-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/rainier/VITAL/X_RAM64M.vhd,v 1.3 2010/01/14 19:38:17 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Static Synchronous RAM 64-Deep by 4-Wide
-- /___/   /\     Filename : X_RAM64M.vhd
-- \   \  /  \    Timestamp : 
--  \___\/\___\
--
-- Revision:
--    03/23/06 - Initial version.

----- CELL X_RAM64M -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.VPACKAGE.all;

entity X_RAM64M is
  generic (
    TimingChecksOn : boolean := true;
    Xon            : boolean := true;
    MsgOn          : boolean := true;
   LOC            : string  := "UNPLACED";

      tipd_ADDRA : VitalDelayArrayType01(5 downto 0)  := (others => (0.000 ns, 0.000 ns));
      tipd_ADDRB : VitalDelayArrayType01(5 downto 0)  := (others => (0.000 ns, 0.000 ns));
      tipd_ADDRC : VitalDelayArrayType01(5 downto 0)  := (others => (0.000 ns, 0.000 ns));
      tipd_ADDRD : VitalDelayArrayType01(5 downto 0)  := (others => (0.000 ns, 0.000 ns));

      tipd_DIA   : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DIB   : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DIC   : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DID   : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tipd_WCLK : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WE : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tpd_WCLK_DOA : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_WCLK_DOB : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_WCLK_DOC : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_WCLK_DOD : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tpd_ADDRA_DOA : VitalDelayArrayType01(5 downto 0) := (others => (0.000 ns, 0.000 ns));
      tpd_ADDRB_DOB : VitalDelayArrayType01(5 downto 0) := (others => (0.000 ns, 0.000 ns));
      tpd_ADDRC_DOC : VitalDelayArrayType01(5 downto 0) := (others => (0.000 ns, 0.000 ns));
      tpd_ADDRD_DOD : VitalDelayArrayType01(5 downto 0) := (others => (0.000 ns, 0.000 ns));

      
      tsetup_ADDRA_WCLK_negedge_posedge : VitalDelayArrayType(5 downto 0) := (others => 0.00 ns);
      tsetup_ADDRA_WCLK_posedge_posedge : VitalDelayArrayType(5 downto 0) := (others => 0.00 ns);
      tsetup_ADDRB_WCLK_negedge_posedge : VitalDelayArrayType(5 downto 0) := (others => 0.00 ns);
      tsetup_ADDRB_WCLK_posedge_posedge : VitalDelayArrayType(5 downto 0) := (others => 0.00 ns);
      tsetup_ADDRC_WCLK_negedge_posedge : VitalDelayArrayType(5 downto 0) := (others => 0.00 ns);
      tsetup_ADDRC_WCLK_posedge_posedge : VitalDelayArrayType(5 downto 0) := (others => 0.00 ns);
      tsetup_ADDRD_WCLK_negedge_posedge : VitalDelayArrayType(5 downto 0) := (others => 0.00 ns);
      tsetup_ADDRD_WCLK_posedge_posedge : VitalDelayArrayType(5 downto 0) := (others => 0.00 ns);

      tsetup_DIA_WCLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_DIA_WCLK_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_DIB_WCLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_DIB_WCLK_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_DIC_WCLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_DIC_WCLK_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_DID_WCLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_DID_WCLK_posedge_posedge : VitalDelayType := 0.000 ns;

      tsetup_WE_WCLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_WE_WCLK_posedge_posedge : VitalDelayType := 0.000 ns;

      thold_ADDRA_WCLK_negedge_posedge : VitalDelayArrayType(5 downto 0) := (others => 0.00 ns);
      thold_ADDRA_WCLK_posedge_posedge : VitalDelayArrayType(5 downto 0) := (others => 0.00 ns);
      thold_ADDRB_WCLK_negedge_posedge : VitalDelayArrayType(5 downto 0) := (others => 0.00 ns);
      thold_ADDRB_WCLK_posedge_posedge : VitalDelayArrayType(5 downto 0) := (others => 0.00 ns);
      thold_ADDRC_WCLK_negedge_posedge : VitalDelayArrayType(5 downto 0) := (others => 0.00 ns);
      thold_ADDRC_WCLK_posedge_posedge : VitalDelayArrayType(5 downto 0) := (others => 0.00 ns);
      thold_ADDRD_WCLK_negedge_posedge : VitalDelayArrayType(5 downto 0) := (others => 0.00 ns);
      thold_ADDRD_WCLK_posedge_posedge : VitalDelayArrayType(5 downto 0) := (others => 0.00 ns);

      thold_DIA_WCLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_DIA_WCLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_DIB_WCLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_DIB_WCLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_DIC_WCLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_DIC_WCLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_DID_WCLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_DID_WCLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_WE_WCLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_WE_WCLK_posedge_posedge : VitalDelayType := 0.000 ns;

      ticd_WCLK : VitalDelayType := 0.000 ns;
      tisd_ADDRA_WCLK : VitalDelayArrayType(5 downto 0) := (others => 0.000 ns);
      tisd_ADDRB_WCLK : VitalDelayArrayType(5 downto 0) := (others => 0.000 ns);
      tisd_ADDRC_WCLK : VitalDelayArrayType(5 downto 0) := (others => 0.000 ns);
      tisd_ADDRD_WCLK : VitalDelayArrayType(5 downto 0) := (others => 0.000 ns);

      tisd_DIA_WCLK : VitalDelayType := 0.000 ns;
      tisd_DIB_WCLK : VitalDelayType := 0.000 ns;
      tisd_DIC_WCLK : VitalDelayType := 0.000 ns;
      tisd_DID_WCLK : VitalDelayType := 0.000 ns;
      tisd_WE_WCLK : VitalDelayType := 0.000 ns;

      tperiod_WCLK_posedge : VitalDelayType := 0.000 ns;

      INIT_A : bit_vector(63 downto 0) := X"0000000000000000";
      INIT_B : bit_vector(63 downto 0) := X"0000000000000000";
      INIT_C : bit_vector(63 downto 0) := X"0000000000000000";
      INIT_D : bit_vector(63 downto 0) := X"0000000000000000"
    );

  port (
    DOA    : out std_ulogic;
    DOB    : out std_ulogic;
    DOC    : out std_ulogic;
    DOD    : out std_ulogic;

    ADDRA : in  std_logic_vector(5 downto 0);
    ADDRB : in  std_logic_vector(5 downto 0);
    ADDRC : in  std_logic_vector(5 downto 0);
    ADDRD : in  std_logic_vector(5 downto 0);
    DIA   : in  std_ulogic;
    DIB   : in  std_ulogic;
    DIC   : in  std_ulogic;
    DID   : in  std_ulogic;
    WCLK  : in  std_ulogic;
    WE   : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_RAM64M : entity is true;
end X_RAM64M;

architecture X_RAM64M_V of X_RAM64M is
  attribute VITAL_LEVEL0 of
    X_RAM64M_V : architecture is true;

  signal ADDRA_ipd : std_logic_vector(5 downto 0) := "XXXXXX";
  signal ADDRB_ipd : std_logic_vector(5 downto 0) := "XXXXXX";
  signal ADDRC_ipd : std_logic_vector(5 downto 0) := "XXXXXX";
  signal ADDRD_ipd : std_logic_vector(5 downto 0) := "XXXXXX";
  signal WCLK_ipd  : std_ulogic := 'X';
  signal DIA_ipd    : std_ulogic := 'X';
  signal DIB_ipd    : std_ulogic := 'X';
  signal DIC_ipd    : std_ulogic := 'X';
  signal DID_ipd    : std_ulogic := 'X';
  signal WE_ipd   : std_ulogic := 'X';

  signal ADDRA_dly : std_logic_vector(5 downto 0) := "XXXXXX";
  signal ADDRB_dly : std_logic_vector(5 downto 0) := "XXXXXX";
  signal ADDRC_dly : std_logic_vector(5 downto 0) := "XXXXXX";
  signal ADDRD_dly : std_logic_vector(5 downto 0) := "XXXXXX";
  signal WCLK_dly  : std_ulogic := 'X';
  signal DIA_dly    : std_ulogic := 'X';
  signal DIB_dly    : std_ulogic := 'X';
  signal DIC_dly    : std_ulogic := 'X';
  signal DID_dly    : std_ulogic := 'X';
  signal WE_dly   : std_ulogic := 'X';

  signal Violation : std_ulogic;
  signal QA_zd      : std_ulogic;
  signal QB_zd      : std_ulogic;
  signal QC_zd      : std_ulogic;
  signal QD_zd      : std_ulogic;

  signal MEM_a : std_logic_vector( 64 downto 0 ) := ('X' & To_StdLogicVector(INIT_A) );
  signal MEM_b : std_logic_vector( 64 downto 0 ) := ('X' & To_StdLogicVector(INIT_B) );
  signal MEM_c : std_logic_vector( 64 downto 0 ) := ('X' & To_StdLogicVector(INIT_C) );
  signal MEM_d : std_logic_vector( 64 downto 0 ) := ('X' & To_StdLogicVector(INIT_D) );
begin
  WireDelay  : block
  begin
   ADDRA_DELAY : for i in 5 downto 0 generate
     VitalWireDelay (ADDRA_ipd(i), ADDRA(i), tipd_ADDRA(i));
   end generate ADDRA_DELAY;
   ADDRB_DELAY : for i in 5 downto 0 generate
     VitalWireDelay (ADDRB_ipd(i), ADDRB(i), tipd_ADDRB(i));
   end generate ADDRB_DELAY;
   ADDRC_DELAY : for i in 5 downto 0 generate
     VitalWireDelay (ADDRC_ipd(i), ADDRC(i), tipd_ADDRC(i));
   end generate ADDRC_DELAY;
   ADDRD_DELAY : for i in 5 downto 0 generate
     VitalWireDelay (ADDRD_ipd(i), ADDRD(i), tipd_ADDRD(i));
   end generate ADDRD_DELAY;
   VitalWireDelay (DIA_ipd, DIA, tipd_DIA);
   VitalWireDelay (DIB_ipd, DIB, tipd_DIB);
   VitalWireDelay (DIC_ipd, DIC, tipd_DIC);
   VitalWireDelay (DID_ipd, DID, tipd_DID);
   VitalWireDelay (WCLK_ipd, WCLK, tipd_WCLK);
   VitalWireDelay (WE_ipd, WE, tipd_WE);
  end block;

  SignalDelay : block
  begin
    ADDRA_DELAY : for i in 5 downto 0 generate
      VitalSignalDelay (ADDRA_dly(i), ADDRA_ipd(i), tisd_ADDRA_WCLK(i));
    end generate ADDRA_DELAY;
    ADDRB_DELAY : for i in 5 downto 0 generate
      VitalSignalDelay (ADDRB_dly(i), ADDRB_ipd(i), tisd_ADDRB_WCLK(i));
    end generate ADDRB_DELAY;
    ADDRC_DELAY : for i in 5 downto 0 generate
      VitalSignalDelay (ADDRC_dly(i), ADDRC_ipd(i), tisd_ADDRC_WCLK(i));
    end generate ADDRC_DELAY;
    ADDRD_DELAY : for i in 5 downto 0 generate
      VitalSignalDelay (ADDRD_dly(i), ADDRD_ipd(i), tisd_ADDRD_WCLK(i));
    end generate ADDRD_DELAY;
    VitalSignalDelay (DIA_dly, DIA_ipd, tisd_DIA_WCLK);
    VitalSignalDelay (DIB_dly, DIB_ipd, tisd_DIB_WCLK);
    VitalSignalDelay (DIC_dly, DIC_ipd, tisd_DIC_WCLK);
    VitalSignalDelay (DID_dly, DID_ipd, tisd_DID_WCLK);
    VitalSignalDelay (WCLK_dly, WCLK_ipd, ticd_WCLK);
    VitalSignalDelay (WE_dly, WE_ipd, tisd_WE_WCLK );
  end block;

   QA_zd <= MEM_a(SLV_TO_INT(SLV => ADDRA_dly));
   QB_zd <= MEM_b(SLV_TO_INT(SLV => ADDRB_dly));
   QC_zd <= MEM_c(SLV_TO_INT(SLV => ADDRC_dly));
   QD_zd <= MEM_d(SLV_TO_INT(SLV => ADDRD_dly));

  VITALWriteBehavior : process(WCLK_dly, Violation)
    variable Index   : integer := 64 ;
  begin
    if (rising_edge(WCLK_dly)) then
      if (WE_dly = '1') then
        Index                  := SLV_TO_INT(SLV => ADDRD_dly);
        MEM_a(Index) <= (DIA_dly xor Violation) after 100 ps;
        MEM_b(Index) <= (DIB_dly xor Violation) after 100 ps;
        MEM_c(Index) <= (DIC_dly xor Violation) after 100 ps;
        MEM_d(Index) <= (DID_dly xor Violation) after 100 ps;
      end if;
    end if;
  end process VITALWriteBehavior;

  VITALTimingCheck : process (WCLK_dly, DIA_dly, DIB_dly, DIC_dly, DID_dly, ADDRA_dly,
                     ADDRB_dly, ADDRC_dly, ADDRD_dly,  WE_dly)
    variable Tviol_ADDRA0_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRA1_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRA2_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRA3_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRA4_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRA5_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRB0_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRB1_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRB2_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRB3_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRB4_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRB5_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRC0_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRC1_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRC2_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRC3_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRC4_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRC5_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRD0_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRD1_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRD2_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRD3_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRD4_WCLK_posedge : std_ulogic := '0';
    variable Tviol_ADDRD5_WCLK_posedge : std_ulogic := '0';

    variable Tviol_DIA_WCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIB_WCLK_posedge    : std_ulogic := '0';
    variable Tviol_DIC_WCLK_posedge    : std_ulogic := '0';
    variable Tviol_DID_WCLK_posedge    : std_ulogic := '0';

    variable Tviol_WE_WCLK_posedge   : std_ulogic := '0';

    variable Tmkr_ADDRA0_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA1_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA2_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA3_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA4_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRA5_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB0_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB1_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB2_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB3_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB4_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRB5_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRC0_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRC1_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRC2_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRC3_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRC4_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRC5_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRD0_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRD1_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRD2_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRD3_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRD4_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADDRD5_WCLK_posedge : VitalTimingDataType := VitalTimingDataInit;


    variable Tmkr_DIA_WCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIB_WCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DIC_WCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_DID_WCLK_posedge    : VitalTimingDataType := VitalTimingDataInit;

    variable Tmkr_WE_WCLK_posedge   : VitalTimingDataType := VitalTimingDataInit;

    variable PInfo_WCLK : VitalPeriodDataType := VitalPeriodDataInit;
    variable PViol_WCLK : std_ulogic          := '0';
  begin
    if (TimingChecksOn ) then
      VitalSetupHoldCheck (
        Violation      => Tviol_DIA_WCLK_posedge,
        TimingData     => Tmkr_DIA_WCLK_posedge,
        TestSignal     => DIA_dly,
        TestSignalName => "DIA",
        TestDelay      => tisd_DIA_WCLK,
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_DIA_WCLK_posedge_posedge,
        SetupLow       => tsetup_DIA_WCLK_negedge_posedge,
        HoldLow        => thold_DIA_WCLK_posedge_posedge,
        HoldHigh       => thold_DIA_WCLK_negedge_posedge,
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_DIB_WCLK_posedge,
        TimingData     => Tmkr_DIB_WCLK_posedge,
        TestSignal     => DIB_dly,
        TestSignalName => "DIB",
        TestDelay      => tisd_DIB_WCLK,
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_DIB_WCLK_posedge_posedge,
        SetupLow       => tsetup_DIB_WCLK_negedge_posedge,
        HoldLow        => thold_DIB_WCLK_posedge_posedge,
        HoldHigh       => thold_DIB_WCLK_negedge_posedge,
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_DIC_WCLK_posedge,
        TimingData     => Tmkr_DIC_WCLK_posedge,
        TestSignal     => DIC_dly,
        TestSignalName => "DIC",
        TestDelay      => tisd_DIC_WCLK,
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_DIC_WCLK_posedge_posedge,
        SetupLow       => tsetup_DIC_WCLK_negedge_posedge,
        HoldLow        => thold_DIC_WCLK_posedge_posedge,
        HoldHigh       => thold_DIC_WCLK_negedge_posedge,
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_DID_WCLK_posedge,
        TimingData     => Tmkr_DID_WCLK_posedge,
        TestSignal     => DID_dly,
        TestSignalName => "DID",
        TestDelay      => tisd_DID_WCLK,
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_DID_WCLK_posedge_posedge,
        SetupLow       => tsetup_DID_WCLK_negedge_posedge,
        HoldLow        => thold_DID_WCLK_posedge_posedge,
        HoldHigh       => thold_DID_WCLK_negedge_posedge,
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_WE_WCLK_posedge,
        TimingData     => Tmkr_WE_WCLK_posedge,
        TestSignal     => WE_dly,
        TestSignalName => "WE",
        TestDelay      => tisd_WE_WCLK,
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_WE_WCLK_posedge_posedge,
        SetupLow       => tsetup_WE_WCLK_negedge_posedge,
        HoldLow        => thold_WE_WCLK_posedge_posedge,
        HoldHigh       => thold_WE_WCLK_negedge_posedge,
        CheckEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA0_WCLK_posedge,
        TimingData     => Tmkr_ADDRA0_WCLK_posedge,
        TestSignal     => ADDRA_dly(0),
        TestSignalName => "ADDRA(0)",
        TestDelay      => tisd_ADDRA_WCLK(0),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRA_WCLK_posedge_posedge(0),
        SetupLow       => tsetup_ADDRA_WCLK_negedge_posedge(0),
        HoldLow        => thold_ADDRA_WCLK_posedge_posedge(0),
        HoldHigh       => thold_ADDRA_WCLK_negedge_posedge(0),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA1_WCLK_posedge,
        TimingData     => Tmkr_ADDRA1_WCLK_posedge,
        TestSignal     => ADDRA_dly(1),
        TestSignalName => "ADDRA(1)",
        TestDelay      => tisd_ADDRA_WCLK(1),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRA_WCLK_posedge_posedge(1),
        SetupLow       => tsetup_ADDRA_WCLK_negedge_posedge(1),
        HoldLow        => thold_ADDRA_WCLK_posedge_posedge(1),
        HoldHigh       => thold_ADDRA_WCLK_negedge_posedge(1),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA2_WCLK_posedge,
        TimingData     => Tmkr_ADDRA2_WCLK_posedge,
        TestSignal     => ADDRA_dly(2),
        TestSignalName => "ADDRA(2)",
        TestDelay      => tisd_ADDRA_WCLK(2),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRA_WCLK_posedge_posedge(2),
        SetupLow       => tsetup_ADDRA_WCLK_negedge_posedge(2),
        HoldLow        => thold_ADDRA_WCLK_posedge_posedge(2),
        HoldHigh       => thold_ADDRA_WCLK_negedge_posedge(2),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA3_WCLK_posedge,
        TimingData     => Tmkr_ADDRA3_WCLK_posedge,
        TestSignal     => ADDRA_dly(3),
        TestSignalName => "ADDRA(3)",
        TestDelay      => tisd_ADDRA_WCLK(3),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRA_WCLK_posedge_posedge(3),
        SetupLow       => tsetup_ADDRA_WCLK_negedge_posedge(3),
        HoldLow        => thold_ADDRA_WCLK_posedge_posedge(3),
        HoldHigh       => thold_ADDRA_WCLK_negedge_posedge(3),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA4_WCLK_posedge,
        TimingData     => Tmkr_ADDRA4_WCLK_posedge,
        TestSignal     => ADDRA_dly(4),
        TestSignalName => "ADDRA(4)",
        TestDelay      => tisd_ADDRA_WCLK(4),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRA_WCLK_posedge_posedge(4),
        SetupLow       => tsetup_ADDRA_WCLK_negedge_posedge(4),
        HoldLow        => thold_ADDRA_WCLK_posedge_posedge(4),
        HoldHigh       => thold_ADDRA_WCLK_negedge_posedge(4),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRA5_WCLK_posedge,
        TimingData     => Tmkr_ADDRA5_WCLK_posedge,
        TestSignal     => ADDRA_dly(5),
        TestSignalName => "ADDRA(5)",
        TestDelay      => tisd_ADDRA_WCLK(5),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRA_WCLK_posedge_posedge(5),
        SetupLow       => tsetup_ADDRA_WCLK_negedge_posedge(5),
        HoldLow        => thold_ADDRA_WCLK_posedge_posedge(5),
        HoldHigh       => thold_ADDRA_WCLK_negedge_posedge(5),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB0_WCLK_posedge,
        TimingData     => Tmkr_ADDRB0_WCLK_posedge,
        TestSignal     => ADDRB_dly(0),
        TestSignalName => "ADDRB(0)",
        TestDelay      => tisd_ADDRB_WCLK(0),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRB_WCLK_posedge_posedge(0),
        SetupLow       => tsetup_ADDRB_WCLK_negedge_posedge(0),
        HoldLow        => thold_ADDRB_WCLK_posedge_posedge(0),
        HoldHigh       => thold_ADDRB_WCLK_negedge_posedge(0),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB1_WCLK_posedge,
        TimingData     => Tmkr_ADDRB1_WCLK_posedge,
        TestSignal     => ADDRB_dly(1),
        TestSignalName => "ADDRB(1)",
        TestDelay      => tisd_ADDRB_WCLK(1),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRB_WCLK_posedge_posedge(1),
        SetupLow       => tsetup_ADDRB_WCLK_negedge_posedge(1),
        HoldLow        => thold_ADDRB_WCLK_posedge_posedge(1),
        HoldHigh       => thold_ADDRB_WCLK_negedge_posedge(1),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB2_WCLK_posedge,
        TimingData     => Tmkr_ADDRB2_WCLK_posedge,
        TestSignal     => ADDRB_dly(2),
        TestSignalName => "ADDRB(2)",
        TestDelay      => tisd_ADDRB_WCLK(2),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRB_WCLK_posedge_posedge(2),
        SetupLow       => tsetup_ADDRB_WCLK_negedge_posedge(2),
        HoldLow        => thold_ADDRB_WCLK_posedge_posedge(2),
        HoldHigh       => thold_ADDRB_WCLK_negedge_posedge(2),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB3_WCLK_posedge,
        TimingData     => Tmkr_ADDRB3_WCLK_posedge,
        TestSignal     => ADDRB_dly(3),
        TestSignalName => "ADDRB(3)",
        TestDelay      => tisd_ADDRB_WCLK(3),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRB_WCLK_posedge_posedge(3),
        SetupLow       => tsetup_ADDRB_WCLK_negedge_posedge(3),
        HoldLow        => thold_ADDRB_WCLK_posedge_posedge(3),
        HoldHigh       => thold_ADDRB_WCLK_negedge_posedge(3),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB4_WCLK_posedge,
        TimingData     => Tmkr_ADDRB4_WCLK_posedge,
        TestSignal     => ADDRB_dly(4),
        TestSignalName => "ADDRB(4)",
        TestDelay      => tisd_ADDRB_WCLK(4),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRB_WCLK_posedge_posedge(4),
        SetupLow       => tsetup_ADDRB_WCLK_negedge_posedge(4),
        HoldLow        => thold_ADDRB_WCLK_posedge_posedge(4),
        HoldHigh       => thold_ADDRB_WCLK_negedge_posedge(4),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRB5_WCLK_posedge,
        TimingData     => Tmkr_ADDRB5_WCLK_posedge,
        TestSignal     => ADDRB_dly(5),
        TestSignalName => "ADDRB(5)",
        TestDelay      => tisd_ADDRB_WCLK(5),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRB_WCLK_posedge_posedge(5),
        SetupLow       => tsetup_ADDRB_WCLK_negedge_posedge(5),
        HoldLow        => thold_ADDRB_WCLK_posedge_posedge(5),
        HoldHigh       => thold_ADDRB_WCLK_negedge_posedge(5),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRC0_WCLK_posedge,
        TimingData     => Tmkr_ADDRC0_WCLK_posedge,
        TestSignal     => ADDRC_dly(0),
        TestSignalName => "ADDRC(0)",
        TestDelay      => tisd_ADDRC_WCLK(0),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRC_WCLK_posedge_posedge(0),
        SetupLow       => tsetup_ADDRC_WCLK_negedge_posedge(0),
        HoldLow        => thold_ADDRC_WCLK_posedge_posedge(0),
        HoldHigh       => thold_ADDRC_WCLK_negedge_posedge(0),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRC1_WCLK_posedge,
        TimingData     => Tmkr_ADDRC1_WCLK_posedge,
        TestSignal     => ADDRC_dly(1),
        TestSignalName => "ADDRC(1)",
        TestDelay      => tisd_ADDRC_WCLK(1),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRC_WCLK_posedge_posedge(1),
        SetupLow       => tsetup_ADDRC_WCLK_negedge_posedge(1),
        HoldLow        => thold_ADDRC_WCLK_posedge_posedge(1),
        HoldHigh       => thold_ADDRC_WCLK_negedge_posedge(1),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRC2_WCLK_posedge,
        TimingData     => Tmkr_ADDRC2_WCLK_posedge,
        TestSignal     => ADDRC_dly(2),
        TestSignalName => "ADDRC(2)",
        TestDelay      => tisd_ADDRC_WCLK(2),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRC_WCLK_posedge_posedge(2),
        SetupLow       => tsetup_ADDRC_WCLK_negedge_posedge(2),
        HoldLow        => thold_ADDRC_WCLK_posedge_posedge(2),
        HoldHigh       => thold_ADDRC_WCLK_negedge_posedge(2),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRC3_WCLK_posedge,
        TimingData     => Tmkr_ADDRC3_WCLK_posedge,
        TestSignal     => ADDRC_dly(3),
        TestSignalName => "ADDRC(3)",
        TestDelay      => tisd_ADDRC_WCLK(3),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRC_WCLK_posedge_posedge(3),
        SetupLow       => tsetup_ADDRC_WCLK_negedge_posedge(3),
        HoldLow        => thold_ADDRC_WCLK_posedge_posedge(3),
        HoldHigh       => thold_ADDRC_WCLK_negedge_posedge(3),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRC4_WCLK_posedge,
        TimingData     => Tmkr_ADDRC4_WCLK_posedge,
        TestSignal     => ADDRC_dly(4),
        TestSignalName => "ADDRC(4)",
        TestDelay      => tisd_ADDRC_WCLK(4),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRC_WCLK_posedge_posedge(4),
        SetupLow       => tsetup_ADDRC_WCLK_negedge_posedge(4),
        HoldLow        => thold_ADDRC_WCLK_posedge_posedge(4),
        HoldHigh       => thold_ADDRC_WCLK_negedge_posedge(4),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRC5_WCLK_posedge,
        TimingData     => Tmkr_ADDRC5_WCLK_posedge,
        TestSignal     => ADDRC_dly(5),
        TestSignalName => "ADDRC(5)",
        TestDelay      => tisd_ADDRC_WCLK(5),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRC_WCLK_posedge_posedge(5),
        SetupLow       => tsetup_ADDRC_WCLK_negedge_posedge(5),
        HoldLow        => thold_ADDRC_WCLK_posedge_posedge(5),
        HoldHigh       => thold_ADDRC_WCLK_negedge_posedge(5),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);


      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRD0_WCLK_posedge,
        TimingData     => Tmkr_ADDRD0_WCLK_posedge,
        TestSignal     => ADDRD_dly(0),
        TestSignalName => "ADDRD(0)",
        TestDelay      => tisd_ADDRD_WCLK(0),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRD_WCLK_posedge_posedge(0),
        SetupLow       => tsetup_ADDRD_WCLK_negedge_posedge(0),
        HoldLow        => thold_ADDRD_WCLK_posedge_posedge(0),
        HoldHigh       => thold_ADDRD_WCLK_negedge_posedge(0),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRD1_WCLK_posedge,
        TimingData     => Tmkr_ADDRD1_WCLK_posedge,
        TestSignal     => ADDRD_dly(1),
        TestSignalName => "ADDRD(1)",
        TestDelay      => tisd_ADDRD_WCLK(1),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRD_WCLK_posedge_posedge(1),
        SetupLow       => tsetup_ADDRD_WCLK_negedge_posedge(1),
        HoldLow        => thold_ADDRD_WCLK_posedge_posedge(1),
        HoldHigh       => thold_ADDRD_WCLK_negedge_posedge(1),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRD2_WCLK_posedge,
        TimingData     => Tmkr_ADDRD2_WCLK_posedge,
        TestSignal     => ADDRD_dly(2),
        TestSignalName => "ADDRD(2)",
        TestDelay      => tisd_ADDRD_WCLK(2),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRD_WCLK_posedge_posedge(2),
        SetupLow       => tsetup_ADDRD_WCLK_negedge_posedge(2),
        HoldLow        => thold_ADDRD_WCLK_posedge_posedge(2),
        HoldHigh       => thold_ADDRD_WCLK_negedge_posedge(2),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRD3_WCLK_posedge,
        TimingData     => Tmkr_ADDRD3_WCLK_posedge,
        TestSignal     => ADDRD_dly(3),
        TestSignalName => "ADDRD(3)",
        TestDelay      => tisd_ADDRD_WCLK(3),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRD_WCLK_posedge_posedge(3),
        SetupLow       => tsetup_ADDRD_WCLK_negedge_posedge(3),
        HoldLow        => thold_ADDRD_WCLK_posedge_posedge(3),
        HoldHigh       => thold_ADDRD_WCLK_negedge_posedge(3),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRD4_WCLK_posedge,
        TimingData     => Tmkr_ADDRD4_WCLK_posedge,
        TestSignal     => ADDRD_dly(4),
        TestSignalName => "ADDRD(4)",
        TestDelay      => tisd_ADDRD_WCLK(4),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRD_WCLK_posedge_posedge(4),
        SetupLow       => tsetup_ADDRD_WCLK_negedge_posedge(4),
        HoldLow        => thold_ADDRD_WCLK_posedge_posedge(4),
        HoldHigh       => thold_ADDRD_WCLK_negedge_posedge(4),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_ADDRD5_WCLK_posedge,
        TimingData     => Tmkr_ADDRD5_WCLK_posedge,
        TestSignal     => ADDRD_dly(5),
        TestSignalName => "ADDRD(5)",
        TestDelay      => tisd_ADDRD_WCLK(5),
        RefSignal      => WCLK_dly,
        RefSignalName  => "WCLK",
        RefDelay       => ticd_WCLK,
        SetupHigh      => tsetup_ADDRD_WCLK_posedge_posedge(5),
        SetupLow       => tsetup_ADDRD_WCLK_negedge_posedge(5),
        HoldLow        => thold_ADDRD_WCLK_posedge_posedge(5),
        HoldHigh       => thold_ADDRD_WCLK_negedge_posedge(5),
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAM64M",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
    end if;
    Violation <= Tviol_DIA_WCLK_posedge or Tviol_DIB_WCLK_posedge or
                 Tviol_DIC_WCLK_posedge or Tviol_DID_WCLK_posedge or
                 Tviol_WE_WCLK_posedge or
                 Tviol_ADDRA0_WCLK_posedge or Tviol_ADDRA1_WCLK_posedge or
                 Tviol_ADDRA2_WCLK_posedge or Tviol_ADDRA3_WCLK_posedge or
                 Tviol_ADDRA4_WCLK_posedge or Tviol_ADDRA5_WCLK_posedge or
                 Tviol_ADDRB0_WCLK_posedge or Tviol_ADDRB1_WCLK_posedge or
                 Tviol_ADDRB2_WCLK_posedge or Tviol_ADDRB3_WCLK_posedge or
                 Tviol_ADDRB4_WCLK_posedge or Tviol_ADDRB5_WCLK_posedge or
                 Tviol_ADDRC0_WCLK_posedge or Tviol_ADDRC1_WCLK_posedge or
                 Tviol_ADDRC2_WCLK_posedge or Tviol_ADDRC3_WCLK_posedge or
                 Tviol_ADDRC4_WCLK_posedge or Tviol_ADDRC5_WCLK_posedge or
                 Tviol_ADDRD0_WCLK_posedge or Tviol_ADDRD1_WCLK_posedge or
                 Tviol_ADDRD2_WCLK_posedge or Tviol_ADDRD3_WCLK_posedge or
                 Tviol_ADDRD4_WCLK_posedge or Tviol_ADDRD5_WCLK_posedge or
                 Pviol_WCLK;
  end process VITALTimingCheck;

  VITALScheduleOutput     : process(QA_zd, QB_zd, QC_zd, QD_zd)
    variable OA_zd         : std_ulogic := 'X';
    variable OA_GlitchData : VitalGlitchDataType;
    variable OB_zd         : std_ulogic := 'X';
    variable OB_GlitchData : VitalGlitchDataType;
    variable OC_zd         : std_ulogic := 'X';
    variable OC_GlitchData : VitalGlitchDataType;
    variable OD_zd         : std_ulogic := 'X';
    variable OD_GlitchData : VitalGlitchDataType;
  begin
    OA_zd                               := QA_zd;
    OB_zd                               := QB_zd;
    OC_zd                               := QC_zd;
    OD_zd                               := QD_zd;

    VitalPathDelay01 (
      OutSignal     => DOA,
      GlitchData    => OA_GlitchData,
      OutSignalName => "DOA",
      OutTemp       => OA_zd,
      Paths         => (0 => (WCLK_dly'last_event, tpd_WCLK_DOA, (WE_dly /= '0')),
                        1   => (ADDRA_dly(0)'last_event, tpd_ADDRA_DOA(0), true),
                        2   => (ADDRA_dly(1)'last_event, tpd_ADDRA_DOA(1), true),
                        3   => (ADDRA_dly(2)'last_event, tpd_ADDRA_DOA(2), true),
                        4   => (ADDRA_dly(3)'last_event, tpd_ADDRA_DOA(3), true),
                        5   => (ADDRA_dly(4)'last_event, tpd_ADDRA_DOA(4), true),
                        6   => (ADDRA_dly(5)'last_event, tpd_ADDRA_DOA(5), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);

    VitalPathDelay01 (
      OutSignal     => DOB,
      GlitchData    => OB_GlitchData,
      OutSignalName => "DOB",
      OutTemp       => OB_zd,
      Paths         => (0 => (WCLK_dly'last_event, tpd_WCLK_DOB, (WE_dly /= '0')),
                        1   => (ADDRB_dly(0)'last_event, tpd_ADDRB_DOB(0), true),
                        2   => (ADDRB_dly(1)'last_event, tpd_ADDRB_DOB(1), true),
                        3   => (ADDRB_dly(2)'last_event, tpd_ADDRB_DOB(2), true),
                        4   => (ADDRB_dly(3)'last_event, tpd_ADDRB_DOB(3), true),
                        5   => (ADDRB_dly(4)'last_event, tpd_ADDRB_DOB(4), true),
                        6   => (ADDRB_dly(5)'last_event, tpd_ADDRB_DOB(5), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);

    VitalPathDelay01 (
      OutSignal     => DOC,
      GlitchData    => OC_GlitchData,
      OutSignalName => "DOC",
      OutTemp       => OC_zd,
      Paths         => (0 => (WCLK_dly'last_event, tpd_WCLK_DOC, (WE_dly /= '0')),
                        1   => (ADDRC_dly(0)'last_event, tpd_ADDRC_DOC(0), true),
                        2   => (ADDRC_dly(1)'last_event, tpd_ADDRC_DOC(1), true),
                        3   => (ADDRC_dly(2)'last_event, tpd_ADDRC_DOC(2), true),
                        4   => (ADDRC_dly(3)'last_event, tpd_ADDRC_DOC(3), true),
                        5   => (ADDRC_dly(4)'last_event, tpd_ADDRC_DOC(4), true),
                        6   => (ADDRC_dly(5)'last_event, tpd_ADDRC_DOC(5), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);

    VitalPathDelay01 (
      OutSignal     => DOD,
      GlitchData    => OD_GlitchData,
      OutSignalName => "DOD",
      OutTemp       => OD_zd,
      Paths         => (0 => (WCLK_dly'last_event, tpd_WCLK_DOD, (WE_dly /= '0')),
                        1   => (ADDRD_dly(0)'last_event, tpd_ADDRD_DOD(0), true),
                        2   => (ADDRD_dly(1)'last_event, tpd_ADDRD_DOD(1), true),
                        3   => (ADDRD_dly(2)'last_event, tpd_ADDRD_DOD(2), true),
                        4   => (ADDRD_dly(3)'last_event, tpd_ADDRD_DOD(3), true),
                        5   => (ADDRD_dly(4)'last_event, tpd_ADDRD_DOD(4), true),
                        6   => (ADDRD_dly(5)'last_event, tpd_ADDRD_DOD(5), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
  end process VITALScheduleOutput;
end X_RAM64M_V;

