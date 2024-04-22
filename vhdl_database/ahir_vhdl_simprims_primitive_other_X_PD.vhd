-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_PD.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Resistor to GND
-- /___/   /\     Filename : X_PD.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:12 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_PD -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_PD is
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;
    LOC   : string  := "UNPLACED"
);
  port(
    O : out std_ulogic := 'L'
    );

  attribute VITAL_LEVEL0 of
    X_PD : entity is true;
end X_PD;

architecture X_PD_V of X_PD is
  attribute VITAL_LEVEL0 of
    X_PD_V : architecture is true;

begin
  O <= 'L';
end X_PD_V;
