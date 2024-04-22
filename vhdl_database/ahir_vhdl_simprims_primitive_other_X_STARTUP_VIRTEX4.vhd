-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  User Interface to Global Clock, Reset and 3-State Controls for VIRTEX4
-- /___/   /\     Filename : X_STARTUP_VIRTEX4.vhd
-- \   \  /  \    Timestamp : Thu Jul 31 15:22:22 PDT 2008
--  \___\/\___\
--
-- Revision:
--    07/31/08 - Initial version -- CR 448436.
-- End Revision

----- CELL X_STARTUP_VIRTEX4 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity X_STARTUP_VIRTEX4 is
  port(
    EOS		: out std_ulogic;

    CLK		: in std_ulogic := 'X';
    GSR		: in std_ulogic := 'X';
    GTS		: in std_ulogic := 'X';
    USRCCLKO	: in std_ulogic := 'X';
    USRCCLKTS	: in std_ulogic := 'X';
    USRDONEO	: in std_ulogic := 'X';
    USRDONETS	: in std_ulogic := 'X'
    );

end X_STARTUP_VIRTEX4;

architecture X_STARTUP_VIRTEX4_V of X_STARTUP_VIRTEX4 is

begin
end X_STARTUP_VIRTEX4_V;
