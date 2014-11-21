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

-- Description: Reset circuit to start up the MD5 hasher

--
-- Dependencies: 4-1 multiplexer
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Driver is
    Port ( clk : in  STD_LOGIC;
           ready : in  STD_LOGIC;
           reset : out  STD_LOGIC := '1');
end Driver;

architecture Behavioral of Driver is

begin


-- Initially, reset is high
-- Once the MD5 hasher has signalled that it is ready, pull reset low
-- Thereafter, this circuit does not have to do anything
startup : process (clk, ready) 

variable onceRun : std_logic := '0';

begin

	if (clk ='1' and ready='1' and onceRun = '0' and clk'event) then
		reset <= '0';
		onceRun := '1';
	else
	
	end if;

end process;


end Behavioral;