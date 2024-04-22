-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_RAMB4_S16.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  4K-Bit Data Single Port Block RAM
-- /___/   /\     Filename : X_RAMB4_S16.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:16 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    27/05/08 - CR 472154 Removed Vital GSR constructs
-- End Revision

----- CELL X_RAMB4_S16 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.VPACKAGE.all;
use simprim.VCOMPONENTS.all;

entity X_RAMB4_S16 is

  generic (

    TimingChecksOn : boolean := true;
    Xon            : boolean := true;
    MsgOn          : boolean := true;
    LOC            : string  := "UNPLACED";

    tipd_ADDR : VitalDelayArrayType01 (7 downto 0)  := (others => (0 ps, 0 ps));
    tipd_CLK : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_DI   : VitalDelayArrayType01 (15 downto 0) := (others => (0 ps, 0 ps));
    tipd_EN : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_RST : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_WE : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tpd_CLK_DO : VitalDelayArrayType01 (15 downto 0) := (others => (100 ps, 100 ps));

    tsetup_ADDR_CLK_negedge_posedge : VitalDelayArrayType (7 downto 0)  := (others => 0 ps);
    tsetup_ADDR_CLK_posedge_posedge : VitalDelayArrayType (7 downto 0)  := (others => 0 ps);
    tsetup_DI_CLK_negedge_posedge   : VitalDelayArrayType (15 downto 0) := (others => 0 ps);
    tsetup_DI_CLK_posedge_posedge   : VitalDelayArrayType (15 downto 0) := (others => 0 ps);
    tsetup_EN_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_EN_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_RST_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_RST_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_WE_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_WE_CLK_posedge_posedge : VitalDelayType := 0.000 ns;

    thold_ADDR_CLK_negedge_posedge : VitalDelayArrayType (7 downto 0)  := (others => 0 ps);
    thold_ADDR_CLK_posedge_posedge : VitalDelayArrayType (7 downto 0)  := (others => 0 ps);
    thold_DI_CLK_negedge_posedge   : VitalDelayArrayType (15 downto 0) := (others => 0 ps);
    thold_DI_CLK_posedge_posedge   : VitalDelayArrayType (15 downto 0) := (others => 0 ps);
    thold_EN_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_EN_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
    thold_RST_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_RST_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
    thold_WE_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_WE_CLK_posedge_posedge : VitalDelayType := 0.000 ns;

    ticd_CLK : VitalDelayType := 0.000 ns;
    tisd_ADDR_CLK : VitalDelayArrayType (7 downto 0)  := (others => 0 ps);
    tisd_DI_CLK  : VitalDelayArrayType (15 downto 0) := (others => 0 ps);
    tisd_EN_CLK : VitalDelayType := 0.000 ns;
    tisd_RST_CLK : VitalDelayType := 0.000 ns;
    tisd_WE_CLK : VitalDelayType := 0.000 ns;

    tpw_CLK_negedge : VitalDelayType := 0.000 ns;
    tpw_CLK_posedge : VitalDelayType := 0.000 ns;

    INIT_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
    );

  port (
    DO                                  : out std_logic_vector (15 downto 0) := (others => '0');
    
    ADDR                                : in  std_logic_vector (7 downto 0);
    CLK                                 : in  std_ulogic;
    DI                                  : in  std_logic_vector (15 downto 0);
    EN                                  : in  std_ulogic;
    RST                                 : in  std_ulogic;
    WE                                  : in  std_ulogic
    );
  attribute VITAL_LEVEL0 of
    X_RAMB4_S16 :     entity is true;

end X_RAMB4_S16;

architecture X_RAMB4_S16_V of X_RAMB4_S16 is

  attribute VITAL_LEVEL0 of
    X_RAMB4_S16_V : architecture is true;

  signal ADDR_ipd : std_logic_vector(7 downto 0)  := (others => 'X');
  signal CLK_ipd : std_ulogic := 'X';
  signal DI_ipd   : std_logic_vector(15 downto 0) := (others => 'X');
  signal EN_ipd  : std_ulogic := 'X';
  signal GSR_ipd : std_ulogic := 'X';
  signal RST_ipd : std_ulogic := 'X';
  signal WE_ipd  : std_ulogic := 'X';

  signal ADDR_dly : std_logic_vector(7 downto 0)  := (others => 'X');
  signal CLK_dly : std_ulogic := 'X';
  signal DI_dly   : std_logic_vector(15 downto 0) := (others => 'X');
  signal EN_dly  : std_ulogic := 'X';
  signal GSR_dly  : std_ulogic := '0';
  signal RST_dly : std_ulogic := 'X';
  signal WE_dly  : std_ulogic := 'X';

  constant length : integer := 256;
  constant width : integer := 16;
  type Two_D_array_type is array ((length -  1) downto 0) of std_logic_vector((width - 1) downto 0);

  function slv_to_two_D_array(
    SLV : in std_logic_vector)
    return two_D_array_type is
    variable two_D_array : two_D_array_type;
    variable intermediate : std_logic_vector((width - 1) downto 0);
  begin
    for i in two_D_array'low to two_D_array'high loop
      intermediate := SLV(((i*width) + (width - 1)) downto (i* width));
      two_D_array(i) := intermediate; 
    end loop;
    return two_D_array;
  end;    

begin

  GSR_dly <= GSR;

  WireDelay : block
  begin
    ADDR_DELAY       : for i in 7 downto 0 generate
      VitalWireDelay (ADDR_ipd(i), ADDR(i), tipd_ADDR(i));
    end generate ADDR_DELAY;      
    VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
    DI_DELAY       : for i in 15 downto 0 generate    
      VitalWireDelay (DI_ipd(i), DI(i), tipd_DI(i));
    end generate DI_DELAY;        
    VitalWireDelay (EN_ipd, EN, tipd_EN);
    VitalWireDelay (RST_ipd, RST, tipd_RST);
    VitalWireDelay (WE_ipd, WE, tipd_WE);
  end block;

  SignalDelay : block
  begin
    ADDR_DELAY       : for i in 7 downto 0 generate
    VitalSignalDelay (ADDR_dly(i), ADDR_ipd(i), tisd_ADDR_CLK(i));
    end generate ADDR_DELAY;          
    VitalSignalDelay (CLK_dly, CLK_ipd, ticd_CLK);
    DI_DELAY       : for i in 15 downto 0 generate    
    VitalSignalDelay (DI_dly(i), DI_ipd(i), tisd_DI_CLK(i));
    end generate DI_DELAY;            
    VitalSignalDelay (EN_dly, EN_ipd, tisd_EN_CLK);
    VitalSignalDelay (RST_dly, RST_ipd, tisd_RST_CLK);
    VitalSignalDelay (WE_dly, WE_ipd, tisd_WE_CLK);
  end block;

  VITALBehavior : process
    variable Tviol_ADDR0_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADDR1_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADDR2_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADDR3_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADDR4_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADDR5_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADDR6_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADDR7_CLK_posedge : std_ulogic := '0';
    variable Tviol_DI0_CLK_posedge   : std_ulogic := '0';
    variable Tviol_DI10_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI11_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI12_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI13_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI14_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI15_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI1_CLK_posedge   : std_ulogic := '0';
    variable Tviol_DI2_CLK_posedge   : std_ulogic := '0';
    variable Tviol_DI3_CLK_posedge   : std_ulogic := '0';
    variable Tviol_DI4_CLK_posedge   : std_ulogic := '0';
    variable Tviol_DI5_CLK_posedge   : std_ulogic := '0';
    variable Tviol_DI6_CLK_posedge   : std_ulogic := '0';
    variable Tviol_DI7_CLK_posedge   : std_ulogic := '0';
    variable Tviol_DI8_CLK_posedge   : std_ulogic := '0';
    variable Tviol_DI9_CLK_posedge   : std_ulogic := '0';
    variable Tviol_EN_CLK_posedge    : std_ulogic := '0';
    variable Tviol_RST_CLK_posedge   : std_ulogic := '0';
    variable Tviol_WE_CLK_posedge    : std_ulogic := '0';

    variable Tmkr_ADDR0_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR1_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR2_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR3_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR4_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR5_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR6_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR7_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI0_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI10_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI11_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI12_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI13_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI14_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI15_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI1_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI2_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI3_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI4_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI5_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI6_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI7_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI8_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI9_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_EN_CLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_RST_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WE_CLK_posedge    : VitalTimingDataType := VitalTimingDataInit;

    variable PInfo_CLK : VitalPeriodDataType := VitalPeriodDataInit;
    
    variable PViol_CLK : std_ulogic          := '0';

    variable address : integer;
    variable valid_addr : boolean := FALSE;
    variable mem_slv : std_logic_vector(4095 downto 0) := To_StdLogicVector(INIT_0F & INIT_0E & INIT_0D & INIT_0C &
                                                                            INIT_0B & INIT_0A & INIT_09 & INIT_08 &
                                                                            INIT_07 & INIT_06 & INIT_05 & INIT_04 &
                                                                            INIT_03 & INIT_02 & INIT_01 & INIT_00);     
    variable mem : Two_D_array_type := slv_to_two_D_array(mem_slv);        



    variable DO_GlitchData0  : VitalGlitchDataType;
    variable DO_GlitchData1  : VitalGlitchDataType;
    variable DO_GlitchData10 : VitalGlitchDataType;
    variable DO_GlitchData11 : VitalGlitchDataType;
    variable DO_GlitchData12 : VitalGlitchDataType;
    variable DO_GlitchData13 : VitalGlitchDataType;
    variable DO_GlitchData14 : VitalGlitchDataType;
    variable DO_GlitchData15 : VitalGlitchDataType;
    variable DO_GlitchData2  : VitalGlitchDataType;
    variable DO_GlitchData3  : VitalGlitchDataType;
    variable DO_GlitchData4  : VitalGlitchDataType;
    variable DO_GlitchData5  : VitalGlitchDataType;
    variable DO_GlitchData6  : VitalGlitchDataType;
    variable DO_GlitchData7  : VitalGlitchDataType;
    variable DO_GlitchData8  : VitalGlitchDataType;
    variable DO_GlitchData9  : VitalGlitchDataType;
    variable DO_zd           : std_logic_vector(15 downto 0)   := (others => '0');
    variable Violation       : std_ulogic                      := '0';    

  begin

    if (TimingChecksOn) then
      VitalSetupHoldCheck (
        Violation      => Tviol_DI15_CLK_posedge,
        TimingData     => Tmkr_DI15_CLK_posedge,
        TestSignal     => DI_dly(15),
        TestSignalName => "DI(15)",
        TestDelay      => tisd_DI_CLK(15),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(15),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(15),
        HoldLow        => thold_DI_CLK_posedge_posedge(15),
        HoldHigh       => thold_DI_CLK_negedge_posedge(15),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI14_CLK_posedge,
        TimingData     => Tmkr_DI14_CLK_posedge,
        TestSignal     => DI_dly(14),
        TestSignalName => "DI(14)",
        TestDelay      => tisd_DI_CLK(14),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(14),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(14),
        HoldLow        => thold_DI_CLK_posedge_posedge(14),
        HoldHigh       => thold_DI_CLK_negedge_posedge(14),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI13_CLK_posedge,
        TimingData     => Tmkr_DI13_CLK_posedge,
        TestSignal     => DI_dly(13),
        TestSignalName => "DI(13)",
        TestDelay      => tisd_DI_CLK(13),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(13),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(13),
        HoldLow        => thold_DI_CLK_posedge_posedge(13),
        HoldHigh       => thold_DI_CLK_negedge_posedge(13),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI12_CLK_posedge,
        TimingData     => Tmkr_DI12_CLK_posedge,
        TestSignal     => DI_dly(12),
        TestSignalName => "DI(12)",
        TestDelay      => tisd_DI_CLK(12),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(12),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(12),
        HoldLow        => thold_DI_CLK_posedge_posedge(12),
        HoldHigh       => thold_DI_CLK_negedge_posedge(12),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI11_CLK_posedge,
        TimingData     => Tmkr_DI11_CLK_posedge,
        TestSignal     => DI_dly(11),
        TestSignalName => "DI(11)",
        TestDelay      => tisd_DI_CLK(11),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(11),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(11),
        HoldLow        => thold_DI_CLK_posedge_posedge(11),
        HoldHigh       => thold_DI_CLK_negedge_posedge(11),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI10_CLK_posedge,
        TimingData     => Tmkr_DI10_CLK_posedge,
        TestSignal     => DI_dly(10),
        TestSignalName => "DI(10)",
        TestDelay      => tisd_DI_CLK(10),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(10),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(10),
        HoldLow        => thold_DI_CLK_posedge_posedge(10),
        HoldHigh       => thold_DI_CLK_negedge_posedge(10),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI9_CLK_posedge,
        TimingData     => Tmkr_DI9_CLK_posedge,
        TestSignal     => DI_dly(9),
        TestSignalName => "DI(9)",
        TestDelay      => tisd_DI_CLK(9),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(9),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(9),
        HoldLow        => thold_DI_CLK_posedge_posedge(9),
        HoldHigh       => thold_DI_CLK_negedge_posedge(9),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI8_CLK_posedge,
        TimingData     => Tmkr_DI8_CLK_posedge,
        TestSignal     => DI_dly(8),
        TestSignalName => "DI(8)",
        TestDelay      => tisd_DI_CLK(8),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(8),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(8),
        HoldLow        => thold_DI_CLK_posedge_posedge(8),
        HoldHigh       => thold_DI_CLK_negedge_posedge(8),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI7_CLK_posedge,
        TimingData     => Tmkr_DI7_CLK_posedge,
        TestSignal     => DI_dly(7),
        TestSignalName => "DI(7)",
        TestDelay      => tisd_DI_CLK(7),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(7),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(7),
        HoldLow        => thold_DI_CLK_posedge_posedge(7),
        HoldHigh       => thold_DI_CLK_negedge_posedge(7),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI6_CLK_posedge,
        TimingData     => Tmkr_DI6_CLK_posedge,
        TestSignal     => DI_dly(6),
        TestSignalName => "DI(6)",
        TestDelay      => tisd_DI_CLK(6),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(6),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(6),
        HoldLow        => thold_DI_CLK_posedge_posedge(6),
        HoldHigh       => thold_DI_CLK_negedge_posedge(6),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI5_CLK_posedge,
        TimingData     => Tmkr_DI5_CLK_posedge,
        TestSignal     => DI_dly(5),
        TestSignalName => "DI(5)",
        TestDelay      => tisd_DI_CLK(5),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(5),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(5),
        HoldLow        => thold_DI_CLK_posedge_posedge(5),
        HoldHigh       => thold_DI_CLK_negedge_posedge(5),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI4_CLK_posedge,
        TimingData     => Tmkr_DI4_CLK_posedge,
        TestSignal     => DI_dly(4),
        TestSignalName => "DI(4)",
        TestDelay      => tisd_DI_CLK(4),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(4),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(4),
        HoldLow        => thold_DI_CLK_posedge_posedge(4),
        HoldHigh       => thold_DI_CLK_negedge_posedge(4),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI3_CLK_posedge,
        TimingData     => Tmkr_DI3_CLK_posedge,
        TestSignal     => DI_dly(3),
        TestSignalName => "DI(3)",
        TestDelay      => tisd_DI_CLK(3),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(3),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(3),
        HoldLow        => thold_DI_CLK_posedge_posedge(3),
        HoldHigh       => thold_DI_CLK_negedge_posedge(3),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI2_CLK_posedge,
        TimingData     => Tmkr_DI2_CLK_posedge,
        TestSignal     => DI_dly(2),
        TestSignalName => "DI(2)",
        TestDelay      => tisd_DI_CLK(2),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(2),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(2),
        HoldLow        => thold_DI_CLK_posedge_posedge(2),
        HoldHigh       => thold_DI_CLK_negedge_posedge(2),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI1_CLK_posedge,
        TimingData     => Tmkr_DI1_CLK_posedge,
        TestSignal     => DI_dly(1),
        TestSignalName => "DI(1)",
        TestDelay      => tisd_DI_CLK(1),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(1),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(1),
        HoldLow        => thold_DI_CLK_posedge_posedge(1),
        HoldHigh       => thold_DI_CLK_negedge_posedge(1),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_DI0_CLK_posedge,
        TimingData     => Tmkr_DI0_CLK_posedge,
        TestSignal     => DI_dly(0),
        TestSignalName => "DI(0)",
        TestDelay      => tisd_DI_CLK(0),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_DI_CLK_posedge_posedge(0),
        SetupLow       => tsetup_DI_CLK_negedge_posedge(0),
        HoldLow        => thold_DI_CLK_posedge_posedge(0),
        HoldHigh       => thold_DI_CLK_negedge_posedge(0),
        CheckEnabled   => TO_X01(EN_dly and WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WE_CLK_posedge,
        TimingData     => Tmkr_WE_CLK_posedge,
        TestSignal     => WE_dly,
        TestSignalName => "WE",
        TestDelay      => tisd_WE_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_WE_CLK_posedge_posedge,
        SetupLow       => tsetup_WE_CLK_negedge_posedge,
        HoldLow        => thold_WE_CLK_posedge_posedge,
        HoldHigh       => thold_WE_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_EN_CLK_posedge,
        TimingData     => Tmkr_EN_CLK_posedge,
        TestSignal     => EN_dly,
        TestSignalName => "EN",
        TestDelay      => tisd_EN_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_EN_CLK_posedge_posedge,
        SetupLow       => tsetup_EN_CLK_negedge_posedge,
        HoldLow        => thold_EN_CLK_posedge_posedge,
        HoldHigh       => thold_EN_CLK_negedge_posedge,
        CheckEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_RST_CLK_posedge,
        TimingData     => Tmkr_RST_CLK_posedge,
        TestSignal     => RST_dly,
        TestSignalName => "RST",
        TestDelay      => tisd_RST_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_RST_CLK_posedge_posedge,
        SetupLow       => tsetup_RST_CLK_negedge_posedge,
        HoldLow        => thold_RST_CLK_posedge_posedge,
        HoldHigh       => thold_RST_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR7_CLK_posedge,
        TimingData     => Tmkr_ADDR7_CLK_posedge,
        TestSignal     => ADDR_dly(7),
        TestSignalName => "ADDR(7)",
        TestDelay      => tisd_ADDR_CLK(7),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(7),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(7),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(7),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(7),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR6_CLK_posedge,
        TimingData     => Tmkr_ADDR6_CLK_posedge,
        TestSignal     => ADDR_dly(6),
        TestSignalName => "ADDR(6)",
        TestDelay      => tisd_ADDR_CLK(6),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(6),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(6),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(6),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(6),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR5_CLK_posedge,
        TimingData     => Tmkr_ADDR5_CLK_posedge,
        TestSignal     => ADDR_dly(5),
        TestSignalName => "ADDR(5)",
        TestDelay      => tisd_ADDR_CLK(5),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(5),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(5),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(5),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(5),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR4_CLK_posedge,
        TimingData     => Tmkr_ADDR4_CLK_posedge,
        TestSignal     => ADDR_dly(4),
        TestSignalName => "ADDR(4)",
        TestDelay      => tisd_ADDR_CLK(4),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(4),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(4),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(4),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(4),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR3_CLK_posedge,
        TimingData     => Tmkr_ADDR3_CLK_posedge,
        TestSignal     => ADDR_dly(3),
        TestSignalName => "ADDR(3)",
        TestDelay      => tisd_ADDR_CLK(3),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(3),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(3),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(3),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(3),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR2_CLK_posedge,
        TimingData     => Tmkr_ADDR2_CLK_posedge,
        TestSignal     => ADDR_dly(2),
        TestSignalName => "ADDR(2)",
        TestDelay      => tisd_ADDR_CLK(2),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(2),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(2),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(2),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(2),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR1_CLK_posedge,
        TimingData     => Tmkr_ADDR1_CLK_posedge,
        TestSignal     => ADDR_dly(1),
        TestSignalName => "ADDR(1)",
        TestDelay      => tisd_ADDR_CLK(1),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(1),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(1),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(1),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(1),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR0_CLK_posedge,
        TimingData     => Tmkr_ADDR0_CLK_posedge,
        TestSignal     => ADDR_dly(0),
        TestSignalName => "ADDR(0)",
        TestDelay      => tisd_ADDR_CLK(0),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(0),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(0),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(0),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(0),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_CLK,
        PeriodData     => PInfo_CLK,
        TestSignal     => CLK_dly,
        TestSignalName => "CLK",
        TestDelay      => 0 ps,
        Period         => 0 ps,
        PulseWidthHigh => tpw_CLK_posedge,
        PulseWidthLow  => tpw_CLK_negedge,
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        HeaderMsg      => "/X_RAMB4_S16",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
    end if;

    Violation :=
      Pviol_CLK or
      Tviol_ADDR0_CLK_posedge or
      Tviol_ADDR1_CLK_posedge or
      Tviol_ADDR2_CLK_posedge or
      Tviol_ADDR3_CLK_posedge or
      Tviol_ADDR4_CLK_posedge or
      Tviol_ADDR5_CLK_posedge or
      Tviol_ADDR6_CLK_posedge or
      Tviol_ADDR7_CLK_posedge or
      Tviol_DI0_CLK_posedge or
      Tviol_DI10_CLK_posedge or
      Tviol_DI11_CLK_posedge or
      Tviol_DI12_CLK_posedge or
      Tviol_DI13_CLK_posedge or
      Tviol_DI14_CLK_posedge or
      Tviol_DI15_CLK_posedge or
      Tviol_DI1_CLK_posedge or
      Tviol_DI2_CLK_posedge or
      Tviol_DI3_CLK_posedge or
      Tviol_DI4_CLK_posedge or
      Tviol_DI5_CLK_posedge or
      Tviol_DI6_CLK_posedge or
      Tviol_DI7_CLK_posedge or
      Tviol_DI8_CLK_posedge or
      Tviol_DI9_CLK_posedge or
      Tviol_EN_CLK_posedge or
      Tviol_RST_CLK_posedge or
      Tviol_WE_CLK_posedge;

    valid_addr := addr_is_valid(ADDR_dly);

    if (valid_addr) then
      address := slv_to_int(ADDR_dly);
    end if;

    if (GSR_dly = '1') then
      DO_zd := (others => '0');
      
    elsif (GSR_dly = '0') then
      if (rising_edge(CLK_dly)) then
        if (EN_dly = '1') then
          if (RST_dly = '1') then
            DO_zd := (others => '0');
          else    
            if (WE_dly = '1') then
              DO_zd := DI_dly;              
            else 
              if (valid_addr) then
                DO_zd := mem(address);
              end if;
            end if;
          end if;
          if (WE_dly = '1') then
            if (valid_addr) then
              mem(address) := DI_dly;
            end if;
          end if;  
        end if;
      end if;      
    end if;

    DO_zd(15) := Violation xor DO_zd(15);
    DO_zd(14) := Violation xor DO_zd(14);
    DO_zd(13) := Violation xor DO_zd(13);
    DO_zd(12) := Violation xor DO_zd(12);
    DO_zd(11) := Violation xor DO_zd(11);
    DO_zd(10) := Violation xor DO_zd(10);
    DO_zd(9)  := Violation xor DO_zd(9);
    DO_zd(8)  := Violation xor DO_zd(8);
    DO_zd(7)  := Violation xor DO_zd(7);
    DO_zd(6)  := Violation xor DO_zd(6);
    DO_zd(5)  := Violation xor DO_zd(5);
    DO_zd(4)  := Violation xor DO_zd(4);
    DO_zd(3)  := Violation xor DO_zd(3);
    DO_zd(2)  := Violation xor DO_zd(2);
    DO_zd(1)  := Violation xor DO_zd(1);
    DO_zd(0)  := Violation xor DO_zd(0);

    VitalPathDelay01 (
      OutSignal     => DO(15),
      GlitchData    => DO_GlitchData15,
      OutSignalName => "DO(15)",
      OutTemp       => DO_zd(15),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(15), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(14),
      GlitchData    => DO_GlitchData14,
      OutSignalName => "DO(14)",
      OutTemp       => DO_zd(14),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(14), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(13),
      GlitchData    => DO_GlitchData13,
      OutSignalName => "DO(13)",
      OutTemp       => DO_zd(13),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(13), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(12),
      GlitchData    => DO_GlitchData12,
      OutSignalName => "DO(12)",
      OutTemp       => DO_zd(12),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(12), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(11),
      GlitchData    => DO_GlitchData11,
      OutSignalName => "DO(11)",
      OutTemp       => DO_zd(11),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(11), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(10),
      GlitchData    => DO_GlitchData10,
      OutSignalName => "DO(10)",
      OutTemp       => DO_zd(10),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(10), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(9),
      GlitchData    => DO_GlitchData9,
      OutSignalName => "DO(9)",
      OutTemp       => DO_zd(9),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(9), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(8),
      GlitchData    => DO_GlitchData8,
      OutSignalName => "DO(8)",
      OutTemp       => DO_zd(8),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(8), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(7),
      GlitchData    => DO_GlitchData7,
      OutSignalName => "DO(7)",
      OutTemp       => DO_zd(7),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(7), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(6),
      GlitchData    => DO_GlitchData6,
      OutSignalName => "DO(6)",
      OutTemp       => DO_zd(6),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(6), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(5),
      GlitchData    => DO_GlitchData5,
      OutSignalName => "DO(5)",
      OutTemp       => DO_zd(5),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(5), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(4),
      GlitchData    => DO_GlitchData4,
      OutSignalName => "DO(4)",
      OutTemp       => DO_zd(4),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(4), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(3),
      GlitchData    => DO_GlitchData3,
      OutSignalName => "DO(3)",
      OutTemp       => DO_zd(3),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(3), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(2),
      GlitchData    => DO_GlitchData2,
      OutSignalName => "DO(2)",
      OutTemp       => DO_zd(2),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(2), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(1),
      GlitchData    => DO_GlitchData1,
      OutSignalName => "DO(1)",
      OutTemp       => DO_zd(1),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(1), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DO(0),
      GlitchData    => DO_GlitchData0,
      OutSignalName => "DO(0)",
      OutTemp       => DO_zd(0),
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_DO(0), (EN_dly /= '0' and GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    wait on ADDR_dly, CLK_dly, DI_dly, EN_dly, GSR_dly, RST_dly, WE_dly;
  end process VITALBehavior;
end X_RAMB4_S16_V;

