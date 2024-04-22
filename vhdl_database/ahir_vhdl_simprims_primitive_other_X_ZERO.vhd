-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_ZERO.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  GND Connection
-- /___/   /\     Filename : X_ZERO.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:22 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_ZERO -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_ZERO is
  generic(
    LOC : string  := "UNPLACED"
    );
  port(
    O : out std_ulogic := '0'
    );

  attribute VITAL_LEVEL0 of
    X_ZERO : entity is true;
end X_ZERO;

architecture X_ZERO_V of X_ZERO is
  attribute VITAL_LEVEL0 of
    X_ZERO_V : architecture is true;
begin
  O <= '0';
end X_ZERO_V;
