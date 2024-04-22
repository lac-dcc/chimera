-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_BPAD.vhd,v 1.3 2010/01/14 19:43:22 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Bi-Directional Pad
-- /___/   /\     Filename : X_BPAD.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:07 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_BPAD -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_BPAD is
  generic(
    LOC : string  := "UNPLACED"
    );
  port(
    PAD : inout std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_BPAD : entity is true;

end X_BPAD;

architecture X_BPAD_V of X_BPAD is
  attribute VITAL_LEVEL0 of
    X_BPAD_V : architecture is true;
begin
  PAD <= 'Z';
end X_BPAD_V;
