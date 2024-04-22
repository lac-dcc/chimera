----------------------------------------------------------------------------
--  Copyright (C) 2017 Kaan Kara - Systems Group, ETH Zurich

--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU Affero General Public License as published
--  by the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.

--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU Affero General Public License for more details.

--  You should have received a copy of the GNU Affero General Public License
--  along with this program. If not, see <http://www.gnu.org/licenses/>.
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity qFSGD is
generic(ADDRESS_WIDTH : integer := 32;
		MAX_DIMENSION_BITS : integer := 8;
		QUANTIZATION_BITS : integer := 2);
port(
	clk: in std_logic;
	resetn : in std_logic;

	read_request : out std_logic;
	read_request_address : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	read_request_almostfull : in std_logic;

	read_response : in std_logic;
	read_response_data : in std_logic_vector(511 downto 0);
	read_response_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);

	write_request : out std_logic;
	write_request_address : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	write_request_data : out std_logic_vector(511 downto 0);
	write_request_almostfull : in std_logic;

	write_response : in std_logic;

	start : in std_logic;
	done : out std_logic;

	number_of_indices : in std_logic_vector(7 downto 0);
	mini_batch_size : in std_logic_vector(15 downto 0);
	step_size_decline_interval : in std_logic_vector(13 downto 0);
	step_size : in std_logic_vector(5 downto 0);
	number_of_epochs : in std_logic_vector(13 downto 0);
	start_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	normalized_to_minus1_1 : in std_logic;
	binarize_b_value : in std_logic;
	b_value_to_binarize_to : in std_logic_vector(31 downto 0);
	dimension : in std_logic_vector(17 downto 0);
	number_of_samples : in std_logic_vector(31 downto 0);
	number_of_CL_to_process : in std_logic_vector(31 downto 0));
end qFSGD;

architecture behavioral of qFSGD is

signal start_here : std_logic;

constant MAX_DIMENSION : integer := 2**MAX_DIMENSION_BITS;
constant FIFO_DEPTH_BITS : integer := MAX_DIMENSION_BITS - 4;
constant FIFO_DEPTH : integer := 2**FIFO_DEPTH_BITS-10;
constant ELEMENTS_PER_CL : integer := 512/(2*QUANTIZATION_BITS);
constant X_CL_COUNT : integer := MAX_DIMENSION/ELEMENTS_PER_CL;

signal internal_step_size : unsigned(5 downto 0);
signal internal_number_of_indices : unsigned(7 downto 0);
signal internal_address : unsigned(31 downto 0);

signal accumulation_count : integer;
signal remainder : integer;

signal NumberOfCLToProcess : unsigned(31 downto 0) := (others => '0');
signal NumberOfRequestedReads : unsigned(31 downto 0) := (others => '0');
signal NumberOfCompletedReads : unsigned(31 downto 0) := (others => '0');
signal NumberOfRequestedWrites : unsigned(31 downto 0) := (others => '0');
signal NumberOfCompletedWrites : unsigned(31 downto 0) := (others => '0');
signal NumberOfEpochs : unsigned(13 downto 0);
signal NumberOfEpochsCompleted : unsigned(13 downto 0);

signal reorder_start_address_adjust : std_logic;
signal reorder_start_address : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
signal reordered_response_data : std_logic_vector(511 downto 0);
signal reordered_resonse : std_logic;

signal NumberOfSamples : unsigned(31 downto 0) := (others => '0');
signal NumberOfSamplesInCacheLines : unsigned(31 downto 0) := (others => '0');
signal sample_index_to_read : integer;
signal sample_index_to_read_unsigned : unsigned(31 downto 0);
signal gradient_valid_counter : integer;
signal gradient_valid_counter_unsigned : unsigned(31 downto 0);

signal count_upto_a_whole_row : integer range 0 to X_CL_COUNT-1;
signal new_CL_available : std_logic_vector(9 downto 0);
signal new_row_available : std_logic_vector(9 downto 0);

signal dot_product_result_almost_valid : std_logic;
signal dot_product_result_almost_valid_1d : std_logic;
signal dot_product_result_valid : std_logic;
signal dot_product_result : std_logic_vector(31 downto 0);

signal minus_b_times_alpha_almost_valid : std_logic;
signal minus_b_times_alpha_valid : std_logic;
signal minus_b_times_alpha : std_logic_vector(31 downto 0);

signal gradient_almost_valid : std_logic;
signal gradient_valid : std_logic;
signal gradient : std_logic_vector(ELEMENTS_PER_CL*32-1 downto 0);

signal new_x_almost_valid : std_logic;
signal new_x_valid : std_logic;
signal new_x : std_logic_vector(ELEMENTS_PER_CL*32-1 downto 0);

type x_type is array (X_CL_COUNT-1 downto 0) of std_logic_vector(ELEMENTS_PER_CL*32-1 downto 0);
signal x : x_type;
signal x_loading : x_type;
signal x_reset_index : integer range 0 to X_CL_COUNT-1;
signal x_index1 : integer range 0 to X_CL_COUNT-1;
signal x_index2 : integer range 0 to X_CL_COUNT-1;
signal x_index3 : integer range 0 to X_CL_COUNT-1;
signal x_for_dot_product : std_logic_vector(ELEMENTS_PER_CL*32-1 downto 0);
signal x_for_update : std_logic_vector(ELEMENTS_PER_CL*32-1 downto 0);

signal write_back_the_model : std_logic;
signal write_back_index : integer range 0 to X_CL_COUNT-1;
signal secondary_write_back_index : integer range 0 to ELEMENTS_PER_CL/16-1;
signal model_is_written : std_logic;

signal first_sample : std_logic_vector(255 downto 0);
signal second_sample : std_logic_vector(255 downto 0);

signal ififo_we : std_logic;
signal ififo_din : std_logic_vector(255 downto 0);
signal ififo_re : std_logic;
signal ififo_valid : std_logic;
signal ififo_dout : std_logic_vector(255 downto 0);
signal ififo_count : std_logic_vector(FIFO_DEPTH_BITS-1 downto 0);
signal ififo_empty : std_logic;
signal ififo_full : std_logic;
signal ififo_almostfull: std_logic;
signal ififo_free_count : unsigned(FIFO_DEPTH_BITS-1 downto 0);

signal a_row_fifo_we : std_logic;
signal a_row_fifo_din : std_logic_vector(255 downto 0);
signal a_row_fifo_re : std_logic;
signal a_row_fifo_valid : std_logic;
signal a_row_fifo_dout : std_logic_vector(255 downto 0);
signal a_row_fifo_count : std_logic_vector(FIFO_DEPTH_BITS-1 downto 0);
signal a_row_fifo_empty : std_logic;
signal a_row_fifo_full : std_logic;
signal a_row_fifo_almostfull: std_logic;
signal a_row_fifo_free_count : unsigned(FIFO_DEPTH_BITS-1 downto 0);

signal b_to_subtract_fifo_we : std_logic;
signal b_to_subtract_fifo_din : std_logic_vector(31 downto 0);
signal b_to_subtract_fifo_re : std_logic;
signal b_to_subtract_fifo_valid : std_logic;
signal b_to_subtract_fifo_dout : std_logic_vector(31 downto 0);
signal b_to_subtract_fifo_count : std_logic_vector(FIFO_DEPTH_BITS-1 downto 0);
signal b_to_subtract_fifo_empty : std_logic;
signal b_to_subtract_fifo_full : std_logic;
signal b_to_subtract_fifo_almostfull: std_logic;
signal b_to_subtract_fifo_free_count : unsigned(FIFO_DEPTH_BITS-1 downto 0);

signal valid_pulse_counter : integer;

component simple_dual_port_ram_single_clock
generic(
	DATA_WIDTH : integer := 32;
	ADDR_WIDTH : integer := 8);
port(
	clk :	in std_logic;
	raddr : in std_logic_vector(ADDR_WIDTH-1 downto 0);
	waddr : in std_logic_vector(ADDR_WIDTH-1 downto 0);
	data : 	in std_logic_vector(DATA_WIDTH-1 downto 0);
	we :	in std_logic;
	q : 	out std_logic_vector(DATA_WIDTH-1 downto 0));
end component;

component fifo
generic(
	FIFO_WIDTH : integer := 32;
	FIFO_DEPTH_BITS : integer := 8;
	FIFO_ALMOSTFULL_THRESHOLD : integer := 220);
port(
	clk :		in std_logic;
	resetn :	in std_logic;

	we :		in std_logic;
	din :		in std_logic_vector(FIFO_WIDTH-1 downto 0);	
	re :		in std_logic;
	valid :		out std_logic;
	dout :		out std_logic_vector(FIFO_WIDTH-1 downto 0);
	count :		out std_logic_vector(FIFO_DEPTH_BITS-1 downto 0);
	empty :		out std_logic;
	full :		out std_logic;
	almostfull: out std_logic);
end component;

component reorder
generic(ADDRESS_WIDTH : integer := 32);
port (
	clk : in std_logic;
	resetn : in std_logic;

	start_address_adjust : std_logic;
	start_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	in_trigger : in std_logic;
	in_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	in_data : in std_logic_vector(511 downto 0);
	out_data : out std_logic_vector(511 downto 0);
	out_valid : out std_logic);
end component;

component qfixed_dot_product
generic (
	QUANTIZATION_BITS : integer := 2);
port (
	clk : in std_logic;
	resetn : in std_logic;

	normalized_to_minus1_1 : in std_logic;
	trigger : in std_logic;
	dimension : in std_logic_vector(17 downto 0);
	vector1 : in std_logic_vector(255 downto 0);
	vector2 : in std_logic_vector(8192/QUANTIZATION_BITS-1 downto 0);
	result_almost_valid : out std_logic;
	result_valid : out std_logic;
	result : out std_logic_vector(31 downto 0));
end component;

component fixed_subtract_mult
port (
	clk : in std_logic;
	trigger : in std_logic;
	dot_product : in std_logic_vector(31 downto 0);
	b_to_subtract : in std_logic_vector(31 downto 0);
	step_size : in std_logic_vector(5 downto 0);
	result_almost_valid : out std_logic;
	result_valid : out std_logic;
	result : out std_logic_vector(31 downto 0));
end component;

component qfixed_scalar_vector_mult
generic (
	VECTOR_SIZE : integer := 16;
	QUANTIZATION_BITS : integer := 2);
port (
	clk : in std_logic;

	normalized_to_minus1_1 : in std_logic;
	trigger : in std_logic;
	scalar : in std_logic_vector(31 downto 0);
	vector : in std_logic_vector(255 downto 0);
	result_almost_valid : out std_logic;
	result_valid : out std_logic;
	result : out std_logic_vector(32*VECTOR_SIZE-1 downto 0));
end component;

component fixed_vector_subtract
generic (VECTOR_SIZE : integer := 16);
port (
	clk : in std_logic;
	trigger : in std_logic;
	vector1 : in std_logic_vector(32*VECTOR_SIZE-1 downto 0);
	vector2 : in std_logic_vector(32*VECTOR_SIZE-1 downto 0);
	result_almost_valid : out std_logic;
	result_valid : out std_logic;
	result : out std_logic_vector(32*VECTOR_SIZE-1 downto 0));
end component;

begin

reordering: reorder
generic map (
	ADDRESS_WIDTH => ADDRESS_WIDTH)
port map (
	clk => clk,
	resetn => resetn,

	start_address_adjust => reorder_start_address_adjust,
	start_address => reorder_start_address,
	in_trigger => read_response,
	in_address => read_response_address,
	in_data => read_response_data,
	out_data => reordered_response_data,
	out_valid => reordered_resonse);

ififo: fifo
generic map (
	FIFO_WIDTH => 256,
	FIFO_DEPTH_BITS => FIFO_DEPTH_BITS,
	FIFO_ALMOSTFULL_THRESHOLD => 2**FIFO_DEPTH_BITS-30)
port map (
	clk => clk,
	resetn => resetn,

	we => ififo_we,
	din => ififo_din,
	re => ififo_re,
	valid => ififo_valid,
	dout => ififo_dout,
	count => ififo_count,
	empty => ififo_empty,
	full => ififo_full,
	almostfull => ififo_almostfull);

a_row_fifo_free_count <= FIFO_DEPTH - unsigned(a_row_fifo_count) when unsigned(a_row_fifo_count) < FIFO_DEPTH else (others => '0');

a_row_fifo_re <= dot_product_result_almost_valid_1d;
a_row_fifo: fifo
generic map (
	FIFO_WIDTH => 256,
	FIFO_DEPTH_BITS => FIFO_DEPTH_BITS,
	FIFO_ALMOSTFULL_THRESHOLD => 2**FIFO_DEPTH_BITS-30)
port map (
	clk => clk,
	resetn => resetn,

	we => a_row_fifo_we,
	din => a_row_fifo_din,
	re => a_row_fifo_re,
	valid => a_row_fifo_valid,
	dout => a_row_fifo_dout,
	count => a_row_fifo_count,
	empty => a_row_fifo_empty,
	full => a_row_fifo_full,
	almostfull => a_row_fifo_almostfull);

b_to_subtract_fifo_re <= dot_product_result_almost_valid;
b_to_subtract_fifo: fifo
generic map (
	FIFO_WIDTH => 32,
	FIFO_DEPTH_BITS => FIFO_DEPTH_BITS,
	FIFO_ALMOSTFULL_THRESHOLD => 2**FIFO_DEPTH_BITS-30)
port map (
	clk => clk,
	resetn => resetn,

	we => b_to_subtract_fifo_we,
	din => b_to_subtract_fifo_din,
	re => b_to_subtract_fifo_re,
	valid => b_to_subtract_fifo_valid,
	dout => b_to_subtract_fifo_dout,
	count => b_to_subtract_fifo_count,
	empty => b_to_subtract_fifo_empty,
	full => b_to_subtract_fifo_full,
	almostfull => b_to_subtract_fifo_almostfull);

dot_product: qfixed_dot_product
generic map (
	QUANTIZATION_BITS => QUANTIZATION_BITS)
port map (
	clk => clk,
	resetn => resetn,

	normalized_to_minus1_1 => normalized_to_minus1_1,
	trigger => ififo_valid,
	dimension => dimension,
	vector1 => ififo_dout,
	vector2 => x_for_dot_product,
	result_almost_valid => dot_product_result_almost_valid,
	result_valid => dot_product_result_valid,
	result => dot_product_result);

subtract_mult: fixed_subtract_mult
port map (
	clk => clk,
	trigger => dot_product_result_valid,
	dot_product => dot_product_result,
	b_to_subtract => b_to_subtract_fifo_dout,
	step_size => std_logic_vector(internal_step_size),
	result_almost_valid => minus_b_times_alpha_almost_valid,
	result_valid => minus_b_times_alpha_valid,
	result => minus_b_times_alpha);

scalar_vector_mult: qfixed_scalar_vector_mult
generic map (
	VECTOR_SIZE => ELEMENTS_PER_CL,
	QUANTIZATION_BITS => QUANTIZATION_BITS)
port map (
	clk => clk,

	normalized_to_minus1_1 => normalized_to_minus1_1,
	trigger => a_row_fifo_valid,
	scalar => minus_b_times_alpha,
	vector => a_row_fifo_dout,
	result_almost_valid => gradient_almost_valid,
	result_valid => gradient_valid,
	result => gradient);

vector_subtract: fixed_vector_subtract
generic map (
	VECTOR_SIZE => ELEMENTS_PER_CL)
port map (
	clk => clk,
	trigger => gradient_valid,
	vector1 => x_for_update,
	vector2 => gradient,
	result_almost_valid => new_x_almost_valid,
	result_valid => new_x_valid,
	result => new_x);

sample_index_to_read_unsigned <= to_unsigned(sample_index_to_read, 32);
gradient_valid_counter_unsigned <= to_unsigned(gradient_valid_counter, 32);

GEN_Q1: if QUANTIZATION_BITS = 1 generate
	remainder <= 1 when unsigned(dimension(7 downto 0)) > 0 else 0;
	accumulation_count <= to_integer(shift_right(unsigned(dimension), 8)) + remainder;
	GEN: for k in 0 to 255 generate
		first_sample(k) <= reordered_response_data(2*k);
		second_sample(k) <= reordered_response_data(2*k+1);
	end generate GEN;
end generate;
GEN_Q2: if QUANTIZATION_BITS = 2 generate
	remainder <= 1 when unsigned(dimension(6 downto 0)) > 0 else 0;
	accumulation_count <= to_integer(shift_right(unsigned(dimension), 7)) + remainder;
	GEN: for k in 0 to 127 generate
		first_sample(2*k+1 downto 2*k) <= reordered_response_data(4*k+1 downto 4*k);
		second_sample(2*k+1 downto 2*k) <= reordered_response_data(4*k+3 downto 4*k+2);
	end generate GEN;
end generate;
GEN_Q4: if QUANTIZATION_BITS = 4 generate
	remainder <= 1 when unsigned(dimension(5 downto 0)) > 0 else 0;
	accumulation_count <= to_integer(shift_right(unsigned(dimension), 6)) + remainder;
	GEN: for k in 0 to 63 generate
		first_sample(4*k+3 downto 4*k) <= reordered_response_data(8*k+3 downto 8*k);
		second_sample(4*k+3 downto 4*k) <= reordered_response_data(8*k+7 downto 8*k+4);
	end generate GEN;
end generate;
GEN_Q8: if QUANTIZATION_BITS = 8 generate
	remainder <= 1 when unsigned(dimension(4 downto 0)) > 0 else 0;
	accumulation_count <= to_integer(shift_right(unsigned(dimension), 5)) + remainder;
	GEN: for k in 0 to 31 generate
		first_sample(8*k+7 downto 8*k) <= reordered_response_data(16*k+7 downto 16*k);
		second_sample(8*k+7 downto 8*k) <= reordered_response_data(16*k+15 downto 16*k+8);
	end generate GEN;
end generate;

internal_number_of_indices <= unsigned(number_of_indices);

process(clk)
begin
if clk'event and clk = '1' then
	NumberOfCLToProcess <= unsigned(number_of_CL_to_process);
	NumberOfEpochs <= unsigned(number_of_epochs);
	NumberOfSamples <= unsigned(number_of_samples);
	NumberOfSamplesInCacheLines <= shift_right(NumberOfSamples,4) + 1;

	start_here <= start;

	if start_here = '0' then
		internal_step_size <= (others => '0');
		internal_address <= (others => '0');

		NumberOfRequestedReads <= (others => '0');
		NumberOfCompletedReads <= (others => '0');
		NumberOfRequestedWrites <= (others => '0');
		NumberOfCompletedWrites <= (others => '0');
		NumberOfEpochsCompleted <= (others => '0');

		sample_index_to_read <= 0;
		gradient_valid_counter <= 0;

		count_upto_a_whole_row <= 0;
		new_CL_available <= (others => '0');
		new_row_available <= (others => '0');
		
		x(x_reset_index) <= (others => '0');
		x_loading(x_reset_index) <= (others => '0');
		if x_reset_index = X_CL_COUNT-1 then
			x_reset_index <= 0;
		else
			x_reset_index <= x_reset_index + 1;
		end if;
		x_index1 <= 0;
		x_index2 <= 0;
		x_index3 <= 0;
		x_for_dot_product <= (others => '0');
		x_for_update <= (others => '0');

		write_back_the_model <= '0';
		write_back_index <= 0;
		secondary_write_back_index <= 0;
		model_is_written <= '0';

		ififo_we <= '0';
		ififo_re <= '0';

		a_row_fifo_we <= '0';

		b_to_subtract_fifo_we <= '0';

		dot_product_result_almost_valid_1d <= '0';
		valid_pulse_counter <= 0;

		done <= '0';
	else
		if internal_step_size = B"000000" then
			internal_step_size <= unsigned(step_size);
		end if;

		read_request <= '0';
		reorder_start_address_adjust <= '0';
		if start_here = '1' and NumberOfRequestedReads < NumberOfCLToProcess and write_request_almostfull = '0' and read_request_almostfull = '0' and NumberOfRequestedReads - NumberOfCompletedReads < a_row_fifo_free_count then
			read_request <= '1';
			read_request_address <= std_logic_vector(unsigned(start_address) + internal_address + NumberOfRequestedReads);
			if NumberOfRequestedReads = 0 then
				reorder_start_address_adjust <= '1';
				reorder_start_address <= std_logic_vector(unsigned(start_address) + internal_address + NumberOfRequestedReads);
			end if;
			NumberOfRequestedReads <= NumberOfRequestedReads + 1;
		end if;

		ififo_we <= '0';
		a_row_fifo_we <= '0';
		b_to_subtract_fifo_we <= '0';
		new_CL_available(0) <= '0';
		new_row_available(0) <= '0';
		if reordered_resonse = '1' then
			NumberOfCompletedReads <= NumberOfCompletedReads + 1;

			ififo_we <= '1';
			a_row_fifo_we <= '1';
			
			new_CL_available(0) <= '1';

			if count_upto_a_whole_row = accumulation_count-1 then
				ififo_din(239 downto 0) <= first_sample(239 downto 0);
				a_row_fifo_din(239 downto 0) <= second_sample(239 downto 0);
				ififo_din(255 downto 240) <= (others => '0');
				a_row_fifo_din(255 downto 240) <= (others => '0');

				count_upto_a_whole_row <= 0;
				new_row_available(0) <= '1';

				b_to_subtract_fifo_we <= '1';
				if binarize_b_value = '0' then
					b_to_subtract_fifo_din <= reordered_response_data(511 downto 480);
				else
					if reordered_response_data(511 downto 480) = b_value_to_binarize_to then
						b_to_subtract_fifo_din <= X"00800000";
					else
						b_to_subtract_fifo_din <= X"00000000";
					end if;
				end if;
			else
				ififo_din <= first_sample;
				a_row_fifo_din <= second_sample;

				count_upto_a_whole_row <= count_upto_a_whole_row + 1;
			end if;
		end if;

		ififo_re <= '0';
		if new_CL_available(1) = '1' then
			ififo_re <= '1';
		end if;

		if new_CL_available(4) = '1' then
			x_for_dot_product <= x(x_index1);
			--x_for_dot_product <= x_loading(x_index1);
			if x_index1 = accumulation_count-1 then
				x_index1 <= 0;
			else
				x_index1 <= x_index1 + 1;
			end if;
		end if;

		if gradient_almost_valid = '1' then
			if new_x_valid = '1' and x_index2 = x_index3 then
				x_for_update <= new_x;
			else
				x_for_update <= x_loading(x_index2);
			end if;
			------------------------------------------------------------------------
			--if ( std_logic_vector(gradient_valid_counter_unsigned(15 downto 0)) and mini_batch_size(15 downto 0) ) = mini_batch_size(15 downto 0) or gradient_valid_counter = NumberOfSamples-2 then
			--	x(x_index2) <= x_loading(x_index2);
			--end if;
			------------------------------------------------------------------------
			if x_index2 = accumulation_count-1 then
				x_index2 <= 0;
				if gradient_valid_counter = NumberOfSamples-1 then
					gradient_valid_counter <= 0;
				else
					gradient_valid_counter <= gradient_valid_counter + 1;
				end if;
			else
				x_index2 <= x_index2 + 1;
			end if;
		end if;

		if new_x_valid = '1' then
			if ( std_logic_vector(sample_index_to_read_unsigned(15 downto 0)) and mini_batch_size(15 downto 0) ) = mini_batch_size(15 downto 0) or sample_index_to_read = NumberOfSamples-1 then
				x(x_index3) <= new_x;
			end if;

			x_loading(x_index3) <= new_x;
			if x_index3 = accumulation_count-1 then
				x_index3 <= 0;
				if sample_index_to_read = NumberOfSamples-1 then
					sample_index_to_read <= 0;
					write_back_the_model <= '1';
				else
					sample_index_to_read <= sample_index_to_read + 1;
				end if;
			else
				x_index3 <= x_index3 + 1;
			end if;
		end if;

		for k in 1 to 9 loop
			new_CL_available(k) <= new_CL_available(k-1);
			new_row_available(k) <= new_row_available(k-1);
		end loop;

		write_request <= '0';
		if write_back_the_model = '1' and write_request_almostfull = '0' and new_CL_available(4) /= '1' then
			write_request <= '1';
			write_request_address <= std_logic_vector(NumberOfRequestedWrites);
			write_request_data <= x(write_back_index)(512*secondary_write_back_index+511 downto 512*secondary_write_back_index);
			--write_request_data <= x_loading(write_back_index)(512*secondary_write_back_index+511 downto 512*secondary_write_back_index);
			if secondary_write_back_index = ELEMENTS_PER_CL/16-1 then
				secondary_write_back_index <= 0;
				if write_back_index = accumulation_count-1 then
					write_back_index <= 0;
					write_back_the_model <= '0';

					NumberOfEpochsCompleted <= NumberOfEpochsCompleted + 1;
					if NumberOfEpochsCompleted = NumberOfEpochs-1 then
						model_is_written <= '1';
					else
						if internal_address = (internal_number_of_indices-1)*NumberOfCLToProcess then
							internal_address <= (others => '0');
						else
							internal_address <= internal_address + NumberOfCLToProcess;
						end if;
						NumberOfRequestedReads <= (others => '0');
						NumberOfCompletedReads <= (others => '0');
					end if;

					if (std_logic_vector(NumberOfEpochsCompleted) and step_size_decline_interval) = step_size_decline_interval then
						internal_step_size <= internal_step_size + 1;
					end if;
				else
					write_back_index <= write_back_index + 1;
				end if;
			else
				secondary_write_back_index <= secondary_write_back_index + 1;
			end if;

			NumberOfRequestedWrites <= NumberOfRequestedWrites + 1;
		end if;

		if write_response = '1' then
			NumberOfCompletedWrites <= NumberOfCompletedWrites + 1;
		end if;

		if start_here = '1' and NumberOfCompletedWrites = NumberOfRequestedWrites and NumberOfEpochsCompleted = NumberOfEpochs and model_is_written = '1' then
			done <= '1';
		end if;

		dot_product_result_almost_valid_1d <= '0';
		if dot_product_result_almost_valid = '1' or valid_pulse_counter > 0 then
			dot_product_result_almost_valid_1d <= '1';
			if valid_pulse_counter = accumulation_count-1 then
				valid_pulse_counter <= 0;
			else
				valid_pulse_counter <= valid_pulse_counter + 1;
			end if;
		end if;

	end if;
end if;
end process;

end architecture;