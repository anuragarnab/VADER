--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : MD5_Cracker.vhf
-- /___/   /\     Timestamp : 05/26/2014 08:42:15
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan6 -flat -suppress -vhdl "C:/Users/Anurag/SkyDrive/Documents/4th Year/EEE4084F/YODA/Final Report/Final Code for Hand-in/UART/MD5_Cracker.vhf" -w "C:/Users/Anurag/SkyDrive/Documents/4th Year/EEE4084F/YODA/Final Report/Final Code for Hand-in/UART/MD5_Cracker.sch"
--Design Name: MD5_Cracker
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity MD5_Cracker is
   port ( clk         : in    std_logic; 
          IncAmount   : in    std_logic_vector (2 downto 0); 
          StartPos    : in    std_logic_vector (2 downto 0); 
          TargetHash  : in    std_logic_vector (127 downto 0); 
          HashesEqual : out   std_logic; 
          plainPw     : out   std_logic_vector (127 downto 0));
end MD5_Cracker;

architecture BEHAVIORAL of MD5_Cracker is
   signal GuessHash         : std_logic_vector (0 to 127);
   signal GuessPW           : std_logic_vector (0 to 127);
   signal MsgOutValid       : std_logic;
   signal Ready             : std_logic;
   signal Reset             : std_logic;
   signal XLXN_1            : std_logic_vector (7 downto 0);
   signal HashesEqual_DUMMY : std_logic;
   component BruteForceGen
      port ( clk             : in    std_logic; 
             enable          : in    std_logic; 
             startPos        : in    std_logic_vector (2 downto 0); 
             incrementAmount : in    std_logic_vector (2 downto 0); 
             message_width   : out   std_logic_vector (7 downto 0); 
             password        : out   std_logic_vector (127 downto 0));
   end component;
   
   component pancham
      port ( clk           : in    std_logic; 
             reset         : in    std_logic; 
             msg_in_valid  : in    std_logic; 
             msg_in        : in    std_logic_vector (0 to 127); 
             msg_in_width  : in    std_logic_vector (0 to 7); 
             msg_out_valid : out   std_logic; 
             ready         : out   std_logic; 
             msg_output    : out   std_logic_vector (0 to 127));
   end component;
   
   component Comparator
      port ( test_valid  : in    std_logic; 
             clk         : in    std_logic; 
             test_hash   : in    std_logic_vector (127 downto 0); 
             target_hash : in    std_logic_vector (127 downto 0); 
             equal       : out   std_logic);
   end component;
   
   component Driver
      port ( clk   : in    std_logic; 
             ready : in    std_logic; 
             reset : out   std_logic);
   end component;
   
   component Plaintext
      port ( hashesEqual     : in    std_logic; 
             clk             : in    std_logic; 
             word_in         : in    std_logic_vector (127 downto 0); 
             incrementAmount : in    std_logic_vector (2 downto 0); 
             word_out        : out   std_logic_vector (127 downto 0));
   end component;
   
begin
   HashesEqual <= HashesEqual_DUMMY;
   XLXI_1 : BruteForceGen
      port map (clk=>clk,
                enable=>Ready,
                incrementAmount(2 downto 0)=>IncAmount(2 downto 0),
                startPos(2 downto 0)=>StartPos(2 downto 0),
                message_width(7 downto 0)=>XLXN_1(7 downto 0),
                password(127 downto 0)=>GuessPW(0 to 127));
   
   XLXI_2 : pancham
      port map (clk=>clk,
                msg_in(0 to 127)=>GuessPW(0 to 127),
                msg_in_valid=>Ready,
                msg_in_width(0 to 7)=>XLXN_1(7 downto 0),
                reset=>Reset,
                msg_output(0 to 127)=>GuessHash(0 to 127),
                msg_out_valid=>MsgOutValid,
                ready=>Ready);
   
   XLXI_3 : Comparator
      port map (clk=>clk,
                target_hash(127 downto 0)=>TargetHash(127 downto 0),
                test_hash(127 downto 0)=>GuessHash(0 to 127),
                test_valid=>MsgOutValid,
                equal=>HashesEqual_DUMMY);
   
   XLXI_4 : Driver
      port map (clk=>clk,
                ready=>Ready,
                reset=>Reset);
   
   XLXI_5 : Plaintext
      port map (clk=>clk,
                hashesEqual=>HashesEqual_DUMMY,
                incrementAmount(2 downto 0)=>IncAmount(2 downto 0),
                word_in(127 downto 0)=>GuessPW(0 to 127),
                word_out(127 downto 0)=>plainPw(127 downto 0));
   
end BEHAVIORAL;


