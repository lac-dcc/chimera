-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  
-- /___/   /\     Filename : X_BUFIODQS.vhd
-- \   \  /  \    Timestamp : Mon Jul 14 14:30:57 PDT 2008
--  \___\/\___\
--
-- Revision:
--    07/14/08 - Initial version.
--    03/18/09 - CR 513153 fix -- simprim output goes "X"
--    03/20/09 - CR 513938 remove DELAY_BYPASS 
--    05/12/09 - CR 521124 changed functionality as specified by hw.
--    09/01/09 - CR 532419 Changed default value of DQSMASK_ENABLE
-- End Revision

----- CELL X_BUFIODQS -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_BUFIODQS is

  generic(

      TimingChecksOn : boolean := true;
      Xon            : boolean := true;
      MsgOn          : boolean := true;
      LOC            : string  := "UNPLACED";

--  VITAL input Pin path delay variables
      tipd_I    : VitalDelayType01 := (0 ps, 0 ps);
      tipd_DQSMASK    : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL clk-to-output path delay variables
      tpd_DQSMASK_O : VitalDelayType01 := (0 ps, 0 ps);
      tpd_I_O       : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL period check
        tperiod_I_posedge     : VitalDelayType := 0 ps;


      DQSMASK_ENABLE : boolean := FALSE  -- TRUE, FALSE
      );

  port(
      O : out std_ulogic;

      DQSMASK : in  std_ulogic;
      I : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_BUFIODQS : entity is true;

end X_BUFIODQS;

architecture X_BUFIODQS_V OF X_BUFIODQS is

  attribute VITAL_LEVEL0 of
    X_BUFIODQS_V : architecture is true;


  signal q1          : std_ulogic := '0';
  signal q2          : std_ulogic := '0';
  signal clk         : std_ulogic := '0';
  signal dglitch_en  : std_ulogic := '0';

  signal I_ipd       : std_ulogic := '0';
  signal DQSMASK_ipd : std_ulogic := '0';
  signal O_zd        : std_ulogic := '0';
  signal Violation   : std_ulogic := '0';

begin

  WireDelay : block
  begin
    VitalWireDelay (I_ipd,       I,       tipd_I);
    VitalWireDelay (DQSMASK_ipd, DQSMASK, tipd_DQSMASK);
  end block;


  --------------------
  --  BEHAVIOR SECTION
  --------------------


--####################################################################
--#####                     Initialize                           #####
--####################################################################
  prcs_init:process

  begin
-------------------------------------------------
------ DQSMASK_ENABLE Check
-------------------------------------------------
      if((DQSMASK_ENABLE /= true) and (DQSMASK_ENABLE /= false))  then
           assert false
           report "Attribute Syntax Error: The Legal values for DQSMASK_ENABLE are TRUE or FALSE"
           severity Failure;
      end if;
     wait;
  end process prcs_init;

--####################################################################
--#####                     Functionality                        #####
--####################################################################

  dglitch_en <= (not q2 or DQSMASK_ipd);

  clk <= I_ipd when (dglitch_en = '1')
        else '0';

  prcs_q1 : process(DQSMASK_ipd, clk)
  begin
     if(DQSMASK_ipd = '1') then
        q1 <= '0';
     else
        if(clk <= '1') then 
           q1 <= '1' after 300 ps;
        end if;
     end if; 
  end process prcs_q1;

  prcs_q2 : process(DQSMASK_ipd, clk) 
  begin
     if(DQSMASK_ipd = '1') then
        q2 <= '0';
     else
        if(clk <= '0') then 
           q2 <= q1 after 400 ps;
        end if;
     end if; 
  end process prcs_q2;


--####################################################################
--#####                           OUTPUT                         #####
--####################################################################

  O_zd <= clk when DQSMASK_ENABLE else I_ipd;

  prcs_timing:process
    variable PViol_I : std_ulogic          := '0';
    variable PInfo_I : VitalPeriodDataType := VitalPeriodDataInit;

  begin
    if (TimingChecksOn) then
       VitalPeriodPulseCheck (
         Violation            => Pviol_I,
         PeriodData           => PInfo_I,
         TestSignal           => I_ipd,
         TestSignalName       => "I",
         TestDelay            => 0 ps,
         Period               => tperiod_I_posedge,
         PulseWidthHigh       => 0 ps,
         PulseWidthLow        => 0 ps,
         CheckEnabled         => true,
         HeaderMsg            => "/X_BUFIODQS",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => warning);
    end if;
   
    Violation <= Pviol_I;

    wait on I_ipd;

  end process prcs_timing;
       

  prcs_output:process(O_zd)
  variable  O_GlitchData : VitalGlitchDataType;

  begin

     if(DQSMASK_ENABLE=false) then
        VitalPathDelay01
          (
            OutSignal     => O,
            GlitchData    => O_GlitchData,
            OutSignalName => "O",
            OutTemp       => O_zd,
            Paths         => (0 => (I_ipd'last_event,   tpd_I_O, true)),
            Mode          => VitalTransport,
            Xon           => Xon,
            MsgOn         => MsgOn,
            MsgSeverity   => WARNING
          );

     else
        VitalPathDelay01
          (
            OutSignal     => O,
            GlitchData    => O_GlitchData,
            OutSignalName => "O",
            OutTemp       => O_zd,
            Paths         => (0 => (DQSMASK_ipd'last_event,   tpd_DQSMASK_O, true)),
            Mode          => VitalTransport,
            Xon           => Xon,
            MsgOn         => MsgOn,
            MsgSeverity   => WARNING
          );
     end if;
  end process prcs_output;


end X_BUFIODQS_V;
