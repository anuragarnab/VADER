----------------------------------------------------------------------------------
-- Company: EEE4084F - YODA Project
-- Engineer: Anurag Arnab and Michael Seymour 
-- 
-- Create Date:    17:19:13 05/16/2014 
-- Design Name:	   VADER
-- Module Name:    Plaintext - Behavioral 
-- Project Name:   YODA - Your Own Digital Accelerator
-- Target Devices: Digilent Nexys 3
-- Tool versions:  Xilinx ISE 14.3

-- Description: Register which stores the password which was recovered.
-- Takes off-by-one error of the brute-forceg generator into account
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

entity Plaintext is
    Port ( word_in :         in  STD_LOGIC_VECTOR (127 downto 0);
           hashesEqual :     in  STD_LOGIC;
           incrementAmount : in std_logic_vector (2 downto 0);
           clk :             in  STD_LOGIC;
           word_out :        out  STD_LOGIC_VECTOR (127 downto 0) := (others => '0'));
end Plaintext;

architecture Behavioral of Plaintext is

begin

process (clk, hashesEqual)
	
	variable onceUpdated : std_logic := '0'; --used to keep the word_out from changing
	begin
	
		if (clk = '1' and clk'event and hashesEqual = '1' and onceUpdated = '0') then
			word_out <= std_logic_vector ( unsigned(word_in) - unsigned(incrementAmount) ); --return the previous word stored
			onceUpdated := '1';
		end if;
	
	end process;
end Behavioral;