-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_MULT18X18S.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  18X18 Signed Registered Multiplier
-- /___/   /\     Filename : X_MULT18X18S.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:10 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    27/05/08 - CR 472154 Removed Vital GSR constructs
-- End Revision

----- CELL X_MULT18X18S -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_MULT18X18S is
  generic (
      TimingChecksOn  : boolean := true;
      Xon             : boolean := true;
      MsgOn           : boolean := true;
      LOC             : string  := "UNPLACED";
         
      tipd_A : VitalDelayArrayType01 (17 downto 0 ) := (others => (0 ps, 0 ps));
      tipd_B : VitalDelayArrayType01 (17 downto 0 ) := (others => (0 ps, 0 ps));
      tipd_C : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_CE: VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_R : VitalDelayType01 := (0.000 ns, 0.000 ns);
           
      tpd_C_P   :     VitalDelayArrayType01 (35 downto 0) := (others => (100 ps, 100 ps));
           
      tsetup_A_C_negedge_posedge      : VitalDelayArrayType (17 downto 0)    := (others => 0 ps);
      tsetup_A_C_posedge_posedge      : VitalDelayArrayType (17 downto 0)    := (others => 0 ps);
      tsetup_B_C_negedge_posedge      : VitalDelayArrayType (17 downto 0)    := (others => 0 ps);
      tsetup_B_C_posedge_posedge      : VitalDelayArrayType (17 downto 0)    := (others => 0 ps);
      tsetup_CE_C_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_CE_C_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_R_C_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_R_C_posedge_posedge : VitalDelayType := 0.000 ns;
           
      thold_A_C_negedge_posedge       : VitalDelayArrayType (17 downto 0)    := (others => 0 ps);
      thold_A_C_posedge_posedge       : VitalDelayArrayType (17 downto 0)    := (others => 0 ps);
      thold_B_C_negedge_posedge       : VitalDelayArrayType (17 downto 0)    := (others => 0 ps);
      thold_B_C_posedge_posedge       : VitalDelayArrayType (17 downto 0)    := (others => 0 ps);
      thold_CE_C_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_CE_C_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_R_C_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_R_C_posedge_posedge : VitalDelayType := 0.000 ns;

      ticd_C : VitalDelayType := 0.000 ns;
      tisd_A_C  : VitalDelayArrayType (17 downto 0)    := (others => 0 ps);
      tisd_B_C  : VitalDelayArrayType (17 downto 0)    := (others => 0 ps);
      tisd_CE_C : VitalDelayType := 0.000 ns;
      tisd_R_C : VitalDelayType := 0.000 ns;

      tpw_C_posedge : VitalDelayType := 0.000 ns;
      tpw_C_negedge : VitalDelayType := 0.000 ns
           );
  port (
    P                : out std_logic_vector (35 downto 0);
    A                : in  std_logic_vector (17 downto 0);
    B                : in  std_logic_vector (17 downto 0);
    C                : in  std_ulogic;
    CE               : in  std_ulogic;
    R                : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_MULT18X18S : entity is true;

end X_MULT18X18S;

architecture X_MULT18X18S_V of X_MULT18X18S is
  function INT_TO_SLV(ARG : integer; SIZE : integer) return std_logic_vector is
    variable result : std_logic_vector (SIZE-1 downto 0);
    variable temp   : integer := ARG;
  begin

    temp                      := ARG;
    for i in 0 to SIZE-1 loop
      if (temp mod 2) = 1 then
        result(i)             := '1';
      else
        result(i)             := '0';
      end if;
      if temp > 0 then
        temp                  := temp /2 ;
      elsif (temp > integer'low) then
        temp                  := (temp-1) / 2;
      else
        temp                  := temp / 2;
      end if;
    end loop;
    return result;
  end;

  function COMPLEMENT(ARG : std_logic_vector ) return std_logic_vector is
    variable RESULT : std_logic_vector (ARG'left downto 0);
    variable found1 : std_ulogic := '0';
  begin

    for i in 0 to ARG'left loop
      if (found1 = '0') then
        RESULT(i)                := ARG(i);
        if (ARG(i) = '1' ) then
          found1                 := '1';
        end if;
      else
        RESULT(i)                := not ARG(i);
      end if;
    end loop;
    return result;
  end;

  function VECPLUS(A, B : std_logic_vector ) return std_logic_vector is
    variable carry   : std_ulogic;
    variable BV, sum : std_logic_vector(A'left downto 0);

  begin

    if (A(A'left) = 'X' or B(B'left) = 'X') then
      sum := (others => 'X');
      return(sum);
    end if;
    carry := '0';
    BV    := B;

    for i in 0 to A'left loop
      sum(i) := A(i) xor BV(i) xor carry;
      carry  := (A(i) and BV(i)) or
               (A(i) and carry) or
               (carry and BV(i));
    end loop;
    return sum;
  end;

  signal A_ipd : std_logic_vector(17 downto 0) := (others => '0' );
  signal B_ipd : std_logic_vector(17 downto 0) := (others => '0' );
  signal CE_ipd  : std_ulogic := 'X';
  signal C_ipd   : std_ulogic := 'X';
  signal GSR_ipd : std_ulogic := 'X';
  signal R_ipd   : std_ulogic := 'X';

  signal A_dly : std_logic_vector(17 downto 0) := (others => '0' );
  signal B_dly : std_logic_vector(17 downto 0) := (others => '0' );
  signal CE_dly  : std_ulogic := 'X';
  signal C_dly   : std_ulogic := 'X';
  signal GSR_dly : std_ulogic := '0';
  signal R_dly   : std_ulogic := 'X';

  attribute VITAL_LEVEL0 of
    X_MULT18X18S_V : architecture is true;


begin

  GSR_dly <= GSR;

  WireDelay : block
  begin
    A_DELAY : for i in 17 downto 0 generate
      VitalWireDelay ( A_ipd(i), A(i), tipd_A(i));
    end generate A_DELAY;
    B_DELAY : for i in 17 downto 0 generate
      VitalWireDelay ( B_ipd(i), B(i), tipd_B(i));
    end generate B_DELAY;
    VitalWireDelay (CE_ipd, CE, tipd_CE);
    VitalWireDelay (C_ipd, C, tipd_C);
    VitalWireDelay (R_ipd, R, tipd_R);
  end block;
  
--  A_dly(35 downto 18) <= A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17) & A(17);
--  B_dly(35 downto 18) <= B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17) & B(17);   

  SignalDelay : block
  begin
    A_DELAY : for i in 17 downto 0 generate
    VitalSignalDelay ( A_dly(i), A_ipd(i), tisd_A_C(i));
    end generate A_DELAY;
    B_DELAY : for i in 17 downto 0 generate
    VitalSignalDelay ( B_dly(i), B_ipd(i), tisd_B_C(i));
    end generate B_DELAY;    
    VitalSignalDelay (CE_dly, CE_ipd, tisd_CE_C);
    VitalSignalDelay (C_dly, C_ipd, ticd_C);
    VitalSignalDelay (R_dly, R_ipd, tisd_R_C);
  end block;

  VITALBehaviour : process
    variable Tviol_A0_C_posedge  : std_ulogic := '0';
    variable Tviol_A1_C_posedge  : std_ulogic := '0';
    variable Tviol_A2_C_posedge  : std_ulogic := '0';
    variable Tviol_A3_C_posedge  : std_ulogic := '0';
    variable Tviol_A4_C_posedge  : std_ulogic := '0';
    variable Tviol_A5_C_posedge  : std_ulogic := '0';
    variable Tviol_A6_C_posedge  : std_ulogic := '0';
    variable Tviol_A7_C_posedge  : std_ulogic := '0';
    variable Tviol_A8_C_posedge  : std_ulogic := '0';
    variable Tviol_A9_C_posedge  : std_ulogic := '0';
    variable Tviol_A10_C_posedge : std_ulogic := '0';
    variable Tviol_A11_C_posedge : std_ulogic := '0';
    variable Tviol_A12_C_posedge : std_ulogic := '0';
    variable Tviol_A13_C_posedge : std_ulogic := '0';
    variable Tviol_A14_C_posedge : std_ulogic := '0';
    variable Tviol_A15_C_posedge : std_ulogic := '0';
    variable Tviol_A16_C_posedge : std_ulogic := '0';
    variable Tviol_A17_C_posedge : std_ulogic := '0';
    variable Tviol_B0_C_posedge  : std_ulogic := '0';
    variable Tviol_B1_C_posedge  : std_ulogic := '0';
    variable Tviol_B2_C_posedge  : std_ulogic := '0';
    variable Tviol_B3_C_posedge  : std_ulogic := '0';
    variable Tviol_B4_C_posedge  : std_ulogic := '0';
    variable Tviol_B5_C_posedge  : std_ulogic := '0';
    variable Tviol_B6_C_posedge  : std_ulogic := '0';
    variable Tviol_B7_C_posedge  : std_ulogic := '0';
    variable Tviol_B8_C_posedge  : std_ulogic := '0';
    variable Tviol_B9_C_posedge  : std_ulogic := '0';
    variable Tviol_B10_C_posedge : std_ulogic := '0';
    variable Tviol_B11_C_posedge : std_ulogic := '0';
    variable Tviol_B12_C_posedge : std_ulogic := '0';
    variable Tviol_B13_C_posedge : std_ulogic := '0';
    variable Tviol_B14_C_posedge : std_ulogic := '0';
    variable Tviol_B15_C_posedge : std_ulogic := '0';
    variable Tviol_B16_C_posedge : std_ulogic := '0';
    variable Tviol_B17_C_posedge : std_ulogic := '0';
    variable Tviol_CE_C_posedge  : std_ulogic := '0';
    variable Tviol_R_C_posedge   : std_ulogic := '0';

    variable Tmkr_A0_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_A1_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_A2_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_A3_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_A4_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_A5_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_A6_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_A7_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_A8_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_A9_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_A10_C_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_A11_C_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_A12_C_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_A13_C_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_A14_C_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_A15_C_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_A16_C_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_A17_C_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_B0_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_B1_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_B2_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_B3_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_B4_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_B5_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_B6_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_B7_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_B8_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_B9_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_B10_C_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_B11_C_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_B12_C_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_B13_C_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_B14_C_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_B15_C_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_B16_C_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_B17_C_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CE_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_R_C_posedge   : VitalTimingDataType := VitalTimingDataInit;

    variable PInfo_C   : VitalPeriodDataType := VitalPeriodDataInit;
    variable PViol_C   : std_ulogic          := '0';

    variable FIRST_TIME                   : boolean    := true;
    variable O_zd, O1_zd, O2_zd, Omult_zd : std_logic_vector( A'length+B'length-1 downto 0);
    variable IA, IB1, Ib2                 : integer ;
    variable sign                         : std_ulogic  := '0';
    variable A_i                          : std_logic_vector(A_dly'left downto 0);
    variable B_i                          : std_logic_vector(B_dly'left downto 0);
    variable O_GlitchData                 : VitalGlitchDataArrayType (35 downto 0);
    variable violation                    : std_ulogic := '0';

  begin 
     if (FIRST_TIME) then
       P <= O_zd;
       wait until (GSR_dly = '1' or C_dly'last_value = '0' or C_dly'last_value = '1');
       FIRST_TIME := false;
     end if;


    if (TimingChecksOn) then
      VitalSetupHoldCheck (
        Violation      => Tviol_A17_C_posedge,
        TimingData     => Tmkr_A17_C_posedge,
        TestSignal     => A_dly(17),
        TestSignalName => "A(17)",
        TestDelay      => tisd_A_C(17),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_A_C_posedge_posedge(17),
        SetupLow       => tsetup_A_C_negedge_posedge(17),
        HoldLow        => thold_A_C_posedge_posedge(17),
        HoldHigh       => thold_A_C_negedge_posedge(17),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_A16_C_posedge,
        TimingData     => Tmkr_A16_C_posedge,
        TestSignal     => A_dly(16),
        TestSignalName => "A(16)",
        TestDelay      => tisd_A_C(16),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_A_C_posedge_posedge(16),
        SetupLow       => tsetup_A_C_negedge_posedge(16),
        HoldLow        => thold_A_C_posedge_posedge(16),
        HoldHigh       => thold_A_C_negedge_posedge(16),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_A15_C_posedge,
        TimingData     => Tmkr_A15_C_posedge,
        TestSignal     => A_dly(15),
        TestSignalName => "A(15)",
        TestDelay      => tisd_A_C(15),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_A_C_posedge_posedge(15),
        SetupLow       => tsetup_A_C_negedge_posedge(15),
        HoldLow        => thold_A_C_posedge_posedge(15),
        HoldHigh       => thold_A_C_negedge_posedge(15),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_A14_C_posedge,
        TimingData     => Tmkr_A14_C_posedge,
        TestSignal     => A_dly(14),
        TestSignalName => "A(14)",
        TestDelay      => tisd_A_C(14),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_A_C_posedge_posedge(14),
        SetupLow       => tsetup_A_C_negedge_posedge(14),
        HoldLow        => thold_A_C_posedge_posedge(14),
        HoldHigh       => thold_A_C_negedge_posedge(14),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_A13_C_posedge,
        TimingData     => Tmkr_A13_C_posedge,
        TestSignal     => A_dly(13),
        TestSignalName => "A(13)",
        TestDelay      => tisd_A_C(13),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_A_C_posedge_posedge(13),
        SetupLow       => tsetup_A_C_negedge_posedge(13),
        HoldLow        => thold_A_C_posedge_posedge(13),
        HoldHigh       => thold_A_C_negedge_posedge(13),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_A12_C_posedge,
        TimingData     => Tmkr_A12_C_posedge,
        TestSignal     => A_dly(12),
        TestSignalName => "A(12)",
        TestDelay      => tisd_A_C(12),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_A_C_posedge_posedge(12),
        SetupLow       => tsetup_A_C_negedge_posedge(12),
        HoldLow        => thold_A_C_posedge_posedge(12),
        HoldHigh       => thold_A_C_negedge_posedge(12),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_A11_C_posedge,
        TimingData     => Tmkr_A11_C_posedge,
        TestSignal     => A_dly(11),
        TestSignalName => "A(11)",
        TestDelay      => tisd_A_C(11),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_A_C_posedge_posedge(11),
        SetupLow       => tsetup_A_C_negedge_posedge(11),
        HoldLow        => thold_A_C_posedge_posedge(11),
        HoldHigh       => thold_A_C_negedge_posedge(11),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_A10_C_posedge,
        TimingData     => Tmkr_A10_C_posedge,
        TestSignal     => A_dly(10),
        TestSignalName => "A(10)",
        TestDelay      => tisd_A_C(10),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_A_C_posedge_posedge(10),
        SetupLow       => tsetup_A_C_negedge_posedge(10),
        HoldLow        => thold_A_C_posedge_posedge(10),
        HoldHigh       => thold_A_C_negedge_posedge(10),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_A9_C_posedge,
        TimingData     => Tmkr_A9_C_posedge,
        TestSignal     => A_dly(9),
        TestSignalName => "A(9)",
        TestDelay      => tisd_A_C(9),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_A_C_posedge_posedge(9),
        SetupLow       => tsetup_A_C_negedge_posedge(9),
        HoldLow        => thold_A_C_posedge_posedge(9),
        HoldHigh       => thold_A_C_negedge_posedge(9),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_A8_C_posedge,
        TimingData     => Tmkr_A8_C_posedge,
        TestSignal     => A_dly(8),
        TestSignalName => "A(8)",
        TestDelay      => tisd_A_C(8),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_A_C_posedge_posedge(8),
        SetupLow       => tsetup_A_C_negedge_posedge(8),
        HoldLow        => thold_A_C_posedge_posedge(8),
        HoldHigh       => thold_A_C_negedge_posedge(8),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_A7_C_posedge,
        TimingData     => Tmkr_A7_C_posedge,
        TestSignal     => A_dly(7),
        TestSignalName => "A(7)",
        TestDelay      => tisd_A_C(7),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_A_C_posedge_posedge(7),
        SetupLow       => tsetup_A_C_negedge_posedge(7),
        HoldLow        => thold_A_C_posedge_posedge(7),
        HoldHigh       => thold_A_C_negedge_posedge(7),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_A6_C_posedge,
        TimingData     => Tmkr_A6_C_posedge,
        TestSignal     => A_dly(6),
        TestSignalName => "A(6)",
        TestDelay      => tisd_A_C(6),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_A_C_posedge_posedge(6),
        SetupLow       => tsetup_A_C_negedge_posedge(6),
        HoldLow        => thold_A_C_posedge_posedge(6),
        HoldHigh       => thold_A_C_negedge_posedge(6),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_A5_C_posedge,
        TimingData     => Tmkr_A5_C_posedge,
        TestSignal     => A_dly(5),
        TestSignalName => "A(5)",
        TestDelay      => tisd_A_C(5),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_A_C_posedge_posedge(5),
        SetupLow       => tsetup_A_C_negedge_posedge(5),
        HoldLow        => thold_A_C_posedge_posedge(5),
        HoldHigh       => thold_A_C_negedge_posedge(5),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_A4_C_posedge,
        TimingData     => Tmkr_A4_C_posedge,
        TestSignal     => A_dly(4),
        TestSignalName => "A(4)",
        TestDelay      => tisd_A_C(4),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_A_C_posedge_posedge(4),
        SetupLow       => tsetup_A_C_negedge_posedge(4),
        HoldLow        => thold_A_C_posedge_posedge(4),
        HoldHigh       => thold_A_C_negedge_posedge(4),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_A3_C_posedge,
        TimingData     => Tmkr_A3_C_posedge,
        TestSignal     => A_dly(3),
        TestSignalName => "A(3)",
        TestDelay      => tisd_A_C(3),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_A_C_posedge_posedge(3),
        SetupLow       => tsetup_A_C_negedge_posedge(3),
        HoldLow        => thold_A_C_posedge_posedge(3),
        HoldHigh       => thold_A_C_negedge_posedge(3),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_A2_C_posedge,
        TimingData     => Tmkr_A2_C_posedge,
        TestSignal     => A_dly(2),
        TestSignalName => "A(2)",
        TestDelay      => tisd_A_C(2),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_A_C_posedge_posedge(2),
        SetupLow       => tsetup_A_C_negedge_posedge(2),
        HoldLow        => thold_A_C_posedge_posedge(2),
        HoldHigh       => thold_A_C_negedge_posedge(2),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_A1_C_posedge,
        TimingData     => Tmkr_A1_C_posedge,
        TestSignal     => A_dly(1),
        TestSignalName => "A(1)",
        TestDelay      => tisd_A_C(1),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_A_C_posedge_posedge(1),
        SetupLow       => tsetup_A_C_negedge_posedge(1),
        HoldLow        => thold_A_C_posedge_posedge(1),
        HoldHigh       => thold_A_C_negedge_posedge(1),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_A0_C_posedge,
        TimingData     => Tmkr_A0_C_posedge,
        TestSignal     => A_dly(0),
        TestSignalName => "A(0)",
        TestDelay      => tisd_A_C(0),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_A_C_posedge_posedge(0),
        SetupLow       => tsetup_A_C_negedge_posedge(0),
        HoldLow        => thold_A_C_posedge_posedge(0),
        HoldHigh       => thold_A_C_negedge_posedge(0),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_B17_C_posedge,
        TimingData     => Tmkr_B17_C_posedge,
        TestSignal     => B_dly(17),
        TestSignalName => "B(17)",
        TestDelay      => tisd_B_C(17),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_B_C_posedge_posedge(17),
        SetupLow       => tsetup_B_C_negedge_posedge(17),
        HoldLow        => thold_B_C_posedge_posedge(17),
        HoldHigh       => thold_B_C_negedge_posedge(17),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_B16_C_posedge,
        TimingData     => Tmkr_B16_C_posedge,
        TestSignal     => B_dly(16),
        TestSignalName => "B(16)",
        TestDelay      => tisd_B_C(16),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_B_C_posedge_posedge(16),
        SetupLow       => tsetup_B_C_negedge_posedge(16),
        HoldLow        => thold_B_C_posedge_posedge(16),
        HoldHigh       => thold_B_C_negedge_posedge(16),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_B15_C_posedge,
        TimingData     => Tmkr_B15_C_posedge,
        TestSignal     => B_dly(15),
        TestSignalName => "B(15)",
        TestDelay      => tisd_B_C(15),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_B_C_posedge_posedge(15),
        SetupLow       => tsetup_B_C_negedge_posedge(15),
        HoldLow        => thold_B_C_posedge_posedge(15),
        HoldHigh       => thold_B_C_negedge_posedge(15),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_B14_C_posedge,
        TimingData     => Tmkr_B14_C_posedge,
        TestSignal     => B_dly(14),
        TestSignalName => "B(14)",
        TestDelay      => tisd_B_C(14),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_B_C_posedge_posedge(14),
        SetupLow       => tsetup_B_C_negedge_posedge(14),
        HoldLow        => thold_B_C_posedge_posedge(14),
        HoldHigh       => thold_B_C_negedge_posedge(14),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_B13_C_posedge,
        TimingData     => Tmkr_B13_C_posedge,
        TestSignal     => B_dly(13),
        TestSignalName => "B(13)",
        TestDelay      => tisd_B_C(13),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_B_C_posedge_posedge(13),
        SetupLow       => tsetup_B_C_negedge_posedge(13),
        HoldLow        => thold_B_C_posedge_posedge(13),
        HoldHigh       => thold_B_C_negedge_posedge(13),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_B12_C_posedge,
        TimingData     => Tmkr_B12_C_posedge,
        TestSignal     => B_dly(12),
        TestSignalName => "B(12)",
        TestDelay      => tisd_B_C(12),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_B_C_posedge_posedge(12),
        SetupLow       => tsetup_B_C_negedge_posedge(12),
        HoldLow        => thold_B_C_posedge_posedge(12),
        HoldHigh       => thold_B_C_negedge_posedge(12),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_B11_C_posedge,
        TimingData     => Tmkr_B11_C_posedge,
        TestSignal     => B_dly(11),
        TestSignalName => "B(11)",
        TestDelay      => tisd_B_C(11),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_B_C_posedge_posedge(11),
        SetupLow       => tsetup_B_C_negedge_posedge(11),
        HoldLow        => thold_B_C_posedge_posedge(11),
        HoldHigh       => thold_B_C_negedge_posedge(11),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_B10_C_posedge,
        TimingData     => Tmkr_B10_C_posedge,
        TestSignal     => B_dly(10),
        TestSignalName => "B(10)",
        TestDelay      => tisd_B_C(10),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_B_C_posedge_posedge(10),
        SetupLow       => tsetup_B_C_negedge_posedge(10),
        HoldLow        => thold_B_C_posedge_posedge(10),
        HoldHigh       => thold_B_C_negedge_posedge(10),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_B9_C_posedge,
        TimingData     => Tmkr_B9_C_posedge,
        TestSignal     => B_dly(9),
        TestSignalName => "B(9)",
        TestDelay      => tisd_B_C(9),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_B_C_posedge_posedge(9),
        SetupLow       => tsetup_B_C_negedge_posedge(9),
        HoldLow        => thold_B_C_posedge_posedge(9),
        HoldHigh       => thold_B_C_negedge_posedge(9),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_B8_C_posedge,
        TimingData     => Tmkr_B8_C_posedge,
        TestSignal     => B_dly(8),
        TestSignalName => "B(8)",
        TestDelay      => tisd_B_C(8),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_B_C_posedge_posedge(8),
        SetupLow       => tsetup_B_C_negedge_posedge(8),
        HoldLow        => thold_B_C_posedge_posedge(8),
        HoldHigh       => thold_B_C_negedge_posedge(8),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_B7_C_posedge,
        TimingData     => Tmkr_B7_C_posedge,
        TestSignal     => B_dly(7),
        TestSignalName => "B(7)",
        TestDelay      => tisd_B_C(7),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_B_C_posedge_posedge(7),
        SetupLow       => tsetup_B_C_negedge_posedge(7),
        HoldLow        => thold_B_C_posedge_posedge(7),
        HoldHigh       => thold_B_C_negedge_posedge(7),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_B6_C_posedge,
        TimingData     => Tmkr_B6_C_posedge,
        TestSignal     => B_dly(6),
        TestSignalName => "B(6)",
        TestDelay      => tisd_B_C(6),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_B_C_posedge_posedge(6),
        SetupLow       => tsetup_B_C_negedge_posedge(6),
        HoldLow        => thold_B_C_posedge_posedge(6),
        HoldHigh       => thold_B_C_negedge_posedge(6),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_B5_C_posedge,
        TimingData     => Tmkr_B5_C_posedge,
        TestSignal     => B_dly(5),
        TestSignalName => "B(5)",
        TestDelay      => tisd_B_C(5),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_B_C_posedge_posedge(5),
        SetupLow       => tsetup_B_C_negedge_posedge(5),
        HoldLow        => thold_B_C_posedge_posedge(5),
        HoldHigh       => thold_B_C_negedge_posedge(5),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_B4_C_posedge,
        TimingData     => Tmkr_B4_C_posedge,
        TestSignal     => B_dly(4),
        TestSignalName => "B(4)",
        TestDelay      => tisd_B_C(4),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_B_C_posedge_posedge(4),
        SetupLow       => tsetup_B_C_negedge_posedge(4),
        HoldLow        => thold_B_C_posedge_posedge(4),
        HoldHigh       => thold_B_C_negedge_posedge(4),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_B3_C_posedge,
        TimingData     => Tmkr_B3_C_posedge,
        TestSignal     => B_dly(3),
        TestSignalName => "B(3)",
        TestDelay      => tisd_B_C(3),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_B_C_posedge_posedge(3),
        SetupLow       => tsetup_B_C_negedge_posedge(3),
        HoldLow        => thold_B_C_posedge_posedge(3),
        HoldHigh       => thold_B_C_negedge_posedge(3),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_B2_C_posedge,
        TimingData     => Tmkr_B2_C_posedge,
        TestSignal     => B_dly(2),
        TestSignalName => "B(2)",
        TestDelay      => tisd_B_C(2),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_B_C_posedge_posedge(2),
        SetupLow       => tsetup_B_C_negedge_posedge(2),
        HoldLow        => thold_B_C_posedge_posedge(2),
        HoldHigh       => thold_B_C_negedge_posedge(2),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_B1_C_posedge,
        TimingData     => Tmkr_B1_C_posedge,
        TestSignal     => B_dly(1),
        TestSignalName => "B(1)",
        TestDelay      => tisd_B_C(1),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_B_C_posedge_posedge(1),
        SetupLow       => tsetup_B_C_negedge_posedge(1),
        HoldLow        => thold_B_C_posedge_posedge(1),
        HoldHigh       => thold_B_C_negedge_posedge(1),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_B0_C_posedge,
        TimingData     => Tmkr_B0_C_posedge,
        TestSignal     => B_dly(0),
        TestSignalName => "B(0)",
        TestDelay      => tisd_B_C(0),
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_B_C_posedge_posedge(0),
        SetupLow       => tsetup_B_C_negedge_posedge(0),
        HoldLow        => thold_B_C_posedge_posedge(0),
        HoldHigh       => thold_B_C_negedge_posedge(0),
        CheckEnabled   => TO_X01((CE_dly) and (not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_CE_C_posedge,
        TimingData     => Tmkr_CE_C_posedge,
        TestSignal     => CE_dly,
        TestSignalName => "CE",
        TestDelay      => tisd_CE_C,
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_CE_C_posedge_posedge,
        SetupLow       => tsetup_CE_C_negedge_posedge,
        HoldLow        => thold_CE_C_posedge_posedge,
        HoldHigh       => thold_CE_C_negedge_posedge,
        CheckEnabled   => TO_X01((not R_dly)) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_R_C_posedge,
        TimingData     => Tmkr_R_C_posedge,
        TestSignal     => R_dly,
        TestSignalName => "R",
        TestDelay      => tisd_R_C,
        RefSignal      => C_dly,
        RefSignalName  => "C",
        RefDelay       => ticd_C,
        SetupHigh      => tsetup_R_C_posedge_posedge,
        SetupLow       => tsetup_R_C_negedge_posedge,
        HoldLow        => thold_R_C_posedge_posedge,
        HoldHigh       => thold_R_C_negedge_posedge,
        CheckEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalPeriodPulseCheck (
        Violation      => Pviol_C,
        PeriodData     => PInfo_C,
        TestSignal     => C_dly,
        TestSignalName => "C",
        TestDelay      => 0 ps,
        Period         => 0 ps,
        PulseWidthHigh => tpw_C_posedge,
        PulseWidthLow  => tpw_C_negedge,
        CheckEnabled   => true,
        HeaderMsg      => "/X_MULT18X18S",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

    end if;

    violation :=
      Tviol_A17_C_posedge
      or Tviol_A16_C_posedge
      or Tviol_A15_C_posedge
      or Tviol_A14_C_posedge
      or Tviol_A13_C_posedge
      or Tviol_A12_C_posedge
      or Tviol_A11_C_posedge
      or Tviol_A10_C_posedge
      or Tviol_A9_C_posedge
      or Tviol_A8_C_posedge
      or Tviol_A7_C_posedge
      or Tviol_A6_C_posedge
      or Tviol_A5_C_posedge
      or Tviol_A4_C_posedge
      or Tviol_A3_C_posedge
      or Tviol_A2_C_posedge
      or Tviol_A1_C_posedge
      or Tviol_A0_C_posedge
      or Tviol_B17_C_posedge
      or Tviol_B16_C_posedge
      or Tviol_B15_C_posedge
      or Tviol_B14_C_posedge
      or Tviol_B13_C_posedge
      or Tviol_B12_C_posedge
      or Tviol_B11_C_posedge
      or Tviol_B10_C_posedge
      or Tviol_B9_C_posedge
      or Tviol_B8_C_posedge
      or Tviol_B7_C_posedge
      or Tviol_B6_C_posedge
      or Tviol_B5_C_posedge
      or Tviol_B4_C_posedge
      or Tviol_B3_C_posedge
      or Tviol_B2_C_posedge
      or Tviol_B1_C_posedge
      or Tviol_B0_C_posedge
      or Tviol_CE_C_posedge
      or Tviol_R_C_posedge
      or Pviol_C;

    if (GSR_dly = '1') then
      O_zd                                    := (others => '0');
    elsif (GSR_dly = '0') then
      if (A_dly(A'left) = 'X' or B_dly(B'left) = 'X') then
        Omult_zd                              := (others => 'X');
      else
        if (A_dly(A'left) = '1' ) then
          A_i                                 := complement(A_dly);
        else
          A_i                                 := A_dly;
        end if;
        if (B_dly(B'left) = '1') then
          B_i                                 := complement(B_dly);
        else
          B_i                                 := B_dly;
        end if;
        IA                                    := SLV_TO_INT(A_i);
        IB1                                   := SLV_TO_INT(B_i (17 downto 9));
        IB2                                   := SLV_TO_INT(B_i (8 downto 0));
        O1_zd                                 := INT_TO_SLV((IA * IB1), A'length+B'length);
        -- shift I1_zd 9 to the left
        for j in 0 to 8 loop
          O1_zd(A'length+B'length-1 downto 0) := O1_zd(A'length+B'length-2 downto 0) & '0';
        end loop;
        O2_zd                                 := INT_TO_SLV((IA * IB2), A'length+B'length);
        Omult_zd                              := VECPLUS(O1_zd, O2_zd);
        sign                                  := A_dly(A'left) xor B_dly(B'left);
        if (sign = '1' ) then
          Omult_zd                            := complement(Omult_zd);
        end if;
      end if;
      if (C_dly'event and C_dly'last_value = '0' and C_dly = '1') then
        if (R_dly = '1') then
          O_zd                                := (others => '0');
        elsif (R_dly = '0') then
          if (CE_dly = '1') then
            O_zd                              := Omult_zd;
          end if;
        end if;
      end if;


      O_zd(35) := violation xor O_zd(35);
      O_zd(34) := violation xor O_zd(34);
      O_zd(33) := violation xor O_zd(33);
      O_zd(32) := violation xor O_zd(32);
      O_zd(31) := violation xor O_zd(31);
      O_zd(30) := violation xor O_zd(30);
      O_zd(29) := violation xor O_zd(29);
      O_zd(28) := violation xor O_zd(28);
      O_zd(27) := violation xor O_zd(27);
      O_zd(26) := violation xor O_zd(26);
      O_zd(25) := violation xor O_zd(25);
      O_zd(24) := violation xor O_zd(24);
      O_zd(23) := violation xor O_zd(23);
      O_zd(22) := violation xor O_zd(22);
      O_zd(21) := violation xor O_zd(21);
      O_zd(20) := violation xor O_zd(20);
      O_zd(19) := violation xor O_zd(19);
      O_zd(18) := violation xor O_zd(18);
      O_zd(17) := violation xor O_zd(17);
      O_zd(16) := violation xor O_zd(16);
      O_zd(15) := violation xor O_zd(15);
      O_zd(14) := violation xor O_zd(14);
      O_zd(13) := violation xor O_zd(13);
      O_zd(12) := violation xor O_zd(12);
      O_zd(11) := violation xor O_zd(11);
      O_zd(10) := violation xor O_zd(10);
      O_zd(9)  := violation xor O_zd(9);
      O_zd(8)  := violation xor O_zd(8);
      O_zd(7)  := violation xor O_zd(7);
      O_zd(6)  := violation xor O_zd(6);
      O_zd(5)  := violation xor O_zd(5);
      O_zd(4)  := violation xor O_zd(4);
      O_zd(3)  := violation xor O_zd(3);
      O_zd(2)  := violation xor O_zd(2);
      O_zd(1)  := violation xor O_zd(1);
      O_zd(0)  := violation xor O_zd(0);
    end if;
    VitalPathDelay01 (
      OutSignal     => P(35),
      GlitchData    => O_GlitchData(35),
      OutSignalName => "P(35)",
      OutTemp       => O_zd(35),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(35), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(34),
      GlitchData    => O_GlitchData(34),
      OutSignalName => "P(35)",
      OutTemp       => O_zd(34),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(34), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(33),
      GlitchData    => O_GlitchData(33),
      OutSignalName => "P(35)",
      OutTemp       => O_zd(33),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(33), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(32),
      GlitchData    => O_GlitchData(32),
      OutSignalName => "P(35)",
      OutTemp       => O_zd(32),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(32), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(31),
      GlitchData    => O_GlitchData(31),
      OutSignalName => "P(35)",
      OutTemp       => O_zd(31),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(31), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(30),
      GlitchData    => O_GlitchData(30),
      OutSignalName => "P(35)",
      OutTemp       => O_zd(30),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(30), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(29),
      GlitchData    => O_GlitchData(29),
      OutSignalName => "P(29)",
      OutTemp       => O_zd(29),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(29), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(28),
      GlitchData    => O_GlitchData(28),
      OutSignalName => "P(28)",
      OutTemp       => O_zd(28),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(28), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(27),
      GlitchData    => O_GlitchData(27),
      OutSignalName => "P(27)",
      OutTemp       => O_zd(27),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(27), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(26),
      GlitchData    => O_GlitchData(26),
      OutSignalName => "P(26)",
      OutTemp       => O_zd(26),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(26), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(25),
      GlitchData    => O_GlitchData(25),
      OutSignalName => "P(25)",
      OutTemp       => O_zd(25),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(25), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(24),
      GlitchData    => O_GlitchData(24),
      OutSignalName => "P(24)",
      OutTemp       => O_zd(24),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(24), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(23),
      GlitchData    => O_GlitchData(23),
      OutSignalName => "P(23)",
      OutTemp       => O_zd(23),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(23), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(22),
      GlitchData    => O_GlitchData(22),
      OutSignalName => "P(22)",
      OutTemp       => O_zd(22),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(22), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(21),
      GlitchData    => O_GlitchData(21),
      OutSignalName => "P(21)",
      OutTemp       => O_zd(21),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(21), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(20),
      GlitchData    => O_GlitchData(20),
      OutSignalName => "P(20)",
      OutTemp       => O_zd(20),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(20), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(19),
      GlitchData    => O_GlitchData(19),
      OutSignalName => "P(19)",
      OutTemp       => O_zd(19),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(19), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(18),
      GlitchData    => O_GlitchData(18),
      OutSignalName => "P(18)",
      OutTemp       => O_zd(18),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(18), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(17),
      GlitchData    => O_GlitchData(17),
      OutSignalName => "P(17)",
      OutTemp       => O_zd(17),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(17), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(16),
      GlitchData    => O_GlitchData(16),
      OutSignalName => "P(16)",
      OutTemp       => O_zd(16),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(16), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(15),
      GlitchData    => O_GlitchData(15),
      OutSignalName => "P(15)",
      OutTemp       => O_zd(15),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(15), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(14),
      GlitchData    => O_GlitchData(14),
      OutSignalName => "P(14)",
      OutTemp       => O_zd(14),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(14), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(13),
      GlitchData    => O_GlitchData(13),
      OutSignalName => "P(13)",
      OutTemp       => O_zd(13),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(13), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(12),
      GlitchData    => O_GlitchData(12),
      OutSignalName => "P(12)",
      OutTemp       => O_zd(12),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(12), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(11),
      GlitchData    => O_GlitchData(11),
      OutSignalName => "P(11)",
      OutTemp       => O_zd(11),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(11), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(10),
      GlitchData    => O_GlitchData(10),
      OutSignalName => "P(10)",
      OutTemp       => O_zd(10),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(10), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(9),
      GlitchData    => O_GlitchData(9),
      OutSignalName => "P(9)",
      OutTemp       => O_zd(9),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(9), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(8),
      GlitchData    => O_GlitchData(8),
      OutSignalName => "P(8)",
      OutTemp       => O_zd(8),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(8), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(7),
      GlitchData    => O_GlitchData(7),
      OutSignalName => "P(7)",
      OutTemp       => O_zd(7),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(7), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(6),
      GlitchData    => O_GlitchData(6),
      OutSignalName => "P(6)",
      OutTemp       => O_zd(6),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(6), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(5),
      GlitchData    => O_GlitchData(5),
      OutSignalName => "P(5)",
      OutTemp       => O_zd(5),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(5), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(4),
      GlitchData    => O_GlitchData(4),
      OutSignalName => "P(4)",
      OutTemp       => O_zd(4),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(4), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(3),
      GlitchData    => O_GlitchData(3),
      OutSignalName => "P(3)",
      OutTemp       => O_zd(3),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(3), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(2),
      GlitchData    => O_GlitchData(2),
      OutSignalName => "P(2)",
      OutTemp       => O_zd(2),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(2), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(1),
      GlitchData    => O_GlitchData(1),
      OutSignalName => "P(1)",
      OutTemp       => O_zd(1),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(1), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => P(0),
      GlitchData    => O_GlitchData(0),
      OutSignalName => "P(0)",
      OutTemp       => O_zd(0),
      Paths         => (0 => (C_dly'last_event, tpd_C_P(0), true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);

    wait on GSR_dly, C_dly, R_dly, CE_dly, A_dly, B_dly;

  end process VITALBehaviour;

end X_MULT18X18S_V ;
