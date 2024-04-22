library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.compressor_pkg.all;
use work.entropy_pkg.all;

entity fse_bitstream_aligner is	
	port(
		clk							: in std_logic;
		reset_n						: in std_logic;
		
		start						: in std_logic;
		
		sequence_merged_bitstream	: in sequence_merged_bitstream_t;
		sequence_last_in			: in std_logic;
		
		fse_bitsream_final			: out fse_bitsream_final_t;
		fse_bitsream_last_out		: out std_logic
	);
end entity;

architecture rtl of fse_bitstream_aligner is
	signal sequence_merged_bitstream_d		: sequence_merged_bitstream_t;
	signal sequence_merged_bitstream_d2		: sequence_merged_bitstream_t;
	signal sequence_merged_bitstream_d3		: sequence_merged_bitstream_t;
	signal sequence_merged_bitstream_d4		: sequence_merged_bitstream_t;
	
	signal fse_bitsream_last_d				: std_logic;
	signal fse_bitsream_last_d2				: std_logic;
	signal fse_bitsream_last_d3				: std_logic;
	signal fse_bitsream_last_d4				: std_logic;
	
	signal aligned_data						: std_logic_vector(fse_bitsream_final.bitstream'length-1 downto 0);
begin
	
	process(clk)
	begin
		if(rising_edge(clk))then
			sequence_merged_bitstream_d			<= sequence_merged_bitstream;
			sequence_merged_bitstream_d2		<= sequence_merged_bitstream_d;
			sequence_merged_bitstream_d3		<= sequence_merged_bitstream_d2;
			sequence_merged_bitstream_d4		<= sequence_merged_bitstream_d3;
			
			fse_bitsream_last_d					<= sequence_last_in;
			fse_bitsream_last_d2				<= fse_bitsream_last_d;
			fse_bitsream_last_d3				<= fse_bitsream_last_d2;
			fse_bitsream_last_d4				<= fse_bitsream_last_d3;
		end if;
	end process;
	
	aligner0 : entity work.aligner
	generic map(
		UNIT_WIDTH					=> 1,
		NUM_UNIT_INPUT				=> SEQUENCE_BITS_MERGED_NUM_MAX,
		NUM_UNIT_OUTPUT				=> FSE_BITSTREAM_FINAL_WIDTH,
		ALIGNED_LEFT				=> '0'   --set to 1 of aligned to the left, otherwise right
	)
	port map(
		clk 						=> clk,
		reset_n						=> reset_n,
		
		start						=> start,
		
		input_data					=> std_logic_vector(sequence_merged_bitstream_d.bitstream),
		input_data_valid			=> sequence_merged_bitstream_d.valid,
		input_num					=> sequence_merged_bitstream_d.bitstream_num,
		input_last					=> sequence_merged_bitstream_d.block_last,
		task_last_in                => fse_bitsream_last_d,
		
		output_data 				=> aligned_data,
		output_data_valid			=> fse_bitsream_final.valid,
		output_num					=> fse_bitsream_final.bitstream_num,
		output_last 				=> fse_bitsream_final.block_last,
		task_last_out               => fse_bitsream_last_out
	);
	
	fse_bitsream_final.bitstream	<= unsigned(aligned_data);
end architecture;