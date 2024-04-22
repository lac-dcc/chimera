library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.arithmetic_pkg.all;
use work.entropy_pkg.all;
use work.compressor_pkg.all;

entity fse2single_bitstream is
	port(
		clk								: in std_logic;
		reset_n							: in std_logic;
		
		start							: in std_logic;
		
		sequence_encoded_bits			: in sequence_encoded_bits_t;
		sequence_last_in				: in std_logic;
		
		sequence_merged_bitstream		: out sequence_merged_bitstream_t;
		sequence_last_out				: out std_logic
	);
end entity;
 
--format of output data | 000...000 off_streambits ml_stream_bits ll_stream_bits ll_code_bits ml_code_bits off_code_bits |
architecture rtl of fse2single_bitstream is
	--stage1
	constant TEMP0_STREAM_WIDTH				: integer := MATCH_OFFSET_NBITS_MAX + MATCH_LENGTH_NBITS_MAX;
	constant TEMP0_STREAM_BITS_NUM_WIDTH	: integer := work.arithmetic_pkg.clog2(TEMP0_STREAM_WIDTH+1);
	
	constant TEMP1_STREAM_WIDTH				: integer := LIT_LENGTH_NBITS_MAX + LL_STATE_TABLE_ELEMENT_NBITS;
	constant TEMP1_STREAM_BITS_NUM_WIDTH	: integer := work.arithmetic_pkg.clog2(TEMP1_STREAM_WIDTH+1);
	
	constant TEMP2_STREAM_WIDTH				: integer := ML_STATE_TABLE_ELEMENT_NBITS + OFF_STATE_TABLE_ELEMENT_NBITS;
	constant TEMP2_STREAM_BITS_NUM_WIDTH	: integer := work.arithmetic_pkg.clog2(TEMP2_STREAM_WIDTH+1);
	
	signal temp0_stream						: unsigned(TEMP0_STREAM_WIDTH-1 downto 0);
	signal temp0_stream_num_bits			: unsigned(TEMP0_STREAM_BITS_NUM_WIDTH-1 downto 0);
	
	signal temp1_stream						: unsigned(TEMP1_STREAM_WIDTH-1 downto 0);
	signal temp1_stream_num_bits			: unsigned(TEMP1_STREAM_BITS_NUM_WIDTH-1 downto 0);
	
	signal temp2_stream						: unsigned(TEMP2_STREAM_WIDTH-1 downto 0);
	signal temp2_stream_num_bits			: unsigned(TEMP2_STREAM_BITS_NUM_WIDTH-1 downto 0);
	
	signal sequence_valid_d					: std_logic;
	signal sequence_valid_d2				: std_logic;
	signal sequence_valid_d3				: std_logic;
	
	signal sequence_block_last_d			: std_logic;
	signal sequence_block_last_d2			: std_logic;
	signal sequence_block_last_d3			: std_logic;
	
	signal sequence_last_d					: std_logic;
	signal sequence_last_d2					: std_logic;
	signal sequence_last_d3					: std_logic;
	
	--stage2
	signal temp2_stream_d					: unsigned(TEMP2_STREAM_WIDTH-1 downto 0);
	signal temp2_stream_num_bits_d			: unsigned(TEMP2_STREAM_BITS_NUM_WIDTH-1 downto 0);
	
	constant TEMP3_STREAM_WIDTH				: integer := TEMP0_STREAM_WIDTH + TEMP1_STREAM_WIDTH;
	constant TEMP3_STREAM_BITS_NUM_WIDTH	: integer := work.arithmetic_pkg.clog2(TEMP3_STREAM_WIDTH+1);
	
	signal temp3_stream						: unsigned(TEMP3_STREAM_WIDTH-1 downto 0);
	signal temp3_stream_num_bits			: unsigned(TEMP3_STREAM_BITS_NUM_WIDTH-1 downto 0);
	
	--stage3
	signal bitstream_all_merged				: unsigned(SEQUENCE_BITS_MERGED_NUM_MAX-1 downto 0);
	signal bitstream_all_merged_num_bits	: unsigned(SEQUENCE_BITS_MERGED_NUM_WIDTH-1 downto 0);
	
begin
	---stage 1
	process(clk)
	begin
		if(rising_edge(clk))then
			sequence_valid_d			<= sequence_encoded_bits.valid;
			sequence_valid_d2			<= sequence_valid_d;
			sequence_valid_d3			<= sequence_valid_d2;
			
			sequence_block_last_d		<= sequence_encoded_bits.block_last;
			sequence_block_last_d2		<= sequence_block_last_d;
			sequence_block_last_d3		<= sequence_block_last_d2;
			
			sequence_last_d				<= sequence_last_in;
			sequence_last_d2			<= sequence_last_d;
			sequence_last_d3			<= sequence_last_d2;
		end if;
	end process;
	
	--merge off_streambits and ml_stream_bits
	bitstream_2to1_merger0 : entity work.bitstream_2to1_merger
	generic map(
		BITSTREAM1_WIDTH_MAX			=> MATCH_OFFSET_NBITS_MAX,
		BITSTREAM2_WIDTH_MAX			=> MATCH_LENGTH_NBITS_MAX
	)
	port map(
		clk								=> clk,
		
		bitstream1						=> sequence_encoded_bits.match_offset_encoded_bits.stream_bits,
		bitstream1_num_bits				=> sequence_encoded_bits.match_offset_encoded_bits.stream_bits_num,
		
		bitstream2						=> sequence_encoded_bits.match_length_encoded_bits.stream_bits,
		bitstream2_num_bits				=> sequence_encoded_bits.match_length_encoded_bits.stream_bits_num,
		
		bitstream_merged				=> temp0_stream,
		bitstream_merged_num_bits		=> temp0_stream_num_bits
	);
	
	bitstream_2to1_merger1 : entity work.bitstream_2to1_merger
	generic map(
		BITSTREAM1_WIDTH_MAX			=> LIT_LENGTH_NBITS_MAX,
		BITSTREAM2_WIDTH_MAX			=> LL_STATE_TABLE_ELEMENT_NBITS
	)
	port map(
		clk								=> clk,
		
		bitstream1						=> sequence_encoded_bits.lit_length_encoded_bits.stream_bits,
		bitstream1_num_bits				=> sequence_encoded_bits.lit_length_encoded_bits.stream_bits_num,
		
		bitstream2						=> sequence_encoded_bits.lit_length_encoded_bits.code_bits,
		bitstream2_num_bits				=> sequence_encoded_bits.lit_length_encoded_bits.code_bits_num,
		
		bitstream_merged				=> temp1_stream,
		bitstream_merged_num_bits		=> temp1_stream_num_bits
	);
	
	bitstream_2to1_merger2 : entity work.bitstream_2to1_merger
	generic map(
		BITSTREAM1_WIDTH_MAX			=> ML_STATE_TABLE_ELEMENT_NBITS,
		BITSTREAM2_WIDTH_MAX			=> OFF_STATE_TABLE_ELEMENT_NBITS
	)
	port map(
		clk								=> clk,
		
		bitstream1						=> sequence_encoded_bits.match_length_encoded_bits.code_bits,
		bitstream1_num_bits				=> sequence_encoded_bits.match_length_encoded_bits.code_bits_num,
		
		bitstream2						=> sequence_encoded_bits.match_offset_encoded_bits.code_bits,
		bitstream2_num_bits				=> sequence_encoded_bits.match_offset_encoded_bits.code_bits_num,
		
		bitstream_merged				=> temp2_stream,
		bitstream_merged_num_bits		=> temp2_stream_num_bits
	);
	
	---stage2
	bitstream_2to1_merger3 : entity work.bitstream_2to1_merger
	generic map(
		BITSTREAM1_WIDTH_MAX			=> TEMP0_STREAM_WIDTH,
		BITSTREAM2_WIDTH_MAX			=> TEMP1_STREAM_WIDTH
	)
	port map(
		clk								=> clk,
		
		bitstream1						=> temp0_stream,
		bitstream1_num_bits				=> temp0_stream_num_bits,
		
		bitstream2						=> temp1_stream,
		bitstream2_num_bits				=> temp1_stream_num_bits,
		
		bitstream_merged				=> temp3_stream,
		bitstream_merged_num_bits		=> temp3_stream_num_bits
	);
	
	process(clk)
	begin
		if(rising_edge(clk))then
			temp2_stream_d				<= temp2_stream;
			temp2_stream_num_bits_d		<= temp2_stream_num_bits;
		end if;
	end process;
	
	---stage3
	
	bitstream_2to1_merger4 : entity work.bitstream_2to1_merger
	generic map(
		BITSTREAM1_WIDTH_MAX			=> TEMP3_STREAM_WIDTH,
		BITSTREAM2_WIDTH_MAX			=> TEMP2_STREAM_WIDTH
	)
	port map(
		clk								=> clk,
		
		bitstream1						=> temp3_stream,
		bitstream1_num_bits				=> temp3_stream_num_bits,
		
		bitstream2						=> temp2_stream_d,
		bitstream2_num_bits				=> temp2_stream_num_bits_d,
		
		bitstream_merged				=> bitstream_all_merged,
		bitstream_merged_num_bits		=> bitstream_all_merged_num_bits
	);
	
	sequence_merged_bitstream.bitstream				<= bitstream_all_merged;
	sequence_merged_bitstream.bitstream_num			<= bitstream_all_merged_num_bits;
	sequence_merged_bitstream.valid					<= sequence_valid_d3;
	sequence_merged_bitstream.block_last			<= sequence_block_last_d3;
	sequence_last_out								<= sequence_last_d3;
	
end architecture;