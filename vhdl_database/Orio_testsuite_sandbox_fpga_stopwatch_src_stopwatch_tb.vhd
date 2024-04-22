--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 
--  \   \         Application : ISE
--  /   /         Filename : stopwatch_tb_selfcheck.vhw
-- /___/   /\     Timestamp : Wed May 16 15:05:19 2007
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: stopwatch_tb
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE STD.TEXTIO.ALL;

ENTITY stopwatch_tb IS
END stopwatch_tb;

ARCHITECTURE testbench_arch OF stopwatch_tb IS
    COMPONENT stopwatch
        PORT (
            clk : In std_logic;
            lap_load : In std_logic;
            mode : In std_logic;
            reset : In std_logic;
            strtstop : In std_logic;
            lcd_e : Out std_logic;
            lcd_rs : Out std_logic;
            lcd_rw : Out std_logic;
            sf_d : Out std_logic_vector (7 DownTo 0)
        );
    END COMPONENT;

    SIGNAL clk : std_logic := '0';
    SIGNAL lap_load : std_logic := '0';
    SIGNAL mode : std_logic := '0';
    SIGNAL reset : std_logic := '1';
    SIGNAL strtstop : std_logic := '0';
    SIGNAL lcd_e : std_logic := '0';
    SIGNAL lcd_rs : std_logic := '0';
    SIGNAL lcd_rw : std_logic := '0';
    SIGNAL sf_d : std_logic_vector (7 DownTo 0) := "XXXXXXXX";

    constant PERIOD : time := 20 ns;
    constant DUTY_CYCLE : real := 0.5;

    BEGIN
        UUT : stopwatch
        PORT MAP (
            clk => clk,
            lap_load => lap_load,
            mode => mode,
            reset => reset,
            strtstop => strtstop,
            lcd_e => lcd_e,
            lcd_rs => lcd_rs,
            lcd_rw => lcd_rw,
            sf_d => sf_d
        );

        PROCESS    -- clock process for clk
        BEGIN
            CLOCK_LOOP : LOOP
                clk <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                clk <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

			PROCESS   -- input signals
             BEGIN
                -- -------------  Current Time:  105ns
                WAIT FOR 105 ns;
                reset <= '0';
                   -- -------------------------------------
                -- -------------  Current Time:  185ns
                WAIT FOR 80 ns;
                strtstop <= '1';
                -- -------------------------------------
                WAIT FOR 2665 ns;

            END PROCESS;

    END testbench_arch;

