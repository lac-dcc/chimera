-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_PU.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Resistor to VCC
-- /___/   /\     Filename : X_PU.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:12 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_PU -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_PU is
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;
    LOC   : string  := "UNPLACED"
);
  port(
    O : out std_ulogic := 'H'
    );

  attribute VITAL_LEVEL0 of
    X_PU : entity is true;
end X_PU;

architecture X_PU_V of X_PU is
  attribute VITAL_LEVEL0 of
    X_PU_V : architecture is true;

begin
  O <= 'H';
end X_PU_V;
