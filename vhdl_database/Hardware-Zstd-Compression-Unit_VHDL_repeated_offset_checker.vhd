library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.compressor_pkg.all;
use work.entropy_pkg.all;

entity repeated_offset_checker is
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

architecture rtl of repeated_offset_checker is
	signal repeated_offsets		: repeated_offset_t;
	signal updated_offset		: unsigned(MAX_OFFSET_WIDTH-1 downto 0);
	signal sequence_updated		: sequence_merged_t;
	signal sequence_last		: std_logic;
begin
	process(clk)
		variable repeated_offset_check_result : repeated_offset_check_result_t;
	begin
		if(rising_edge(clk))then
			if(sequence_last_in = '1' and sequence_in.sequence_valid = '1')then
				assert sequence_in.match_length = 0 report "the last sequence must be literal only" severity error;
			end if;
		
			repeated_offset_check_result 	:= update_offset(repeated_offsets, sequence_in.match_offset, sequence_in.literal_length);
			
			if(reset_n = '0')then
				repeated_offsets			<= (REPEATED_OFFSET1_INIT, REPEATED_OFFSET2_INIT, REPEATED_OFFSET3_INIT);
			elsif(start = '1')then
				repeated_offsets			<= (REPEATED_OFFSET1_INIT, REPEATED_OFFSET2_INIT, REPEATED_OFFSET3_INIT);
			elsif(sequence_in.sequence_valid = '1')then
				repeated_offsets			<= repeated_offset_check_result.offsets;
			end if;
			
			sequence_updated				<= sequence_in;
			sequence_updated.match_offset	<= repeated_offset_check_result.updated_offset;
			sequence_last					<= sequence_last_in;
		end if;
	end process;
	
	sequence_out							<= sequence_updated;
	sequence_last_out						<= sequence_last;
	
end architecture;