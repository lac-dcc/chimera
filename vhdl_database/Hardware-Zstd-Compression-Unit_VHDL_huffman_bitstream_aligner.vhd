library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.compressor_pkg.all;
use work.entropy_pkg.all;

entity huffman_bitstream_aligner is	
	port(
		clk							: in std_logic;
		reset_n						: in std_logic;
		
		start						: in std_logic;
		
		huffman_merged_bitstream	: in huffman_merged_bitstream_t;
		huffman_last_in				: in std_logic;
		
		huffman_bitsream_final		: out huffman_bitsream_final_t;
		huffman_bitsream_last_out	: out std_logic
	);
end entity;

architecture rtl of huffman_bitstream_aligner is
	signal huffman_merged_bitstream_d		: huffman_merged_bitstream_t;
	signal huffman_merged_bitstream_d2		: huffman_merged_bitstream_t;
	signal huffman_merged_bitstream_d3		: huffman_merged_bitstream_t;
	signal huffman_merged_bitstream_d4		: huffman_merged_bitstream_t;
	
	signal huffman_bitsream_last_d				: std_logic;
	signal huffman_bitsream_last_d2				: std_logic;
	signal huffman_bitsream_last_d3				: std_logic;
	signal huffman_bitsream_last_d4				: std_logic;
	
	signal aligned_data						: std_logic_vector(huffman_bitsream_final.bitstream'length-1 downto 0);
begin
	
	process(clk)
	begin
		if(rising_edge(clk))then
			huffman_merged_bitstream_d			<= huffman_merged_bitstream;
			huffman_merged_bitstream_d2			<= huffman_merged_bitstream_d;
			huffman_merged_bitstream_d3			<= huffman_merged_bitstream_d2;
			huffman_merged_bitstream_d4			<= huffman_merged_bitstream_d3;
			
			huffman_bitsream_last_d				<= huffman_last_in;
			huffman_bitsream_last_d2			<= huffman_bitsream_last_d;
			huffman_bitsream_last_d3			<= huffman_bitsream_last_d2;
			huffman_bitsream_last_d4			<= huffman_bitsream_last_d3;
		end if;
	end process;
	
	aligner0 : entity work.aligner
	generic map(
		UNIT_WIDTH					=> 1,
		NUM_UNIT_INPUT				=> HUFFMAN_BITS_MERGED_NUM_MAX,
		NUM_UNIT_OUTPUT				=> HUFFMAN_BITSTREAM_FINAL_WIDTH,
		ALIGNED_LEFT				=> '0'   --set to 1 of aligned to the left, otherwise right
	)
	port map(
		clk 						=> clk,
		reset_n						=> reset_n,
		
		start						=> start,
		
		input_data					=> std_logic_vector(huffman_merged_bitstream_d.bitstream),
		input_data_valid			=> huffman_merged_bitstream_d.valid,
		input_num					=> huffman_merged_bitstream_d.bitstream_num,
		input_last					=> huffman_merged_bitstream_d.block_last,
		task_last_in                => huffman_bitsream_last_d,
		
		output_data 				=> aligned_data,
		output_data_valid			=> huffman_bitsream_final.valid,
		output_num					=> huffman_bitsream_final.bitstream_num,
		output_last 				=> huffman_bitsream_final.block_last,
		task_last_out               => huffman_bitsream_last_out
	);
	
	huffman_bitsream_final.bitstream	<= unsigned(aligned_data);
end architecture;