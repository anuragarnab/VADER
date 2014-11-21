<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_6(127:0)" />
        <signal name="XLXN_7(127:0)" />
        <signal name="XLXN_8(1:0)" />
        <signal name="SUCCESS" />
        <signal name="PASSWORD(127:0)" />
        <signal name="XLXN_18(2:0)" />
        <signal name="CLK" />
        <signal name="SUCCESS_INV" />
        <signal name="XLXN_46(2:0)" />
        <signal name="XLXN_47(2:0)" />
        <signal name="XLXN_48(2:0)" />
        <signal name="XLXN_53(2:0)" />
        <signal name="XLXN_57(127:0)" />
        <signal name="XLXN_58(127:0)" />
        <signal name="XLXN_59(127:0)" />
        <signal name="XLXN_60" />
        <signal name="XLXN_61" />
        <port polarity="Output" name="SUCCESS" />
        <port polarity="Output" name="PASSWORD(127:0)" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="SUCCESS_INV" />
        <blockdef name="Success_Detector">
            <timestamp>2014-5-19T12:23:4</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="Mux">
            <timestamp>2014-5-19T12:17:18</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <blockdef name="constVR">
            <timestamp>2014-5-22T11:44:25</timestamp>
            <rect width="64" x="320" y="276" height="24" />
            <line x2="384" y1="288" y2="288" x1="320" />
            <rect width="64" x="320" y="404" height="24" />
            <line x2="384" y1="416" y2="416" x1="320" />
            <rect width="64" x="320" y="148" height="24" />
            <line x2="384" y1="160" y2="160" x1="320" />
            <rect width="64" x="320" y="20" height="24" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="256" x="64" y="-256" height="704" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="MD5_Cracker">
            <timestamp>2014-5-26T6:41:41</timestamp>
            <rect width="368" x="64" y="-256" height="256" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="496" y1="-224" y2="-224" x1="432" />
            <rect width="64" x="432" y="-44" height="24" />
            <line x2="496" y1="-32" y2="-32" x1="432" />
        </blockdef>
        <block symbolname="Mux" name="XLXI_4">
            <blockpin signalname="XLXN_59(127:0)" name="I3(127:0)" />
            <blockpin signalname="XLXN_58(127:0)" name="I2(127:0)" />
            <blockpin signalname="XLXN_6(127:0)" name="I1(127:0)" />
            <blockpin signalname="XLXN_7(127:0)" name="I0(127:0)" />
            <blockpin signalname="XLXN_8(1:0)" name="S(1:0)" />
            <blockpin signalname="PASSWORD(127:0)" name="O(127:0)" />
        </block>
        <block symbolname="Success_Detector" name="XLXI_6">
            <blockpin signalname="XLXN_1" name="cracker1" />
            <blockpin signalname="XLXN_2" name="cracker2" />
            <blockpin signalname="XLXN_60" name="cracker3" />
            <blockpin signalname="XLXN_61" name="cracker4" />
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="SUCCESS" name="success" />
            <blockpin signalname="XLXN_8(1:0)" name="crkr_sel(1:0)" />
        </block>
        <block symbolname="constVR" name="XLXI_21">
            <blockpin signalname="XLXN_53(2:0)" name="incAmountC(2:0)" />
            <blockpin signalname="XLXN_18(2:0)" name="startPos1(2:0)" />
            <blockpin signalname="XLXN_46(2:0)" name="startPos2(2:0)" />
            <blockpin signalname="XLXN_57(127:0)" name="tgtHash(127:0)" />
            <blockpin signalname="XLXN_47(2:0)" name="startPos3(2:0)" />
            <blockpin signalname="XLXN_48(2:0)" name="startPos4(2:0)" />
        </block>
        <block symbolname="inv" name="XLXI_22">
            <blockpin signalname="SUCCESS" name="I" />
            <blockpin signalname="SUCCESS_INV" name="O" />
        </block>
        <block symbolname="MD5_Cracker" name="XLXI_24">
            <blockpin signalname="XLXN_53(2:0)" name="IncAmount(2:0)" />
            <blockpin signalname="XLXN_18(2:0)" name="StartPos(2:0)" />
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="XLXN_57(127:0)" name="TargetHash(127:0)" />
            <blockpin signalname="XLXN_1" name="HashesEqual" />
            <blockpin signalname="XLXN_7(127:0)" name="plainPw(127:0)" />
        </block>
        <block symbolname="MD5_Cracker" name="XLXI_25">
            <blockpin signalname="XLXN_53(2:0)" name="IncAmount(2:0)" />
            <blockpin signalname="XLXN_46(2:0)" name="StartPos(2:0)" />
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="XLXN_57(127:0)" name="TargetHash(127:0)" />
            <blockpin signalname="XLXN_2" name="HashesEqual" />
            <blockpin signalname="XLXN_6(127:0)" name="plainPw(127:0)" />
        </block>
        <block symbolname="MD5_Cracker" name="XLXI_26">
            <blockpin signalname="XLXN_53(2:0)" name="IncAmount(2:0)" />
            <blockpin signalname="XLXN_47(2:0)" name="StartPos(2:0)" />
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="XLXN_57(127:0)" name="TargetHash(127:0)" />
            <blockpin signalname="XLXN_60" name="HashesEqual" />
            <blockpin signalname="XLXN_58(127:0)" name="plainPw(127:0)" />
        </block>
        <block symbolname="MD5_Cracker" name="XLXI_27">
            <blockpin signalname="XLXN_53(2:0)" name="IncAmount(2:0)" />
            <blockpin signalname="XLXN_48(2:0)" name="StartPos(2:0)" />
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="XLXN_57(127:0)" name="TargetHash(127:0)" />
            <blockpin signalname="XLXN_61" name="HashesEqual" />
            <blockpin signalname="XLXN_59(127:0)" name="plainPw(127:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="XLXN_1">
            <wire x2="2256" y1="1168" y2="1168" x1="1872" />
        </branch>
        <branch name="XLXN_6(127:0)">
            <wire x2="2832" y1="1744" y2="1744" x1="1872" />
        </branch>
        <instance x="2832" y="1904" name="XLXI_4" orien="R0">
        </instance>
        <branch name="XLXN_7(127:0)">
            <wire x2="1920" y1="1360" y2="1360" x1="1872" />
            <wire x2="1920" y1="1360" y2="1808" x1="1920" />
            <wire x2="2832" y1="1808" y2="1808" x1="1920" />
        </branch>
        <branch name="XLXN_8(1:0)">
            <wire x2="2816" y1="1424" y2="1424" x1="2640" />
            <wire x2="2816" y1="1424" y2="1872" x1="2816" />
            <wire x2="2832" y1="1872" y2="1872" x1="2816" />
        </branch>
        <branch name="SUCCESS">
            <wire x2="3056" y1="1168" y2="1168" x1="2640" />
            <wire x2="3312" y1="1168" y2="1168" x1="3056" />
            <wire x2="3056" y1="1136" y2="1136" x1="2976" />
            <wire x2="3056" y1="1136" y2="1168" x1="3056" />
            <wire x2="2976" y1="1136" y2="1248" x1="2976" />
            <wire x2="3056" y1="1248" y2="1248" x1="2976" />
        </branch>
        <branch name="PASSWORD(127:0)">
            <wire x2="3312" y1="1616" y2="1616" x1="3216" />
        </branch>
        <iomarker fontsize="28" x="3312" y="1168" name="SUCCESS" orien="R0" />
        <iomarker fontsize="28" x="3312" y="1616" name="PASSWORD(127:0)" orien="R0" />
        <iomarker fontsize="28" x="1088" y="832" name="CLK" orien="R180" />
        <branch name="XLXN_18(2:0)">
            <wire x2="1376" y1="1232" y2="1232" x1="624" />
        </branch>
        <instance x="2256" y="1456" name="XLXI_6" orien="R0">
        </instance>
        <branch name="XLXN_2">
            <wire x2="1888" y1="1552" y2="1552" x1="1872" />
            <wire x2="1888" y1="1232" y2="1552" x1="1888" />
            <wire x2="2256" y1="1232" y2="1232" x1="1888" />
        </branch>
        <branch name="CLK">
            <wire x2="1232" y1="832" y2="832" x1="1088" />
            <wire x2="1232" y1="832" y2="1296" x1="1232" />
            <wire x2="1232" y1="1296" y2="1424" x1="1232" />
            <wire x2="1232" y1="1424" y2="1680" x1="1232" />
            <wire x2="1376" y1="1680" y2="1680" x1="1232" />
            <wire x2="1232" y1="1680" y2="2080" x1="1232" />
            <wire x2="1376" y1="2080" y2="2080" x1="1232" />
            <wire x2="1232" y1="2080" y2="2448" x1="1232" />
            <wire x2="1392" y1="2448" y2="2448" x1="1232" />
            <wire x2="2256" y1="1424" y2="1424" x1="1232" />
            <wire x2="1376" y1="1296" y2="1296" x1="1232" />
        </branch>
        <instance x="3056" y="1280" name="XLXI_22" orien="R0" />
        <branch name="SUCCESS_INV">
            <wire x2="3312" y1="1248" y2="1248" x1="3280" />
        </branch>
        <iomarker fontsize="28" x="3312" y="1248" name="SUCCESS_INV" orien="R0" />
        <instance x="1376" y="1392" name="XLXI_24" orien="R0">
        </instance>
        <instance x="1376" y="1776" name="XLXI_25" orien="R0">
        </instance>
        <instance x="1376" y="2176" name="XLXI_26" orien="R0">
        </instance>
        <instance x="1392" y="2544" name="XLXI_27" orien="R0">
        </instance>
        <instance x="240" y="1392" name="XLXI_21" orien="R0">
        </instance>
        <branch name="XLXN_46(2:0)">
            <wire x2="992" y1="1296" y2="1296" x1="624" />
            <wire x2="992" y1="1296" y2="1616" x1="992" />
            <wire x2="1376" y1="1616" y2="1616" x1="992" />
        </branch>
        <branch name="XLXN_47(2:0)">
            <wire x2="992" y1="1680" y2="1680" x1="624" />
            <wire x2="992" y1="1680" y2="2016" x1="992" />
            <wire x2="1376" y1="2016" y2="2016" x1="992" />
        </branch>
        <branch name="XLXN_48(2:0)">
            <wire x2="912" y1="1808" y2="1808" x1="624" />
            <wire x2="912" y1="1808" y2="2384" x1="912" />
            <wire x2="1392" y1="2384" y2="2384" x1="912" />
        </branch>
        <branch name="XLXN_53(2:0)">
            <wire x2="1152" y1="1424" y2="1424" x1="624" />
            <wire x2="1152" y1="1424" y2="1552" x1="1152" />
            <wire x2="1376" y1="1552" y2="1552" x1="1152" />
            <wire x2="1152" y1="1552" y2="1952" x1="1152" />
            <wire x2="1376" y1="1952" y2="1952" x1="1152" />
            <wire x2="1152" y1="1952" y2="2320" x1="1152" />
            <wire x2="1392" y1="2320" y2="2320" x1="1152" />
            <wire x2="1376" y1="1168" y2="1168" x1="1152" />
            <wire x2="1152" y1="1168" y2="1424" x1="1152" />
        </branch>
        <branch name="XLXN_57(127:0)">
            <wire x2="656" y1="1552" y2="1552" x1="624" />
            <wire x2="1280" y1="1504" y2="1504" x1="656" />
            <wire x2="1280" y1="1504" y2="1744" x1="1280" />
            <wire x2="1280" y1="1744" y2="2144" x1="1280" />
            <wire x2="1376" y1="2144" y2="2144" x1="1280" />
            <wire x2="1280" y1="2144" y2="2512" x1="1280" />
            <wire x2="1392" y1="2512" y2="2512" x1="1280" />
            <wire x2="1376" y1="1744" y2="1744" x1="1280" />
            <wire x2="656" y1="1504" y2="1552" x1="656" />
            <wire x2="1376" y1="1360" y2="1360" x1="1280" />
            <wire x2="1280" y1="1360" y2="1504" x1="1280" />
        </branch>
        <branch name="XLXN_58(127:0)">
            <wire x2="2352" y1="2144" y2="2144" x1="1872" />
            <wire x2="2352" y1="1680" y2="2144" x1="2352" />
            <wire x2="2832" y1="1680" y2="1680" x1="2352" />
        </branch>
        <branch name="XLXN_59(127:0)">
            <wire x2="2464" y1="2512" y2="2512" x1="1888" />
            <wire x2="2832" y1="1616" y2="1616" x1="2464" />
            <wire x2="2464" y1="1616" y2="2512" x1="2464" />
        </branch>
        <branch name="XLXN_60">
            <wire x2="2064" y1="1952" y2="1952" x1="1872" />
            <wire x2="2064" y1="1296" y2="1952" x1="2064" />
            <wire x2="2256" y1="1296" y2="1296" x1="2064" />
        </branch>
        <branch name="XLXN_61">
            <wire x2="2128" y1="2320" y2="2320" x1="1888" />
            <wire x2="2256" y1="1360" y2="1360" x1="2128" />
            <wire x2="2128" y1="1360" y2="2320" x1="2128" />
        </branch>
    </sheet>
</drawing>