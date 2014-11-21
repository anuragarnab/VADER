----------------------------------------------------------------------------------
-- Company: EEE4084F - YODA Project
-- Engineer: Anurag Arnab and Michael Seymour 
-- 
-- Create Date:    17:19:13 05/16/2014 
-- Design Name:	   VADER
-- Module Name:    Success_Detector - Behavioral 
-- Project Name:   YODA - Your Own Digital Accelerator
-- Target Devices: Digilent Nexys 3
-- Tool versions:  Xilinx ISE 14.3
--
-- Description: 		-- Determines if any of the MD5 crackers have cracked the password yet. If so, sends an
-- appropriate code to the MUX to select this passsword for transmission
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;


entity Success_Detector is
    port( cracker1:   in std_logic; --1 if cracker 1 has found the password
          cracker2:   in std_logic;
          cracker3:   in std_logic;
          cracker4:   in std_logic;
          clk:        in std_logic;
          crkr_sel:   out std_logic_vector(1 downto 0) :="00"; --selects the correct cracker to receive the plaintext pw from
          success:    out std_logic :='0' --1 if either of the cracker has found the password
    );
end Success_Detector;


architecture behv of Success_Detector is

begin 
    
    process(clk)
    begin
		-- Determines if any of the MD5 crackers have
		-- cracked the password yet
	    if (clk='1' and clk'event) then
			if (cracker1='1') then
				success <= '1';
				crkr_sel <= "00";
			elsif (cracker2='1') then
				success <= '1';
				crkr_sel <= "01";
			elsif (cracker3='1') then
				success <= '1';
				crkr_sel <= "10";
			elsif (cracker4='1') then
				success <= '1';
				crkr_sel <= "11";
			else
				--success <= '0';
			end if;
	    end if;
    end process;

end behv;