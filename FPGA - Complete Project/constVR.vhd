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

-- Description: Stores configuration values (startPos and incrementAmount) for each of the brute force generators
-- Also has the target hash hard-coded in since we did not have the time to implement a UART receiver on the FPGA
--
-- Dependencies: 4-1 multiplexer
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity constVR is
	port (
			
			-- these parameters are supplied to the brute force generators so they generate different guesses
			  incAmountC : out  STD_LOGIC_VECTOR (2 downto 0) := "100";
           startPos1 : out  STD_LOGIC_VECTOR (2 downto 0) := "000";
           startPos2 : out  STD_LOGIC_VECTOR (2 downto 0) := "001";
			  startPos3 : out  STD_LOGIC_VECTOR (2 downto 0) := "010";
           startPos4 : out  STD_LOGIC_VECTOR (2 downto 0) := "011";

				tgtHash : out  STD_LOGIC_VECTOR (127 downto 0) );
end constVR;

architecture Behavioral of constVR is

begin
	
	--target hashes in MD5
	
--	tgtHash <=  x"a5643066c7a784ec29b50db0361ec90f"; -- fpga
	tgtHash <=  x"2db1850a4fe292bd2706ffd78dbe44b9"; -- vader

end Behavioral;

