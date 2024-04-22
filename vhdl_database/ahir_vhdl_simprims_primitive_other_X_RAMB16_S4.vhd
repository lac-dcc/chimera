-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_RAMB16_S4.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  16K-Bit Data and 2K-Bit Parity Single Port Block RAM
-- /___/   /\     Filename : X_RAMB16_S4.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:15 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    07/09/07 - Changed generic write_mode to uppercase (CR 441954).
--    27/05/08 - CR 472154 Removed Vital GSR constructs
-- End Revision

----- CELL X_RAMB16_S4 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.VPACKAGE.all;
use simprim.VCOMPONENTS.all;

entity X_RAMB16_S4 is

  generic (
    TimingChecksOn : boolean := true;
    Xon            : boolean := true;
    MsgOn          : boolean := true;
    LOC            : string  := "UNPLACED";

    tipd_ADDR : VitalDelayArrayType01(11 downto 0) := (others => (0 ps, 0 ps));
    tipd_CLK : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_DI   : VitalDelayArrayType01(3 downto 0)  := (others => (0 ps, 0 ps));
    tipd_EN : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_SSR : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_WE : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tpd_CLK_DO : VitalDelayArrayType01(3 downto 0) := (others => (100 ps, 100 ps));

    tsetup_ADDR_CLK_negedge_posedge : VitalDelayArrayType(11 downto 0) := (others => 0 ps);
    tsetup_ADDR_CLK_posedge_posedge : VitalDelayArrayType(11 downto 0) := (others => 0 ps);
    tsetup_DI_CLK_negedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_DI_CLK_posedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tsetup_EN_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_EN_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_SSR_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_SSR_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_WE_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_WE_CLK_posedge_posedge : VitalDelayType := 0.000 ns;

    thold_ADDR_CLK_negedge_posedge : VitalDelayArrayType(11 downto 0) := (others => 0 ps);
    thold_ADDR_CLK_posedge_posedge : VitalDelayArrayType(11 downto 0) := (others => 0 ps);
    thold_DI_CLK_negedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_DI_CLK_posedge_posedge   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    thold_EN_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_EN_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
    thold_SSR_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_SSR_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
    thold_WE_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_WE_CLK_posedge_posedge : VitalDelayType := 0.000 ns;

    ticd_CLK : VitalDelayType := 0.000 ns;
    tisd_ADDR_CLK  : VitalDelayArrayType(11 downto 0) := (others => 0 ps);
    tisd_DI_CLK : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tisd_EN_CLK : VitalDelayType := 0.000 ns;
    tisd_SSR_CLK : VitalDelayType := 0.000 ns;
    tisd_WE_CLK : VitalDelayType := 0.000 ns;

    tpw_CLK_negedge : VitalDelayType := 0.000 ns;
    tpw_CLK_posedge : VitalDelayType := 0.000 ns;

    INIT       : bit_vector := X"0";
    SRVAL      : bit_vector := X"0";
    WRITE_MODE : string     := "WRITE_FIRST";

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
    INIT_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
    );

  port (
    DO                                  : out std_logic_vector(3 downto 0);
    
    ADDR                                : in  std_logic_vector(11 downto 0);
    CLK                                 : in  std_ulogic;
    DI                                  : in  std_logic_vector(3 downto 0);
    EN                                  : in  std_ulogic;
    SSR                                 : in  std_ulogic;
    WE                                  : in  std_ulogic
    );
  
  attribute VITAL_LEVEL0 of
    X_RAMB16_S4 :     entity is true;
end X_RAMB16_S4;

architecture X_RAMB16_S4_V of X_RAMB16_S4 is
  attribute VITAL_LEVEL0 of
    X_RAMB16_S4_V : architecture is true;

  signal ADDR_ipd : std_logic_vector(11 downto 0) := (others => 'X');
  signal CLK_ipd : std_ulogic := 'X';
  signal DI_ipd   : std_logic_vector(3 downto 0)  := (others => 'X');
  signal EN_ipd  : std_ulogic := 'X';
  signal GSR_ipd : std_ulogic := 'X';
  signal SSR_ipd : std_ulogic := 'X';
  signal WE_ipd  : std_ulogic := 'X';

  signal ADDR_dly : std_logic_vector(11 downto 0) := (others => 'X');
  signal CLK_dly : std_ulogic := 'X';
  signal DI_dly   : std_logic_vector(3 downto 0)  := (others => 'X');
  signal EN_dly  : std_ulogic := 'X';
  signal GSR_dly  : std_ulogic := '0';
  signal SSR_dly : std_ulogic := 'X';
  signal WE_dly  : std_ulogic := 'X';

  constant length : integer := 4096;
  constant width : integer := 4;
  type Two_D_array_type is array ((length -  1) downto 0) of std_logic_vector((width - 1) downto 0);

  function slv_to_two_D_array(
    slv_length : integer;
    slv_width : integer;
    SLV : in std_logic_vector
    )
    return two_D_array_type is
    variable two_D_array : two_D_array_type;
    variable intermediate : std_logic_vector((slv_width - 1) downto 0);
  begin
    for i in 0 to (slv_length - 1)loop
      intermediate := SLV(((i*slv_width) + (slv_width - 1)) downto (i* slv_width));
      two_D_array(i) := intermediate; 
    end loop;
    return two_D_array;
  end;      

begin

  GSR_dly <= GSR;

  WireDelay : block
  begin
    ADDR_DELAY       : for i in 11 downto 0 generate
      VitalWireDelay (ADDR_ipd(i), ADDR(i), tipd_ADDR(i));
    end generate ADDR_DELAY;        
    VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
    DI_DELAY       : for i in 3 downto 0 generate    
      VitalWireDelay (DI_ipd(i), DI(i), tipd_DI(i));
    end generate DI_DELAY;            
    VitalWireDelay (EN_ipd, EN, tipd_EN);
    VitalWireDelay (SSR_ipd, SSR, tipd_SSR);
    VitalWireDelay (WE_ipd, WE, tipd_WE);
  end block;

  SignalDelay : block
  begin
    ADDR_DELAY       : for i in 11 downto 0 generate
    VitalSignalDelay (ADDR_dly(i), ADDR_ipd(i), tisd_ADDR_CLK(i));
    end generate ADDR_DELAY;            
    VitalSignalDelay (CLK_dly, CLK_ipd, ticd_CLK);
    DI_DELAY       : for i in 3 downto 0 generate    
    VitalSignalDelay (DI_dly(i), DI_ipd(i), tisd_DI_CLK(i));
    end generate DI_DELAY;                
    VitalSignalDelay (EN_dly, EN_ipd, tisd_EN_CLK);
    VitalSignalDelay (SSR_dly, SSR_ipd, tisd_SSR_CLK);
    VitalSignalDelay (WE_dly, WE_ipd, tisd_WE_CLK);
  end block;

  VITALBehavior : process
    variable Tviol_ADDR0_CLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDR10_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADDR11_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADDR1_CLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDR2_CLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDR3_CLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDR4_CLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDR5_CLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDR6_CLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDR7_CLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDR8_CLK_posedge  : std_ulogic := '0';
    variable Tviol_ADDR9_CLK_posedge  : std_ulogic := '0';
    variable Tviol_DI0_CLK_posedge    : std_ulogic := '0';
    variable Tviol_DI1_CLK_posedge    : std_ulogic := '0';
    variable Tviol_DI2_CLK_posedge    : std_ulogic := '0';
    variable Tviol_DI3_CLK_posedge    : std_ulogic := '0';
    variable Tviol_EN_CLK_posedge     : std_ulogic := '0';
    variable Tviol_SSR_CLK_posedge    : std_ulogic := '0';
    variable Tviol_WE_CLK_posedge     : std_ulogic := '0';

    variable Tmkr_ADDR0_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR10_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR11_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR1_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR2_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR3_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR4_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR5_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR6_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR7_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR8_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDR9_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI0_CLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI1_CLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI2_CLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DI3_CLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_EN_CLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_SSR_CLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WE_CLK_posedge     : VitalTimingDataType := VitalTimingDataInit;

    variable PInfo_CLK : VitalPeriodDataType := VitalPeriodDataInit;
    
    variable PViol_CLK : std_ulogic          := '0';

    variable DO_GlitchData0 : VitalGlitchDataType;
    variable DO_GlitchData1 : VitalGlitchDataType;
    variable DO_GlitchData2 : VitalGlitchDataType;
    variable DO_GlitchData3 : VitalGlitchDataType;

    variable address : integer;
    variable valid_addr : boolean := FALSE;
    variable mem_slv : std_logic_vector(16383 downto 0) := To_StdLogicVector(INIT_3F & INIT_3E & INIT_3D & INIT_3C &
                                                                             INIT_3B & INIT_3A & INIT_39 & INIT_38 &
                                                                             INIT_37 & INIT_36 & INIT_35 & INIT_34 &
                                                                             INIT_33 & INIT_32 & INIT_31 & INIT_30 &
                                                                             INIT_2F & INIT_2E & INIT_2D & INIT_2C &
                                                                             INIT_2B & INIT_2A & INIT_29 & INIT_28 &
                                                                             INIT_27 & INIT_26 & INIT_25 & INIT_24 &
                                                                             INIT_23 & INIT_22 & INIT_21 & INIT_20 &
                                                                             INIT_1F & INIT_1E & INIT_1D & INIT_1C &
                                                                             INIT_1B & INIT_1A & INIT_19 & INIT_18 &
                                                                             INIT_17 & INIT_16 & INIT_15 & INIT_14 &
                                                                             INIT_13 & INIT_12 & INIT_11 & INIT_10 &
                                                                             INIT_0F & INIT_0E & INIT_0D & INIT_0C &
                                                                             INIT_0B & INIT_0A & INIT_09 & INIT_08 &
                                                                             INIT_07 & INIT_06 & INIT_05 & INIT_04 &
                                                                             INIT_03 & INIT_02 & INIT_01 & INIT_00);
    variable mem : Two_D_array_type := slv_to_two_D_array(length, width, mem_slv);

    variable wr_mode : integer := 0;    
    variable first_time : boolean := true;            


    variable INI            : std_logic_vector (INIT'length-1 downto 0)  := To_StdLogicVector(INIT) ;
    variable SRVA           : std_logic_vector (SRVAL'length-1 downto 0) := To_StdLogicVector(SRVAL) ;
    variable Violation : std_ulogic := '0';

    variable DO_zd          : std_logic_vector(3 downto 0)               := INI(3 downto 0 );    

  begin
    if (FIRST_TIME) then
      if ((WRITE_MODE = "write_first") or (WRITE_MODE = "WRITE_FIRST")) then
        wr_mode := 0;
      elsif ((WRITE_MODE = "read_first") or (WRITE_MODE = "READ_FIRST")) then
        wr_mode := 1;
      elsif ((WRITE_MODE = "no_change") or (WRITE_MODE = "NO_CHANGE")) then
        wr_mode := 2;
      else
        GenericValueCheckMessage
          (HeaderMsg            => " Attribute Syntax Error ",
           GenericName          => " WRITE_MODE ",
           EntityName           => "/X_RAMB16_S4",
           GenericValue         => WRITE_MODE,
           Unit                 => "",
           ExpectedValueMsg     => " The Legal values for this attribute are ",
           ExpectedGenericValue => " WRITE_FIRST, READ_FIRST or NO_CHANGE ",
           TailMsg              => "",
           MsgSeverity          => error
           );
      end if;      
      DO <= DO_zd;
      FIRST_TIME := false;
    end if;

    if (TimingChecksOn) then
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
        HeaderMsg      => "/X_RAMB16_S4",
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
        HeaderMsg      => "/X_RAMB16_S4",
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
        HeaderMsg      => "/X_RAMB16_S4",
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
        HeaderMsg      => "/X_RAMB16_S4",
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
        HeaderMsg      => "/X_RAMB16_S4",
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
        HeaderMsg      => "/X_RAMB16_S4",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_SSR_CLK_posedge,
        TimingData     => Tmkr_SSR_CLK_posedge,
        TestSignal     => SSR_dly,
        TestSignalName => "SSR",
        TestDelay      => tisd_SSR_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_SSR_CLK_posedge_posedge,
        SetupLow       => tsetup_SSR_CLK_negedge_posedge,
        HoldLow        => thold_SSR_CLK_posedge_posedge,
        HoldHigh       => thold_SSR_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S4",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR11_CLK_posedge,
        TimingData     => Tmkr_ADDR11_CLK_posedge,
        TestSignal     => ADDR_dly(11),
        TestSignalName => "ADDR(11)",
        TestDelay      => tisd_ADDR_CLK(11),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(11),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(11),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(11),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(11),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S4",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR10_CLK_posedge,
        TimingData     => Tmkr_ADDR10_CLK_posedge,
        TestSignal     => ADDR_dly(10),
        TestSignalName => "ADDR(10)",
        TestDelay      => tisd_ADDR_CLK(10),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(10),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(10),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(10),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(10),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S4",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR9_CLK_posedge,
        TimingData     => Tmkr_ADDR9_CLK_posedge,
        TestSignal     => ADDR_dly(9),
        TestSignalName => "ADDR(9)",
        TestDelay      => tisd_ADDR_CLK(9),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(9),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(9),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(9),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(9),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S4",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDR8_CLK_posedge,
        TimingData     => Tmkr_ADDR8_CLK_posedge,
        TestSignal     => ADDR_dly(8),
        TestSignalName => "ADDR(8)",
        TestDelay      => tisd_ADDR_CLK(8),
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADDR_CLK_posedge_posedge(8),
        SetupLow       => tsetup_ADDR_CLK_negedge_posedge(8),
        HoldLow        => thold_ADDR_CLK_posedge_posedge(8),
        HoldHigh       => thold_ADDR_CLK_negedge_posedge(8),
        CheckEnabled   => TO_X01(EN_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMB16_S4",
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
        HeaderMsg      => "/X_RAMB16_S4",
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
        HeaderMsg      => "/X_RAMB16_S4",
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
        HeaderMsg      => "/X_RAMB16_S4",
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
        HeaderMsg      => "/X_RAMB16_S4",
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
        HeaderMsg      => "/X_RAMB16_S4",
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
        HeaderMsg      => "/X_RAMB16_S4",
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
        HeaderMsg      => "/X_RAMB16_S4",
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
        HeaderMsg      => "/X_RAMB16_S4",
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
        HeaderMsg      => "/X_RAMB16_S4",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
    end if;

    Violation :=
      Pviol_CLK or
      Tviol_ADDR0_CLK_posedge or
      Tviol_ADDR10_CLK_posedge or
      Tviol_ADDR11_CLK_posedge or
      Tviol_ADDR1_CLK_posedge or
      Tviol_ADDR2_CLK_posedge or
      Tviol_ADDR3_CLK_posedge or
      Tviol_ADDR4_CLK_posedge or
      Tviol_ADDR5_CLK_posedge or
      Tviol_ADDR6_CLK_posedge or
      Tviol_ADDR7_CLK_posedge or
      Tviol_ADDR8_CLK_posedge or
      Tviol_ADDR9_CLK_posedge or
      Tviol_DI0_CLK_posedge or
      Tviol_DI1_CLK_posedge or
      Tviol_DI2_CLK_posedge or
      Tviol_DI3_CLK_posedge or
      Tviol_EN_CLK_posedge or
      Tviol_SSR_CLK_posedge or
      Tviol_WE_CLK_posedge;

    VALID_ADDR := ADDR_IS_VALID(ADDR_dly);

    if (VALID_ADDR) then
      ADDRESS := SLV_TO_INT(ADDR_dly);
    end if;

    if (GSR_dly = '1') then
      DO_zd := INI(3 downto 0 );
      
    elsif (GSR_dly = '0') then
      if (rising_edge(CLK_dly)) then
        if (EN_dly = '1') then
          if (SSR_dly = '1') then
            DO_zd := To_StdLogicVector(SRVAL)(3 downto 0);
          else    
            if (WE_dly = '1') then
              if (wr_mode = 0) then
                DO_zd := DI_dly;
              elsif (wr_mode = 1) then
                DO_zd := mem(address);  
              end if;
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

    DO_zd(3) := Violation xor DO_zd(3);
    DO_zd(2) := Violation xor DO_zd(2);
    DO_zd(1) := Violation xor DO_zd(1);
    DO_zd(0) := Violation xor DO_zd(0);

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
    wait on GSR_dly, CLK_dly, WE_dly, EN_dly, SSR_dly, DI_dly, ADDR_dly;
  end process VITALBehavior;
end X_RAMB16_S4_V;
