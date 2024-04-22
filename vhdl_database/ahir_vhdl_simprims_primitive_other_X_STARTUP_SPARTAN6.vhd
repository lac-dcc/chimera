-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  User Interface to Global Clock, Reset and 3-State Controls for SPARTAN6
-- /___/   /\     Filename : X_STARTUP_SPARTAN6.vhd
-- \   \  /  \    Timestamp : Fri May 15 10:11:42 PDT 2009
--  \___\/\___\
--
-- Revision:
--    05/15/09 - Initial version
--    10/30/09 - CR 537641 -- Added CFGMCLK functionality.
-- End Revision

----- CELL X_STARTUP_SPARTAN6 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

  entity X_STARTUP_SPARTAN6 is
    generic (
      LOC            : string  := "UNPLACED"
    );
    port (
      CFGCLK               : out std_ulogic;
      CFGMCLK              : out std_ulogic;
      EOS                  : out std_ulogic;
      CLK                  : in std_ulogic;
      GSR                  : in std_ulogic := 'L';
      GTS                  : in std_ulogic := 'L';
      KEYCLEARB            : in std_ulogic := 'H'
    );
  end X_STARTUP_SPARTAN6;

architecture X_STARTUP_SPARTAN6_V of X_STARTUP_SPARTAN6 is
   constant  CFGMCLK_PERIOD : time       := 20000 ps;
   signal    CFGMCLK_zd     : std_ulogic := '0';
begin
   CFGMCLK_zd <= not CFGMCLK_zd after CFGMCLK_PERIOD/2.0;
   CFGMCLK <= CFGMCLK_zd;
end X_STARTUP_SPARTAN6_V;
