-------------------------------------------------------------------------------
-- Copyright (c) 1995/2010 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Differential Signaling Input Buffer
-- /___/   /\     Filename : X_IBUFDS_IBUFDISABLE.vhd
-- \   \  /  \    Timestamp : Wed Dec  8 17:04:24 PST 2010
--  \___\/\___\
--
-- Revision:
--    12/08/10 - Initial version.
--    04/04/11 - CR 604808 fix
--    06/15/11 - CR 613347 -- made ouput logic_1 when IBUFDISABLE is active
--    08/31/11 - CR 623170 -- added attribute USE_IBUFDISABLE
--    09/13/11 - CR 624774 -- Removed attributes IBUF_DELAY_VALUE and IFD_DELAY_VALUE
--    09/16/11 - CR 625725 -- Removed attribute CAPACITANCE
-- End Revision

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_IBUFDS_IBUFDISABLE is
  generic(
      DIFF_TERM   : string  :=  "FALSE";
      IBUF_LOW_PWR : string :=  "TRUE";
      IOSTANDARD  : string  := "DEFAULT";
      USE_IBUFDISABLE : string :=  "TRUE";

      Xon   : boolean := true;
      MsgOn : boolean := true;
      LOC            : string  := "UNPLACED";

      tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_IB : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_IB_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_IBUFDISABLE : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_IBUFDISABLE_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      PATHPULSE : time := 0 ps
    );

  port(
    O : out std_ulogic;

    I  : in std_ulogic;
    IB : in std_ulogic;
    IBUFDISABLE : in std_ulogic
    );

 attribute VITAL_LEVEL0 of
    X_IBUFDS_IBUFDISABLE : entity is true;

end X_IBUFDS_IBUFDISABLE;

architecture X_IBUFDS_IBUFDISABLE_V of X_IBUFDS_IBUFDISABLE is

 attribute VITAL_LEVEL0 of
    X_IBUFDS_IBUFDISABLE_V : architecture is true;

  signal I_ipd              : std_ulogic := 'X';
  signal IB_ipd             : std_ulogic := 'X';
  signal IBUFDISABLE_ipd    : std_ulogic := 'X';

begin

  WireDelay    : block
  begin
    VitalWireDelay (I_ipd,              I,              tipd_I);
    VitalWireDelay (IB_ipd,             IB,             tipd_IB);
    VitalWireDelay (IBUFDISABLE_ipd,    IBUFDISABLE,    tipd_IBUFDISABLE);
  end block;

  prcs_init : process
  variable FIRST_TIME        : boolean    := TRUE;
  begin

     If(FIRST_TIME = true) then

        if((DIFF_TERM = "TRUE") or
           (DIFF_TERM = "FALSE")) then
           FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for DIFF_TERM are TRUE or FALSE"
           severity Failure;
        end if;

--   
        if((IBUF_LOW_PWR = "TRUE") or
           (IBUF_LOW_PWR = "FALSE")) then
           FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for IBUF_LOW_PWR are TRUE or FALSE"
           severity Failure;
        end if;

--  
        if((USE_IBUFDISABLE = "TRUE") or
           (USE_IBUFDISABLE = "FALSE")) then
           FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for USE_IBUFDISABLE are TRUE or FALSE"
           severity Failure;
        end if;

     end if;

     wait;
  end process prcs_init;

--  VitalBehavior : process (I, IB)
--  begin
--    if ( (((I = '1') or (I = 'H')) and ((IB = '0') or (IB = 'L'))) or
--         (((I = '0') or (I = 'L')) and ((IB = '1') or (IB = 'H'))) ) then
--      O <= TO_X01(I);
--    elsif (I = 'Z' or I = 'X' or IB = 'Z' or IB ='X') then
--        O <= 'X';
--    end if;
--  end process;

  prcs_timing : process
     variable O_zd         : std_ulogic;
     variable O_GlitchData : VitalGlitchDataType;
  begin

     if((USE_IBUFDISABLE = "FALSE") OR ((USE_IBUFDISABLE = "TRUE") AND (IBUFDISABLE_ipd = '0'))) then
        if ( (((I_ipd = '1') or (I_ipd = 'H')) and ((IB_ipd = '0') or (IB_ipd = 'L'))) or
             (((I_ipd = '0') or (I_ipd = 'L')) and ((IB_ipd = '1') or (IB_ipd = 'H'))) ) then
           O_zd := TO_X01(I);
        elsif (I_ipd = 'Z' or I_ipd = 'X' or IB_ipd = 'Z' or IB_ipd ='X') then
           O_zd := 'X';
        end if;
     elsif((USE_IBUFDISABLE = "TRUE") AND (IBUFDISABLE_ipd = '1')) then
         O_zd := '1';
     else
         O_zd := 'X';
     end if;

     VitalPathDelay01 (
       OutSignal     => O,
       GlitchData    => O_GlitchData,
       OutSignalName => "O",
       OutTemp       => O_zd,
       Paths         => (0 => (I_ipd'last_event,              tpd_I_O,              true),
                         1 => (IBUFDISABLE_ipd'last_event,    tpd_IBUFDISABLE_O,    true)),
       Mode          => VitalTransport,
       Xon           => Xon,
       MsgOn         => MsgOn,
       MsgSeverity   => warning);


     wait on I_ipd, IB_ipd, IBUFDISABLE_ipd;
  end process;

end X_IBUFDS_IBUFDISABLE_V;
