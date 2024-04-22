-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  I/O Clock Buffer/Divider for the Spartan Series
-- /___/   /\     Filename : X_BUFIO2FB.vhd
-- \   \  /  \    Timestamp : Fri Mar 21 16:42:08 PDT 2008
--  \___\/\___\
--
-- Revision:
--    03/21/08 - Initial version.
-- End Revision

----- CELL X_BUFIO2FB -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_BUFIO2FB is

  generic(

      TimingChecksOn : boolean := true;
      Xon            : boolean := true;
      MsgOn          : boolean := true;
      LOC            : string  := "UNPLACED";

--  VITAL input Pin path delay variables
      tipd_I    : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL clk-to-output path delay variables
      tpd_I_O   : VitalDelayType01 := (0 ps, 0 ps);


      DIVIDE_BYPASS : boolean := TRUE  -- TRUE, FALSE
      );

  port(
      O : out std_ulogic;

      I : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_BUFIO2FB : entity is true;

end X_BUFIO2FB;

architecture X_BUFIO2FB_V OF X_BUFIO2FB is

  attribute VITAL_LEVEL0 of
    X_BUFIO2FB_V : architecture is true;


  signal I_ipd       : std_ulogic := '0';

begin

  WireDelay : block
  begin
    VitalWireDelay (I_ipd,     I,    tipd_I);
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
------ DIVIDE_BYPASS Check
-------------------------------------------------
      if((DIVIDE_BYPASS /= true) and (DIVIDE_BYPASS /= false))  then
           assert false
           report "Attribute Syntax Error: The Legal values for DIVIDE_BYPASS are TRUE or FALSE"
           severity Failure;
      end if;

     wait;
  end process prcs_init;


--####################################################################
--#####                           OUTPUT                         #####
--####################################################################
  prcs_output:process
  variable  O_zd : std_ulogic;
  variable  O_GlitchData : VitalGlitchDataType;

  begin
     O_zd := I_ipd;
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

    wait on I_ipd;
  end process prcs_output;


end X_BUFIO2FB_V;
