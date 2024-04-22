-------------------------------------------------------------------------------
-- Copyright (c) 1995/2010 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Differential Signaling Input Buffer with Differential Outputs
-- /___/   /\     Filename : X_IBUFDS_DIFF_OUT_IBUFDISABLE.vhd
-- \   \  /  \    Timestamp : Wed Dec  8 17:04:24 PST 2010
--  \___\/\___\
--
-- Revision:
--    12/08/10 - Initial version.
--    04/04/11 - CR 604808 fix
--    06/15/11 - CR 613347 -- made ouput logic_1 when IBUFDISABLE is active
--    08/31/11 - CR 623170 -- added attribute USE_IBUFDISABLE
-- End Revision


library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_IBUFDS_DIFF_OUT_IBUFDISABLE is
  generic(
    DIFF_TERM    : string :=  "FALSE";
    IBUF_LOW_PWR : string :=  "TRUE";
    IOSTANDARD   : string := "DEFAULT";          
    USE_IBUFDISABLE : string := "TRUE";

    Xon   : boolean := true;
    MsgOn : boolean := true;
    LOC            : string  := "UNPLACED";

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_I_OB : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_IB : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_IB_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_IB_OB : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_IBUFDISABLE : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_IBUFDISABLE_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_IBUFDISABLE_OB : VitalDelayType01 := (0.000 ns, 0.000 ns);
    PATHPULSE : time := 0 ps
    );

   port(
      O                              :	out   STD_ULOGIC;
      OB                             :	out   STD_ULOGIC;      
      
      I                              :	in    STD_ULOGIC;
      IB                             :	in    STD_ULOGIC;
      IBUFDISABLE                    :	in    STD_ULOGIC
      );

 attribute VITAL_LEVEL0 of
    X_IBUFDS_DIFF_OUT_IBUFDISABLE : entity is true;

end X_IBUFDS_DIFF_OUT_IBUFDISABLE;

architecture X_IBUFDS_DIFF_OUT_IBUFDISABLE_V of X_IBUFDS_DIFF_OUT_IBUFDISABLE is

 attribute VITAL_LEVEL0 of
    X_IBUFDS_DIFF_OUT_IBUFDISABLE_V : architecture is true;

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
--

     wait;
  end process prcs_init;


--   VITALBehavior : process (I, IB)
--   begin
--      if (I /= IB ) then
--        O  <= TO_X01(I);
--        OB <= TO_X01(NOT I);
--      end if;
-- end process;

  prcs_timing : process
     variable O_zd          : std_ulogic;
     variable O_GlitchData  : VitalGlitchDataType;
     variable OB_zd         : std_ulogic;
     variable OB_GlitchData : VitalGlitchDataType;
  begin
     if(USE_IBUFDISABLE = "TRUE") then
        if(IBUFDISABLE_ipd = '0') then
            if (I_ipd /= IB_ipd ) then 
               O_zd  := TO_X01(I_ipd);
               OB_zd := TO_X01(NOT I_ipd);
            end if;
        elsif(IBUFDISABLE_ipd = '1') then
            O_zd  := '1';
            OB_zd := '1';
        else
            O_zd  := 'X';
            OB_zd := 'X';
        end if;
     elsif(USE_IBUFDISABLE = "FALSE") then
        if (I_ipd /= IB_ipd ) then
           O_zd  := TO_X01(I_ipd);
           OB_zd := TO_X01(NOT I_ipd);
        end if;
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

     VitalPathDelay01 (
       OutSignal     => OB,
       GlitchData    => OB_GlitchData,
       OutSignalName => "OB",
       OutTemp       => OB_zd,
       Paths         => (0 => (I_ipd'last_event,              tpd_I_OB,              true),
                         1 => (IBUFDISABLE_ipd'last_event,    tpd_IBUFDISABLE_OB,    true)),
       Mode          => VitalTransport,
       Xon           => Xon,
       MsgOn         => MsgOn,
       MsgSeverity   => warning);


     wait on I_ipd, IB_ipd, IBUFDISABLE_ipd;
  end process;


end X_IBUFDS_DIFF_OUT_IBUFDISABLE_V;
