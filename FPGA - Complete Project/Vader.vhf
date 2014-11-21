--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : Vader.vhf
-- /___/   /\     Timestamp : 05/26/2014 08:42:16
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan6 -flat -suppress -vhdl "C:/Users/Anurag/SkyDrive/Documents/4th Year/EEE4084F/YODA/Final Report/Final Code for Hand-in/UART/Vader.vhf" -w "C:/Users/Anurag/SkyDrive/Documents/4th Year/EEE4084F/YODA/Final Report/Final Code for Hand-in/UART/Vader.sch"
--Design Name: Vader
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

entity MD5_Cracker_MUSER_Vader is
   port ( clk         : in    std_logic; 
          IncAmount   : in    std_logic_vector (2 downto 0); 
          StartPos    : in    std_logic_vector (2 downto 0); 
          TargetHash  : in    std_logic_vector (127 downto 0); 
          HashesEqual : out   std_logic; 
          plainPw     : out   std_logic_vector (127 downto 0));
end MD5_Cracker_MUSER_Vader;

architecture BEHAVIORAL of MD5_Cracker_MUSER_Vader is
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Vader is
   port ( CLK         : in    std_logic; 
          PASSWORD    : out   std_logic_vector (127 downto 0); 
          SUCCESS     : out   std_logic; 
          SUCCESS_INV : out   std_logic);
end Vader;

architecture BEHAVIORAL of Vader is
   attribute BOX_TYPE   : string ;
   signal XLXN_1        : std_logic;
   signal XLXN_2        : std_logic;
   signal XLXN_6        : std_logic_vector (127 downto 0);
   signal XLXN_7        : std_logic_vector (127 downto 0);
   signal XLXN_8        : std_logic_vector (1 downto 0);
   signal XLXN_18       : std_logic_vector (2 downto 0);
   signal XLXN_46       : std_logic_vector (2 downto 0);
   signal XLXN_47       : std_logic_vector (2 downto 0);
   signal XLXN_48       : std_logic_vector (2 downto 0);
   signal XLXN_53       : std_logic_vector (2 downto 0);
   signal XLXN_57       : std_logic_vector (127 downto 0);
   signal XLXN_58       : std_logic_vector (127 downto 0);
   signal XLXN_59       : std_logic_vector (127 downto 0);
   signal XLXN_60       : std_logic;
   signal XLXN_61       : std_logic;
   signal SUCCESS_DUMMY : std_logic;
   component Mux
      port ( I3 : in    std_logic_vector (127 downto 0); 
             I2 : in    std_logic_vector (127 downto 0); 
             I1 : in    std_logic_vector (127 downto 0); 
             I0 : in    std_logic_vector (127 downto 0); 
             S  : in    std_logic_vector (1 downto 0); 
             O  : out   std_logic_vector (127 downto 0));
   end component;
   
   component Success_Detector
      port ( cracker1 : in    std_logic; 
             cracker2 : in    std_logic; 
             cracker3 : in    std_logic; 
             cracker4 : in    std_logic; 
             clk      : in    std_logic; 
             success  : out   std_logic; 
             crkr_sel : out   std_logic_vector (1 downto 0));
   end component;
   
   component constVR
      port ( incAmountC : out   std_logic_vector (2 downto 0); 
             startPos1  : out   std_logic_vector (2 downto 0); 
             startPos2  : out   std_logic_vector (2 downto 0); 
             tgtHash    : out   std_logic_vector (127 downto 0); 
             startPos3  : out   std_logic_vector (2 downto 0); 
             startPos4  : out   std_logic_vector (2 downto 0));
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component MD5_Cracker_MUSER_Vader
      port ( IncAmount   : in    std_logic_vector (2 downto 0); 
             StartPos    : in    std_logic_vector (2 downto 0); 
             clk         : in    std_logic; 
             TargetHash  : in    std_logic_vector (127 downto 0); 
             HashesEqual : out   std_logic; 
             plainPw     : out   std_logic_vector (127 downto 0));
   end component;
   
begin
   SUCCESS <= SUCCESS_DUMMY;
   XLXI_4 : Mux
      port map (I0(127 downto 0)=>XLXN_7(127 downto 0),
                I1(127 downto 0)=>XLXN_6(127 downto 0),
                I2(127 downto 0)=>XLXN_58(127 downto 0),
                I3(127 downto 0)=>XLXN_59(127 downto 0),
                S(1 downto 0)=>XLXN_8(1 downto 0),
                O(127 downto 0)=>PASSWORD(127 downto 0));
   
   XLXI_6 : Success_Detector
      port map (clk=>CLK,
                cracker1=>XLXN_1,
                cracker2=>XLXN_2,
                cracker3=>XLXN_60,
                cracker4=>XLXN_61,
                crkr_sel(1 downto 0)=>XLXN_8(1 downto 0),
                success=>SUCCESS_DUMMY);
   
   XLXI_21 : constVR
      port map (incAmountC(2 downto 0)=>XLXN_53(2 downto 0),
                startPos1(2 downto 0)=>XLXN_18(2 downto 0),
                startPos2(2 downto 0)=>XLXN_46(2 downto 0),
                startPos3(2 downto 0)=>XLXN_47(2 downto 0),
                startPos4(2 downto 0)=>XLXN_48(2 downto 0),
                tgtHash(127 downto 0)=>XLXN_57(127 downto 0));
   
   XLXI_22 : INV
      port map (I=>SUCCESS_DUMMY,
                O=>SUCCESS_INV);
   
   XLXI_24 : MD5_Cracker_MUSER_Vader
      port map (clk=>CLK,
                IncAmount(2 downto 0)=>XLXN_53(2 downto 0),
                StartPos(2 downto 0)=>XLXN_18(2 downto 0),
                TargetHash(127 downto 0)=>XLXN_57(127 downto 0),
                HashesEqual=>XLXN_1,
                plainPw(127 downto 0)=>XLXN_7(127 downto 0));
   
   XLXI_25 : MD5_Cracker_MUSER_Vader
      port map (clk=>CLK,
                IncAmount(2 downto 0)=>XLXN_53(2 downto 0),
                StartPos(2 downto 0)=>XLXN_46(2 downto 0),
                TargetHash(127 downto 0)=>XLXN_57(127 downto 0),
                HashesEqual=>XLXN_2,
                plainPw(127 downto 0)=>XLXN_6(127 downto 0));
   
   XLXI_26 : MD5_Cracker_MUSER_Vader
      port map (clk=>CLK,
                IncAmount(2 downto 0)=>XLXN_53(2 downto 0),
                StartPos(2 downto 0)=>XLXN_47(2 downto 0),
                TargetHash(127 downto 0)=>XLXN_57(127 downto 0),
                HashesEqual=>XLXN_60,
                plainPw(127 downto 0)=>XLXN_58(127 downto 0));
   
   XLXI_27 : MD5_Cracker_MUSER_Vader
      port map (clk=>CLK,
                IncAmount(2 downto 0)=>XLXN_53(2 downto 0),
                StartPos(2 downto 0)=>XLXN_48(2 downto 0),
                TargetHash(127 downto 0)=>XLXN_57(127 downto 0),
                HashesEqual=>XLXN_61,
                plainPw(127 downto 0)=>XLXN_59(127 downto 0));
   
end BEHAVIORAL;


