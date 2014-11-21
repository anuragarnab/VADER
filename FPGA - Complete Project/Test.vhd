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
-- Description: 	This is the VADER module with a UART transmitter (FPGA to PC) as well
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


entity Test is
    Port ( clk : in  STD_LOGIC;
			  uart_txd : out std_logic;
			  led : out std_logic
	 );
end Test;

architecture Behavioral of Test is

-- Use the UART-TX module from Digilent
component UART_TX_CTRL
Port(
	SEND : in std_logic;
	DATA : in std_logic_vector(7 downto 0);
	CLK : in std_logic;          
	READY : out std_logic;
	UART_TX : out std_logic
	);
end component;

-- The VADER unit actually recovers passwords
-- The target hash is stored in the constant value register within the VADER
component VADER
Port(
	clk : in std_logic;
	password : out std_logic_vector (127 downto 0);
	success : out std_logic;
	success_inv : out std_logic
);
end component;


-- For UART finite state machine
type UART_STATE_TYPE is (RST_REG, LD_INIT_STR, SEND_CHAR, RDY_LOW, WAIT_RDY, WAIT_BTN, LD_BTN_STR);
type CHAR_ARRAY is array (integer range<>) of std_logic_vector(7 downto 0);

constant MAX_STR_LEN : integer := 16;
constant STR_LEN : natural := 16;

constant WELCOME_STR : CHAR_ARRAY(0 to 15) := (X"56",  --V
															  X"41",  --A
															  X"44",  --D
															  X"45",  --E
															  X"52",  --R
															  X"20",  --
															  X"20",  --
															  X"20",  --
															  X"20",  -- 
															  X"20",  --
															  X"20",  --
															  X"20",  --
															  X"20",  --
															  X"20",  --
															  X"20",  --
															  X"20"); --

--Contains the current string being sent over uart.
signal sendStr : CHAR_ARRAY(0 to (MAX_STR_LEN - 1));

--Contains the length of the current string being sent over uart.
signal strEnd : natural;  

--Contains the index of the next character to be sent over uart
--within the sendStr variable.
signal strIndex : natural;

--UART_TX_CTRL control signals
signal uartRdy : std_logic;
signal uartSend : std_logic := '0';
signal uartData : std_logic_vector (7 downto 0):= "00000000";
signal uartTX : std_logic;

--Current uart state signal
signal uartState : UART_STATE_TYPE := RST_REG;

-- signals from the vader
signal success : std_logic := '0';
signal success_inv : std_logic := '1';
signal password : std_logic_vector (127 downto 0); 

-- Success LED lights up when password cracked. Mapped to pin R11 on the Nexys 3
signal sled : std_logic := '0';


begin


--Next Uart state logic (states described in Report)
next_uartState_process : process (CLK)
begin
	if (rising_edge(CLK)) then

			case uartState is 
			when RST_REG =>
				uartState <= LD_INIT_STR;
			when LD_INIT_STR =>
				uartState <= SEND_CHAR;
			when SEND_CHAR =>
				uartState <= RDY_LOW;
			when RDY_LOW =>
				uartState <= WAIT_RDY;
			when WAIT_RDY =>
				if (uartRdy = '1') then
					if (strEnd = strIndex) then
						uartState <= WAIT_BTN;
					else
						uartState <= SEND_CHAR;
					end if;
				end if;
			when WAIT_BTN =>
				if (success = '1') then
					uartState <= LD_BTN_STR;
				end if;
			when LD_BTN_STR =>
				uartState <= SEND_CHAR;
			when others=> --should never be reached
				uartState <= RST_REG;
			end case;
	end if;
end process;

--Loads the sendStr and strEnd signals when a LOADD state is
--is reached.
string_load_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (uartState = LD_INIT_STR) then
			sendStr <= WELCOME_STR;
			strEnd <= MAX_STR_LEN;
		elsif (uartState = LD_BTN_STR) then
		
			sendStr (0) <= password (7 downto 0);
			sendStr (1) <= password (15 downto 8);
			sendStr (2) <= password (23 downto 16);
			sendStr (3) <= password (31 downto 24);
			sendStr (4) <= password (39 downto 32);
			sendStr (5) <= password (47 downto 40);
			sendStr (6) <= password (55 downto 48);
			sendStr (7) <= password (63 downto 56);
			sendStr (8) <= password (71 downto 64);
			sendStr (9) <= password (79 downto 72);
			sendStr (10) <= password (87 downto 80);
			sendStr (11) <= password (95 downto 88);
			sendStr (12) <= password (103 downto 96);
			sendStr (13) <= password (111 downto 104);
			sendStr (14) <= password (119 downto 112);
			sendStr (15) <= password (127 downto 120);

			strEnd <= MAX_STR_LEN;
		end if;
	end if;
end process;

--Conrols the strIndex signal so that it contains the index
--of the next character that needs to be sent over uart
char_count_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (uartState = LD_INIT_STR or uartState = LD_BTN_STR) then
			strIndex <= 0;
		elsif (uartState = SEND_CHAR) then
			strIndex <= strIndex + 1;
		end if;
	end if;
end process;

--Controls the UART_TX_CTRL signals
char_load_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (uartState = SEND_CHAR) then
			uartSend <= '1';
			uartData <= sendStr(strIndex);
		else
			uartSend <= '0';
		end if;
	end if;
end process;

-- Instantiate UART transmitter
Inst_UART_TX_CTRL: UART_TX_CTRL port map(
		SEND => uartSend,
		DATA => uartData,
		CLK => CLK,
		READY => uartRdy,
		UART_TX => uartTX 
	);

-- Instantiate the VADER
Cracker : Vader port map(
	clk => clk,
	password => password,
	success => success,
	success_inv => success_inv
);

UART_TXD <= uartTX; 
led <= success;

end Behavioral;

