-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  User Interface to Global Clock, Reset and 3-State Controls for VIRTEX5
-- /___/   /\     Filename : X_STARTUP_VIRTEX5.vhd
-- \   \  /  \    Timestamp : Thu Jul 31 15:22:22 PDT 2008
--  \___\/\___\
--
-- Revision:
--    07/31/08 - Initial version -- CR 448436.
--    10/30/09 - CR 537429 -- Added CFGMCLK functionality.
-- End Revision

----- CELL X_STARTUP_VIRTEX5 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity X_STARTUP_VIRTEX5 is
  port(
    CFGCLK	: out std_ulogic;
    CFGMCLK	: out std_ulogic;
    DINSPI	: out std_ulogic;
    EOS		: out std_ulogic;
    TCKSPI	: out std_ulogic;

    CLK		: in std_ulogic := 'X';
    GSR		: in std_ulogic := 'X';
    GTS		: in std_ulogic := 'X';
    USRCCLKO	: in std_ulogic := 'X';
    USRCCLKTS	: in std_ulogic := 'X';
    USRDONEO	: in std_ulogic := 'X';
    USRDONETS	: in std_ulogic := 'X'
    );

end X_STARTUP_VIRTEX5;

architecture X_STARTUP_VIRTEX5_V of X_STARTUP_VIRTEX5 is
   constant  CFGMCLK_PERIOD : time       := 10000 ps;
   signal    CFGMCLK_zd     : std_ulogic := '0';

begin
   CFGMCLK_zd <= not CFGMCLK_zd after CFGMCLK_PERIOD;
   CFGMCLK <= CFGMCLK_zd;
end X_STARTUP_VIRTEX5_V;
