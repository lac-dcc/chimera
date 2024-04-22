-------------------------------------------------------------------------------
-- Copyright (c) 2015 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.7
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : CSP_UART_ILA.vhd
-- /___/   /\     Timestamp  : Sat Jun 27 16:01:07 Mitteleuropäische Sommerzeit 2015
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY CSP_UART_ILA IS
  port (
    CONTROL: inout std_logic_vector(35 downto 0);
    CLK: in std_logic;
    TRIG0: in std_logic_vector(29 downto 0);
    TRIG_OUT: out std_logic);
END CSP_UART_ILA;

ARCHITECTURE CSP_UART_ILA_a OF CSP_UART_ILA IS
BEGIN

END CSP_UART_ILA_a;
