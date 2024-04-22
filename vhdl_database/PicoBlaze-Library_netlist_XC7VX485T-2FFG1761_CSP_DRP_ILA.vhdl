-------------------------------------------------------------------------------
-- Copyright (c) 2015 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.7
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : CSP_DRP_ILA.vhd
-- /___/   /\     Timestamp  : Tue Jun 09 21:47:15 Mitteleuropäische Sommerzeit 2015
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY CSP_DRP_ILA IS
  port (
    CONTROL: inout std_logic_vector(35 downto 0);
    CLK: in std_logic;
    DATA: in std_logic_vector(69 downto 0);
    TRIG0: in std_logic_vector(9 downto 0);
    TRIG1: in std_logic_vector(11 downto 0);
    TRIG_OUT: out std_logic);
END CSP_DRP_ILA;

ARCHITECTURE CSP_DRP_ILA_a OF CSP_DRP_ILA IS
BEGIN

END CSP_DRP_ILA_a;
