library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.compressor_pkg.all;

entity match_merger is
	port(
		reset_n 					: in std_logic;
		clk							: in std_logic;
		start						: in std_logic;
		
		sequence_unmerged_in		: in sequence_unmerged_t;
		sequence_last_in			: in std_logic; 
		
		sequence_merged_out			: out sequence_merged_t;
		sequence_last_out			: out std_logic;
		
		block_original_size_out		: out block_original_size_t
	);
end entity;
	
architecture rtl of match_merger is

	signal sequence_last_d			: std_logic;
	signal sequence_last_d2			: std_logic;
	signal sequence_last_d3			: std_logic;
	
	type sequence_unmerged_buff_t is record 
		sequence_valid				: std_logic;
		literal_length				: unsigned(MAX_LITERAL_LENGTH_WIDTH-1 downto 0);
		match_length				: unsigned(MAX_MATCH_LENGTH_WIDTH-1 downto 0);
		match_offset				: unsigned(MAX_OFFSET_WIDTH -1 downto 0);
		literal_tail_length			: unsigned(LITERAL_TAIL_LENGTH-1 downto 0);
		block_last					: std_logic; -- whether it is the last sequence of the block
	end record sequence_unmerged_buff_t;
	
	signal sequence_unmerged_buff	: sequence_unmerged_buff_t;
	signal sequence_last_stage2		: std_logic;
	signal sequence_last_stage2_d	: std_logic;
	signal sequence_last_stage3		: std_logic;
	
	signal sequence_unmerged_buff2	: sequence_unmerged_buff_t;
	
	signal sequence_merged_temp		: sequence_merged_t;
		
	signal sequence_unmerged_d		: sequence_unmerged_t;
	
	signal literal_tail_length_d	: unsigned(LITERAL_TAIL_LENGTH-1 downto 0);
	signal sequence_merged			: sequence_merged_t;
	
	signal block_original_size		: block_original_size_t;
	
	--some debug signals
	signal debug_is_fully_merge_hist	: std_logic;
	signal debug_is_merge_case_one		: std_logic;
	signal debug_is_merge_case_two		: std_logic;
	
begin

	process(clk)
	begin
		if(rising_edge(clk))then
			sequence_last_d			<= sequence_last_in;
			sequence_last_d2		<= sequence_last_d;
			sequence_last_d3		<= sequence_last_d2;
		end if;
	end process;


--------------------------------------------------------------------------------
----------first stage, buffer the input and pre-calculate some information------
--------------------------------------------------------------------------------
	process(clk)
	begin
		if(rising_edge(clk))then
			sequence_unmerged_d		<= sequence_unmerged_in;	
		end if;
	end process;
	
--------------------------------------------------------------------------------
----------second stage, eliminate tail-----
--------------------------------------------------------------------------------	
	process(clk)
	begin
		if(rising_edge(clk))then
			if(reset_n = '0')then
				sequence_unmerged_buff.sequence_valid 	<= '0';
			elsif(start = '1')then
				sequence_unmerged_buff.sequence_valid 	<= '0';
			elsif(sequence_unmerged_d.sequence_valid = '1')then
				sequence_unmerged_buff.sequence_valid 	<= '1';
			end if;
		end if;
	end process;
	
	--it is possible that the current sequence can be fully mergerd into the sequence_unmerged_buff
	--check a case of fully merge:
	--1. current sequence consists of only history match, no normal match, no literal
	--in this stage only check the first case
	--the last sequence must be literal-only sequence
	process(clk)
		variable is_fully_merge_hist				: std_logic; -- check the case 1 fully merge
	begin
		if(rising_edge(clk))then
			if(sequence_unmerged_d.match_hist_length /= 0 and sequence_unmerged_d.literal_length = 0 and sequence_unmerged_d.match_length = 0 and sequence_unmerged_buff.sequence_valid = '1')then
				is_fully_merge_hist						:= '1';
			else
				is_fully_merge_hist						:= '0';
			end if;
			
			debug_is_fully_merge_hist			<= is_fully_merge_hist;
						
			if(sequence_unmerged_d.sequence_valid = '1')then
				if(is_fully_merge_hist = '1')then
					sequence_unmerged_buff.match_length		<= sequence_unmerged_buff.match_length + sequence_unmerged_d.match_hist_length;
					sequence_unmerged_buff.match_offset		<= sequence_unmerged_buff.match_offset;
					sequence_unmerged_buff.block_last		<= sequence_unmerged_buff.block_last;
				else
					sequence_unmerged_buff.match_length		<= resize(sequence_unmerged_d.match_length, MAX_MATCH_LENGTH_WIDTH);
					sequence_unmerged_buff.match_offset		<= resize(sequence_unmerged_d.match_offset, MAX_OFFSET_WIDTH);
					sequence_unmerged_buff.block_last		<= sequence_unmerged_d.block_last;
				end if;
				
				if(is_fully_merge_hist = '1')then
					sequence_unmerged_buff.literal_length		<= sequence_unmerged_buff.literal_length;
				elsif(sequence_unmerged_buff.sequence_valid = '1')then
					sequence_unmerged_buff.literal_length		<= sequence_unmerged_d.literal_length + resize(sequence_unmerged_buff.literal_tail_length, MAX_LITERAL_LENGTH_WIDTH);		
				else
					sequence_unmerged_buff.literal_length		<= resize(sequence_unmerged_d.literal_length, MAX_LITERAL_LENGTH_WIDTH);
				end if;
				
				sequence_unmerged_buff.literal_tail_length	<= sequence_unmerged_d.literal_tail_length;
			end if;
			
			if(sequence_last_d2 = '1')then --if receive a last signal in the last cycle, check whether output an extra valid this cycle
				sequence_merged_temp.sequence_valid		<= '1';
				assert (sequence_unmerged_buff.literal_length /= 0) report "Last sequence must be all 0" severity error;
			elsif(sequence_unmerged_buff.sequence_valid /= '1')then
				sequence_merged_temp.sequence_valid 	<= '0';
			elsif(is_fully_merge_hist = '1')then
				sequence_merged_temp.sequence_valid		<= '0';
			else
				sequence_merged_temp.sequence_valid 	<= sequence_unmerged_d.sequence_valid;
			end if;
			
			--the last signal of this stage should be generated one cycle later
			sequence_last_stage2					<= sequence_last_d2;
			
			sequence_merged_temp.match_length		<= sequence_unmerged_buff.match_length + sequence_unmerged_d.match_hist_length;
			sequence_merged_temp.match_offset		<= sequence_unmerged_buff.match_offset;
			sequence_merged_temp.literal_length		<= sequence_unmerged_buff.literal_length;
			sequence_merged_temp.block_last			<= sequence_unmerged_buff.block_last;
		end if;
	end process;

--------------------------------------------------------------
----------third stage, finish merge----------------------------
---------------------------------------------------------------
	process(clk)
	begin
		if(rising_edge(clk))then
			if(reset_n = '0')then
				sequence_unmerged_buff2.sequence_valid <= '0';
			elsif(start = '1')then
				sequence_unmerged_buff2.sequence_valid <= '0';
			elsif(sequence_merged_temp.sequence_valid = '1')then
				sequence_unmerged_buff2.sequence_valid <= '1';
			end if;
		end if;
	end process;
	
	--check two case of merge
	--1.| literal(can be 0) | match | + | match | => | literal | match |  (if offsets are the same)
	--2.| literal | + | literal | match | => | literal | match | 
	--in both cases, there should not be output
	--since the last sequence is literal only, there must be some data stored in sequence_unmerged_buff2
	--when the "last" signal from the last stage comes
	process(clk)
		variable is_merge_case_one, is_merge_case_two	: std_logic;
	begin
		if(rising_edge(clk))then
			if(sequence_unmerged_buff2.sequence_valid = '1' and sequence_unmerged_buff2.match_length /= 0 and sequence_merged_temp.literal_length = 0 and sequence_merged_temp.match_length /= 0 and sequence_unmerged_buff2.match_offset = sequence_merged_temp.match_offset)then
				is_merge_case_one						:= '1';
			else
				is_merge_case_one						:= '0';
			end if;
			
			if(sequence_unmerged_buff2.sequence_valid = '1' and sequence_unmerged_buff2.match_length = 0)then
				is_merge_case_two						:= '1';
			else
				is_merge_case_two						:= '0';
			end if;
			
			debug_is_merge_case_one						<= is_merge_case_one;
			debug_is_merge_case_two						<= is_merge_case_two;
		
			if(sequence_last_stage2_d = '1')then
				sequence_merged.match_length			<= (others => '0');
				sequence_merged.literal_length			<= sequence_unmerged_buff2.literal_length;
			elsif(is_merge_case_one = '1')then
				sequence_merged.match_length			<= (others => '0');
				sequence_merged.literal_length			<= (others => '0');
			elsif(is_merge_case_two = '1')then
				sequence_merged.match_length			<= (others => '0');
				sequence_merged.literal_length			<= (others => '0');
			else
				sequence_merged.match_length			<= sequence_unmerged_buff2.match_length;
				sequence_merged.literal_length			<= sequence_unmerged_buff2.literal_length;
			end if;
			
			if(sequence_last_stage2_d = '1')then
				sequence_merged.sequence_valid			<= '1';
			elsif(is_merge_case_one = '1')then
				sequence_merged.sequence_valid			<= '0';
			elsif(is_merge_case_two = '1')then
				sequence_merged.sequence_valid			<= '0';
			elsif(sequence_unmerged_buff2.sequence_valid = '0')then
				sequence_merged.sequence_valid			<= '0';
			else
				sequence_merged.sequence_valid			<= sequence_merged_temp.sequence_valid;
			end if;
			
			sequence_merged.match_offset			<= sequence_unmerged_buff2.match_offset;
			sequence_merged.block_last				<= sequence_unmerged_buff2.block_last;
			
			sequence_last_stage2_d					<= sequence_last_stage2;
			sequence_last_stage3					<= sequence_last_stage2_d;
			
			if(sequence_merged_temp.sequence_valid = '1')then
				if(is_merge_case_one = '1')then
					sequence_unmerged_buff2.match_length	<= sequence_unmerged_buff2.match_length + sequence_merged_temp.match_length;
					sequence_unmerged_buff2.literal_length	<= sequence_unmerged_buff2.literal_length;
					sequence_unmerged_buff2.block_last		<= sequence_unmerged_buff2.block_last or sequence_merged_temp.block_last;
				elsif(is_merge_case_two = '1')then
					sequence_unmerged_buff2.match_offset	<= sequence_merged_temp.match_offset;
					sequence_unmerged_buff2.match_length	<= sequence_merged_temp.match_length;
					sequence_unmerged_buff2.literal_length	<= sequence_unmerged_buff2.literal_length + sequence_merged_temp.literal_length;
					sequence_unmerged_buff2.block_last		<= sequence_merged_temp.block_last;
				else
					sequence_unmerged_buff2.match_offset	<= sequence_merged_temp.match_offset;
					sequence_unmerged_buff2.block_last		<= sequence_merged_temp.block_last;
					sequence_unmerged_buff2.match_length	<= sequence_merged_temp.match_length;
					sequence_unmerged_buff2.literal_length	<= sequence_merged_temp.literal_length;
				end if;
			end if;
		end if;
	end process;

--stage4, this stage is only to generate block_original_size_t
	process(clk)
	begin
		if(rising_edge(clk))then
			if(reset_n = '0')then
				block_original_size.sequence_num			<= (others => '0');
				block_original_size.litreal_byte_num		<= (others => '0');
			elsif(start = '1')then
				block_original_size.sequence_num			<= (others => '0');
				block_original_size.litreal_byte_num		<= (others => '0');
			elsif(block_original_size.valid = '1')then
				if(sequence_merged.sequence_valid = '1')then
					block_original_size.sequence_num		<= to_unsigned(1, block_original_size.sequence_num'length);
					block_original_size.litreal_byte_num	<= resize(sequence_merged.literal_length, block_original_size.litreal_byte_num'length);
				else
					block_original_size.sequence_num		<= (others => '0');
					block_original_size.litreal_byte_num	<= (others => '0');
				end if;
			elsif(sequence_merged.sequence_valid = '1')then
				block_original_size.sequence_num			<= block_original_size.sequence_num + to_unsigned(1, block_original_size.sequence_num'length);
				block_original_size.litreal_byte_num		<= block_original_size.litreal_byte_num + sequence_merged.literal_length;
			end if;
		end if;
	end process;
	
	process(clk)
	begin
		if(rising_edge(clk))then
			if(reset_n = '0')then
				block_original_size.valid			<= '0';
			elsif(start = '1')then
				block_original_size.valid			<= '0';
			elsif(sequence_merged.sequence_valid = '1' and (sequence_merged.block_last = '1' or sequence_last_stage3 = '1'))then
				block_original_size.valid			<= '1';
			else
				block_original_size.valid			<= '0';
			end if;
		end if;
	end process;


	sequence_merged_out									<= sequence_merged;
	sequence_last_out									<= sequence_last_stage3;
	block_original_size_out								<= block_original_size;
--------------------------------------------------------------------------------
----------debug-----
--------------------------------------------------------------------------------
--	process(clk)
--	begin
--		if(rising_edge(clk))then
			
--		end if;
--	end process;


end architecture;