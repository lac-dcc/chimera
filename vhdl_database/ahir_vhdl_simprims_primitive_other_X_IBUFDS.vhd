-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_IBUFDS.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Differential Signaling Input Buffer
-- /___/   /\     Filename : X_IBUFDS.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:08 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    07/21/05 - CR 212974 -- matched unisim parameters as requested by other tools
--    01/10/06 - CR 222428 -- added H(pullup) and L(pulldown) usage
--    07/19/06 - Add else to handle x case for o_out (CR 234718).
-- End Revision

----- CELL X_IBUFDS -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_IBUFDS is
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;

    LOC            : string  := "UNPLACED";
    CAPACITANCE : string  := "DONT_CARE";
    DIFF_TERM   : boolean :=  FALSE;
    IBUF_DELAY_VALUE : string := "0";
    IFD_DELAY_VALUE  : string := "AUTO";
    IOSTANDARD  : string  := "DEFAULT";


      tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_IB : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tpd_IB_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns)
    );

  port(
    O  : out std_ulogic;
    I  : in  std_ulogic;
    IB : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_IBUFDS : entity is true;
end X_IBUFDS;

architecture X_IBUFDS_V of X_IBUFDS is
  attribute VITAL_LEVEL0 of
    X_IBUFDS_V : architecture is true;

  signal I_ipd  : std_ulogic := 'X';
  signal IB_ipd : std_ulogic := 'X';
begin

  WireDelay : block
  begin
    VitalWireDelay (I_ipd, I, tipd_I);
    VitalWireDelay (IB_ipd, IB, tipd_IB);
  end block;

  VitalBehavior           : process (I_ipd, IB_ipd)
    variable O_zd         : std_ulogic;
    variable O_GlitchData : VitalGlitchDataType;
  begin
    if ( (((I_ipd = '1') or (I_ipd = 'H')) and ((IB_ipd = '0') or (IB_ipd = 'L')))
                                   or 
         (((I_ipd = '0') or (I_ipd = 'L')) and ((IB_ipd = '1') or (IB_ipd = 'H'))) ) then
      O_zd := TO_X01(I_ipd);
     elsif (I_ipd = 'Z' or I_ipd = 'X' or IB_ipd = 'Z' or IB_ipd ='X') then
       O_zd := 'X';
    end if;    

    VitalPathDelay01 (
      OutSignal                 => O,
      GlitchData                => O_GlitchData,
      OutSignalName             => "O",
      OutTemp                   => O_zd,
      Paths                     => (0 => (I_ipd'last_event, tpd_I_O, true),
                                    1 => (IB_ipd'last_event, tpd_IB_O, true)),
      Mode                      => VitalTransport,
      Xon                       => Xon,
      MsgOn                     => MsgOn,
      MsgSeverity               => warning);
  end process;
end X_IBUFDS_V;
