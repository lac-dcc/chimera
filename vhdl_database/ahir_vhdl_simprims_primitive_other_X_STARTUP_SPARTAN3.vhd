-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  User Interface to Global Clock, Reset and 3-State Controls for SPARTAN3
-- /___/   /\     Filename : X_STARTUP_SPARTAN3.vhd
-- \   \  /  \    Timestamp : Thu Jul 31 15:22:22 PDT 2008
--  \___\/\___\
--
-- Revision:
--    07/31/08 - Initial version -- CR 448436.
-- End Revision

----- CELL X_STARTUP_SPARTAN3 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity X_STARTUP_SPARTAN3 is
  port(
    CLK : in std_ulogic := 'X';
    GSR : in std_ulogic := 'X';
    GTS : in std_ulogic := 'X'
    );
end X_STARTUP_SPARTAN3;

architecture X_STARTUP_SPARTAN3_V of X_STARTUP_SPARTAN3 is
begin
end X_STARTUP_SPARTAN3_V;


