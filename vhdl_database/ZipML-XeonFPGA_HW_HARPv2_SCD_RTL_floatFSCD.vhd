----------------------------------------------------------------------------
--  Copyright (C) 2018 Kaan Kara - Systems Group, ETH Zurich

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

entity floatFSCD is
generic(ADDRESS_WIDTH : integer := 32;
		LOG2_MAX_iBATCHSIZE : integer := 9;
		LOG2_MAX_NUMFEATURES: integer := 15);
port(
	clk: in std_logic;
	resetn : in std_logic;

	read_request : out std_logic;
	read_request_address : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	read_request_tid : out std_logic_vector(15 downto 0);
	read_request_length : out std_logic_vector(1 downto 0);
	read_request_almostfull : in std_logic;

	read_response : in std_logic;
	read_response_data : in std_logic_vector(511 downto 0);
	read_response_tid : in std_logic_vector(15 downto 0);

	write_request : out std_logic;
	write_request_address : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	write_request_data : out std_logic_vector(511 downto 0);
	write_request_almostfull : in std_logic;

	write_response : in std_logic;

	start : in std_logic;
	done : out std_logic;

	do_real_scd: in std_logic;
	do_residual_update : in std_logic;
	enable_multiline : in std_logic;
	enable_decompression : in std_logic;
	enable_staleness : in std_logic;
	enable_decryption : in std_logic;
	program_key_index : std_logic_vector(3 downto 0);
	program_key : std_logic_vector(127 downto 0);
	to_integer_scaler : in std_logic_vector(15 downto 0);
	a_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	b_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	step_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	residual_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	number_of_features : in std_logic_vector(31 downto 0);
	number_of_batches : in std_logic_vector(15 downto 0);
	batch_size : in std_logic_vector(15 downto 0);
	step_size : in std_logic_vector(31 downto 0);
	lambda : in std_logic_vector(31 downto 0);
	do_sigmoid : in std_logic;
	number_of_epochs : in std_logic_vector(15 downto 0));
end floatFSCD;

architecture behavioral of floatFSCD is

--signal timeout_occured : std_logic;
--signal timeout : unsigned(31 downto 0);
signal resetn_internal : std_logic;
signal reset : std_logic;
constant LOG2_VALUE_WIDTH : integer := 5;
constant LOG2_LINE_WIDTH : integer := 9;
constant LOG2_VALUES_PER_LINE : integer := LOG2_LINE_WIDTH-LOG2_VALUE_WIDTH;
constant VALUES_PER_LINE : integer := 2**LOG2_VALUES_PER_LINE;

signal iNUMBER_OF_EPOCHS : unsigned(15 downto 0) := (others => '0');
signal iNUMBER_OF_FEATURES : unsigned(31 downto 0) := (others => '0');
signal iNUMBER_OF_BATCHES : unsigned(15 downto 0) := (others => '0');
signal iBATCH_SIZE : unsigned(15 downto 0) := (others => '0');
signal iNUMBER_OF_BATCHES_TIMES_BATCH_SIZE : unsigned(31 downto 0) := (others => '0');
signal write_iBATCH_OFFSET : unsigned(31 downto 0) := (others => '0');

signal finish_allowed : std_logic;
signal completed_epochs : unsigned(15 downto 0);

signal NumberOfRequestedReads : std_logic_vector(31 downto 0);
signal NumberOfReceivedReads : unsigned(31 downto 0) := (others => '0');
signal residual_NumberOfReceivedReads : unsigned(31 downto 0) := (others => '0');
signal b_NumberOfReceivedReads : unsigned(31 downto 0) := (others => '0');
signal a_NumberOfReceivedReads : unsigned(31 downto 0) := (others => '0');
signal residual_NumberOfWriteRequests : unsigned(31 downto 0) := (others => '0');
signal step_NumberOfWriteRequests : unsigned(31 downto 0) := (others => '0');
signal step_NumberOfWriteRequestsPerEpoch : unsigned(31 downto 0) := (others => '0');
signal NumberOfWriteRequests : unsigned(31 downto 0) := (others => '0');
signal NumberOfPendingWrites : unsigned(31 downto 0) := (others => '0');
signal NumberOfWriteResponses : unsigned(31 downto 0) := (others => '0');

signal i_residual_receive_index : unsigned(31 downto 0) := (others => '0');
signal i_receive_index : unsigned(LOG2_MAX_iBATCHSIZE-1 downto 0) := (others => '0');
signal i_batch_index : unsigned(15 downto 0) := (others => '0');
signal i_model_index : unsigned(LOG2_MAX_NUMFEATURES-1 downto 0) := (others => '0');
signal feature_update_index : unsigned(31 downto 0) := (others => '0');
signal batch_update_index : unsigned(15 downto 0) := (others => '0');
signal write_batch_index : unsigned(15 downto 0) := (others => '0');
signal write_feature_index : unsigned(31 downto 0) := (others => '0');
signal i_write_index : unsigned(LOG2_MAX_iBATCHSIZE-1 downto 0) := (others => '0');
signal i_update_index : unsigned(LOG2_MAX_iBATCHSIZE-1 downto 0) := (others => '0');
signal i_writeback_index : unsigned(LOG2_MAX_iBATCHSIZE-1 downto 0) := (others => '0');
signal i_writerequest_index : unsigned(LOG2_MAX_iBATCHSIZE-1 downto 0) := (others => '0');

signal allowed_batch_to_read : std_logic_vector(15 downto 0);
signal allowed_feature_to_read : std_logic_vector(31 downto 0);
signal write_residual_back : std_logic;

signal epoch_start : std_logic;
signal reorder_free_count : std_logic_vector(31 downto 0);
signal response_residual_valid : std_logic;
signal response_model_valid : std_logic;
signal response_b_valid : std_logic;
signal response_a_valid : std_logic;
signal response_index : std_logic_vector(31 downto 0);
signal response_data : std_logic_vector(511 downto 0);
signal a_data : std_logic_vector(511 downto 0);

signal decompressor_in_valid : std_logic;
signal decompressor_out_valid : std_logic;
signal decompressor_out_data : std_logic_vector(511 downto 0);
signal decompressor_out_fifo_free_count : std_logic_vector(8 downto 0);

constant INPUT_VECTOR_DELAY_CYCLES : integer := 4;
type input_vector_type is array(INPUT_VECTOR_DELAY_CYCLES downto 0) of std_logic_vector(511 downto 0);
signal input_vector : input_vector_type;

signal residual_store_raddr : std_logic_vector(LOG2_MAX_iBATCHSIZE-1 downto 0);
signal residual_store_waddr : std_logic_vector(LOG2_MAX_iBATCHSIZE-1 downto 0);
signal residual_store_din : std_logic_vector(511 downto 0);
signal residual_store_we : std_logic;
signal residual_store_re : std_logic;
signal residual_store_dout : std_logic_vector(511 downto 0);

signal residual_store_loading_raddr : std_logic_vector(LOG2_MAX_iBATCHSIZE-1 downto 0);
signal residual_store_loading_waddr : std_logic_vector(LOG2_MAX_iBATCHSIZE-1 downto 0);
signal residual_store_loading_din : std_logic_vector(511 downto 0);
signal residual_store_loading_we : std_logic;
signal residual_store_loading_re : std_logic;
signal residual_store_loading_dout : std_logic_vector(511 downto 0);
signal residual_writeback_re : std_logic;
signal residual_writeback_re_1d : std_logic;

signal b_store_raddr : std_logic_vector(LOG2_MAX_iBATCHSIZE-1 downto 0);
signal b_store_waddr : std_logic_vector(LOG2_MAX_iBATCHSIZE-1 downto 0);
signal b_store_din : std_logic_vector(511 downto 0);
signal b_store_we : std_logic;
signal b_store_re : std_logic;
signal b_store_dout : std_logic_vector(511 downto 0);

signal model_store_raddr : std_logic_vector(LOG2_MAX_NUMFEATURES-4-1 downto 0);
signal model_store_waddr : std_logic_vector(LOG2_MAX_NUMFEATURES-4-1 downto 0);
signal model_store_din : std_logic_vector(511 downto 0);
signal model_store_we : std_logic;
signal model_store_re : std_logic;
signal model_store_re_1d : std_logic;
signal i_model_mux : integer range 0 to 15;
signal i_model_mux_1d : integer range 0 to 15;
signal model_store_dout : std_logic_vector(511 downto 0);

signal a_fifo_we : std_logic;
signal a_fifo_din : std_logic_vector(511 downto 0);
signal a_fifo_re : std_logic;
signal a_fifo_valid : std_logic;
signal a_fifo_dout : std_logic_vector(511 downto 0);
signal a_fifo_count : std_logic_vector(LOG2_MAX_iBATCHSIZE downto 0);
signal a_fifo_almostfull: std_logic;

signal a1_fifo_we : std_logic;
signal a1_fifo_din : std_logic_vector(511 downto 0);
signal a1_fifo_re : std_logic;
signal a1_fifo_valid : std_logic;
signal a1_fifo_dout : std_logic_vector(511 downto 0);
signal a1_fifo_count : std_logic_vector(LOG2_MAX_iBATCHSIZE downto 0);
signal a1_fifo_almostfull: std_logic;

signal model_for_lambda : std_logic_vector(31 downto 0);

signal scalar_vector_mult_valid : std_logic;
signal scalar_vector_mult_scalar : std_logic_vector(31 downto 0);
signal scalar_vector_mult_vector : std_logic_vector(511 downto 0);

signal residual_minus_b_trigger : std_logic;
signal residual_minus_b_valid : std_logic;
signal residual_minus_b : std_logic_vector(511 downto 0);

signal dot_almost_valid : std_logic;
signal dot_almost_valid_1d : std_logic;
signal dot_almost_valid_2d : std_logic;
signal dot_valid : std_logic;
signal dot : std_logic_vector(31 downto 0);
signal step : std_logic_vector(31 downto 0);
signal step_valid : std_logic;
signal step_valid_once : std_logic;

signal delta_almost_valid : std_logic;
signal delta_valid : std_logic;
signal delta : std_logic_vector(511 downto 0);
signal delta0 : std_logic_vector(31 downto 0);

signal new_residual_valid : std_logic;
signal new_residual : std_logic_vector(511 downto 0);
signal new_residual0 : std_logic_vector(31 downto 0);

signal step_writeback_valid : std_logic;
signal step_writeback : std_logic_vector(511 downto 0);
signal step_writeback_index : integer range 0 to 15 := 0;

signal scd_phase : std_logic := '0';
signal scd_residual_phase : std_logic := '0'; 

signal allowed_new_column_read : std_logic := '0';

component simple_dual_port_ram_single_clock
generic(
	DATA_WIDTH : natural := 8;
	ADDR_WIDTH : natural := 6);
port(
	clk		: in std_logic;
	raddr	: in std_logic_vector(ADDR_WIDTH-1 downto 0);
	waddr	: in std_logic_vector(ADDR_WIDTH-1 downto 0);
	data	: in std_logic_vector((DATA_WIDTH-1) downto 0);
	we		: in std_logic := '1';
	q		: out std_logic_vector((DATA_WIDTH -1) downto 0));
end component;

component normal2axis_fifo
generic (
	FIFO_WIDTH : integer;
	LOG2_FIFO_DEPTH : integer);
 port(
	clk : in std_logic;
	resetn : in std_logic;

	write_enable : in std_logic;
	write_data : in std_logic_vector(FIFO_WIDTH-1 downto 0);
	
	m_axis_tvalid : out std_logic;
	m_axis_tready : in std_logic;
	m_axis_tdata : out std_logic_vector(FIFO_WIDTH-1 downto 0);

	almostfull : out std_logic;
	count : out std_logic_vector(LOG2_FIFO_DEPTH-1 downto 0) );
end component;

component request_receive
generic(ADDRESS_WIDTH : integer := 32;
		LOG2_MAX_iBATCHSIZE : integer := 9;
		LOG2_MAX_NUMFEATURES: integer := 15);
port (
	clk: in std_logic;
	resetn : in std_logic;

	start : in std_logic;
	restart : in std_logic;

	read_request : out std_logic;
	read_request_address : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	read_request_tid : out std_logic_vector(15 downto 0);
	read_request_length : out std_logic_vector(1 downto 0);
	read_request_almostfull : in std_logic;

	read_response : in std_logic;
	read_response_data : in std_logic_vector(511 downto 0);
	read_response_tid : in std_logic_vector(15 downto 0);

	requested_reads_count : out std_logic_vector(31 downto 0);
	reorder_free_count : out std_logic_vector(31 downto 0);
	out_residual_valid : out std_logic;
	out_model_valid : out std_logic;
	out_b_valid : out std_logic;
	out_a_valid : out std_logic;
	out_index : out std_logic_vector(31 downto 0);
	out_data : out std_logic_vector(511 downto 0);

	allowed_new_column_read : in std_logic;
	allowed_batch_to_read : in std_logic_vector(15 downto 0);
	allowed_feature_to_read : in std_logic_vector(31 downto 0);

	do_real_scd: in std_logic;
	do_residual_update : in std_logic;
	enable_decryption : in std_logic;
	program_key_index : std_logic_vector(3 downto 0);
	program_key : std_logic_vector(127 downto 0);
	enable_multiline : in std_logic;
	external_free_count : in std_logic_vector(8 downto 0);
	enable_staleness : in std_logic;
	read_size_from_memory : in std_logic;
	a_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	b_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	step_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	residual_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	number_of_features : in std_logic_vector(LOG2_MAX_NUMFEATURES downto 0);
	number_of_batches : in std_logic_vector(15 downto 0);
	batch_size : in std_logic_vector(15 downto 0));
end component;

component decompressor
generic(
	LOG2_BUFFER_DEPTH : integer := 8);
port (
	clk : in std_logic;
	resetn : in std_logic;
	to_integer_scaler : std_logic_vector(15 downto 0);
	in_valid : in std_logic;
	in_data : in std_logic_vector(511 downto 0);
	out_valid : out std_logic;
	out_data : out std_logic_vector(511 downto 0);
	out_fifo_free_count : out std_logic_vector(LOG2_BUFFER_DEPTH downto 0));
end component;

component float_vector_subtract_sigmoid
generic (VALUES_PER_LINE : integer := 16);
port (
	clk : in std_logic;
	resetn : in std_logic;
	trigger : in std_logic;
	vector1 : in std_logic_vector(32*VALUES_PER_LINE-1 downto 0);
	vector2 : in std_logic_vector(32*VALUES_PER_LINE-1 downto 0);
	do_sigmoid : in std_logic;
	result_valid : out std_logic;
	result : out std_logic_vector(32*VALUES_PER_LINE-1 downto 0));
end component;

component float_vector_subtract
generic (VALUES_PER_LINE : integer := 16);
port (
	clk : in std_logic;
	resetn : in std_logic;
	trigger : in std_logic;
	vector1 : in std_logic_vector(32*VALUES_PER_LINE-1 downto 0);
	vector2 : in std_logic_vector(32*VALUES_PER_LINE-1 downto 0);
	result_valid : out std_logic;
	result : out std_logic_vector(32*VALUES_PER_LINE-1 downto 0));
end component;

signal dot_product_accumulation_count : std_logic_vector(31 downto 0);
signal dot_valid_allowed : std_logic;
component hybrid_dot_product
generic (
	LOG2_VALUES_PER_LINE : integer := 5);
port (
	clk : in std_logic;
	resetn : in std_logic;
	trigger : in std_logic;
	accumulation_count : in std_logic_vector(31 downto 0);
	vector1 : in std_logic_vector(511 downto 0);
	vector2 : in std_logic_vector(511 downto 0);
	valid_allowed : in std_logic;
	result_almost_valid : out std_logic;
	result_valid : out std_logic;
	result : out std_logic_vector(31 downto 0));
end component;

component stepsize_and_regularization
generic (VALUES_PER_LINE : integer := 16);
port (
	clk : in std_logic;
	reset : in std_logic;
	trigger : in std_logic;
	dot : in std_logic_vector(31 downto 0);
	model : in std_logic_vector(31 downto 0);
	stepsize : in std_logic_vector(31 downto 0);
	lambda : in std_logic_vector(31 downto 0);
	result_valid_once : out std_logic;
	result_valid : out std_logic;
	result : out std_logic_vector(31 downto 0));
end component;


component float_scalar_vector_mult
generic (VALUES_PER_LINE : integer := 16);
port (
	clk : in std_logic;
	resetn : in std_logic;
	trigger : in std_logic;
	scalar : in std_logic_vector(31 downto 0);
	vector : in std_logic_vector(32*VALUES_PER_LINE-1 downto 0);
	result_almost_valid : out std_logic;
	result_valid : out std_logic;
	result : out std_logic_vector(32*VALUES_PER_LINE-1 downto 0));
end component;

begin

delta0 <= delta(31 downto 0);
new_residual0 <= new_residual(31 downto 0);

reset <= not resetn_internal;

allowed_batch_to_read <= number_of_batches when do_real_scd = '1' else std_logic_vector(write_batch_index);
allowed_feature_to_read <= std_logic_vector(write_feature_index) when do_real_scd = '1' else number_of_features;
request_receive_lines: request_receive
generic map (
	ADDRESS_WIDTH => ADDRESS_WIDTH,
	LOG2_MAX_iBATCHSIZE => LOG2_MAX_iBATCHSIZE,
	LOG2_MAX_NUMFEATURES => LOG2_MAX_NUMFEATURES)
port map (
	clk => clk,
	resetn => resetn_internal,

	start => start,
	restart => epoch_start,

	read_request => read_request,
	read_request_address => read_request_address,
	read_request_tid => read_request_tid,
	read_request_length => read_request_length,
	read_request_almostfull => read_request_almostfull,

	read_response => read_response,
	read_response_data => read_response_data,
	read_response_tid => read_response_tid,

	requested_reads_count => NumberOfRequestedReads,
	reorder_free_count => reorder_free_count,
	out_residual_valid => response_residual_valid,
	out_model_valid => response_model_valid,
	out_b_valid => response_b_valid,
	out_a_valid => response_a_valid,
	out_index => response_index,
	out_data => response_data,

	allowed_new_column_read => allowed_new_column_read,
	allowed_batch_to_read => allowed_batch_to_read,
	allowed_feature_to_read => allowed_feature_to_read,

	do_real_scd => do_real_scd,
	do_residual_update => do_residual_update,
	enable_decryption => enable_decryption,
	program_key_index => program_key_index,
	program_key => program_key,
	enable_multiline => enable_multiline,
	external_free_count => decompressor_out_fifo_free_count,
	enable_staleness => enable_staleness,
	read_size_from_memory => enable_decompression,
	a_address => a_address,
	b_address => b_address,
	step_address => step_address,
	residual_address => residual_address,
	number_of_features => number_of_features(LOG2_MAX_NUMFEATURES downto 0),
	number_of_batches => number_of_batches,
	batch_size => batch_size);

decompressor_in_valid <= response_a_valid when enable_decompression = '1' else '0';
decompression: decompressor
generic map (
	LOG2_BUFFER_DEPTH => 8)
port map (
	clk => clk,
	resetn => resetn_internal,
	to_integer_scaler => to_integer_scaler,
	in_valid => decompressor_in_valid,
	in_data => response_data,
	out_valid => decompressor_out_valid,
	out_data => decompressor_out_data,
	out_fifo_free_count => decompressor_out_fifo_free_count);
a_data <= decompressor_out_data when enable_decompression = '1' else response_data;

residual_store: simple_dual_port_ram_single_clock
generic map (
	DATA_WIDTH => 512,
	ADDR_WIDTH => LOG2_MAX_iBATCHSIZE)
port map (
	clk => clk,
	raddr => residual_store_raddr,
	waddr => residual_store_waddr,
	data => residual_store_din,
	we => residual_store_we,
	q => residual_store_dout);

residual_store_loading: simple_dual_port_ram_single_clock
generic map (
	DATA_WIDTH => 512,
	ADDR_WIDTH => LOG2_MAX_iBATCHSIZE)
port map (
	clk => clk,
	raddr => residual_store_loading_raddr,
	waddr => residual_store_loading_waddr,
	data => residual_store_loading_din,
	we => residual_store_loading_we,
	q => residual_store_loading_dout);

b_store: simple_dual_port_ram_single_clock
generic map (
	DATA_WIDTH => 512,
	ADDR_WIDTH => LOG2_MAX_iBATCHSIZE)
port map (
	clk => clk,
	raddr => b_store_raddr,
	waddr => b_store_waddr,
	data => b_store_din,
	we => b_store_we,
	q => b_store_dout);

model_store: simple_dual_port_ram_single_clock
generic map (
	DATA_WIDTH => 512,
	ADDR_WIDTH => LOG2_MAX_NUMFEATURES-4)
port map (
	clk => clk,
	raddr => model_store_raddr,
	waddr => model_store_waddr,
	data => model_store_din,
	we => model_store_we,
	q => model_store_dout);

a1_fifo_re <= residual_minus_b_valid;
a1_fifo: normal2axis_fifo
generic map (
	FIFO_WIDTH => 512,
	LOG2_FIFO_DEPTH => LOG2_MAX_iBATCHSIZE+1)
port map (
	clk => clk,
	resetn => resetn_internal,

	write_enable => a1_fifo_we,
	write_data => a1_fifo_din,

	m_axis_tready => a1_fifo_re,
	m_axis_tvalid => a1_fifo_valid,
	m_axis_tdata => a1_fifo_dout,

	almostfull => a1_fifo_almostfull,
	count => a1_fifo_count);

a_fifo_re <= step_valid;
a_fifo: normal2axis_fifo
generic map (
	FIFO_WIDTH => 512,
	LOG2_FIFO_DEPTH => LOG2_MAX_iBATCHSIZE+1)
port map (
	clk => clk,
	resetn => resetn_internal,

	write_enable => a_fifo_we,
	write_data => a_fifo_din,

	m_axis_tready => a_fifo_re,
	m_axis_tvalid => a_fifo_valid,
	m_axis_tdata => a_fifo_dout,

	almostfull => a_fifo_almostfull,
	count => a_fifo_count);

COMP_residual_minus_b: float_vector_subtract_sigmoid
generic map (
	VALUES_PER_LINE => VALUES_PER_LINE)
port map (
	clk => clk,
	resetn => resetn_internal,
	trigger => residual_minus_b_trigger,
	vector1 => residual_store_dout,
	vector2 => b_store_dout,
	do_sigmoid => do_sigmoid,
	result_valid => residual_minus_b_valid,
	result => residual_minus_b);

dot_product_accumulation_count <= std_logic_vector(unsigned(batch_size)*unsigned(number_of_batches)) when do_real_scd = '1' else X"0000" & batch_size;
dot_valid_allowed <= a_fifo_valid;
COMP_dot: hybrid_dot_product
generic map (
	LOG2_VALUES_PER_LINE => LOG2_VALUES_PER_LINE)
port map (
	clk => clk,
	resetn => resetn_internal,
	trigger => residual_minus_b_valid,
	accumulation_count => dot_product_accumulation_count,
	vector1 => residual_minus_b,
	vector2 => a1_fifo_dout,
	valid_allowed => dot_valid_allowed,
	result_almost_valid => dot_almost_valid,
	result_valid => dot_valid,
	result => dot);

model_for_lambda <= model_store_dout( 32*i_model_mux_1d + 31 downto 32*i_model_mux_1d );
COMP_stepsize_and_regularization: stepsize_and_regularization
port map (
	clk => clk,
	reset => reset,
	trigger => dot_valid,
	dot => dot,
	model => model_for_lambda,
	stepsize => step_size,
	lambda => lambda,
	result_valid_once => step_valid_once,
	result_valid => step_valid,
	result => step);


scalar_vector_mult_valid <= model_store_re_1d when do_residual_update = '1' else (a_fifo_valid and a_fifo_re);
scalar_vector_mult_scalar <= (not model_store_dout( 32*i_model_mux_1d + 31 ) & model_store_dout( 32*i_model_mux_1d + 30 downto 32*i_model_mux_1d )) when do_residual_update = '1' else step;
scalar_vector_mult_vector <= input_vector(1) when do_residual_update = '1' else a_fifo_dout;
COMP_scalar_vector_mult: float_scalar_vector_mult
generic map (
	VALUES_PER_LINE => VALUES_PER_LINE)
port map (
	clk => clk,
	resetn => resetn_internal,
	trigger => scalar_vector_mult_valid,
	scalar => scalar_vector_mult_scalar,
	vector => scalar_vector_mult_vector,
	result_almost_valid => delta_almost_valid,
	result_valid => delta_valid,
	result => delta);

COMP_residual_minus_delta: float_vector_subtract
generic map (
	VALUES_PER_LINE => VALUES_PER_LINE)
port map (
	clk => clk,
	resetn => resetn_internal,
	trigger => delta_valid,
	vector1 => residual_store_loading_dout,
	vector2 => delta,
	result_valid => new_residual_valid,
	result => new_residual);

process(clk)
begin
if clk'event and clk = '1' then
	resetn_internal <= resetn;

	NumberOfWriteRequests <= step_NumberOfWriteRequests + residual_NumberOfWriteRequests;
	if NumberOfWriteRequests < NumberOfWriteResponses then
		NumberOfPendingWrites <= (others => '0');
	else
		NumberOfPendingWrites <= NumberOfWriteRequests - NumberOfWriteResponses;
	end if;

	for k in 1 to INPUT_VECTOR_DELAY_CYCLES loop
		input_vector(k) <= input_vector(k-1);
	end loop;
	residual_minus_b_trigger <= residual_store_re and b_store_re;
	dot_almost_valid_1d <= dot_almost_valid;
	dot_almost_valid_2d <= dot_almost_valid_1d;

	iNUMBER_OF_EPOCHS <= unsigned(number_of_epochs);
	iNUMBER_OF_FEATURES <= unsigned(number_of_features);
	iNUMBER_OF_BATCHES <= unsigned(number_of_batches);
	iBATCH_SIZE <= unsigned(batch_size);
	iNUMBER_OF_BATCHES_TIMES_BATCH_SIZE <= iNUMBER_OF_BATCHES*iBATCH_SIZE;
	write_iBATCH_OFFSET <= write_batch_index*iBATCH_SIZE;

	model_store_re_1d <= model_store_re;
	i_model_mux_1d <= i_model_mux;

	if resetn_internal = '0' then
		--timeout_occured <= '0';
		--timeout <= (others => '0');

		write_request <= '0';
		done <= '0';

		epoch_start <= '0';
		finish_allowed <= '0';
		completed_epochs <= (others => '0');

		NumberOfReceivedReads <= (others => '0');
		residual_NumberOfReceivedReads <= (others => '0');
		b_NumberOfReceivedReads <= (others => '0');
		a_NumberOfReceivedReads <= (others => '0');
		residual_NumberOfWriteRequests <= (others => '0');
		step_NumberOfWriteRequests <= (others => '0');
		step_NumberOfWriteRequestsPerEpoch <= (others => '0');
		NumberOfWriteResponses <= (others => '0');

		i_residual_receive_index <= (others => '0');
		i_receive_index <= (others => '0');
		i_batch_index <= (others => '0');
		i_model_index <= (others => '0');
		feature_update_index <= (others => '0');
		batch_update_index <= (others => '0');
		write_batch_index <= (others => '0');
		write_feature_index <= (others => '0');
		i_write_index <= (others => '0');
		i_update_index <= (others => '0');
		i_writeback_index <= (others => '0');
		i_writerequest_index <= (others => '0');

		write_residual_back <= '0';

		a1_fifo_we <= '0';
		a_fifo_we <= '0';

		step_writeback_valid <= '0';
		step_writeback <= (others => '0');
		step_writeback_index <= 0;

		scd_phase <= '0';
		scd_residual_phase <= '0';

		allowed_new_column_read <= '0';
	else
		-- Receive lines
		residual_store_we <= '0';
		residual_store_loading_we <= '0';
		if response_residual_valid = '1' then
			if not (do_real_scd = '1' and scd_residual_phase = '1') then
				residual_store_we <= '1';
			end if;
			residual_store_loading_we <= '1';
			residual_store_din <= response_data;
			residual_store_loading_din <= response_data;
			residual_store_waddr <= std_logic_vector(response_index(LOG2_MAX_iBATCHSIZE-1 downto 0));
			residual_store_loading_waddr <= std_logic_vector(response_index(LOG2_MAX_iBATCHSIZE-1 downto 0));
			residual_NumberOfReceivedReads <= residual_NumberOfReceivedReads + 1;

			if i_residual_receive_index = iNUMBER_OF_BATCHES_TIMES_BATCH_SIZE-1 then
				i_residual_receive_index <= (others => '0');
				if do_real_scd = '1' then
					scd_residual_phase <= not scd_residual_phase;
				end if;
			else
				i_residual_receive_index <= i_residual_receive_index + 1;
			end if;
		end if;


		b_store_we <= '0';
		if response_b_valid = '1' then
			b_store_we <= '1';
			b_store_din <= response_data;
			b_store_waddr <= std_logic_vector(response_index(LOG2_MAX_iBATCHSIZE-1 downto 0));
			b_NumberOfReceivedReads <= b_NumberOfReceivedReads + 1;
		end if;


		model_store_we <= '0';
		if response_model_valid = '1' then
			model_store_we <= '1';
			model_store_din <= response_data;
			model_store_waddr <= std_logic_vector(response_index(LOG2_MAX_NUMFEATURES-4-1 downto 0));
		end if;


		allowed_new_column_read <= '0';
		residual_store_re <= '0';
		b_store_re <= '0';
		model_store_re <= '0';
		a1_fifo_we <= '0';
		a_fifo_we <= '0';
		if (response_a_valid = '1' and enable_decompression = '0') or decompressor_out_valid = '1' then
			a1_fifo_we <= '1';
			a1_fifo_din <= a_data;
			input_vector(0) <= a_data;

			model_store_raddr <= std_logic_vector(i_model_index(LOG2_MAX_NUMFEATURES-1 downto 4));
			i_model_mux <= to_integer(i_model_index(3 downto 0));
			if do_residual_update = '1' then
				model_store_re <= '1';	
			else
				if do_real_scd = '1' then
					if scd_phase = '1' then
						a_fifo_we <= '1';
						a_fifo_din <= a_data;
					else
						residual_store_re <= '1';
						b_store_re <= '1';
						residual_store_raddr <= std_logic_vector(i_receive_index);
						b_store_raddr <= std_logic_vector(i_receive_index);
					end if;
				else
					a_fifo_we <= '1';
					a_fifo_din <= a_data;
					residual_store_re <= '1';
					b_store_re <= '1';
					residual_store_raddr <= std_logic_vector(i_receive_index);
					b_store_raddr <= std_logic_vector(i_receive_index);
				end if;
			end if;

			if i_receive_index = iBATCH_SIZE-1 then
				i_receive_index <= (others => '0');
				if do_real_scd = '1' then
					if i_batch_index = iNUMBER_OF_BATCHES-1 then
						i_batch_index <= (others => '0');
						scd_phase <= not scd_phase;
					else
						i_batch_index <= i_batch_index + 1;
					end if;
					--if scd_phase = '0' then
					--	allowed_new_column_read <= '1';
					--end if;
				else
					if i_model_index = iNUMBER_OF_FEATURES-1 then
						i_model_index <= (others => '0');
					else
						i_model_index <= i_model_index + 1;
					end if;
					--allowed_new_column_read <= '1';
				end if;
			else
				i_receive_index <= i_receive_index + 1;
			end if;

			a_NumberOfReceivedReads <= a_NumberOfReceivedReads + 1;
		end if;


		residual_store_loading_re <= '0';
		if delta_almost_valid = '1' then
			residual_store_loading_re <= '1';
			residual_store_loading_raddr <= std_logic_vector(i_write_index);
			if i_write_index = iBATCH_SIZE-1 then
				i_write_index <= (others => '0');
			else
				i_write_index <= i_write_index + 1;
			end if;
		end if;


		step_writeback_valid <= '0';
		if new_residual_valid = '1' then
			if feature_update_index < iNUMBER_OF_FEATURES-1 then
				residual_store_we <= '1';
				residual_store_waddr <= std_logic_vector(i_update_index);
				residual_store_din <= new_residual;
			end if;
			residual_store_loading_we <= '1';
			residual_store_loading_waddr <= std_logic_vector(i_update_index);
			residual_store_loading_din <= new_residual;

			if i_update_index = iBATCH_SIZE-1 then
				i_update_index <= (others => '0');

				if do_real_scd = '1' then
					write_residual_back <= '1';
					if batch_update_index = iNUMBER_OF_BATCHES-1 then
						batch_update_index <= (others => '0');
						if feature_update_index = iNUMBER_OF_FEATURES-1 then
							feature_update_index <= (others => '0');
							if unsigned(iNUMBER_OF_FEATURES(3 downto 0)) > 0 then
								step_writeback_valid <= '1';
							end if;
						else
							feature_update_index <= feature_update_index + 1;
						end if;
					else
						batch_update_index <= batch_update_index + 1;
					end if;
					if scd_phase = '0' then
						allowed_new_column_read <= '1';
					end if;
				else
					if feature_update_index = iNUMBER_OF_FEATURES-1 then
						feature_update_index <= (others => '0');
						write_residual_back <= '1';
						if unsigned(iNUMBER_OF_FEATURES(3 downto 0)) > 0 then
							step_writeback_valid <= '1';
						end if;
					else
						feature_update_index <= feature_update_index + 1;
					end if;
					allowed_new_column_read <= '1';
				end if;
			else
				i_update_index <= i_update_index + 1;
			end if;
		end if;


		residual_writeback_re <= '0';
		if write_residual_back = '1' and write_request_almostfull = '0' and NumberOfPendingWrites < 220 then
			residual_store_loading_re <= '1';
			residual_writeback_re <= '1';
			residual_store_loading_raddr <= std_logic_vector(i_writeback_index);
			if i_writeback_index = iBATCH_SIZE-1 then
				i_writeback_index <= (others => '0');
				write_residual_back <= '0';
				if do_real_scd = '1' then
					allowed_new_column_read <= '1';
				end if;
			else
				i_writeback_index <= i_writeback_index + 1;
			end if;
		end if;
		residual_writeback_re_1d <= residual_writeback_re;


		epoch_start <= '0';
		write_request <= '0';
		if residual_writeback_re_1d = '1' then
			write_request <= '1';
			write_request_address <= std_logic_vector(unsigned(residual_address) + write_iBATCH_OFFSET + i_writerequest_index);
			write_request_data <= residual_store_loading_dout;

			residual_store_we <= '1';
			residual_store_waddr <= std_logic_vector(i_writerequest_index);
			residual_store_din <= (others => '0');
			residual_store_loading_we <= '1';
			residual_store_loading_waddr <= std_logic_vector(i_writerequest_index);
			residual_store_loading_din <= (others => '0');

			if i_writerequest_index = iBATCH_SIZE-1 then
				i_writerequest_index <= (others => '0');
				if do_real_scd = '1' then
					if write_batch_index = iNUMBER_OF_BATCHES-1 then
						write_batch_index <= (others => '0');
						finish_allowed <= '1';
					else
						write_batch_index <= write_batch_index + 1;
					end if;
				else
					finish_allowed <= '1';
				end if;
			else
				i_writerequest_index <= i_writerequest_index + 1;
			end if;
			residual_NumberOfWriteRequests <= residual_NumberOfWriteRequests + 1;
		end if;


		if step_valid_once = '1' then
			step_writeback( 32*(step_writeback_index+1)-1 downto 32*step_writeback_index ) <= step;
			if step_writeback_index = 15 then
				step_writeback_index <= 0;
				step_writeback_valid <= '1';
			else
				step_writeback_index <= step_writeback_index+1;
			end if;
		end if;
		if step_writeback_valid = '1' then
			step_writeback_index <= 0;
			write_request <= '1';
			write_request_address <= std_logic_vector(unsigned(step_address) + step_NumberOfWriteRequestsPerEpoch);
			write_request_data <= step_writeback;
			step_NumberOfWriteRequests <= step_NumberOfWriteRequests + 1;
			step_NumberOfWriteRequestsPerEpoch <= step_NumberOfWriteRequestsPerEpoch + 1;
		end if;


		if write_response = '1' then
			NumberOfWriteResponses <= NumberOfWriteResponses + 1;
		end if;


		if finish_allowed = '1' and NumberOfWriteResponses = (residual_NumberOfWriteRequests+step_NumberOfWriteRequests) and NumberOfWriteResponses > 0 then
			finish_allowed <= '0';

			if do_real_scd = '1' then
				if write_feature_index = iNUMBER_OF_FEATURES-1 then
					write_feature_index <= (others => '0');
					if completed_epochs = iNUMBER_OF_EPOCHS-1 then
						done <= '1';
					else
						epoch_start <= '1';
					end if;
					step_NumberOfWriteRequestsPerEpoch <= (others => '0');
					completed_epochs <= completed_epochs + 1;
				else
					write_feature_index <= write_feature_index + 1;
				end if;
			else
				if write_batch_index = iNUMBER_OF_BATCHES-1 then
					write_batch_index <= (others => '0');
					if completed_epochs = iNUMBER_OF_EPOCHS-1 then
						done <= '1';
					else
						epoch_start <= '1';
					end if;
					step_NumberOfWriteRequestsPerEpoch <= (others => '0');
					completed_epochs <= completed_epochs + 1;
				else
					write_batch_index <= write_batch_index + 1;
				end if;
			end if;
		end if;


		--if response_residual_valid = '1' and response_a_valid = '1' then
		--	timeout <= (others => '0');
		--else
		--	timeout <= timeout + 1;
		--end if;
		--if timeout > X"BEBC200" and timeout_occured = '0' then
		----if timeout > X"4000" and timeout_occured = '0' then -- Use during simulation
		--	NumberOfWriteResponses <= (others => '0');
		--	timeout_occured <= '1';
		--	write_request <= '1';
		--	write_request_address <= (others => '0');
		--	write_request_data(415 downto 0) <= 	B"000" & X"00000" & std_logic_vector(decompressor_out_fifo_free_count) &
		--											X"0000" & std_logic_vector(write_batch_index) &
		--											std_logic_vector(feature_update_index) &
		--											std_logic_vector(reorder_free_count) &
		--											X"0000" & std_logic_vector(completed_epochs) &
		--											std_logic_vector(NumberOfWriteResponses) &
		--											std_logic_vector(step_NumberOfWriteRequests) &
		--											std_logic_vector(residual_NumberOfWriteRequests) &
		--											std_logic_vector(a_NumberOfReceivedReads) &
		--											std_logic_vector(b_NumberOfReceivedReads) &
		--											std_logic_vector(residual_NumberOfReceivedReads) &
		--											std_logic_vector(NumberOfReceivedReads) &
		--											NumberOfRequestedReads;
		--end if;
		--if timeout_occured = '1' and NumberOfWriteResponses = 1 then
		--	done <= '1';
		--end if;

	end if;
end if;
end process;

end architecture;