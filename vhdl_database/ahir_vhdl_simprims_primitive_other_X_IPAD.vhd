-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_IPAD.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Input Pad
-- /___/   /\     Filename : X_IPAD.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:09 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_IPAD -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_IPAD is
  generic(
    LOC : string  := "UNPLACED"
    );
  port(
    PAD : in std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_IPAD : entity is true;
end X_IPAD;

architecture X_IPAD_V of X_IPAD is
  attribute VITAL_LEVEL0 of
    X_IPAD_V : architecture is true;

begin
end X_IPAD_V;
