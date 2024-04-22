library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.entropy_pkg.all;
use work.compressor_pkg.all;

entity sequence_reorder_buffer is
	port(
		clk					: in std_logic;
		reset_n				: in std_logic;
		
		start				: in std_logic;
		
		sequence_in			: in sequence_merged_t;
		sequence_last_in	: in std_logic;
		
		sequence_out		: out sequence_merged_t;
		sequence_last_out	: out std_logic
	);
	
end entity;

architecture rtl of sequence_reorder_buffer is
	constant SEQUENCE_DATA_WIDTH	: integer	:= (MAX_LITERAL_LENGTH_WIDTH + MAX_MATCH_LENGTH_WIDTH + MAX_OFFSET_WIDTH + ADDRESS_WIDTH);
	signal data_in					: std_logic_vector(SEQUENCE_DATA_WIDTH-1 downto 0);
	signal sequence_rd				: sequence_merged_t;
	signal data_out					: std_logic_vector(SEQUENCE_DATA_WIDTH-1 downto 0);
begin
	data_in							<= std_logic_vector(sequence_in.literal_length & sequence_in.match_length & sequence_in.match_offset & sequence_in.match_current_address);
	
	reorder_buffer0	: entity work.reorder_buffer
	generic map(
		DATA_WIDTH					=> SEQUENCE_DATA_WIDTH,
		STACK_SIZE					=> MAX_BLOCK_SEUQUENCE_NUM
	)
	port map(
		clk							=> clk,
		reset_n						=> reset_n,
		
		start						=> start,
		
		last_in						=> sequence_last_in,
		data_in						=> data_in,
		data_valid_in				=> sequence_in.sequence_valid,
		block_last_in				=> sequence_in.block_last,
		
		last_out					=> sequence_last_out,
		data_out					=> data_out,
		data_valid_out				=> sequence_rd.sequence_valid,
		block_last_out				=> sequence_rd.block_last
	);
	
	sequence_rd.match_current_address	<= unsigned(data_out(ADDRESS_WIDTH-1 downto 0));
	sequence_rd.match_offset			<= unsigned(data_out(ADDRESS_WIDTH+MAX_OFFSET_WIDTH-1 downto ADDRESS_WIDTH));
	sequence_rd.match_length			<= unsigned(data_out(ADDRESS_WIDTH+MAX_OFFSET_WIDTH+MAX_MATCH_LENGTH_WIDTH-1 downto ADDRESS_WIDTH+MAX_OFFSET_WIDTH));
	sequence_rd.literal_length			<= unsigned(data_out(ADDRESS_WIDTH+MAX_OFFSET_WIDTH+MAX_MATCH_LENGTH_WIDTH+MAX_LITERAL_LENGTH_WIDTH-1 downto ADDRESS_WIDTH+MAX_OFFSET_WIDTH+MAX_MATCH_LENGTH_WIDTH));
	
	sequence_out						<= sequence_rd;
end architecture;