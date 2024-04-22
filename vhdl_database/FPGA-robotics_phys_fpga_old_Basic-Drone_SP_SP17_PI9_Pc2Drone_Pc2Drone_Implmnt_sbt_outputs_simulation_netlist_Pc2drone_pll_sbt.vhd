-- ******************************************************************************

-- iCEcube Netlister

-- Version:            2017.08.27940

-- Build Date:         Sep 11 2017 17:29:57

-- File Generated:     May 18 2019 11:55:24

-- Purpose:            Post-Route Verilog/VHDL netlist for timing simulation

-- Copyright (C) 2006-2010 by Lattice Semiconductor Corp. All rights reserved.

-- ******************************************************************************

-- VHDL file for cell "Pc2drone_pll" view "INTERFACE"

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library ice;
use ice.vcomponent_vital.all;

-- Entity of Pc2drone_pll
entity Pc2drone_pll is
port (
    RESET : in std_logic;
    REFERENCECLK : in std_logic;
    PLLOUTGLOBAL : out std_logic;
    PLLOUTCORE : out std_logic);
end Pc2drone_pll;

-- Architecture of Pc2drone_pll
-- View name is \INTERFACE\
architecture \INTERFACE\ of Pc2drone_pll is

signal \N__178\ : std_logic;
signal \N__177\ : std_logic;
signal \N__176\ : std_logic;
signal \N__169\ : std_logic;
signal \N__168\ : std_logic;
signal \N__167\ : std_logic;
signal \N__160\ : std_logic;
signal \N__159\ : std_logic;
signal \N__158\ : std_logic;
signal \N__151\ : std_logic;
signal \N__150\ : std_logic;
signal \N__149\ : std_logic;
signal \N__132\ : std_logic;
signal \N__129\ : std_logic;
signal \N__126\ : std_logic;
signal \N__123\ : std_logic;
signal \N__120\ : std_logic;
signal \N__117\ : std_logic;
signal \N__114\ : std_logic;
signal \N__111\ : std_logic;
signal \N__108\ : std_logic;
signal \N__105\ : std_logic;
signal \N__102\ : std_logic;
signal \N__99\ : std_logic;
signal \N__96\ : std_logic;
signal \N__93\ : std_logic;
signal \N__90\ : std_logic;
signal \N__87\ : std_logic;
signal \RESET_c\ : std_logic;
signal \REFERENCECLK_c\ : std_logic;
signal \PLLOUTCORE_c\ : std_logic;
signal \VCCG0\ : std_logic;
signal \GNDG0\ : std_logic;
signal \PLLOUTGLOBAL_c\ : std_logic;
signal \GB_BUFFER_PLLOUTGLOBAL_c_THRU_CO\ : std_logic;
signal \_gnd_net_\ : std_logic;

signal \PLLOUTGLOBAL_wire\ : std_logic;
signal \PLLOUTCORE_wire\ : std_logic;
signal \REFERENCECLK_wire\ : std_logic;
signal \RESET_wire\ : std_logic;
signal \Pc2drone_pll_inst_DYNAMICDELAY_wire\ : std_logic_vector(7 downto 0);

begin
    PLLOUTGLOBAL <= \PLLOUTGLOBAL_wire\;
    PLLOUTCORE <= \PLLOUTCORE_wire\;
    \REFERENCECLK_wire\ <= REFERENCECLK;
    \RESET_wire\ <= RESET;
    \Pc2drone_pll_inst_DYNAMICDELAY_wire\ <= \GNDG0\&\GNDG0\&\GNDG0\&\GNDG0\&\GNDG0\&\GNDG0\&\GNDG0\&\GNDG0\;

    \Pc2drone_pll_inst\ : SB_PLL40_CORE
    generic map (
            DELAY_ADJUSTMENT_MODE_FEEDBACK => "FIXED",
            TEST_MODE => '0',
            SHIFTREG_DIV_MODE => "00",
            PLLOUT_SELECT => "GENCLK",
            FILTER_RANGE => "001",
            FEEDBACK_PATH => "SIMPLE",
            FDA_RELATIVE => "0000",
            FDA_FEEDBACK => "0000",
            ENABLE_ICEGATE => '0',
            DIVR => "0000",
            DIVQ => "110",
            DIVF => "0111111",
            DELAY_ADJUSTMENT_MODE_RELATIVE => "FIXED"
        )
    port map (
            EXTFEEDBACK => '0',
            LATCHINPUTVALUE => '0',
            SCLK => '0',
            SDO => OPEN,
            LOCK => OPEN,
            PLLOUTCORE => \PLLOUTCORE_c\,
            REFERENCECLK => \N__123\,
            RESETB => \N__132\,
            BYPASS => \GNDG0\,
            SDI => '0',
            DYNAMICDELAY => \Pc2drone_pll_inst_DYNAMICDELAY_wire\,
            PLLOUTGLOBAL => \PLLOUTGLOBAL_c\
        );

    \PLLOUTGLOBAL_obuf_iopad\ : IO_PAD
    generic map (
            IO_STANDARD => "SB_LVCMOS",
            PULLUP => '0'
        )
    port map (
            OE => \N__178\,
            DIN => \N__177\,
            DOUT => \N__176\,
            PACKAGEPIN => \PLLOUTGLOBAL_wire\
        );

    \PLLOUTGLOBAL_obuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "011001"
        )
    port map (
            PADOEN => \N__178\,
            PADOUT => \N__177\,
            PADIN => \N__176\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => \N__90\,
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \PLLOUTCORE_obuf_iopad\ : IO_PAD
    generic map (
            IO_STANDARD => "SB_LVCMOS",
            PULLUP => '0'
        )
    port map (
            OE => \N__169\,
            DIN => \N__168\,
            DOUT => \N__167\,
            PACKAGEPIN => \PLLOUTCORE_wire\
        );

    \PLLOUTCORE_obuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "011001"
        )
    port map (
            PADOEN => \N__169\,
            PADOUT => \N__168\,
            PADIN => \N__167\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => \N__114\,
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \REFERENCECLK_ibuf_iopad\ : IO_PAD
    generic map (
            IO_STANDARD => "SB_LVCMOS",
            PULLUP => '0'
        )
    port map (
            OE => \N__160\,
            DIN => \N__159\,
            DOUT => \N__158\,
            PACKAGEPIN => \REFERENCECLK_wire\
        );

    \REFERENCECLK_ibuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "000001"
        )
    port map (
            PADOEN => \N__160\,
            PADOUT => \N__159\,
            PADIN => \N__158\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => \REFERENCECLK_c\,
            DOUT0 => '0',
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \RESET_ibuf_iopad\ : IO_PAD
    generic map (
            IO_STANDARD => "SB_LVCMOS",
            PULLUP => '0'
        )
    port map (
            OE => \N__151\,
            DIN => \N__150\,
            DOUT => \N__149\,
            PACKAGEPIN => \RESET_wire\
        );

    \RESET_ibuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "000001"
        )
    port map (
            PADOEN => \N__151\,
            PADOUT => \N__150\,
            PADIN => \N__149\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => \RESET_c\,
            DOUT0 => '0',
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \I__24\ : IoInMux
    port map (
            O => \N__132\,
            I => \N__129\
        );

    \I__23\ : LocalMux
    port map (
            O => \N__129\,
            I => \N__126\
        );

    \I__22\ : Odrv4
    port map (
            O => \N__126\,
            I => \RESET_c\
        );

    \I__21\ : IoInMux
    port map (
            O => \N__123\,
            I => \N__120\
        );

    \I__20\ : LocalMux
    port map (
            O => \N__120\,
            I => \N__117\
        );

    \I__19\ : Odrv4
    port map (
            O => \N__117\,
            I => \REFERENCECLK_c\
        );

    \I__18\ : IoInMux
    port map (
            O => \N__114\,
            I => \N__111\
        );

    \I__17\ : LocalMux
    port map (
            O => \N__111\,
            I => \N__108\
        );

    \I__16\ : IoSpan4Mux
    port map (
            O => \N__108\,
            I => \N__105\
        );

    \I__15\ : Odrv4
    port map (
            O => \N__105\,
            I => \PLLOUTCORE_c\
        );

    \I__14\ : InMux
    port map (
            O => \N__102\,
            I => \N__99\
        );

    \I__13\ : LocalMux
    port map (
            O => \N__99\,
            I => \N__96\
        );

    \I__12\ : Glb2LocalMux
    port map (
            O => \N__96\,
            I => \N__93\
        );

    \I__11\ : GlobalMux
    port map (
            O => \N__93\,
            I => \PLLOUTGLOBAL_c\
        );

    \I__10\ : IoInMux
    port map (
            O => \N__90\,
            I => \N__87\
        );

    \I__9\ : LocalMux
    port map (
            O => \N__87\,
            I => \GB_BUFFER_PLLOUTGLOBAL_c_THRU_CO\
        );

    \VCC\ : VCC
    port map (
            Y => \VCCG0\
        );

    \GND\ : GND
    port map (
            Y => \GNDG0\
        );

    \GND_Inst\ : GND
    port map (
            Y => \_gnd_net_\
        );

    \GB_BUFFER_PLLOUTGLOBAL_c_THRU_LUT4_0_LC_9_30_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1111111100000000"
        )
    port map (
            in0 => \_gnd_net_\,
            in1 => \_gnd_net_\,
            in2 => \_gnd_net_\,
            in3 => \N__102\,
            lcout => \GB_BUFFER_PLLOUTGLOBAL_c_THRU_CO\,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );
end \INTERFACE\;
