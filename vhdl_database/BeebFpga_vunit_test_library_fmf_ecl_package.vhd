-- ---------------------------------------------------------------
--   File name : ecl_package.vhd
-- ---------------------------------------------------------------
--  Copyright (C) 1995 Free Model Foundry http://www.FreeModelFoundry.com/
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms og the GNU General Public License version 2 as
--  published by the Free Software Foundation.
--
--   MODIFICATION HISTORY :
--
--      version no: |   author: |   mod. date: |    changes made:
--      V1.0            rev3        95 SEP 22     Initial release
--
LIBRARY IEEE;
USE     IEEE.Std_Logic_1164.ALL;
USE     IEEE.VITAL_primitives.all;
USE		IEEE.VITAL_timing.all;

PACKAGE ecl_package IS

    TYPE stdlogic_map IS ARRAY(std_ulogic) OF std_ulogic;
    TYPE stdlogic_table IS ARRAY(std_ulogic, std_ulogic) OF std_ulogic;

    ---------------------------------------------------------------
    ---------------------------------------------------------------
	-- Following are constants for ECL models
    ---------------------------------------------------------------
    ---------------------------------------------------------------
	-- Result map for Wired-or output values
    ---------------------------------------------------------------
    CONSTANT ECL_wired_or_rmap : VitalResultMapType := ('U','X','L','1');

	CONSTANT ECL_no_weak_inputs : stdlogic_map :=

--      -------------------------------------------------
--      |  U    X    0    1    Z    W    L    H    -    |
--      -------------------------------------------------
        ( 'X', 'X', '0', '1', 'X', 'X', 'X', 'X', 'X' );

    ---------------------------------------------------------------
	-- Table for determining whether input pair is differential or
	-- single-ended. There are 3 values:
	-- input, input_bar neither or both Vbb(W)	mode => 'X'
	-- input_bar -- Vbb(W)				mode => '0'
	-- input -- Vbb(W)					mode => '1'
	-- Used as input to ECL_clk_tab: return value name convention is 'Mode'
    ---------------------------------------------------------------
    CONSTANT ECL_diff_mode_tab : stdlogic_table := (

--      ---------------------------------------------------------
--      |  U    X    0    1    Z    W    L    H    -        |   |
--      ---------------------------------------------------------
        ( 'X', 'X', 'X', 'X', 'X', '0', 'X', 'X', 'X' ), -- | U |
        ( 'X', 'X', 'X', 'X', 'X', '0', 'X', 'X', 'X' ), -- | X |
        ( 'X', 'X', 'X', 'X', 'X', '0', 'X', 'X', 'X' ), -- | 0 |
        ( 'X', 'X', 'X', 'X', 'X', '0', 'X', 'X', 'X' ), -- | 1 |
        ( 'X', 'X', 'X', 'X', 'X', '0', 'X', 'X', 'X' ), -- | Z |
        ( '1', '1', '1', '1', '1', 'X', '1', '1', '1' ), -- | W |
        ( 'X', 'X', 'X', 'X', 'X', '0', 'X', 'X', 'X' ), -- | L |
        ( 'X', 'X', 'X', 'X', 'X', '0', 'X', 'X', 'X' ), -- | H |
        ( 'X', 'X', 'X', 'X', 'X', '0', 'X', 'X', 'X' )  -- | - |
        );

    ---------------------------------------------------------------
	-- Table for determining value of a non-clk differential input pair.
	-- 'W' is value of Vbb on either input when it occurs.
	-- This table indicates 'X' whenever diff. inputs are the same, which
	-- is the most conservative approach.
    ---------------------------------------------------------------
    CONSTANT ECL_s_or_d_inputs_tab : stdlogic_table := (

--      ---------------------------------------------------------
--      |  U    X    0    1    Z    W    L    H    -        |   |
--      ---------------------------------------------------------
        ( 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U' ), -- | U |
        ( 'U', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X' ), -- | X |
        ( 'U', 'X', 'X', '0', 'X', '0', 'X', '0', 'X' ), -- | 0 |
        ( 'U', 'X', '1', 'X', 'X', '1', '1', 'X', 'X' ), -- | 1 |
        ( 'U', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X' ), -- | Z |
        ( 'U', 'X', '1', '0', 'X', 'X', '1', '0', 'X' ), -- | W |
        ( 'U', 'X', 'X', '0', 'X', '0', 'X', '0', 'X' ), -- | L |
        ( 'U', 'X', '1', 'X', 'X', '1', '1', 'X', 'X' ), -- | H |
        ( 'U', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X' )  -- | - |
        );

    ---------------------------------------------------------------
	-- Table for computing a single signal from a differential ECL
	-- clock. Mode is '1' or '0' when the signal is single-ended. The rest of
	-- the table is self-explanatory :)
    ---------------------------------------------------------------
    CONSTANT ECL_clk_tab : VitalStateTableType  := (

        -- --INPUTS-------|-PREV---|-OUTPUT----
        -- CLK CLK_N Mode | CLKint | CLKint' --
        ------------------|--------|-----------
        (  '-', 'X', '1', '-', 'X'), -- Single-ended, Vbb on CLK
        (  '-', '0', '1', '-', '1'), -- Single-ended, Vbb on CLK
        (  '-', '1', '1', '-', '0'), -- Single-ended, Vbb on CLK
        (  'X', '-', '0', '-', 'X'), -- Single-ended, Vbb on CLK_N
        (  '0', '-', '0', '-', '0'), -- Single-ended, Vbb on CLK_N
        (  '1', '-', '0', '-', '1'), -- Single-ended, Vbb on CLK_N
        -- Below are differential input possibilities only
        (  'X', '-', 'X', '-', 'X'), -- CLK unknown
        (  '-', 'X', 'X', '-', 'X'), -- CLK unknown
        (  '1', '-', 'X', 'X', '1'), -- Recover from 'X'
        (  '0', '-', 'X', 'X', '0'), -- Recover from 'X'
        (  '/', '0', 'X', '0', '1'), -- valid ECL rising edge
        (  '1', '\', 'X', '0', '1'), -- valid ECL rising edge
        (  '\', '1', 'X', '1', '0'), -- valid ECL falling edge
        (  '0', '/', 'X', '1', '0'), -- valid ECL falling edge
        (  '-', '-', '-', '-', 'S')  -- default

        ); -- end of VitalStateTableType definition

END ecl_package;
