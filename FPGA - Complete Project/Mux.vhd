----------------------------------------------------------------------------------
-- Company: EEE4084F - YODA Project
-- Engineer: Anurag Arnab and Michael Seymour 
-- 
-- Create Date:    17:19:13 05/16/2014 
-- Design Name:	   VADER
-- Module Name:    Mux - Behavioral 
-- Project Name:   YODA - Your Own Digital Accelerator
-- Target Devices: Digilent Nexys 3
-- Tool versions:  Xilinx ISE 14.3
-- Description: 
--
-- Dependencies: 4-1 multiplexer
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;


entity Mux is
	port(
        I3:   in std_logic_vector (127 downto 0);
        I2:   in std_logic_vector (127 downto 0);
        I1:   in std_logic_vector (127 downto 0);
        I0:   in std_logic_vector (127 downto 0);
        S:    in std_logic_vector (1 downto 0);
        O:    out std_logic_vector (127 downto 0)
	);
end Mux;


architecture behv of Mux is
begin
    process(I3,I2,I1,I0,S)
    begin
	
        -- 4 to 1 multiplexer (128 bits)
        case S is
	      when "00" => O <= I0;
	      when "01" => O <= I1;
	      when "10" => O <= I2;
	      when "11" => O <= I3;
	      when others => O <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
	    end case;

    end process;
end behv;