----------------------------------------------------------------------------------
-- Company: EEE4084F - YODA Project
-- Engineer: Anurag Arnab and Michael Seymour 
-- 
-- Create Date:    17:19:13 05/16/2014 
-- Design Name:	   VADER
-- Module Name:    BruteForceGen - Behavioral 
-- Project Name:   YODA - Your Own Digital Accelerator
-- Target Devices: Digilent Nexys 3
-- Tool versions:  Xilinx ISE 14.3
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- To use arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity ASCIICounter is
    Port ( clk : in std_logic;
		   startPos : in  std_logic_vector (2 downto 0);        -- assumes we only have 4 units
           incrementAmount : in  std_logic_vector (2 downto 0); -- assumes we only have 4 units
           enable : in  std_logic;
           password : out std_logic_vector (7 downto 0);        -- 128 bit integer corresponds to 16 ASCII letters
			  wrap : out std_logic
			  );
end ASCIICounter;

architecture Behavioral of ASCIICounter is

begin


	-- Counts from x61 to x7A ("a" in ASCII to "z")
	-- When it gets to "z", it raises the "wrap" bit which enables the other counter in the chain
	countProcess : process (clk)  

	-- A variable which is from 0 to 25 inclusive. It indicates whether the counter has wrapped around or not
	variable subcount : std_logic_vector (4 downto 0) := std_logic_vector("00000" +  unsigned(startPos)); 

	-- A variable representing the actual character to be output. Offset by x"61" which is "a" in ASCII
	-- It basically counts from "x61" (a) to "x7A" (z), in increments denoted by "incrementAmount"
	variable temp : std_logic_vector (7 downto 0) := std_logic_vector(x"61" + unsigned(startPos));

	-- Indicates whether the counter has run before. This is because the output must be "000000000" until the counter
	-- is enabled for the first time
	variable onceRun : std_logic := '0';
	
	begin

	if (rising_edge(clk)) then 
		if (enable = '1' ) then

			-- This is to ensure that the output of the counter is "x00" until it is enabled for the first time
			if (onceRun = '0') then
				onceRun := '1';
				subcount := std_logic_vector("00000" +  unsigned(startPos));
				temp := std_logic_vector(x"61" + unsigned(subcount));

			-- Increment both "temp" and "subcount" by "IncrementAmount" as we have not wrapped around
			elsif (unsigned(subcount)+unsigned(incrementAmount) < 26) then
				temp := std_logic_vector(unsigned(temp) + unsigned(incrementAmount));
				subcount := std_logic_vector(unsigned(subcount) + unsigned(incrementAmount));
				wrap <= '0';

			-- This means that we have wrapped around (ie "z" to "a")	
			else
				subcount := std_logic_vector("00000" +  unsigned(startPos));
				temp := std_logic_vector(x"61" + unsigned(subcount));
				wrap <= '1';
			end if;
		end if;
	
		-- This is to ensure that the output of the counter is "x00" until it is enabled for the first time
		if (onceRun = '0') then
		wrap <= '0';
		temp := x"00";
		end if;
	
	end if;
	password <= temp;
	
	end process;
		
end Behavioral;

