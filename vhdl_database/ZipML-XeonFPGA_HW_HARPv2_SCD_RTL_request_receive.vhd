--------------------------------------------------------------------------
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

entity request_receive is
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
end request_receive;

architecture behavioral of request_receive is

signal iNUMBER_OF_FEATURES : unsigned(LOG2_MAX_NUMFEATURES downto 0) := (others => '0');
signal iNUMBER_OF_OFFSET_LINES : unsigned(LOG2_MAX_NUMFEATURES-4 downto 0) := (others => '0');
signal iNUMBER_OF_BATCHES : unsigned(15 downto 0) := (others => '0');
signal iALLOWED_BATCH_TO_READ : unsigned(15 downto 0) := (others => '0');
signal iALLOWED_FEATURE_TO_READ : unsigned(LOG2_MAX_NUMFEATURES-1 downto 0) := (others => '0');
signal iBATCH_SIZE : unsigned(15 downto 0) := (others => '0');
signal iREAD_SIZE : unsigned(15 downto 0) := (others => '0');
signal iRECEIVE_SIZE : unsigned(15 downto 0) := (others => '0');
signal iBATCH_OFFSET : unsigned(31 downto 0) := (others => '0');
signal iCOLUMN_SIZE : unsigned(31 downto 0) := (others => '0');

-- 0 read column offsets, 1 read residual, 2 read b, 3 read a, 4 read model
signal read_state : std_logic_vector(2 downto 0) := (others => '0');
signal receive_state : std_logic_vector(2 downto 0) := (others => '0');

signal NumberOfPendingReads : unsigned(31 downto 0) := (others => '0');
signal NumberOfRequestedReads : unsigned(31 downto 0) := (others => '0');
signal residual_NumberOfRequestedReads : unsigned(31 downto 0) := (others => '0');
signal b_NumberOfRequestedReads : unsigned(31 downto 0) := (others => '0');
signal a_NumberOfRequestedReads : unsigned(31 downto 0) := (others => '0');
signal NumberOfReceivedReads : unsigned(31 downto 0) := (others => '0');
signal residual_NumberOfReceivedReads : unsigned(31 downto 0) := (others => '0');
signal model_NumberOfReceivedReads : unsigned(31 downto 0) := (others => '0');
signal b_NumberOfReceivedReads : unsigned(31 downto 0) := (others => '0');
signal a_NumberOfReceivedReads : unsigned(31 downto 0) := (others => '0');

signal offset_read_index : unsigned(LOG2_MAX_NUMFEATURES-4-1 downto 0) := (others => '0');
signal model_read_index : unsigned(LOG2_MAX_NUMFEATURES-4-1 downto 0) := (others => '0');
signal feature_index : unsigned(LOG2_MAX_NUMFEATURES-1 downto 0) := (others => '0');
signal feature_index_in_line : integer range 0 to 15;
signal feature_receive_index : unsigned(LOG2_MAX_NUMFEATURES-1 downto 0) := (others => '0');
signal batch_index : unsigned(15 downto 0) := (others => '0');
signal batch_receive_index : unsigned(15 downto 0) := (others => '0');
signal i_index : unsigned(15 downto 0) := (others => '0');
signal i_receive_index : unsigned(31 downto 0) := (others => '0');

signal new_column_read_allowed : std_logic;

signal column_offset_intermediate : unsigned(31 downto 0);

signal column_offset_raddr : std_logic_vector(LOG2_MAX_NUMFEATURES-4-1 downto 0);
signal column_offset_waddr : std_logic_vector(LOG2_MAX_NUMFEATURES-4-1 downto 0);
signal column_offset_din : std_logic_vector(511 downto 0);
signal column_offset_we : std_logic;
signal column_offset_dout : std_logic_vector(511 downto 0);

signal column_previous_readsize_raddr : std_logic_vector(LOG2_MAX_NUMFEATURES-4-1 downto 0);
signal column_previous_readsize_waddr : std_logic_vector(LOG2_MAX_NUMFEATURES-4-1 downto 0);
signal column_previous_readsize_din : std_logic_vector(511 downto 0);
signal column_previous_readsize_we : std_logic;
signal column_previous_readsize_dout : std_logic_vector(511 downto 0);

signal reorder_start_address_adjust : std_logic;
signal reorder_start_address : std_logic_vector(15 downto 0);
signal reordered_buffer_free_count : std_logic_vector(31 downto 0);
signal reordered_response_data : std_logic_vector(511 downto 0);
signal reordered_resonse : std_logic;

signal out_a_valid_internal : std_logic;
signal out_data_internal : std_logic_vector(511 downto 0);

signal AESDEC_CBC_length : unsigned(15 downto 0);
signal AESDEC_CBC_in_valid : std_logic;
signal AESDEC_CBC_in_data : std_logic_vector(511 downto 0);
signal AESDEC_CBC_out_valid : std_logic;
signal AESDEC_CBC_out_data : std_logic_vector(511 downto 0);

signal scd_phase : std_logic := '0';
signal scd_receive_phase : std_logic := '0';

component reorder
generic(
	LOG2_BUFFER_DEPTH : integer := 8;
	ADDRESS_WIDTH : integer := 32);
port (
	clk : in std_logic;
	resetn : in std_logic;
	start_address_adjust : std_logic;
	start_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	in_trigger : in std_logic;
	in_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	in_data : in std_logic_vector(511 downto 0);
	buffer_free_count : out std_logic_vector(31 downto 0);
	out_data : out std_logic_vector(511 downto 0);
	out_valid : out std_logic);
end component;

component AESDEC_CBC
port (
	clk : in std_logic;
	resetn : in std_logic;

	in_valid : in std_logic;
	in_data : in std_logic_vector(511 downto 0);
	in_length : in std_logic_vector(15 downto 0);

	program_key_index : in std_logic_vector(3 downto 0);
	program_key : in std_logic_vector(127 downto 0);

	out_valid : out std_logic;
	out_data : out std_logic_vector(511 downto 0));
end component;

component AESDEC_CBC_256bit
port (
	clk : in std_logic;
	resetn : in std_logic;

	in_valid : in std_logic;
	in_data : in std_logic_vector(511 downto 0);
	in_length : in std_logic_vector(15 downto 0);

	program_key_index : in std_logic_vector(3 downto 0);
	program_key : in std_logic_vector(127 downto 0);

	out_valid : out std_logic;
	out_data : out std_logic_vector(511 downto 0));
end component;

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

begin

requested_reads_count <= std_logic_vector(NumberOfRequestedReads);
reorder_free_count <= std_logic_vector(reordered_buffer_free_count);

reordering: reorder
generic map (
	LOG2_BUFFER_DEPTH => 8,
	ADDRESS_WIDTH => 16)
port map (
	clk => clk,
	resetn => resetn,
	start_address_adjust => reorder_start_address_adjust,
	start_address => reorder_start_address,
	in_trigger => read_response,
	in_address => read_response_tid,
	in_data => read_response_data,
	buffer_free_count => reordered_buffer_free_count,
	out_data => reordered_response_data,
	out_valid => reordered_resonse);

AESDEC_CBC_in_valid <= out_a_valid_internal when enable_decryption = '1' else '0';
AESDEC_CBC_in_data <= out_data_internal;
AESDEC_CBC_length <= iREAD_SIZE-1 when (read_size_from_memory = '1' and iREAD_SIZE > 0) else iREAD_SIZE;
AESDEC_CBC_inst: AESDEC_CBC_256bit
port map (
	clk => clk,
	resetn => resetn,

	in_valid => AESDEC_CBC_in_valid,
	in_data => AESDEC_CBC_in_data,
	in_length => std_logic_vector(AESDEC_CBC_length),

	program_key_index => program_key_index,
	program_key => program_key,

	out_valid => AESDEC_CBC_out_valid,
	out_data => AESDEC_CBC_out_data);
out_a_valid <= AESDEC_CBC_out_valid when enable_decryption = '1' else out_a_valid_internal;
out_data <= AESDEC_CBC_out_data when (AESDEC_CBC_out_valid = '1' and enable_decryption = '1') else out_data_internal;
---- Disable Decryption
--out_a_valid <= out_a_valid_internal;
--out_data <= out_data_internal;

column_offset_raddr <= std_logic_vector( feature_index(LOG2_MAX_NUMFEATURES-1 downto 4) );
column_offset_store: simple_dual_port_ram_single_clock
generic map (
	DATA_WIDTH => 512,
	ADDR_WIDTH => LOG2_MAX_NUMFEATURES-4)
port map (
	clk => clk,
	raddr => column_offset_raddr,
	waddr => column_offset_waddr,
	data => column_offset_din,
	we => column_offset_we,
	q => column_offset_dout);

column_previous_readsize_raddr <= std_logic_vector( feature_index(LOG2_MAX_NUMFEATURES-1 downto 4) );
column_previous_readsize_store: simple_dual_port_ram_single_clock
generic map (
	DATA_WIDTH => 512,
	ADDR_WIDTH => LOG2_MAX_NUMFEATURES-4)
port map (
	clk => clk,
	raddr => column_previous_readsize_raddr,
	waddr => column_previous_readsize_waddr,
	data => column_previous_readsize_din,
	we => column_previous_readsize_we,
	q => column_previous_readsize_dout);

feature_index_in_line <= to_integer(feature_index(3 downto 0));
process(clk)
begin
if clk'event and clk = '1' then
	iNUMBER_OF_FEATURES <= unsigned(number_of_features);
	iNUMBER_OF_BATCHES <= unsigned(number_of_batches);
	iALLOWED_BATCH_TO_READ <= unsigned(allowed_batch_to_read);
	iALLOWED_FEATURE_TO_READ <= unsigned(allowed_feature_to_read(LOG2_MAX_NUMFEATURES-1 downto 0));
	iBATCH_SIZE <= unsigned(batch_size);
	iBATCH_OFFSET <= batch_index*iBATCH_SIZE;
	iCOLUMN_SIZE <= iNUMBER_OF_BATCHES*iBATCH_SIZE;
	if iNUMBER_OF_FEATURES(3 downto 0) > 0 then
		iNUMBER_OF_OFFSET_LINES <= iNUMBER_OF_FEATURES(LOG2_MAX_NUMFEATURES downto 4) + 1;
	else
		iNUMBER_OF_OFFSET_LINES <= iNUMBER_OF_FEATURES(LOG2_MAX_NUMFEATURES downto 4);
	end if;

	out_data_internal <= reordered_response_data;

	NumberOfPendingReads <= NumberOfRequestedReads - (NumberOfReceivedReads + a_NumberOfReceivedReads);

	column_offset_intermediate <= 	unsigned( column_offset_dout( feature_index_in_line*32+31 downto feature_index_in_line*32 ) ) +
									unsigned( column_previous_readsize_dout( feature_index_in_line*32+31 downto feature_index_in_line*32 ) );

	if resetn = '0' or restart = '1' then
		read_request <= '0';

		iREAD_SIZE <= (others => '0');
		iRECEIVE_SIZE <= (others => '0');

		out_residual_valid <= '0';
		out_model_valid <= '0';
		out_b_valid <= '0';
		out_a_valid_internal <= '0';

		read_state <= B"000";
		receive_state <= B"000";

		NumberOfRequestedReads <= (others => '0');
		residual_NumberOfRequestedReads <= (others => '0');
		b_NumberOfRequestedReads <= (others => '0');
		a_NumberOfRequestedReads <= (others => '0');
		NumberOfReceivedReads <= (others => '0');
		residual_NumberOfReceivedReads <= (others => '0');
		model_NumberOfReceivedReads <= (others => '0');
		b_NumberOfReceivedReads <= (others => '0');
		a_NumberOfReceivedReads <= (others => '0');

		offset_read_index <= (others => '0');
		model_read_index <= (others => '0');
		feature_index <= (others => '0');
		feature_receive_index <= (others => '0');
		batch_index <= (others => '0');
		batch_receive_index <= (others => '0');
		i_index <= (others => '0');
		i_receive_index <= (others => '0');

		new_column_read_allowed <= '1';

		reorder_start_address_adjust <= '0';

		scd_phase <= '0';
		scd_receive_phase <= '0';
	else

		-- Request lines
		read_request <= '0';
		reorder_start_address_adjust <= '0';
		column_previous_readsize_we <= '0';
		if start = '1' and read_request_almostfull = '0'
			and batch_index <= iALLOWED_BATCH_TO_READ
			and feature_index <= iALLOWED_FEATURE_TO_READ
			and new_column_read_allowed = '1'
			and NumberOfPendingReads < unsigned(reordered_buffer_free_count)-20
			and NumberOfPendingReads < unsigned(external_free_count)-20
		then
			read_request <= '1';
			read_request_tid <= B"00" & std_logic_vector(NumberOfRequestedReads(13 downto 0));
			NumberOfRequestedReads <= NumberOfRequestedReads + 1;

			if NumberOfRequestedReads = 0 then
				reorder_start_address_adjust <= '1';
				reorder_start_address <= (others => '0');
			end if;

			if read_state = B"000" then
				read_request_address <= std_logic_vector(unsigned(a_address) + offset_read_index);
				read_request_length <= B"00";

				column_previous_readsize_we <= '1';
				column_previous_readsize_din <= (others => '0');
				column_previous_readsize_waddr <= std_logic_vector( offset_read_index );

				if offset_read_index = iNUMBER_OF_OFFSET_LINES-1 then
					offset_read_index <= (others => '0');
					new_column_read_allowed <= '0';

					--if do_residual_update = '1' then
					--	read_state <= B"100";
					--else
					--	read_state <= B"001";
					--end if;
					read_state <= B"100";

				else
					offset_read_index <= offset_read_index + 1;
				end if;
			elsif read_state = B"100" then --read model
				read_request_address <= std_logic_vector(unsigned(step_address) + batch_index*iNUMBER_OF_OFFSET_LINES + model_read_index);
				read_request_length <= B"00";
				
				if model_read_index = iNUMBER_OF_OFFSET_LINES-1 then
					model_read_index <= (others => '0');

					--read_state <= B"011";
					if do_residual_update = '1' then
						read_state <= B"011";
					else
						read_state <= B"001";
					end if;

				else
					model_read_index <= model_read_index + 1;
				end if;
			elsif read_state = B"001" then --read residual
				read_request_address <= std_logic_vector(unsigned(residual_address) + iBATCH_OFFSET + i_index);
				read_request_length <= B"00";
				residual_NumberOfRequestedReads <= residual_NumberOfRequestedReads + 1;

				if i_index = iBATCH_SIZE-1 then
					i_index <= (others => '0');
					if do_real_scd = '1' then
						if scd_phase = '1' then
							read_state <= B"011";
						else
							read_state <= B"010";
						end if;
					else
						read_state <= B"010";
					end if;
				else

					if (i_index+4) < iBATCH_SIZE-1 and enable_multiline = '1'
						and i_index(1 downto 0) = B"00"
						and residual_address(1 downto 0) = B"00"
						and iBATCH_OFFSET(1 downto 0) = B"00" then
						read_request_length <= B"11";
						i_index <= i_index + 4;
						NumberOfRequestedReads <= NumberOfRequestedReads + 4;
						residual_NumberOfRequestedReads <= residual_NumberOfRequestedReads + 4;
					elsif (i_index+2) < iBATCH_SIZE-1 and enable_multiline = '1'
						and i_index(0) = '0'
						and residual_address(0) = '0'
						and iBATCH_OFFSET(0) = '0' then
						read_request_length <= B"01";
						i_index <= i_index + 2;
						NumberOfRequestedReads <= NumberOfRequestedReads + 2;
						residual_NumberOfRequestedReads <= residual_NumberOfRequestedReads + 2;
					else
						read_request_length <= B"00";
						i_index <= i_index + 1;
					end if;
				end if;
			elsif read_state = B"010" then --read b
				read_request_address <= std_logic_vector(unsigned(b_address) + iBATCH_OFFSET + i_index);
				read_request_length <= B"00";
				b_NumberOfRequestedReads <= b_NumberOfRequestedReads + 1;

				if i_index = iBATCH_SIZE-1 then
					i_index <= (others => '0');
					read_state <= B"011";
				else

					if (i_index+4) < iBATCH_SIZE-1 and enable_multiline = '1'
						and i_index(1 downto 0) = B"00"
						and b_address(1 downto 0) = B"00"
						and iBATCH_OFFSET(1 downto 0) = B"00" then
						read_request_length <= B"11";
						i_index <= i_index + 4;
						NumberOfRequestedReads <= NumberOfRequestedReads + 4;
						b_NumberOfRequestedReads <= b_NumberOfRequestedReads + 4;
					elsif (i_index+2) < iBATCH_SIZE-1 and enable_multiline = '1'
						and i_index(0) = '0'
						and b_address(0) = '0'
						and iBATCH_OFFSET(0) = '0' then
						read_request_length <= B"01";
						i_index <= i_index + 2;
						NumberOfRequestedReads <= NumberOfRequestedReads + 2;
						b_NumberOfRequestedReads <= b_NumberOfRequestedReads + 2;
					else
						read_request_length <= B"00";
						i_index <= i_index + 1;
					end if;
				end if;
			else -- read a
				read_request_address(ADDRESS_WIDTH-1 downto 32) <= (others => '0');
				read_request_address(31 downto 0) <= std_logic_vector(column_offset_intermediate + i_index);
				read_request_length <= B"00";
				a_NumberOfRequestedReads <= a_NumberOfRequestedReads + 1;

				if read_size_from_memory = '1' then
					if i_index = 0 then
						new_column_read_allowed <= '0';
						iREAD_SIZE <= (others => '0');
					end if;
				else
					iREAD_SIZE <= iBATCH_SIZE;
				end if;

				if i_index = iREAD_SIZE-1 or iBATCH_SIZE = 1 then
					i_index <= (others => '0');

					column_previous_readsize_we <= '1';
					column_previous_readsize_waddr <= std_logic_vector( feature_index(LOG2_MAX_NUMFEATURES-1 downto 4) );
					column_previous_readsize_din <= column_previous_readsize_dout;
					column_previous_readsize_din(feature_index_in_line*32+31 downto feature_index_in_line*32) <= std_logic_vector( unsigned( column_previous_readsize_dout(feature_index_in_line*32+31 downto feature_index_in_line*32) ) + iREAD_SIZE );

					if do_real_scd = '1' then
						new_column_read_allowed <= '0';
						read_state <= B"001";
						if batch_index = iNUMBER_OF_BATCHES-1 then
							batch_index <= (others => '0');
							if scd_phase = '1' then
								scd_phase <= '0';
								feature_index <= feature_index + 1;
							else
								scd_phase <= '1';
								column_previous_readsize_din(feature_index_in_line*32+31 downto feature_index_in_line*32) <= (others => '0');
							end if;
						else
							batch_index <= batch_index + 1;
						end if;
					else
						new_column_read_allowed <= enable_staleness;
						if feature_index = iNUMBER_OF_FEATURES-1 then
							if do_residual_update = '0' then
								--read_state <= B"001";
								read_state <= B"100";
							end if;
							feature_index <= (others => '0');
							batch_index <= batch_index + 1;
						else
							feature_index <= feature_index + 1;
						end if;
					end if;
					
				else
					if signed(i_index+4) < signed(iREAD_SIZE-1) and enable_multiline = '1'
						and i_index(1 downto 0) = B"00"
						and column_offset_intermediate(1 downto 0) = B"00" then
						read_request_length <= B"11";
						i_index <= i_index + 4;
						NumberOfRequestedReads <= NumberOfRequestedReads + 4;
						a_NumberOfRequestedReads <= a_NumberOfRequestedReads + 4;
					elsif signed(i_index+2) < signed(iREAD_SIZE-1) and enable_multiline = '1'
						and i_index(0) = '0'
						and column_offset_intermediate(0) = '0' then
						read_request_length <= B"01";
						i_index <= i_index + 2;
						NumberOfRequestedReads <= NumberOfRequestedReads + 2;
						a_NumberOfRequestedReads <= a_NumberOfRequestedReads + 2;
					else
						read_request_length <= B"00";
						i_index <= i_index + 1;
					end if;
				end if;
			end if;
		end if;

		-- Receive lines
		column_offset_we <= '0';
		out_residual_valid <= '0';
		out_model_valid <= '0';
		out_b_valid <= '0';
		out_a_valid_internal <= '0';
		if reordered_resonse = '1' then
			out_index <= std_logic_vector(i_receive_index);

			if receive_state = B"000" then
				NumberOfReceivedReads <= NumberOfReceivedReads + 1;
				column_offset_we <= '1';
				column_offset_din <= reordered_response_data;
				column_offset_waddr <= std_logic_vector( i_receive_index(LOG2_MAX_NUMFEATURES-4-1 downto 0) );
				if i_receive_index = iNUMBER_OF_OFFSET_LINES-1 then
					i_receive_index <= (others => '0');
					new_column_read_allowed <= '1';

					--if do_residual_update = '1' then
					--	receive_state <= B"100";
					--else
					--	receive_state <= B"001";
					--end if;
					receive_state <= B"100";

				else
					i_receive_index <= i_receive_index + 1;
				end if;
			elsif receive_state = B"100" then --receive model
				NumberOfReceivedReads <= NumberOfReceivedReads + 1;
				out_model_valid <= '1';
				if i_receive_index = iNUMBER_OF_OFFSET_LINES-1 then
					i_receive_index <= (others => '0');

					--receive_state <= B"011";
					if do_residual_update = '1' then
						receive_state <= B"011";
					else
						receive_state <= B"001";
					end if;

				else
					i_receive_index <= i_receive_index + 1;
				end if;
				model_NumberOfReceivedReads <= model_NumberOfReceivedReads + 1;
			elsif receive_state = B"001" then --receive residual
				NumberOfReceivedReads <= NumberOfReceivedReads + 1;
				out_residual_valid <= '1';
				if i_receive_index = iBATCH_SIZE-1 then
					i_receive_index <= (others => '0');
					if do_real_scd = '1' then
						if scd_receive_phase = '1' then
							receive_state <= B"011";
						else
							receive_state <= B"010";
						end if;
					else
						receive_state <= B"010";
					end if;
				else
					i_receive_index <= i_receive_index + 1;
				end if;
				residual_NumberOfReceivedReads <= residual_NumberOfReceivedReads + 1;
			elsif receive_state = B"010" then --receive b
				NumberOfReceivedReads <= NumberOfReceivedReads + 1;
				out_b_valid <= '1';
				if i_receive_index = iBATCH_SIZE-1 then
					i_receive_index <= (others => '0');
					receive_state <= B"011";
				else
					i_receive_index <= i_receive_index + 1;
				end if;
				b_NumberOfReceivedReads <= b_NumberOfReceivedReads + 1;
			else --receive a

				if read_size_from_memory = '1' then
					if i_receive_index = 0 then
						new_column_read_allowed <= '1';
						iREAD_SIZE <= unsigned(reordered_response_data(15 downto 0));
						iRECEIVE_SIZE <= unsigned(reordered_response_data(15 downto 0));
					else
						out_a_valid_internal <= '1';
					end if;
				else
					iRECEIVE_SIZE <= iBATCH_SIZE;
					out_a_valid_internal <= '1';
				end if;

				if i_receive_index = iRECEIVE_SIZE-1 or iBATCH_SIZE = 1 then
					i_receive_index <= (others => '0');

					if do_real_scd = '1' then
						receive_state <= B"001";
						if batch_receive_index = iNUMBER_OF_BATCHES-1 then
							batch_receive_index <= (others => '0');
							if scd_receive_phase = '1' then
								scd_receive_phase <= '0';
								if feature_receive_index = iNUMBER_OF_FEATURES-1 then
									feature_receive_index <= (others => '0');
								else
									feature_receive_index <= feature_receive_index + 1;
								end if;
							else
								scd_receive_phase <= '1';
							end if;
						else
							batch_receive_index <= batch_receive_index + 1;
						end if;
					else
						if feature_receive_index = iNUMBER_OF_FEATURES-1 then
							if do_residual_update = '0' then
								--receive_state <= B"001";
								receive_state <= B"100";
							end if;
							feature_receive_index <= (others => '0');
							batch_receive_index <= batch_receive_index + 1;
						else
							feature_receive_index <= feature_receive_index + 1;
						end if;
					end if;
				else
					i_receive_index <= i_receive_index + 1;
				end if;

				--a_NumberOfReceivedReads <= a_NumberOfReceivedReads + 1;
			end if;
		end if;

		if (enable_decryption = '1' and AESDEC_CBC_out_valid = '1') or (enable_decryption = '0' and out_a_valid_internal = '1') then
			a_NumberOfReceivedReads <= a_NumberOfReceivedReads + 1;
		end if;

		if allowed_new_column_read = '1' then
			new_column_read_allowed <= '1';
		end if;

	end if;
end if;
end process;

end architecture;