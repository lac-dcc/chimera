-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Differential Signaling Input Buffer for GTs
-- /___/   /\     Filename : X_IBUFDS_GTHE1.vhd
-- \   \  /  \    Timestamp : Tue Jun  2 11:25:11 PDT 2009
--  \___\/\___\
--
-- Revision:
--    06/02/09 - Initial version.
-- End Revision


----- CELL X_IBUFDS_GTHE1 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;


library IEEE;
use IEEE.VITAL_Timing.all;


entity X_IBUFDS_GTHE1 is


    generic (
      TimingChecksOn : boolean := true;
      InstancePath   : string  := "*";
      Xon            : boolean := true;
      MsgOn          : boolean := true;
      LOC            : string  := "UNPLACED";

--  VITAL input Pin path delay variables
      tipd_I    : VitalDelayType01 := (0 ps, 0 ps);
      tipd_IB   : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL clk-to-output path delay variables
      tpd_I_O      : VitalDelayType01 := (0 ps, 0 ps);
      tpd_IB_O     : VitalDelayType01 := (0 ps, 0 ps)
    );


  port(
      O       : out std_ulogic;

      I       : in  std_ulogic;
      IB      : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_IBUFDS_GTHE1 : entity is true;

end X_IBUFDS_GTHE1;

architecture X_IBUFDS_GTHE1_V OF X_IBUFDS_GTHE1 is

  attribute VITAL_LEVEL0 of
    X_IBUFDS_GTHE1_V : architecture is true;



  signal I_ipd  : std_ulogic := 'X';
  signal IB_ipd : std_ulogic := 'X';

  signal O_zd     : std_ulogic := 'X';

begin

  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay : block
  begin
    VitalWireDelay (I_ipd,    I,     tipd_I);
    VitalWireDelay (IB_ipd,   IB,    tipd_IB);
  end block;


  --------------------
  --  BEHAVIOR SECTION
  --------------------


--####################################################################
--#####              Generate O                                  #####
--####################################################################
  VitalBehavior : process (I, IB)
  begin
    if ( (((I = '1') or (I = 'H')) and ((IB = '0') or (IB = 'L'))) or
         (((I = '0') or (I = 'L')) and ((IB = '1') or (IB = 'H'))) ) then
       O_zd <= TO_X01(I);
    elsif (I = 'Z' or I = 'X' or IB = 'Z' or IB ='X') then
       O_zd <= 'X';
    end if;

  end process;
     

--####################################################################
--#####                           OUTPUT                         #####
--####################################################################
  prcs_output:process
    variable  O_GlitchData       : VitalGlitchDataType;
  begin
     VitalPathDelay01
       (
         OutSignal     => O,
         GlitchData    => O_GlitchData,
         OutSignalName => "O",
         OutTemp       => O_zd,
         Paths         => (0 => (I_ipd'last_event,   tpd_I_O, true),
                           1 => (IB_ipd'last_event,  tpd_IB_O, true)),
         Mode          => VitalTransport,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );

    wait on O_zd, I_ipd, IB_ipd;
  end process prcs_output;


end X_IBUFDS_GTHE1_V;
