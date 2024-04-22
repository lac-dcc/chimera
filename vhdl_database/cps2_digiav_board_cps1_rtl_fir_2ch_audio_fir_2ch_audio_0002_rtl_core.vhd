-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 21.1 (Release Build #842)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2021 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from fir_2ch_audio_0002_rtl_core
-- VHDL created on Sun Jul  3 11:44:09 2022


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity fir_2ch_audio_0002_rtl_core is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(16 downto 0);  -- sfix17
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(30 downto 0);  -- sfix31
        clk : in std_logic;
        areset : in std_logic
    );
end fir_2ch_audio_0002_rtl_core;

architecture normal of fir_2ch_audio_0002_rtl_core is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_14_q : STD_LOGIC_VECTOR (16 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id1_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id1_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_inputframe_seq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_inputframe_seq_eq : std_logic;
    signal u0_m0_wo0_run_count : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_run_preEnaQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_enableQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_i : UNSIGNED (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_wi0_r0_ra0_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra0_count1_inner_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count1_inner_i : SIGNED (0 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra0_count1_inner_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra0_count1_inner_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_ra0_count1_inner_eq : signal is true;
    signal u0_m0_wo0_wi0_r0_ra0_count1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count1_i : UNSIGNED (4 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra0_count1_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa0_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_wa0_i : UNSIGNED (4 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_memr0_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr0_ia : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_iq : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_ca0_inner_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_ca0_inner_i : SIGNED (0 downto 0);
    attribute preserve of u0_m0_wo0_ca0_inner_i : signal is true;
    signal u0_m0_wo0_ca0_inner_eq : std_logic;
    attribute preserve of u0_m0_wo0_ca0_inner_eq : signal is true;
    signal u0_m0_wo0_ca0_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_ca0_i : UNSIGNED (3 downto 0);
    attribute preserve of u0_m0_wo0_ca0_i : signal is true;
    signal u0_m0_wo0_cm0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_a0 : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_s1 : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_adelay_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_aseq_eq : std_logic;
    signal u0_m0_wo0_accum_a : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_accum_b : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_accum_i : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_accum_o : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_accum_q : STD_LOGIC_VECTOR (30 downto 0);
    signal u0_m0_wo0_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_eq : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_out0_m0_wo0_assign_id3_q_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal outchan_q : STD_LOGIC_VECTOR (1 downto 0);
    signal outchan_i : UNSIGNED (0 downto 0);
    attribute preserve of outchan_i : signal is true;
    signal u0_m0_wo0_inputframe_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count1_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_ca0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_a_in : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_a_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_b_in : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_b_b : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_join_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_resize_in : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_resize_b : STD_LOGIC_VECTOR (4 downto 0);

begin


    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- d_in0_m0_wi0_wo0_assign_id1_q_11(DELAY,54)@10 + 1
    d_in0_m0_wi0_wo0_assign_id1_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_id1_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_inputframe_seq(SEQUENCE,13)@10 + 1
    u0_m0_wo0_inputframe_seq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_inputframe_seq_c : SIGNED(3 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_inputframe_seq_c := "0000";
            u0_m0_wo0_inputframe_seq_q <= "0";
            u0_m0_wo0_inputframe_seq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                IF (u0_m0_wo0_inputframe_seq_c = "0000") THEN
                    u0_m0_wo0_inputframe_seq_eq <= '1';
                ELSE
                    u0_m0_wo0_inputframe_seq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_inputframe_seq_eq = '1') THEN
                    u0_m0_wo0_inputframe_seq_c := u0_m0_wo0_inputframe_seq_c + 1;
                ELSE
                    u0_m0_wo0_inputframe_seq_c := u0_m0_wo0_inputframe_seq_c - 1;
                END IF;
                u0_m0_wo0_inputframe_seq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_inputframe_seq_c(3 downto 3));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_inputframe(LOGICAL,14)@11
    u0_m0_wo0_inputframe_q <= u0_m0_wo0_inputframe_seq_q and d_in0_m0_wi0_wo0_assign_id1_q_11_q;

    -- u0_m0_wo0_run(ENABLEGENERATOR,15)@11 + 2
    u0_m0_wo0_run_ctrl <= u0_m0_wo0_run_out & u0_m0_wo0_inputframe_q & u0_m0_wo0_run_enableQ;
    u0_m0_wo0_run_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_run_enable_c : SIGNED(5 downto 0);
        variable u0_m0_wo0_run_inc : SIGNED(5 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_run_q <= "0";
            u0_m0_wo0_run_enable_c := TO_SIGNED(30, 6);
            u0_m0_wo0_run_enableQ <= "0";
            u0_m0_wo0_run_count <= "000000";
            u0_m0_wo0_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_run_out = "1") THEN
                IF (u0_m0_wo0_run_enable_c(5) = '1') THEN
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c - (-31);
                ELSE
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c + (-1);
                END IF;
                u0_m0_wo0_run_enableQ <= STD_LOGIC_VECTOR(u0_m0_wo0_run_enable_c(5 downto 5));
            ELSE
                u0_m0_wo0_run_enableQ <= "0";
            END IF;
            CASE (u0_m0_wo0_run_ctrl) IS
                WHEN "000" | "001" => u0_m0_wo0_run_inc := "000000";
                WHEN "010" | "011" => u0_m0_wo0_run_inc := "111111";
                WHEN "100" => u0_m0_wo0_run_inc := "000000";
                WHEN "101" => u0_m0_wo0_run_inc := "010000";
                WHEN "110" => u0_m0_wo0_run_inc := "111111";
                WHEN "111" => u0_m0_wo0_run_inc := "001111";
                WHEN OTHERS => 
            END CASE;
            u0_m0_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_run_count) + SIGNED(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m0_wo0_run_preEnaQ <= u0_m0_wo0_run_count(5 downto 5);
    u0_m0_wo0_run_out <= u0_m0_wo0_run_preEnaQ and VCC_q;

    -- u0_m0_wo0_memread(DELAY,16)@13
    u0_m0_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_run_q, xout => u0_m0_wo0_memread_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_compute(DELAY,18)@13
    u0_m0_wo0_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => u0_m0_wo0_compute_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_14(DELAY,58)@13 + 1
    d_u0_m0_wo0_compute_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_compute_q, xout => d_u0_m0_wo0_compute_q_14_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_15(DELAY,59)@14 + 1
    d_u0_m0_wo0_compute_q_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_14_q, xout => d_u0_m0_wo0_compute_q_15_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_aseq(SEQUENCE,38)@15 + 1
    u0_m0_wo0_aseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_aseq_c : SIGNED(7 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_aseq_c := "00000000";
            u0_m0_wo0_aseq_q <= "0";
            u0_m0_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_15_q = "1") THEN
                IF (u0_m0_wo0_aseq_c = "11111111") THEN
                    u0_m0_wo0_aseq_eq <= '1';
                ELSE
                    u0_m0_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_aseq_eq = '1') THEN
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c + 31;
                ELSE
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c - 1;
                END IF;
                u0_m0_wo0_aseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_aseq_c(7 downto 7));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_compute_q_16(DELAY,60)@15 + 1
    d_u0_m0_wo0_compute_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_15_q, xout => d_u0_m0_wo0_compute_q_16_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_memread_q_14(DELAY,56)@13 + 1
    d_u0_m0_wo0_memread_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => d_u0_m0_wo0_memread_q_14_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_memread_q_16(DELAY,57)@14 + 2
    d_u0_m0_wo0_memread_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_memread_q_14_q, xout => d_u0_m0_wo0_memread_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_adelay(DELAY,37)@16
    u0_m0_wo0_adelay : dspba_delay
    GENERIC MAP ( width => 31, depth => 1, reset_kind => "NONE" )
    PORT MAP ( xin => u0_m0_wo0_accum_q, xout => u0_m0_wo0_adelay_q, ena => d_u0_m0_wo0_compute_q_16_q(0), clk => clk, aclr => areset );

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- u0_m0_wo0_wi0_r0_ra0_count1_inner(COUNTER,22)@14
    -- low=-1, high=0, step=1, init=0
    u0_m0_wo0_wi0_r0_ra0_count1_inner_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra0_count1_inner_i <= TO_SIGNED(0, 1);
            u0_m0_wo0_wi0_r0_ra0_count1_inner_eq <= '1';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_14_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra0_count1_inner_eq = '0') THEN
                    u0_m0_wo0_wi0_r0_ra0_count1_inner_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_ra0_count1_inner_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_ra0_count1_inner_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_ra0_count1_inner_i <= u0_m0_wo0_wi0_r0_ra0_count1_inner_i + 1;
                ELSE
                    u0_m0_wo0_wi0_r0_ra0_count1_inner_i <= u0_m0_wo0_wi0_r0_ra0_count1_inner_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra0_count1_inner_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra0_count1_inner_i, 1)));

    -- u0_m0_wo0_wi0_r0_ra0_count1_run(LOGICAL,23)@14
    u0_m0_wo0_wi0_r0_ra0_count1_run_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra0_count1_inner_q(0 downto 0));

    -- u0_m0_wo0_wi0_r0_ra0_count1(COUNTER,24)@14
    -- low=0, high=31, step=2, init=2
    u0_m0_wo0_wi0_r0_ra0_count1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra0_count1_i <= TO_UNSIGNED(2, 5);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_14_q = "1" and u0_m0_wo0_wi0_r0_ra0_count1_run_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra0_count1_i <= u0_m0_wo0_wi0_r0_ra0_count1_i + 2;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra0_count1_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra0_count1_i, 6)));

    -- u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_b(BITSELECT,51)@14
    u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_b_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((6 downto 6 => u0_m0_wo0_wi0_r0_ra0_count1_q(5)) & u0_m0_wo0_wi0_r0_ra0_count1_q));
    u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_b_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_b_in(4 downto 1));

    -- u0_m0_wo0_wi0_r0_ra0_count0(COUNTER,21)@14
    -- low=0, high=1, step=1, init=0
    u0_m0_wo0_wi0_r0_ra0_count0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra0_count0_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_14_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra0_count0_i <= u0_m0_wo0_wi0_r0_ra0_count0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra0_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra0_count0_i, 2)));

    -- u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_a(BITSELECT,50)@14
    u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_a_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((6 downto 2 => u0_m0_wo0_wi0_r0_ra0_count0_q(1)) & u0_m0_wo0_wi0_r0_ra0_count0_q));
    u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_a_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_a_in(0 downto 0));

    -- u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_join(BITJOIN,52)@14
    u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_join_q <= GND_q & GND_q & u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_b_b & u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_BitSelect_for_a_b;

    -- u0_m0_wo0_wi0_r0_ra0_resize(BITSELECT,26)@14
    u0_m0_wo0_wi0_r0_ra0_resize_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra0_add_0_0_replace_or_join_q(4 downto 0));
    u0_m0_wo0_wi0_r0_ra0_resize_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra0_resize_in(4 downto 0));

    -- d_xIn_0_14(DELAY,53)@10 + 4
    d_xIn_0_14 : dspba_delay
    GENERIC MAP ( width => 17, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => d_xIn_0_14_q, clk => clk, aclr => areset );

    -- d_in0_m0_wi0_wo0_assign_id1_q_14(DELAY,55)@11 + 3
    d_in0_m0_wi0_wo0_assign_id1_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_in0_m0_wi0_wo0_assign_id1_q_11_q, xout => d_in0_m0_wi0_wo0_assign_id1_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_wa0(COUNTER,27)@14
    -- low=0, high=31, step=1, init=0
    u0_m0_wo0_wi0_r0_wa0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa0_i <= TO_UNSIGNED(0, 5);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_14_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa0_i <= u0_m0_wo0_wi0_r0_wa0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa0_i, 5)));

    -- u0_m0_wo0_wi0_r0_memr0(DUALMEM,28)@14
    u0_m0_wo0_wi0_r0_memr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_14_q);
    u0_m0_wo0_wi0_r0_memr0_aa <= u0_m0_wo0_wi0_r0_wa0_q;
    u0_m0_wo0_wi0_r0_memr0_ab <= u0_m0_wo0_wi0_r0_ra0_resize_b;
    u0_m0_wo0_wi0_r0_memr0_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 17,
        widthad_a => 5,
        numwords_a => 32,
        width_b => 17,
        widthad_b => 5,
        numwords_b => 32,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone 10 LP"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr0_aa,
        data_a => u0_m0_wo0_wi0_r0_memr0_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_14_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr0_ab,
        q_b => u0_m0_wo0_wi0_r0_memr0_iq
    );
    u0_m0_wo0_wi0_r0_memr0_q <= u0_m0_wo0_wi0_r0_memr0_iq(16 downto 0);

    -- u0_m0_wo0_ca0_inner(COUNTER,29)@13
    -- low=-1, high=0, step=1, init=0
    u0_m0_wo0_ca0_inner_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca0_inner_i <= TO_SIGNED(0, 1);
            u0_m0_wo0_ca0_inner_eq <= '1';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_ca0_inner_eq = '0') THEN
                    u0_m0_wo0_ca0_inner_eq <= '1';
                ELSE
                    u0_m0_wo0_ca0_inner_eq <= '0';
                END IF;
                IF (u0_m0_wo0_ca0_inner_eq = '1') THEN
                    u0_m0_wo0_ca0_inner_i <= u0_m0_wo0_ca0_inner_i + 1;
                ELSE
                    u0_m0_wo0_ca0_inner_i <= u0_m0_wo0_ca0_inner_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca0_inner_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca0_inner_i, 1)));

    -- u0_m0_wo0_ca0_run(LOGICAL,30)@13
    u0_m0_wo0_ca0_run_q <= STD_LOGIC_VECTOR(u0_m0_wo0_ca0_inner_q(0 downto 0));

    -- u0_m0_wo0_ca0(COUNTER,31)@13
    -- low=0, high=15, step=1, init=0
    u0_m0_wo0_ca0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca0_i <= TO_UNSIGNED(0, 4);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1" and u0_m0_wo0_ca0_run_q = "1") THEN
                u0_m0_wo0_ca0_i <= u0_m0_wo0_ca0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca0_i, 4)));

    -- u0_m0_wo0_cm0(LOOKUP,35)@13 + 1
    u0_m0_wo0_cm0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm0_q <= "0000001100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca0_q) IS
                WHEN "0000" => u0_m0_wo0_cm0_q <= "0000001100";
                WHEN "0001" => u0_m0_wo0_cm0_q <= "0000011110";
                WHEN "0010" => u0_m0_wo0_cm0_q <= "0000001011";
                WHEN "0011" => u0_m0_wo0_cm0_q <= "1111001001";
                WHEN "0100" => u0_m0_wo0_cm0_q <= "1110100111";
                WHEN "0101" => u0_m0_wo0_cm0_q <= "0000011001";
                WHEN "0110" => u0_m0_wo0_cm0_q <= "0100011100";
                WHEN "0111" => u0_m0_wo0_cm0_q <= "0111111111";
                WHEN "1000" => u0_m0_wo0_cm0_q <= "0111111111";
                WHEN "1001" => u0_m0_wo0_cm0_q <= "0100011100";
                WHEN "1010" => u0_m0_wo0_cm0_q <= "0000011001";
                WHEN "1011" => u0_m0_wo0_cm0_q <= "1110100111";
                WHEN "1100" => u0_m0_wo0_cm0_q <= "1111001001";
                WHEN "1101" => u0_m0_wo0_cm0_q <= "0000001011";
                WHEN "1110" => u0_m0_wo0_cm0_q <= "0000011110";
                WHEN "1111" => u0_m0_wo0_cm0_q <= "0000001100";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm0_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_0(MULT,36)@14 + 2
    u0_m0_wo0_mtree_mult1_0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm0_q);
    u0_m0_wo0_mtree_mult1_0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr0_q);
    u0_m0_wo0_mtree_mult1_0_reset <= areset;
    u0_m0_wo0_mtree_mult1_0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 10,
        lpm_widthb => 17,
        lpm_widthp => 27,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_0_a0,
        datab => u0_m0_wo0_mtree_mult1_0_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_0_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_0_s1
    );
    u0_m0_wo0_mtree_mult1_0_q <= u0_m0_wo0_mtree_mult1_0_s1;

    -- u0_m0_wo0_accum(ADD,39)@16 + 1
    u0_m0_wo0_accum_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 27 => u0_m0_wo0_mtree_mult1_0_q(26)) & u0_m0_wo0_mtree_mult1_0_q));
    u0_m0_wo0_accum_b <= STD_LOGIC_VECTOR(u0_m0_wo0_adelay_q);
    u0_m0_wo0_accum_i <= u0_m0_wo0_accum_a;
    u0_m0_wo0_accum_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_accum_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_16_q = "1") THEN
                IF (u0_m0_wo0_aseq_q = "1") THEN
                    u0_m0_wo0_accum_o <= u0_m0_wo0_accum_i;
                ELSE
                    u0_m0_wo0_accum_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_accum_a) + SIGNED(u0_m0_wo0_accum_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_accum_q <= u0_m0_wo0_accum_o(30 downto 0);

    -- u0_m0_wo0_oseq(SEQUENCE,40)@14 + 1
    u0_m0_wo0_oseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_oseq_c : SIGNED(7 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_c := "00011110";
            u0_m0_wo0_oseq_q <= "0";
            u0_m0_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_14_q = "1") THEN
                IF (u0_m0_wo0_oseq_c = "11111111") THEN
                    u0_m0_wo0_oseq_eq <= '1';
                ELSE
                    u0_m0_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_oseq_eq = '1') THEN
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c + 31;
                ELSE
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c - 1;
                END IF;
                u0_m0_wo0_oseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_c(7 downto 7));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_oseq_gated(LOGICAL,41)@15
    u0_m0_wo0_oseq_gated_q <= u0_m0_wo0_oseq_q and d_u0_m0_wo0_compute_q_15_q;

    -- u0_m0_wo0_oseq_gated_reg(REG,42)@15 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_q);
        END IF;
    END PROCESS;

    -- outchan(COUNTER,47)@16 + 1
    -- low=0, high=1, step=1, init=1
    outchan_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outchan_i <= TO_UNSIGNED(1, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_oseq_gated_reg_q = "1") THEN
                outchan_i <= outchan_i + 1;
            END IF;
        END IF;
    END PROCESS;
    outchan_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(outchan_i, 2)));

    -- d_out0_m0_wo0_assign_id3_q_17(DELAY,61)@16 + 1
    d_out0_m0_wo0_assign_id3_q_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_oseq_gated_reg_q, xout => d_out0_m0_wo0_assign_id3_q_17_q, clk => clk, aclr => areset );

    -- xOut(PORTOUT,48)@17 + 1
    xOut_v <= d_out0_m0_wo0_assign_id3_q_17_q;
    xOut_c <= STD_LOGIC_VECTOR("000000" & outchan_q);
    xOut_0 <= u0_m0_wo0_accum_q;

END normal;
