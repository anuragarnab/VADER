----------------------------------------------------------------------------------
-- Company: EEE4084F - YODA Project
-- Engineer: Anurag Arnab and Michael Seymour 
-- 
-- Create Date:    17:19:13 05/16/2014 
-- Design Name:	   VADER
-- Module Name:    Comparator - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;


entity Comparator is

port( test_hash:   in std_logic_vector(127 downto 0); --hash being guessed
      test_valid:  in std_logic;                      --1 if test_hash is valid
      target_hash: in std_logic_vector(127 downto 0); --hash being cracked
      clk:         in std_logic;
      equal:       out std_logic :='0'                --1 if test_hash=target_hash
);
end Comparator;


architecture behv of Comparator is

begin 
    
    process(clk)
    begin
        -- If positive clk edge and input test hash is valid
        if (clk='1' and clk'event and test_valid='1') then
            if (test_hash=target_hash) then
                equal <= '1';
            else 
                equal <= '0';
            end if;
        end if;
    end process;

end behv;