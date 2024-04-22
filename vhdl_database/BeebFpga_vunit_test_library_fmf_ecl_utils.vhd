--------------------------------------------------------------------------------
--  File name : ecl_utils.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1996-1997 Free Model Foundry http://www.FreeModelFoundry.com/
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
--
--   MODIFICATION HISTORY :
--
--  version | author | mod date | changes made
--		V2.0	rev3	07 FEB 96	Changed ECL_wired_or_rmap
--						to have 'Z' for low out
--						Renamed, redefined types
--						Changed name, to ecl_utils
--		V2.1	rev3	06 AUG 96	Redefined CONSTANT tables to make
--						it easier to alter Vbb values (for
--						others, not us)
--		V2.2	rev3	27 FEB 97	Added Xon and MsgOn default values
--------------------------------------------------------------------------------
LIBRARY IEEE;	USE IEEE.std_Logic_1164.ALL;
				USE IEEE.VITAL_primitives.all;
				USE	IEEE.VITAL_timing.all;

PACKAGE ecl_utils IS

    TYPE eclstdlogic_map IS ARRAY(std_ulogic) OF X01;
    TYPE eclstdlogic_table IS ARRAY(std_ulogic, std_ulogic) OF X01;

    ---------------------------------------------------------------
	-- Result map for Wired-or output values
    ---------------------------------------------------------------
    CONSTANT ECL_wired_or_rmap : VitalResultMapType := ('U','X','Z','1');

	CONSTANT ECLUnitDelay : VitalDelayType := 1 ns;
	CONSTANT ECLUnitDelay01 : VitalDelayType01 := (1 ns, 1 ns);
	CONSTANT ECLUnitDelay01Z : VitalDelayType01Z := (others => 1 ns);

	CONSTANT DefaultECLInstancePath : STRING := "*";
	CONSTANT DefaultECLTimingChecks : Boolean := FALSE;
	CONSTANT DefaultECLTimingModel : STRING := "UNIT";
	CONSTANT DefaultECLXon : Boolean := TRUE;
	CONSTANT DefaultECLMsgOn : Boolean := TRUE;

	-- Older, VITAL generic being phased out
	CONSTANT DefaultECLXGeneration : Boolean := TRUE;

    ---------------------------------------------------------------
	-- We have chosen to use the value 'W' as the value for
	-- VBB. Vbb is an intermediate (halfway between logic 0 and 1)
	-- value for ECL logic used to "convert" differential inputs to single
	-- ended values. 'W' is good because it is not likely to appear by
	-- accident in a design (one possibility would be pulled-up and 
	-- pulled-down signals tied together and fed into the differential
	-- input pin - not likely, eh?). Also, 'W' is not affected by
	-- resolution with 'Z' ('-' is) and so digital capacitor models
	-- which output 'Z' won't foul it up.
    ---------------------------------------------------------------
	CONSTANT ECLVbbValue : std_logic := 'W';

	CONSTANT ECL_no_weak_inputs : eclstdlogic_map :=
	---------------------------------------------------
	--|  U    X    0    1    Z    W    L    H    -    |
	---------------------------------------------------
      ( 'X', 'X', '0', '1', 'X', 'X', 'X', 'X', 'X' );

    ---------------------------------------------------------------
	-- Table for determining whether input pair is differential or
	-- single-ended. There are 3 values:
	-- input, input_bar neither or both Vbb, 	mode => 'X'
	-- input_bar =  Vbb,				mode => '0'
	-- input  = Vbb,				mode => '1'
	-- Used as input to ECL_clk_tab: return value name convention is 'Mode'
	-- Type of 'Mode' is X01
    ---------------------------------------------------------------
    CONSTANT ECL_diff_mode_tab : eclstdlogic_table := (
	--
	-- For the case, ECLVbbValue = 'W', table looks like this:
	-------------------------------------------------------------
	----|  U    X    0    1    Z    W    L    H    -        |   |
	-------------------------------------------------------------
	--  ( 'X', 'X', 'X', 'X', 'X', '0', 'X', 'X', 'X' ), -- | U |
	--  ( 'X', 'X', 'X', 'X', 'X', '0', 'X', 'X', 'X' ), -- | X |
	--  ( 'X', 'X', 'X', 'X', 'X', '0', 'X', 'X', 'X' ), -- | 0 |
	--  ( 'X', 'X', 'X', 'X', 'X', '0', 'X', 'X', 'X' ), -- | 1 |
	--  ( 'X', 'X', 'X', 'X', 'X', '0', 'X', 'X', 'X' ), -- | Z |
	--  ( '1', '1', '1', '1', '1', 'X', '1', '1', '1' ), -- | W |
	--  ( 'X', 'X', 'X', 'X', 'X', '0', 'X', 'X', 'X' ), -- | L |
	--  ( 'X', 'X', 'X', 'X', 'X', '0', 'X', 'X', 'X' ), -- | H |
	--  ( 'X', 'X', 'X', 'X', 'X', '0', 'X', 'X', 'X' )  -- | - |
	--);

	  ECLVbbValue => (ECLVbbValue => 'X', OTHERS => '1'),
	  OTHERS 	  => (ECLVbbValue => '0', OTHERS => 'X')
	);


    ---------------------------------------------------------------
	-- Table for determining value of a non-clk differential input pair.
	-- This table indicates 'X' whenever diff. inputs are the same, which
	-- is the most conservative approach.
	-- ECLVbbValue should not be '0', 'L', '1', or 'H' (duh)
    ---------------------------------------------------------------
    CONSTANT ECL_s_or_d_inputs_tab : eclstdlogic_table := (
	--
	-- For the case, ECLVbbValue = 'W', table looks like this:
	-------------------------------------------------------------
	----|  U    X    0    1    Z    W    L    H    -        |   |
	-------------------------------------------------------------
    --  ( 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X' ), -- | U |
    --  ( 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X' ), -- | X |
    --  ( 'X', 'X', 'X', '0', 'X', '0', 'X', '0', 'X' ), -- | 0 |
    --  ( 'X', 'X', '1', 'X', 'X', '1', '1', 'X', 'X' ), -- | 1 |
    --  ( 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X' ), -- | Z |
    --  ( 'X', 'X', '1', '0', 'X', 'X', '1', '0', 'X' ), -- | W |
    --  ( 'X', 'X', 'X', '0', 'X', '0', 'X', '0', 'X' ), -- | L |
    --  ( 'X', 'X', '1', 'X', 'X', '1', '1', 'X', 'X' ), -- | H |
    --  ( 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X' )  -- | - |
    --);

	 '0'	=> ('1' => '0', 'H' => '0', ECLVbbValue => '0', OTHERS => 'X'),
	 'L'	=> ('1' => '0', 'H' => '0', ECLVbbValue => '0', OTHERS => 'X'),
	 '1'	=> ('0' => '1', 'L' => '1', ECLVbbValue => '1', OTHERS => 'X'),
	 'H'	=> ('0' => '1', 'L' => '1', ECLVbbValue => '1', OTHERS => 'X'),
	 ECLVbbValue => ('0' => '1', 'L' => '1', '1' => '0', 'H' => '0',
					  OTHERS => 'X'),
	 OTHERS => (OTHERS => 'X')
	);


    ---------------------------------------------------------------
    -- Table for computing a single signal from a differential ECL clock
    -- pair. Mode is '1' or '0' when the signal is single-ended. The rest of
    -- the table is self-explanatory :)
    ---------------------------------------------------------------
    CONSTANT ECL_clk_tab : VitalStateTableType  := (
    -------------------------------------------
    ------INPUTS-------|-PREV---|-OUTPUT----
    -- CLK CLKNeg Mode | CLKint | CLKint' --
    -------------------|--------|-----------
      ( '-', 'X', '1', '-', 'X'), -- Single-ended, Vbb on CLK
      ( '-', '0', '1', '-', '1'), -- Single-ended, Vbb on CLK
      ( '-', '1', '1', '-', '0'), -- Single-ended, Vbb on CLK
      ( 'X', '-', '0', '-', 'X'), -- Single-ended, Vbb on CLK_N
      ( '0', '-', '0', '-', '0'), -- Single-ended, Vbb on CLK_N
      ( '1', '-', '0', '-', '1'), -- Single-ended, Vbb on CLK_N
      -- Below are differential input possibilities only
      ( 'X', '-', 'X', '-', 'X'), -- CLK unknown
      ( '-', 'X', 'X', '-', 'X'), -- CLK unknown
      ( '1', '-', 'X', 'X', '1'), -- Recover from 'X'
      ( '0', '-', 'X', 'X', '0'), -- Recover from 'X'
      ( '/', '0', 'X', '0', '1'), -- valid ECL rising edge
      ( '1', '\', 'X', '0', '1'), -- valid ECL rising edge
      ( '\', '1', 'X', '1', '0'), -- valid ECL falling edge
      ( '0', '/', 'X', '1', '0'), -- valid ECL falling edge
      ( '-', '-', '-', '-', 'S')  -- default
    ); -- end of VitalStateTableType definition

END ecl_utils;
