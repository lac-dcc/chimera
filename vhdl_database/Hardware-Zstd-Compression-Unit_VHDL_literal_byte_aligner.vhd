library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.compressor_pkg.all;

entity literal_byte_aligner is
	port(
		clk									: in std_logic;
		reset_n								: in std_logic;
		
		start								: in std_logic;
		
		literal_byte_in 					: in literal_t;
		literal_byte_last					: in std_logic;
		
		literal_aligned_bytes_out			: out literal_aligned_bytes_t;
		literal_aligned_bytes_last			: out std_logic;

		literal_aligned_bytes_double_out	: out literal_aligned_doubled_bytes_t;
		literal_aligned_bytes_double_last	: out std_logic
	);
end entity;

architecture rtl of literal_byte_aligner is
	signal aligned_bytes_double		: literal_aligned_doubled_bytes_t;
	signal literal_byte_last_d		: std_logic;
	signal literal_byte_last_d2		: std_logic;
	signal literal_byte_last_d3		: std_logic;
	signal output_data_valid		: std_logic;
begin
	aligner0 : entity work.aligner
	generic map(
		UNIT_WIDTH				=> BITS_PER_BYTE,
		NUM_UNIT_INPUT			=> LITERAL_LENGTH_UNALIGNED_MAX,
		NUM_UNIT_OUTPUT			=> LITERAL_LENGTH_ALIGNED_MAX -- must be larger than NUM_UNIT_INPUT
	)
	port map(
		clk 					=> clk,
		reset_n					=> reset_n,
		
		start					=> start,	
		
		input_data				=> literal_byte_in.literal_data,
		input_data_valid		=> literal_byte_in.literal_valid,
		input_num				=> literal_byte_in.literal_length,
		input_last				=> literal_byte_last or literal_byte_in.block_last,
		task_last_in            => literal_byte_last,
		
		output_data 			=> literal_aligned_bytes_out.literal_data,
		output_data_valid		=> literal_aligned_bytes_out.literal_valid,
		output_num				=> literal_aligned_bytes_out.literal_length,
		output_last 			=> literal_aligned_bytes_out.block_last,
		task_last_out           => literal_aligned_bytes_last
	);
	
	aligner1 : entity work.aligner
	generic map(
		UNIT_WIDTH				=> BITS_PER_BYTE,
		NUM_UNIT_INPUT			=> LITERAL_LENGTH_UNALIGNED_MAX,
		NUM_UNIT_OUTPUT			=> LITERAL_LENGTH_ALIGNED_MAX*2 -- must be larger than NUM_UNIT_INPUT
	)
	port map(
		clk 					=> clk,
		reset_n					=> reset_n,
		
		start					=> start,	
		
		input_data				=> literal_byte_in.literal_data,
		input_data_valid		=> literal_byte_in.literal_valid,
		input_num				=> literal_byte_in.literal_length,
		input_last				=> literal_byte_last or literal_byte_in.block_last,
		task_last_in            => literal_byte_last,
		
		output_data 			=> aligned_bytes_double.literal_data,
		output_data_valid		=> aligned_bytes_double.literal_valid,
		output_num				=> aligned_bytes_double.literal_length,
		output_last 			=> aligned_bytes_double.block_last,
		task_last_out           => literal_aligned_bytes_double_last
	);
	
	process(clk)
	begin
		if(rising_edge(clk))then
			literal_byte_last_d		<= literal_byte_last;
			literal_byte_last_d2	<= literal_byte_last_d;
			literal_byte_last_d3	<= literal_byte_last_d2;
		end if;
	end process;
	
	process(all)
		variable i 				: integer;
	begin
		literal_aligned_bytes_double_out.literal_valid	<= aligned_bytes_double.literal_valid;
		literal_aligned_bytes_double_out.literal_length	<= aligned_bytes_double.literal_length;
		literal_aligned_bytes_double_out.block_last		<= aligned_bytes_double.block_last;
		for i in LITERAL_LENGTH_ALIGNED_MAX*2-1 downto 0 loop
			literal_aligned_bytes_double_out.literal_data(i*BITS_PER_BYTE+BITS_PER_BYTE-1 downto i*BITS_PER_BYTE)	<= aligned_bytes_double.literal_data((LITERAL_LENGTH_ALIGNED_MAX*2-1-i)*BITS_PER_BYTE+BITS_PER_BYTE-1 downto (LITERAL_LENGTH_ALIGNED_MAX*2-1-i)*BITS_PER_BYTE);
		end loop;
	end process;		
end architecture;