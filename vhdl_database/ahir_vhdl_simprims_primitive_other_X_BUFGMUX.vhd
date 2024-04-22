-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Global Clock Mux Buffer with Output State 0
-- /___/   /\     Filename : X_BUFGMUX.vhd
-- \   \  /  \    Timestamp : Fri Mar 26 08:18:04 PST 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    06/27/05 - CR # 200995 -- Removed Extra Timing Checks
--    01/11/06 - CR # 218698 -- Removed output initialization
--    01/11/08 - Add CLK_SEL_TYPE attribute.
--    05/20/08 - Recoding same as verilog model. (CR467336)
--             - Remove GSR Vital (CR444306)
--     2/19/09 - Add initial to I0, I1, q0_t and q1_t (507901)
--    05/11/09 - Add period check (CR521102)
--    11/23/09 - Change Q to 0 instead of L (CR538513)
-- End Revision

----- CELL X_BUFGMUX  -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.VCOMPONENTS.all;

entity X_BUFGMUX is
  generic(
    TimingChecksOn : boolean := true;
    InstancePath   : string  := "*";
    Xon            : boolean := true;
    MsgOn          : boolean := false;
    CLK_SEL_TYPE   : string  := "SYNC";
    LOC            : string  := "UNPLACED";

      tbpd_S_O_I0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tbpd_S_O_I1 : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tipd_S : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I1 : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tpd_I0_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I1_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_S_O : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tsetup_S_I0_posedge_negedge : VitalDelayType := 0.000 ns;
      tsetup_S_I1_negedge_negedge : VitalDelayType := 0.000 ns;

      thold_S_I0_posedge_negedge : VitalDelayType := 0.000 ns;
      thold_S_I1_negedge_negedge : VitalDelayType := 0.000 ns;

      tpw_I0_negedge : VitalDelayType := 0.000 ns;
      tpw_I0_posedge : VitalDelayType := 0.000 ns;
      tpw_I1_negedge : VitalDelayType := 0.000 ns;
      tpw_I1_posedge : VitalDelayType := 0.000 ns;
      tperiod_I0_posedge : VitalDelayType := 0 ps;
      tperiod_I1_posedge : VitalDelayType := 0 ps;

      ticd_I0 : VitalDelayType := 0.000 ns;
      ticd_I1 : VitalDelayType := 0.000 ns;
      ticd_S : VitalDelayType := 0 ps;
      tisd_S_I0 : VitalDelayType := 0.000 ns;
      tisd_S_I1 : VitalDelayType := 0.000 ns
    );

  port(
    O   : out std_ulogic;
    
    I0  : in  std_ulogic := '0';
    I1  : in  std_ulogic := '0';
    S   : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_BUFGMUX : entity is true;
end X_BUFGMUX;

architecture X_BUFGMUX_V of X_BUFGMUX is
  attribute VITAL_LEVEL0 of
    X_BUFGMUX_V : architecture is true;

  signal I0_ipd  : std_ulogic := 'X';
  signal I1_ipd  : std_ulogic := 'X';
  signal S_ipd   : std_ulogic := 'X';
  signal S_ipd1   : std_ulogic := 'X';

  signal I0_dly   : std_ulogic := 'X';
  signal I1_dly   : std_ulogic := 'X';
  signal S_I0_dly : std_ulogic := 'X';
  signal S_I1_dly : std_ulogic := 'X';

  signal clk_sel_in : std_ulogic := '0';

  signal Q_zd : std_ulogic;
  signal q0 : std_ulogic := '1';
  signal q0_t : std_ulogic := '1';
  signal q0_enable : std_ulogic := '1';
  signal q1 : std_ulogic := '0';
  signal q1_t : std_ulogic := '0';
  signal q1_enable : std_ulogic := '0';
begin

  WireDelay : block
  begin
    VitalWireDelay (I0_ipd, I0, tipd_I0);
    VitalWireDelay (I1_ipd, I1, tipd_I1);
    VitalWireDelay (S_ipd, S, tipd_S);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (I0_dly, I0_ipd, ticd_I0);
    VitalSignalDelay (I1_dly, I1_ipd, ticd_I1);
    VitalSignalDelay (S_ipd1, S_ipd, ticd_S);
    VitalSignalDelay (S_I0_dly, S_ipd1, tisd_S_I0);
    VitalSignalDelay (S_I1_dly, S_ipd1, tisd_S_I1);
  end block;

  clk_sel_in <= '1' when (CLK_SEL_TYPE = "ASYNC") else '0';
  q0_t <= not S_ipd when clk_sel_in = '1' else q0;
  q1_t <=  S_ipd when clk_sel_in = '1' else q1;

  Q_zd <= I0_dly when (q0_t = '1') else I1_dly when (q1_t = '1') else 'X' when (q0_t = 'X' or q1_t = 'X') else '0';

  q0_p : process(GSR, I0_dly, S_I0_dly, q0_enable)
  begin
     if (GSR = '1') then
         q0 <= '1';
     elsif (I0_dly /= '1') then
        q0 <= (not S_I0_dly) and q0_enable;
     end if;
  end process;

  q1_p : process(GSR, I1_dly, S_I1_dly, q1_enable)
  begin
     if (GSR = '1') then
         q1 <= '0';
     elsif (I1_dly /= '1') then
        q1 <= S_I1_dly and q1_enable;
     end if;
  end process;

  q0_en_p : process(GSR, q1, I0_dly)
  begin
     if (GSR = '1') then
         q0_enable <= '1';
     elsif (q1 = '1') then
          q0_enable <= '0';
      elsif (I0_dly /= '0') then
          q0_enable <=  not q1;
      end if;
  end process;

  q1_en_p : process(GSR, q0, I1_dly)
  begin
     if (GSR = '1') then
         q1_enable <= '0';
      elsif (q0 = '1') then
          q1_enable <= '0';
      elsif (I1_dly /= '0') then
          q1_enable <=  not q0;
      end if;
  end process;

  
  VITALTimingCheck : process (I0_dly, I1_dly, S_I0_dly, S_I1_dly)
    variable Tmkr_S_I0_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_S_I1_posedge  : VitalTimingDataType := VitalTimingDataInit; 
    variable PInfo_I0 : VitalPeriodDataType := VitalPeriodDataInit;
    variable Pviol_I0 : STD_ULOGIC := '0';
    variable Pviol_I1 : STD_ULOGIC := '0';
    variable PInfo_I1 : VitalPeriodDataType := VitalPeriodDataInit;
    variable Tviol_S_I0_posedge : std_ulogic          := '0';
    variable Tviol_S_I1_posedge : std_ulogic          := '0';
  begin  
    if (TimingChecksOn) then
      VitalSetupHoldCheck (
        Violation      => Tviol_S_I0_posedge,
        TimingData     => Tmkr_S_I0_posedge,
        TestSignal     => S_I0_dly,
        TestSignalName => "S",
        TestDelay      => tisd_S_I0,
        RefSignal      => I0_dly,
        RefSignalName  => "I0",
        RefDelay       => ticd_I0,
        SetupHigh      => tsetup_S_I0_posedge_negedge,
        HoldHigh       => thold_S_I0_posedge_negedge,
        CheckEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_BUFGMUX",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_S_I1_posedge,
        TimingData     => Tmkr_S_I1_posedge,
        TestSignal     => S_I1_dly,
        TestSignalName => "S",
        TestDelay      => tisd_S_I1,
        RefSignal      => I1_dly,
        RefSignalName  => "I1",
        RefDelay       => ticd_I1,
        SetupLow       => tsetup_S_I1_negedge_negedge,
        HoldLow        => thold_S_I1_negedge_negedge,
        CheckEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_BUFGMUX",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
    VitalPeriodPulseCheck
    (
      Violation      => Pviol_I0,
      PeriodData     => PInfo_I0,
      TestSignal     => I0_dly,
      TestSignalName => "I0",
      TestDelay      => 0 ps,
      Period         => tperiod_I0_posedge,
      PulseWidthHigh => 0 ps,
      PulseWidthLow  => 0 ps,
      CheckEnabled   => TRUE,
      HeaderMsg      => InstancePath & "/X_BUFGMUX",
      Xon            => Xon,
      MsgOn          => MsgOn,
      MsgSeverity    => WARNING
    );
    VitalPeriodPulseCheck
    (
      Violation      => Pviol_I1,
      PeriodData     => PInfo_I1,
      TestSignal     => I1_dly,
      TestSignalName => "I1",
      TestDelay      => 0 ps,
      Period         => tperiod_I1_posedge,
      PulseWidthHigh => 0 ps,
      PulseWidthLow  => 0 ps,
      CheckEnabled   => TRUE,
      HeaderMsg      => InstancePath & "/X_BUFGMUX",
      Xon            => Xon,
      MsgOn          => MsgOn,
      MsgSeverity    => WARNING
    );
    end if;
  end process VITALTimingCheck;

  VITALPathDelay : process (Q_zd)
    variable O_zd : std_ulogic;
    variable O_GlitchData : VitalGlitchDataType;    
  begin
    O_zd := Q_zd;
    if (O_zd = 'L') then
      O_zd := '0';
    end if;    
    VitalPathDelay01 (
      OutSignal           => O,
      GlitchData          => O_GlitchData,
      OutSignalName       => "O",
      OutTemp             => O_zd,
      Paths               => (0 => (I0_dly'last_event, tpd_I0_O, true),
                        1 => (I1_dly'last_event, tpd_I1_O, true),
                        2 => (S_ipd1'last_event, tpd_S_O, true)),
      Mode                => VitalTransport,
      Xon                 => Xon,
      MsgOn               => MsgOn,
      MsgSeverity         => warning);    
  end process VITALPathDelay;
end X_BUFGMUX_V;
