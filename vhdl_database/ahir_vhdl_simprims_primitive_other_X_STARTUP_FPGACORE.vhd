-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_STARTUP_FPGACORE.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  User Interface to Global Clock, Reset and 3-State Controls for FPGACORE
-- /___/   /\     Filename : X_STARTUP_FPGACORE.vhd
-- \   \  /  \    Timestamp : Thu Jul 31 15:22:22 PDT 2008
--  \___\/\___\
--
-- Revision:
--    07/31/08 - Initial version -- CR 448436.
-- End Revision

----- CELL X_STARTUP_FPGACORE -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity X_STARTUP_FPGACORE is
  port(
    CLK : in std_ulogic := 'X';
    GSR : in std_ulogic := 'X'
    );
end X_STARTUP_FPGACORE;

architecture X_STARTUP_FPGACORE_V of X_STARTUP_FPGACORE is
begin
end X_STARTUP_FPGACORE_V;
