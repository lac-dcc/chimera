library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.arithmetic_pkg.all;
use work.entropy_pkg.all;
use work.compressor_pkg.all;

entity huffman2single_bitstream is
	port(
		clk								: in std_logic;
		reset_n							: in std_logic;
		
		start							: in std_logic;
		
		huffman_encoded					: in huffman_unaligend_code_t;
		last_in							: in std_logic;
		
		huffman_merged_bitstream		: out huffman_merged_bitstream_t;
		huffman_last_out				: out std_logic
	);
end entity;

--| lower address |										  | higher address				
--| code7 | code6 | code5 | code4 | code3 | code2 | code1 | code0 |
--| temp3_stream  | temp2_stream  | temp1_stream  | temp0_stream  |
--| 		temp4_stream		  |				temp5_stream	  |
--|							bitstream_all_merged				  |
architecture rtl of huffman2single_bitstream is
	--stage1
	constant TEMP0_STREAM_WIDTH				: integer := HUFF_NBIT_MAX *2;
	constant TEMP0_STREAM_BITS_NUM_WIDTH	: integer := work.arithmetic_pkg.clog2(TEMP0_STREAM_WIDTH+1);
	
	signal temp0_stream						: unsigned(TEMP0_STREAM_WIDTH-1 downto 0);
	signal temp0_stream_num_bits			: unsigned(TEMP0_STREAM_BITS_NUM_WIDTH-1 downto 0);
	
	signal temp1_stream						: unsigned(TEMP0_STREAM_WIDTH-1 downto 0);
	signal temp1_stream_num_bits			: unsigned(TEMP0_STREAM_BITS_NUM_WIDTH-1 downto 0);
	
	signal temp2_stream						: unsigned(TEMP0_STREAM_WIDTH-1 downto 0);
	signal temp2_stream_num_bits			: unsigned(TEMP0_STREAM_BITS_NUM_WIDTH-1 downto 0);
	
	signal temp3_stream						: unsigned(TEMP0_STREAM_WIDTH-1 downto 0);
	signal temp3_stream_num_bits			: unsigned(TEMP0_STREAM_BITS_NUM_WIDTH-1 downto 0);
	
	signal last_d							: std_logic;
	signal last_d2							: std_logic;
	signal last_d3							: std_logic;
	
	signal huffman_encoded_valid_d			: std_logic;
	signal huffman_encoded_valid_d2			: std_logic;
	signal huffman_encoded_valid_d3			: std_logic;
	
	signal huffman_encoded_block_last_d		: std_logic;
	signal huffman_encoded_block_last_d2	: std_logic;
	signal huffman_encoded_block_last_d3	: std_logic;
	
	--stage2
	constant TEMP4_STREAM_WIDTH				: integer := HUFF_NBIT_MAX *4;
	constant TEMP4_STREAM_BITS_NUM_WIDTH	: integer := work.arithmetic_pkg.clog2(TEMP4_STREAM_WIDTH+1);
	
	signal temp4_stream						: unsigned(TEMP4_STREAM_WIDTH-1 downto 0);
	signal temp4_stream_num_bits			: unsigned(TEMP4_STREAM_BITS_NUM_WIDTH-1 downto 0);
	
	signal temp5_stream						: unsigned(TEMP4_STREAM_WIDTH-1 downto 0);
	signal temp5_stream_num_bits			: unsigned(TEMP4_STREAM_BITS_NUM_WIDTH-1 downto 0);
	
	--stage3
	signal bitstream_all_merged				: unsigned(HUFFMAN_BITS_MERGED_NUM_MAX-1 downto 0);
	signal bitstream_all_merged_num_bits	: unsigned(HUFFMAN_BITS_MERGED_NUM_WIDTH-1 downto 0);
	
begin
	--stage1
	bitstream_2to1_merger0 : entity work.bitstream_2to1_merger
	generic map(
		BITSTREAM1_WIDTH_MAX			=> HUFF_NBIT_MAX,
		BITSTREAM2_WIDTH_MAX			=> HUFF_NBIT_MAX
	)
	port map(
		clk								=> clk,
		
		bitstream1						=> huffman_encoded.huff_encodes(1).encoded_bits,
		bitstream1_num_bits				=> huffman_encoded.huff_encodes(1).encoded_bits_num,
		
		bitstream2						=> huffman_encoded.huff_encodes(0).encoded_bits,
		bitstream2_num_bits				=> huffman_encoded.huff_encodes(0).encoded_bits_num,
		
		bitstream_merged				=> temp0_stream,
		bitstream_merged_num_bits		=> temp0_stream_num_bits
	);
	
	
	bitstream_2to1_merger1 : entity work.bitstream_2to1_merger
	generic map(
		BITSTREAM1_WIDTH_MAX			=> HUFF_NBIT_MAX,
		BITSTREAM2_WIDTH_MAX			=> HUFF_NBIT_MAX
	)
	port map(
		clk								=> clk,
		
		bitstream1						=> huffman_encoded.huff_encodes(3).encoded_bits,
		bitstream1_num_bits				=> huffman_encoded.huff_encodes(3).encoded_bits_num,
		
		bitstream2						=> huffman_encoded.huff_encodes(2).encoded_bits,
		bitstream2_num_bits				=> huffman_encoded.huff_encodes(2).encoded_bits_num,
		
		bitstream_merged				=> temp1_stream,
		bitstream_merged_num_bits		=> temp1_stream_num_bits
	);
	
	bitstream_2to1_merger2 : entity work.bitstream_2to1_merger
	generic map(
		BITSTREAM1_WIDTH_MAX			=> HUFF_NBIT_MAX,
		BITSTREAM2_WIDTH_MAX			=> HUFF_NBIT_MAX
	)
	port map(
		clk								=> clk,
		
		bitstream1						=> huffman_encoded.huff_encodes(5).encoded_bits,
		bitstream1_num_bits				=> huffman_encoded.huff_encodes(5).encoded_bits_num,
		
		bitstream2						=> huffman_encoded.huff_encodes(4).encoded_bits,
		bitstream2_num_bits				=> huffman_encoded.huff_encodes(4).encoded_bits_num,
		
		bitstream_merged				=> temp2_stream,
		bitstream_merged_num_bits		=> temp2_stream_num_bits
	);
	
	
	bitstream_2to1_merger3 : entity work.bitstream_2to1_merger
	generic map(
		BITSTREAM1_WIDTH_MAX			=> HUFF_NBIT_MAX,
		BITSTREAM2_WIDTH_MAX			=> HUFF_NBIT_MAX
	)
	port map(
		clk								=> clk,
		
		bitstream1						=> huffman_encoded.huff_encodes(7).encoded_bits,
		bitstream1_num_bits				=> huffman_encoded.huff_encodes(7).encoded_bits_num,
		
		bitstream2						=> huffman_encoded.huff_encodes(6).encoded_bits,
		bitstream2_num_bits				=> huffman_encoded.huff_encodes(6).encoded_bits_num,
		
		bitstream_merged				=> temp3_stream,
		bitstream_merged_num_bits		=> temp3_stream_num_bits
	);
	
	process(clk)
	begin
		if(rising_edge(clk))then
			last_d						<= last_in;
			last_d2						<= last_d;
			last_d3						<= last_d2;
			
			huffman_encoded_valid_d		<= huffman_encoded.valid;
			huffman_encoded_valid_d2	<= huffman_encoded_valid_d;
			huffman_encoded_valid_d3	<= huffman_encoded_valid_d2;
			
			huffman_encoded_block_last_d	<= huffman_encoded.block_last;
			huffman_encoded_block_last_d2	<= huffman_encoded_block_last_d;
			huffman_encoded_block_last_d3	<= huffman_encoded_block_last_d2;
		end if;
	end process;
	
	--stage2
	bitstream_2to1_merger4 : entity work.bitstream_2to1_merger
	generic map(
		BITSTREAM1_WIDTH_MAX			=> TEMP0_STREAM_WIDTH,
		BITSTREAM2_WIDTH_MAX			=> TEMP0_STREAM_WIDTH
	)
	port map(
		clk								=> clk,
		
		bitstream1						=> temp1_stream,
		bitstream1_num_bits				=> temp1_stream_num_bits,
		
		bitstream2						=> temp0_stream,
		bitstream2_num_bits				=> temp0_stream_num_bits,
		
		bitstream_merged				=> temp4_stream,
		bitstream_merged_num_bits		=> temp4_stream_num_bits
	);
	
	bitstream_2to1_merger5 : entity work.bitstream_2to1_merger
	generic map(
		BITSTREAM1_WIDTH_MAX			=> TEMP0_STREAM_WIDTH,
		BITSTREAM2_WIDTH_MAX			=> TEMP0_STREAM_WIDTH
	)
	port map(
		clk								=> clk,
		
		bitstream1						=> temp3_stream,
		bitstream1_num_bits				=> temp3_stream_num_bits,
		
		bitstream2						=> temp2_stream,
		bitstream2_num_bits				=> temp2_stream_num_bits,
		
		bitstream_merged				=> temp5_stream,
		bitstream_merged_num_bits		=> temp5_stream_num_bits
	);
	
	--stage3
	bitstream_2to1_merger6 : entity work.bitstream_2to1_merger
	generic map(
		BITSTREAM1_WIDTH_MAX			=> TEMP4_STREAM_WIDTH,
		BITSTREAM2_WIDTH_MAX			=> TEMP4_STREAM_WIDTH
	)
	port map(
		clk								=> clk,
		
		bitstream1						=> temp5_stream,
		bitstream1_num_bits				=> temp5_stream_num_bits,
		
		bitstream2						=> temp4_stream,
		bitstream2_num_bits				=> temp4_stream_num_bits,
		
		bitstream_merged				=> bitstream_all_merged,
		bitstream_merged_num_bits		=> bitstream_all_merged_num_bits
	);
	
	huffman_merged_bitstream.bitstream		<= bitstream_all_merged;
	huffman_merged_bitstream.bitstream_num	<= bitstream_all_merged_num_bits;
	huffman_merged_bitstream.valid			<= huffman_encoded_valid_d3;
	huffman_merged_bitstream.block_last		<= huffman_encoded_block_last_d3;
	huffman_last_out						<= last_d3;
	

end architecture;