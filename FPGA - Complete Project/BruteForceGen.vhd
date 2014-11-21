----------------------------------------------------------------------------------
-- Company: EEE4084F - YODA Project
-- Engineer: Anurag Arnab (ARNANU002) and Michael Seymour (SYMMIC007)
-- 
-- Create Date:    22:11:59 05/16/2014 
-- Design Name: 	 VADER
-- Module Name:    BruteForceGen - Behavioral 
-- Project Name:   YODA - Your own digital accelartor
-- Target Devices: Digilent Nexys 3
-- Tool versions:  Xillinx ISE 14.3
-- Description:    Creates all combinations of 8 ASCII characters which form the password "guesses"
--
-- Dependencies:  ASCIICounter
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


entity BruteForceGen is
    Port ( clk : in  STD_LOGIC;
			  startPos : in  std_logic_vector (2 downto 0); -- assumes we only have 4 units
           incrementAmount : in  std_logic_vector (2 downto 0); -- assumes we only have 4 units
           enable : in  STD_LOGIC;
			  message_width : out std_logic_vector (7 downto 0);
           password : out std_logic_vector (127 downto 0)
			  );
end BruteForceGen;

architecture Behavioral of BruteForceGen is
	
	component ASCIICounter
	port (
			clk : in std_logic;
			startPos : in  std_logic_vector (2 downto 0) := "000"; -- assumes we only have 4 units
         incrementAmount : in  std_logic_vector (2 downto 0) := "001"; -- assumes we only have 4 units
         enable : in  std_logic;
         password : out std_logic_vector (7 downto 0); -- 128 bit integer corresponds to 16 ASCII letters
			wrap : out std_logic
	);
	end component;
	
	
	-- We use these signals to connect up the different ASCII counters
	-- The "ripple" chain method is used
	-- The "wrap" bit of one counter is used to clock the next one
	signal e0 : std_logic;
	signal e1 : std_logic;
	signal e2 : std_logic;
	signal e3 : std_logic;
	signal e4 : std_logic;
	signal e5 : std_logic;
	signal e6 : std_logic;
	
	-- pw stores the intermediate password from the ASCII counters
	-- rw stores the final guesses password 
	signal pw : std_logic_vector (127 downto 0) := x"00000000000000000000000000000000";
	signal rw : std_logic_vector (127 downto 0) := x"00000000000000000000000000000000";
	


begin

	a0 : ASCIICounter port map(
		clk => clk,
		startPos => startPos,
		incrementAmount => incrementAmount,
		enable => enable,
		password => pw(7 downto 0),
		wrap => e0
	);
	
	-- the clock of a1 is enabled by the wrap bit of a0
	a1 : ASCIICounter port map(
		clk => e0,
		enable => enable,
		password => pw (15 downto 8),
		wrap => e1
	);	

	-- the clock of a2 is enabled by the wrap bit of a1	
	a2 : ASCIICounter port map(
		clk => e1,
		enable => enable,
		password => pw (23 downto 16),
		wrap => e2
	);	
	
	-- the clock of a3 is enabled by the wrap bit of a2
	a3 : ASCIICounter port map(
		clk => e2,
		enable => enable,
		password => pw (31 downto 24),
		wrap => e3
	);	
	
	-- the clock of a4 is enabled by the wrap bit of a3
	a4 : ASCIICounter port map(
		clk => e3,
		enable => enable,
		password => pw (39 downto 32),
		wrap => e4
	);	

	-- the clock of a5 is enabled by the wrap bit of a4
	a5 : ASCIICounter port map(
		clk => e4,
		enable => enable,
		password => pw (47 downto 40),
		wrap => e5
	);	

	-- the clock of a6 is enabled by the wrap bit of a5
	a6 : ASCIICounter port map(
		clk => e5,
		enable => enable,
		password => pw (55 downto 48),
		wrap => e6
	);	
	
	-- the clock of a7 is enabled by the wrap bit of a6
	a7 : ASCIICounter port map(
		clk => e6,
		enable => enable,
		password => pw (63 downto 56)
	--	wrap => e7 No need for this. Last counter in the chain
	);	
	
	
	-- This process has two functions:
	-- When counters higher up in the chain have not run for the first time (are uninitialised because they havent got their first clock pulse), their outputs can take on any value
	-- This process ensures that those values are kept to "0"
	
	-- Secondly, this process counts the length of the password in bits and outputs this
	-- This is required by the MD5 hasher
	process (e0, e1, e2, e3, e4, e5, e6, clk)
	
	variable r1, r2, r3, r4, r5, r6, r7 : std_logic := '0';
	variable leng : std_logic_vector (7 downto 0) := x"08";

	begin
		
		rw(7 downto 0) <= pw (7 downto 0);
		
		
		-- If a counter has run once, update the length and add its guesses letter to the overall password
		if (r1 = '0') then
			rw (15 downto 8) <= x"00";
		else
			rw (15 downto 8) <= pw (15 downto 8);
			leng := x"10";
		end if;
		
		if (r2 = '1') then
			rw (23 downto 16) <= pw (23 downto 16);
			leng := x"18";
		end if;
		
		if (r3 = '1') then
			rw (31 downto 24) <= pw (31 downto 24);
			leng := x"20";
		end if;
		
		if (r4 = '1') then
			rw (39 downto 32) <= pw (39 downto 32);
			leng := x"28";
		end if;
		
		if (r5 = '1') then
			rw (47 downto 40) <= pw (47 downto 40);
			leng := x"30";
		end if;
		
		if (r6 = '1') then
			rw (55 downto 48) <= pw (55 downto 48);
			leng := x"38";
		end if;
		
		if (r7 = '1') then
			rw (63 downto 56) <= pw (63 downto 56);
			leng := x"40";
		end if;
		
		
		-- To keep track of which counters have been initialised and run at least once
		if (e0 = '1') then
			r1 := '1';
		end if;
		if (e1 = '1') then
			r2 := '1';
		end if;
		if (e2 = '1') then
			r3 := '1';
		end if;
		if (e3 = '1') then
			r4 := '1';
		end if;
		if (e4 = '1') then
			r5 := '1';
		end if;
		if (e5 = '1') then
			r6 := '1';
		end if;
		if (e6 = '1') then
			r7 := '1';
		end if;
		
		message_width <= leng;
	
	end process;
	
	password <= rw;
end Behavioral;

