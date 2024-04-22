-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_ONE.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  VCC Connection
-- /___/   /\     Filename : X_ONE.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:11 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_ONE -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_ONE is
  generic(
    LOC : string  := "UNPLACED"
    );
  port(
    O : out std_ulogic := '1'
    );

  attribute VITAL_LEVEL0 of
    X_ONE : entity is true;
end X_ONE;

architecture X_ONE_V of X_ONE is
  attribute VITAL_LEVEL0 of
    X_ONE_V : architecture is true;

begin
  O <= '1';
end X_ONE_V;
