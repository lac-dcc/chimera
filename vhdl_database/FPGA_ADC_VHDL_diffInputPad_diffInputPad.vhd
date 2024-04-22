----------------------------------------------------------------------------------------------------
-- brief: This block instantiates the differential input/output buffer which is used to generate the
--        reference slope and which contains also the comparator.
-- file: diffInputPad.vhd
-- author: Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author             | Remarks
----------------------------------------------------------------------------------------------------
-- 0.1     | 23.01.2020 | L. Leuenberger     | Auto-Created
----------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
-- Library declarations
------------------------------------------------------------------------------------------------
library ieee;
-- This package defines the basic std_logic data types and a few functions.								
use ieee.std_logic_1164.all;
-- This package provides arithmetic functions for vectors.		
use ieee.numeric_std.all;
-- This package provides functions for the calcualtion with real values.
use ieee.math_real.all;
-- Vivado Components library
library unisim;
-- This package contains the iobuf component.
use unisim.vcomponents.all;

------------------------------------------------------------------------------------------------
-- Entity declarations
------------------------------------------------------------------------------------------------
entity diffInputPad is
	port(
		-- Input and output ports
		comp_out : out   std_logic;
		inp_in   : inout std_logic;
		inpb_in  : inout std_logic;
		pulse_in : in    std_logic
	);
end diffInputPad;

------------------------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------------------------
architecture behavioral of diffInputPad is
	signal O_int : std_ulogic;
	signal VREF  : std_ulogic;
	signal T     : std_ulogic;

	attribute dont_touch : string;
	attribute dont_touch of inst_OBUFT : label is "true";
	attribute dont_touch of T : signal is "true";
	attribute dont_touch of inst_OBUFT2 : label is "true";
begin
	--------------------------------------------------------------------------------------------
	-- Instantiate the differential input buffer
	--------------------------------------------------------------------------------------------
	inst_DIFFINBUF : component DIFFINBUF
		generic map(
			DIFF_TERM               => false,
			DQS_BIAS                => "FALSE",
			IBUF_LOW_PWR            => "FALSE",
			ISTANDARD               => "DIFF_SSTL18_I",
			SIM_INPUT_BUFFER_OFFSET => 0
		)
		port map(
			O         => open,
			O_B       => O_int,
			DIFF_IN_N => inpb_in,
			DIFF_IN_P => inp_in,
			OSC       => (others => '0'),
			OSC_EN    => (others => '0'),
			VREF      => VREF
		);

	inst_VREF : component HPIO_VREF
		generic map(
			VREF_CNTR => "FABRIC_RANGE2"
		)
		port map(
			VREF             => VREF,
			FABRIC_VREF_TUNE => "0000000"
		);

	inst_IBUFCTRL : component IBUFCTRL
		generic map(
			ISTANDARD       => "DIFF_SSTL18_I",
			USE_IBUFDISABLE => "FALSE"
		)
		port map(
			O             => comp_out,
			I             => O_int,
			IBUFDISABLE   => '0',
			INTERMDISABLE => '0',
			T             => T
		);


	inst_OBUFT : component OBUFT
		generic map(
			CAPACITANCE => "LOW",
			DRIVE       => 2,
			IOSTANDARD  => "DIFF_SSTL18_I",
			SLEW        => "SLOW"
		)
		port map(
			O => inpb_in,
			I => pulse_in,
			T => T
		);

	inst_OBUFT2 : component OBUFT
		generic map(
			CAPACITANCE => "LOW",
			DRIVE       => 2,
			IOSTANDARD  => "DIFF_SSTL18_I",
			SLEW        => "SLOW"
		)
		port map(
			O => inp_in,
			I => '0',
			T => '1'
		);

	T <= '0';


end behavioral;
