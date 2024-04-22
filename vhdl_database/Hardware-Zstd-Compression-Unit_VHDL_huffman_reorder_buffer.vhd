library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.entropy_pkg.all;
use work.compressor_pkg.all;

entity huffman_reorder_buffer is
	port(
		clk					: in std_logic;
		reset_n				: in std_logic;
		
		start				: in std_logic;
		
		literal_in			: in literal_aligned_bytes_t;
		literal_last_in		: in std_logic;
		
		literal_out			: out literal_aligned_bytes_t;
		literal_last_out	: out std_logic
	);
end entity;

architecture rtl of huffman_reorder_buffer is
	constant SEQUENCE_DATA_WIDTH	: integer	:= LITERAL_LENGTH_ALIGNED_MAX*BITS_PER_BYTE + LITERAL_LENGTH_ALIGNED_MAX_WIDTH;
	signal data_in					: std_logic_vector(SEQUENCE_DATA_WIDTH-1 downto 0);
	signal literal_rd				: literal_aligned_bytes_t;
	signal data_out					: std_logic_vector(SEQUENCE_DATA_WIDTH-1 downto 0);
begin
	data_in							<= literal_in.literal_data & std_logic_vector(literal_in.literal_length);
	
	reorder_buffer0	: entity work.reorder_buffer
	generic map(
		DATA_WIDTH					=> SEQUENCE_DATA_WIDTH,
		STACK_SIZE					=> MAX_BLOCK_SIZE/8
	)
	port map(
		clk							=> clk,
		reset_n						=> reset_n,
		
		start						=> start,
		
		last_in						=> literal_last_in,
		data_in						=> data_in,
		data_valid_in				=> literal_in.literal_valid,
		block_last_in				=> literal_in.block_last,
		
		last_out					=> literal_last_out,
		data_out					=> data_out,
		data_valid_out				=> literal_rd.literal_valid,
		block_last_out				=> literal_rd.block_last
	);
	
	literal_rd.literal_length		<= unsigned(data_out(LITERAL_LENGTH_ALIGNED_MAX_WIDTH-1 downto 0));
	literal_rd.literal_data			<= data_out(LITERAL_LENGTH_ALIGNED_MAX*BITS_PER_BYTE + LITERAL_LENGTH_ALIGNED_MAX_WIDTH-1 downto LITERAL_LENGTH_ALIGNED_MAX_WIDTH);
	
	literal_out						<= literal_rd;
end architecture;