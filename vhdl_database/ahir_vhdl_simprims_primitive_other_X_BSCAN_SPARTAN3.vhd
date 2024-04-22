-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Boundary Scan Logic Control Circuit for SPARTAN3
-- /___/   /\     Filename : X_BSCAN_SPARTAN3.vhd
-- \   \  /  \    Timestamp : Sat Mar 26 16:03:05 PST 2005
--  \___\/\___\
--
-- Revision:
--    03/26/05 - Initial version.
--    04/04/08 - Fixed Header Description.
-- End Revision

----- CELL X_BSCAN_SPARTAN3 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity X_BSCAN_SPARTAN3 is
  port(
    CAPTURE : out std_ulogic := 'H';
    DRCK1   : out std_ulogic := 'L';
    DRCK2   : out std_ulogic := 'L';
    RESET   : out std_ulogic := 'L';
    SEL1    : out std_ulogic := 'L';
    SEL2    : out std_ulogic := 'L';
    SHIFT   : out std_ulogic := 'L';
    TDI     : out std_ulogic := 'L';
    UPDATE  : out std_ulogic := 'L';

    TDO1 : in std_ulogic := 'X';
    TDO2 : in std_ulogic := 'X'
    );
end X_BSCAN_SPARTAN3;

architecture X_BSCAN_SPARTAN3_V of X_BSCAN_SPARTAN3 is
begin
  CAPTURE <= 'H';
  RESET   <= 'L';
  UPDATE  <= 'L';
  SHIFT   <= 'L';
  DRCK1   <= 'L';
  DRCK2   <= 'L';
  SEL1    <= 'L';
  SEL2    <= 'L';
  TDI     <= 'L';
end X_BSCAN_SPARTAN3_V;


