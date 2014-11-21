<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1(7:0)" />
        <signal name="GuessPW(0:127)" />
        <signal name="IncAmount(2:0)" />
        <signal name="Ready" />
        <signal name="StartPos(2:0)" />
        <signal name="GuessHash(0:127)" />
        <signal name="clk" />
        <signal name="TargetHash(127:0)" />
        <signal name="HashesEqual" />
        <signal name="Reset" />
        <signal name="plainPw(127:0)" />
        <signal name="MsgOutValid" />
        <port polarity="Input" name="IncAmount(2:0)" />
        <port polarity="Input" name="StartPos(2:0)" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="TargetHash(127:0)" />
        <port polarity="Output" name="HashesEqual" />
        <port polarity="Output" name="plainPw(127:0)" />
        <blockdef name="BruteForceGen">
            <timestamp>2014-5-26T6:40:50</timestamp>
            <rect width="448" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="512" y="-108" height="24" />
            <line x2="576" y1="-96" y2="-96" x1="512" />
            <rect width="64" x="512" y="-44" height="24" />
            <line x2="576" y1="-32" y2="-32" x1="512" />
        </blockdef>
        <blockdef name="pancham">
            <timestamp>2014-5-18T9:56:5</timestamp>
            <rect width="400" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="528" y1="-288" y2="-288" x1="464" />
            <line x2="528" y1="-160" y2="-160" x1="464" />
            <rect width="64" x="464" y="-44" height="24" />
            <line x2="528" y1="-32" y2="-32" x1="464" />
        </blockdef>
        <blockdef name="Comparator">
            <timestamp>2014-5-18T12:11:9</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
        </blockdef>
        <blockdef name="Driver">
            <timestamp>2014-5-19T8:43:4</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="Plaintext">
            <timestamp>2014-5-19T9:24:44</timestamp>
            <rect width="400" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="464" y="-236" height="24" />
            <line x2="528" y1="-224" y2="-224" x1="464" />
        </blockdef>
        <block symbolname="BruteForceGen" name="XLXI_1">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="Ready" name="enable" />
            <blockpin signalname="StartPos(2:0)" name="startPos(2:0)" />
            <blockpin signalname="IncAmount(2:0)" name="incrementAmount(2:0)" />
            <blockpin signalname="XLXN_1(7:0)" name="message_width(7:0)" />
            <blockpin signalname="GuessPW(0:127)" name="password(127:0)" />
        </block>
        <block symbolname="pancham" name="XLXI_2">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="Reset" name="reset" />
            <blockpin signalname="Ready" name="msg_in_valid" />
            <blockpin signalname="GuessPW(0:127)" name="msg_in(0:127)" />
            <blockpin signalname="XLXN_1(7:0)" name="msg_in_width(0:7)" />
            <blockpin signalname="MsgOutValid" name="msg_out_valid" />
            <blockpin signalname="Ready" name="ready" />
            <blockpin signalname="GuessHash(0:127)" name="msg_output(0:127)" />
        </block>
        <block symbolname="Comparator" name="XLXI_3">
            <blockpin signalname="MsgOutValid" name="test_valid" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="GuessHash(0:127)" name="test_hash(127:0)" />
            <blockpin signalname="TargetHash(127:0)" name="target_hash(127:0)" />
            <blockpin signalname="HashesEqual" name="equal" />
        </block>
        <block symbolname="Driver" name="XLXI_4">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="Ready" name="ready" />
            <blockpin signalname="Reset" name="reset" />
        </block>
        <block symbolname="Plaintext" name="XLXI_5">
            <blockpin signalname="HashesEqual" name="hashesEqual" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="GuessPW(0:127)" name="word_in(127:0)" />
            <blockpin signalname="IncAmount(2:0)" name="incrementAmount(2:0)" />
            <blockpin signalname="plainPw(127:0)" name="word_out(127:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="816" y="1456" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1632" y="1472" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_1(7:0)">
            <wire x2="1520" y1="1360" y2="1360" x1="1392" />
            <wire x2="1520" y1="1360" y2="1440" x1="1520" />
            <wire x2="1632" y1="1440" y2="1440" x1="1520" />
        </branch>
        <branch name="GuessPW(0:127)">
            <wire x2="1472" y1="1424" y2="1424" x1="1392" />
            <wire x2="1472" y1="1424" y2="1984" x1="1472" />
            <wire x2="2112" y1="1984" y2="1984" x1="1472" />
            <wire x2="1584" y1="1408" y2="1408" x1="1472" />
            <wire x2="1472" y1="1408" y2="1424" x1="1472" />
            <wire x2="1632" y1="1376" y2="1376" x1="1584" />
            <wire x2="1584" y1="1376" y2="1408" x1="1584" />
        </branch>
        <branch name="IncAmount(2:0)">
            <wire x2="800" y1="1424" y2="1424" x1="784" />
            <wire x2="816" y1="1424" y2="1424" x1="800" />
            <wire x2="800" y1="1424" y2="2048" x1="800" />
            <wire x2="2112" y1="2048" y2="2048" x1="800" />
        </branch>
        <iomarker fontsize="28" x="784" y="1424" name="IncAmount(2:0)" orien="R180" />
        <branch name="Ready">
            <wire x2="112" y1="1056" y2="1312" x1="112" />
            <wire x2="144" y1="1312" y2="1312" x1="112" />
            <wire x2="736" y1="1056" y2="1056" x1="112" />
            <wire x2="1568" y1="1056" y2="1056" x1="736" />
            <wire x2="2272" y1="1056" y2="1056" x1="1568" />
            <wire x2="2272" y1="1056" y2="1312" x1="2272" />
            <wire x2="1568" y1="1056" y2="1312" x1="1568" />
            <wire x2="1632" y1="1312" y2="1312" x1="1568" />
            <wire x2="736" y1="1056" y2="1296" x1="736" />
            <wire x2="816" y1="1296" y2="1296" x1="736" />
            <wire x2="2272" y1="1312" y2="1312" x1="2160" />
        </branch>
        <branch name="StartPos(2:0)">
            <wire x2="816" y1="1360" y2="1360" x1="784" />
        </branch>
        <iomarker fontsize="28" x="784" y="1360" name="StartPos(2:0)" orien="R180" />
        <branch name="GuessHash(0:127)">
            <wire x2="2512" y1="1440" y2="1440" x1="2160" />
            <wire x2="2624" y1="1360" y2="1360" x1="2512" />
            <wire x2="2512" y1="1360" y2="1440" x1="2512" />
        </branch>
        <branch name="clk">
            <wire x2="128" y1="1104" y2="1104" x1="96" />
            <wire x2="128" y1="1104" y2="1248" x1="128" />
            <wire x2="144" y1="1248" y2="1248" x1="128" />
            <wire x2="128" y1="1248" y2="1920" x1="128" />
            <wire x2="2112" y1="1920" y2="1920" x1="128" />
            <wire x2="800" y1="1104" y2="1104" x1="128" />
            <wire x2="1424" y1="1104" y2="1104" x1="800" />
            <wire x2="1424" y1="1104" y2="1184" x1="1424" />
            <wire x2="1488" y1="1184" y2="1184" x1="1424" />
            <wire x2="1632" y1="1184" y2="1184" x1="1488" />
            <wire x2="800" y1="1104" y2="1232" x1="800" />
            <wire x2="816" y1="1232" y2="1232" x1="800" />
            <wire x2="1488" y1="960" y2="1184" x1="1488" />
            <wire x2="2320" y1="960" y2="960" x1="1488" />
            <wire x2="2320" y1="960" y2="1232" x1="2320" />
            <wire x2="2560" y1="1232" y2="1232" x1="2320" />
            <wire x2="2560" y1="1232" y2="1296" x1="2560" />
            <wire x2="2624" y1="1296" y2="1296" x1="2560" />
        </branch>
        <instance x="2624" y="1456" name="XLXI_3" orien="R0">
        </instance>
        <branch name="TargetHash(127:0)">
            <wire x2="2576" y1="1664" y2="1664" x1="2432" />
            <wire x2="2624" y1="1424" y2="1424" x1="2576" />
            <wire x2="2576" y1="1424" y2="1664" x1="2576" />
        </branch>
        <iomarker fontsize="28" x="2432" y="1664" name="TargetHash(127:0)" orien="R180" />
        <instance x="144" y="1344" name="XLXI_4" orien="R0">
        </instance>
        <branch name="Reset">
            <wire x2="544" y1="1248" y2="1248" x1="528" />
            <wire x2="1616" y1="928" y2="928" x1="544" />
            <wire x2="1616" y1="928" y2="1248" x1="1616" />
            <wire x2="1632" y1="1248" y2="1248" x1="1616" />
            <wire x2="544" y1="928" y2="1248" x1="544" />
        </branch>
        <iomarker fontsize="28" x="96" y="1104" name="clk" orien="R180" />
        <instance x="2112" y="2080" name="XLXI_5" orien="R0">
        </instance>
        <branch name="HashesEqual">
            <wire x2="3024" y1="1728" y2="1728" x1="2048" />
            <wire x2="2048" y1="1728" y2="1856" x1="2048" />
            <wire x2="2112" y1="1856" y2="1856" x1="2048" />
            <wire x2="3024" y1="1232" y2="1232" x1="3008" />
            <wire x2="3024" y1="1232" y2="1616" x1="3024" />
            <wire x2="3024" y1="1616" y2="1728" x1="3024" />
            <wire x2="3040" y1="1216" y2="1216" x1="3024" />
            <wire x2="3024" y1="1216" y2="1232" x1="3024" />
        </branch>
        <iomarker fontsize="28" x="3040" y="1216" name="HashesEqual" orien="R0" />
        <branch name="plainPw(127:0)">
            <wire x2="2672" y1="1856" y2="1856" x1="2640" />
        </branch>
        <iomarker fontsize="28" x="2672" y="1856" name="plainPw(127:0)" orien="R0" />
        <branch name="MsgOutValid">
            <wire x2="2160" y1="1120" y2="1184" x1="2160" />
            <wire x2="2432" y1="1120" y2="1120" x1="2160" />
            <wire x2="2624" y1="1120" y2="1120" x1="2432" />
            <wire x2="2624" y1="1120" y2="1232" x1="2624" />
        </branch>
    </sheet>
</drawing>