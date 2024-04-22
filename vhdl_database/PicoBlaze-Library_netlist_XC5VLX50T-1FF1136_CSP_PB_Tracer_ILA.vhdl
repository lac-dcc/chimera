-------------------------------------------------------------------------------
-- Copyright (c) 2014 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.7
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : CSP_PB_Tracer_ILA.vhd
-- /___/   /\     Timestamp  : Mon Oct 20 15:06:27 Mitteleuropäische Sommerzeit 2014
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY CSP_PB_Tracer_ILA IS
  port (
    CONTROL: inout std_logic_vector(35 downto 0);
    CLK: in std_logic;
    DATA: in std_logic_vector(59 downto 0);
    TRIG0: in std_logic_vector(11 downto 0);
    TRIG1: in std_logic_vector(7 downto 0);
    TRIG2: in std_logic_vector(5 downto 0);
    TRIG3: in std_logic_vector(15 downto 0);
    TRIG_OUT: out std_logic);
END CSP_PB_Tracer_ILA;

ARCHITECTURE CSP_PB_Tracer_ILA_a OF CSP_PB_Tracer_ILA IS
BEGIN

END CSP_PB_Tracer_ILA_a;
