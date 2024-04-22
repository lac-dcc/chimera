-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                       Device DNA Data Access Port
-- /___/   /\     Filename : X_DNA_PORT.vhd
-- \   \  /  \    Timestamp : Mon Oct 10 15:21:52 PDT 2005
--  \___\/\___\
--
-- Revision:
--    10/10/05 - Initial version
--    27/05/08 - CR 472154 Removed Vital GSR constructs
--    06/04/08 - CR 472697 -- added check for SIM_DNA_VALUE bits [56:55] 
--    09/18/08 - CR 488646 -- added period check for simprim
--    10/28/08 - IR 494079 -- Shifting of dna_value is corrected to MSB first 
--    11/10/09 - CR 537739 -- Fixed DOUT to be high in READ mode
--    09/07/11 - CR 621903 -- Reinitialized buffer to dna_value when READ is asserted 
-- End Revision

----- CELL X_DNA_PORT -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_DNA_PORT is

  generic(

      TimingChecksOn : boolean := true;
      InstancePath   : string  := "*";
      Xon            : boolean := true;
      MsgOn          : boolean := true;
      LOC            : string  := "UNPLACED";
--  VITAL input Pin path delay variables
      tipd_CLK : VitalDelayType01 := (0 ps, 0 ps);
      tipd_DIN : VitalDelayType01 := (0 ps, 0 ps);
      tipd_READ  : VitalDelayType01 := (0 ps, 0 ps);
      tipd_SHIFT : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL clk-to-output path delay variables
      tpd_CLK_DOUT : VitalDelayType01 := (100 ps, 100 ps);

--  VITAL tisd & tisd variables
      ticd_CLK       : VitalDelayType   := 0 ps;
      tisd_DIN_CLK   : VitalDelayType   := 0 ps;
      tisd_READ_CLK  : VitalDelayType   := 0 ps;
      tisd_SHIFT_CLK : VitalDelayType   := 0 ps;

--  VITAL Setup/Hold delay variables
      tsetup_DIN_CLK_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_DIN_CLK_negedge_posedge : VitalDelayType := 0 ps;
      thold_DIN_CLK_posedge_posedge : VitalDelayType := 0 ps;
      thold_DIN_CLK_negedge_posedge : VitalDelayType := 0 ps;

      tsetup_READ_CLK_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_READ_CLK_negedge_posedge : VitalDelayType := 0 ps;
      thold_READ_CLK_posedge_posedge : VitalDelayType := 0 ps;
      thold_READ_CLK_negedge_posedge : VitalDelayType := 0 ps;

      tsetup_SHIFT_CLK_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_SHIFT_CLK_negedge_posedge : VitalDelayType := 0 ps;
      thold_SHIFT_CLK_posedge_posedge : VitalDelayType := 0 ps;
      thold_SHIFT_CLK_negedge_posedge : VitalDelayType := 0 ps;

--  VITAL CLK period 
      tperiod_CLK_posedge : VitalDelayType := 0 ps;

      SIM_DNA_VALUE : bit_vector := X"000000000000000"
      );

  port(
    DOUT  : out std_ulogic;

    CLK   : in std_ulogic;
    DIN   : in std_ulogic;
    READ  : in std_ulogic;
    SHIFT : in std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_DNA_PORT : entity is true;

end X_DNA_PORT;

architecture X_DNA_PORT_V of X_DNA_PORT is

  attribute VITAL_LEVEL0 of
    X_DNA_PORT_V : architecture is true;

-----------------------------------------------------------
-----------------------------------------------------------
  function eval_init (
                         sim_dna_val : in  bit_vector;
                         msb         : in integer
              ) return std_logic_vector is
  variable ret_sim_dna_val : std_logic_vector (msb downto 0);
  variable tmp_sim_dna_val : std_logic_vector ((sim_dna_val'length-1) downto 0);
  begin
    if (sim_dna_val'length >= msb ) then
--        ret_sim_dna_val(msb downto 0)  := To_stdLogicVector(sim_dna_val((sim_dna_val'length-msb-1) to (sim_dna_val'length-1)));
        tmp_sim_dna_val((sim_dna_val'length-1) downto 0) := To_stdLogicVector(sim_dna_val);
        ret_sim_dna_val(msb downto 0) := tmp_sim_dna_val(msb downto 0);

    else
        ret_sim_dna_val := (others => '0');
        ret_sim_dna_val((sim_dna_val'length-1) downto 0) := To_stdLogicVector(sim_dna_val);
    end if;

    return ret_sim_dna_val(msb downto 0);
  end;
-----------------------------------------------------------
-----------------------------------------------------------

  constant MAX_DNA_BITS     : integer := 57;
  constant MSB_DNA_BITS     : integer := (MAX_DNA_BITS - 1);

  constant SYNC_PATH_DELAY      : time := 100 ps;

  signal        CLK_ipd          : std_ulogic := 'X';
  signal        DIN_ipd          : std_ulogic := 'X';
  signal        GSR_ipd          : std_ulogic := '0';
  signal        READ_ipd         : std_ulogic := 'X';
  signal        SHIFT_ipd        : std_ulogic := 'X';

  signal        CLK_dly          : std_ulogic := 'X';
  signal        DIN_dly          : std_ulogic := 'X';
  signal        GSR_dly          : std_ulogic := '0';
  signal        READ_dly         : std_ulogic := 'X';
  signal        SHIFT_dly        : std_ulogic := 'X';

  signal        DOUT_zd          : std_ulogic := 'X';

  signal        dna_val          : std_logic_vector(MSB_DNA_BITS downto 0) := eval_init(SIM_DNA_VALUE, MSB_DNA_BITS);

  signal	Violation        : std_ulogic := '0';

begin

  GSR_dly <= GSR;

  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay : block
  begin
    VitalWireDelay (CLK_ipd,   CLK,   tipd_CLK);
    VitalWireDelay (DIN_ipd,   DIN,   tipd_DIN);
    VitalWireDelay (READ_ipd,  READ,  tipd_READ);
    VitalWireDelay (SHIFT_ipd, SHIFT, tipd_SHIFT);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (CLK_dly,   CLK_ipd,   ticd_CLK);
    VitalSignalDelay (DIN_dly,   DIN_ipd,   tisd_DIN_CLK);
    VitalSignalDelay (READ_dly,  READ_ipd,  tisd_READ_CLK);
    VitalSignalDelay (SHIFT_dly, SHIFT_ipd, tisd_SHIFT_CLK);

  end block;

  --------------------
  --  BEHAVIOR SECTION
  --------------------

--####################################################################
--#####                        Initialization                      ###
--####################################################################
  prcs_init:process
  begin
    if(dna_val(MSB_DNA_BITS downto (MSB_DNA_BITS -1)) /= "10") then
       assert false
       report "Attribute Syntax Warning: SIM_DNA_VALUE bits [56:55] on component DNA_PORT do not match the expected value ""10"". The simulation will not exactly model the hardware behavior, as detailed in the Spartan-3 Generation FPGA User Guide."
       severity warning;
    end if;
    wait;
  end process prcs_init;

--####################################################################
--#####                            READ                            ###
--####################################################################
  prcs_read:process(CLK_dly, GSR_dly, READ_dly, SHIFT_dly)
  variable        dna_val_var          : std_logic_vector(MSB_DNA_BITS downto 0) := eval_init(SIM_DNA_VALUE, MSB_DNA_BITS);
  begin
     if(GSR_dly = '1') then
        dna_val(0) <= '0';
     elsif(GSR_dly = '0') then
        if(rising_edge(CLK_dly)) then
           if(READ_dly = '1') then
-- CR 621903
                dna_val_var := eval_init(SIM_DNA_VALUE, MSB_DNA_BITS);
                DOUT_zd <= '1';
           elsif(READ_dly = '0') then
               if(SHIFT_dly = '1') then
-- IR 494079 
--                  dna_val <= DIN_dly & dna_val(MSB_DNA_BITS downto 1);
                  dna_val_var := dna_val_var((MSB_DNA_BITS - 1) downto 0) & DIN_dly;
                  DOUT_zd     <= dna_val_var(MSB_DNA_BITS);
               end if; -- SHIFT_dly = '1'   
           end if;  -- READ_dly = '1'  
        end if; -- rising_edge(CLK_dly)   
     end if; -- GSR_dly = '1'   
  end process prcs_read;

--####################################################################
--#####             Update Zero Delay Output                     #####
--####################################################################

-- IR 494079 
-- DOUT_zd <= dna_val(0);
-- CR 537739 
--   DOUT_zd <= dna_val(MSB_DNA_BITS);




--####################################################################
--#####                   TIMING CHECKS & OUTPUT                 #####
--####################################################################
  prcs_tmngchk:process
  variable Tmkr_DIN_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_DIN_CLK_posedge : std_ulogic          := '0';
  variable Tmkr_READ_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_READ_CLK_posedge : std_ulogic          := '0';
  variable Tmkr_SHIFT_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_SHIFT_CLK_posedge : std_ulogic          := '0';

  variable Pviol_CLK : std_ulogic          := '0';
  variable PInfo_CLK : VitalPeriodDataType := VitalPeriodDataInit;

  begin
    if(TimingChecksOn) then

--======================== DIN =============================
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DIN_CLK_posedge,
         TimingData     => Tmkr_DIN_CLK_posedge,
         TestSignal     => DIN_dly,
         TestSignalName => "DIN",
         TestDelay      => tisd_DIN_CLK,
         RefSignal      => CLK_dly,
         RefSignalName  => "CLK",
         RefDelay       => ticd_CLK,
         SetupHigh      => tsetup_DIN_CLK_posedge_posedge,
         SetupLow       => tsetup_DIN_CLK_negedge_posedge,
         HoldLow        => thold_DIN_CLK_posedge_posedge,
         HoldHigh       => thold_DIN_CLK_negedge_posedge,
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_DNA_PORT",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => WARNING);

--======================= READ ==============================
     VitalSetupHoldCheck
       (
         Violation      => Tviol_READ_CLK_posedge,
         TimingData     => Tmkr_READ_CLK_posedge,
         TestSignal     => READ_dly,
         TestSignalName => "READ",
         TestDelay      => tisd_READ_CLK,
         RefSignal      => CLK_dly,
         RefSignalName  => "CLK",
         RefDelay       => ticd_CLK,
         SetupHigh      => tsetup_READ_CLK_posedge_posedge,
         SetupLow       => tsetup_READ_CLK_negedge_posedge,
         HoldLow        => thold_READ_CLK_posedge_posedge,
         HoldHigh       => thold_READ_CLK_negedge_posedge,
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_DNA_PORT",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => WARNING);

--======================= SHIFT ==============================
     VitalSetupHoldCheck
       (
         Violation      => Tviol_SHIFT_CLK_posedge,
         TimingData     => Tmkr_SHIFT_CLK_posedge,
         TestSignal     => SHIFT_dly,
         TestSignalName => "SHIFT",
         TestDelay      => tisd_SHIFT_CLK,
         RefSignal      => CLK_dly,
         RefSignalName  => "CLK",
         RefDelay       => ticd_CLK,
         SetupHigh      => tsetup_SHIFT_CLK_posedge_posedge,
         SetupLow       => tsetup_SHIFT_CLK_negedge_posedge,
         HoldLow        => thold_SHIFT_CLK_posedge_posedge,
         HoldHigh       => thold_SHIFT_CLK_negedge_posedge,
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_DNA_PORT",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => WARNING);

--================= CLK period check  ========================
     VitalPeriodPulseCheck
       (
         Violation            => Pviol_CLK,
         PeriodData           => PInfo_CLK,
         TestSignal           => CLK_dly,
         TestSignalName       => "CLK",
         TestDelay            => 0 ps,
         Period               => tperiod_CLK_posedge,
         PulseWidthHigh       => 0 ps,
         PulseWidthLow        => 0 ps,
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         HeaderMsg      => InstancePath & "/X_DNA_PORT",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => WARNING);
--======================= SHIFT ==============================
    end if;

    Violation <= Tviol_DIN_CLK_posedge or Tviol_READ_CLK_posedge or
                 Tviol_SHIFT_CLK_posedge  or Pviol_CLK;

    wait on CLK_dly, GSR_dly;
  end process prcs_tmngchk;
--####################################################################
--#####                           OUTPUT                         #####
--####################################################################
  prcs_output:process
  variable DOUT_GlitchData     : VitalGlitchDataType;

  variable DOUT_zd_viol : std_ulogic := '0';

  begin

    DOUT_zd_viol := Violation xor DOUT_zd; 

    VitalPathDelay01 (
      OutSignal  => DOUT,
      GlitchData => DOUT_GlitchData,
      OutSignalName => "DOUT",
      OutTemp => DOUT_zd_viol,
      Paths => (0 => (CLK_dly'last_event, tpd_CLK_DOUT, true)),
      Mode => VitalTransport,
      Xon => Xon,
      MsgOn => True,
      MsgSeverity => WARNING
      );
     wait on DOUT_zd, Violation;
  end process prcs_output;


end X_DNA_PORT_V;

