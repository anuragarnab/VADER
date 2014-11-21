-- Vhdl test bench created from schematic C:\Users\Anurag\Documents\4th Year\EEE4084F\YODA\Modules\Vader\Vader.sch - Mon May 19 14:58:13 2014
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY Vader_Vader_sch_tb IS
END Vader_Vader_sch_tb;
ARCHITECTURE behavioral OF Vader_Vader_sch_tb IS 

   COMPONENT Vader
   PORT( SUCCESS	:	OUT	STD_LOGIC; 
          CLK	:	IN	STD_LOGIC; 
          PASSWORD	:	OUT	STD_LOGIC_VECTOR (127 DOWNTO 0));
   END COMPONENT;

   SIGNAL SUCCESS	:	STD_LOGIC;
   SIGNAL CLK	:	STD_LOGIC;
   SIGNAL PASSWORD	:	STD_LOGIC_VECTOR (127 DOWNTO 0);
	
	constant clk_period : time := 10 ns;


BEGIN

   UUT: Vader PORT MAP(
		SUCCESS => SUCCESS, 
		CLK => CLK, 
		PASSWORD => PASSWORD
   );

 -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
-- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for clk_period*10;
      -- insert stimulus here 
      wait;
		
   end process;

END;
