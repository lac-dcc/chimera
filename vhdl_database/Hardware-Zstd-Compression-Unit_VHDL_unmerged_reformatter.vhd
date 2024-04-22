library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.compressor_pkg.all;

--a module to transform unmerged sequence to 512 bit axi output
--no clk not logic, just rewrite
entity unmgered_reformatter is
	generic(
		C_M00_AXI_DATA_WIDTH	: integer:= 512
	);
	port(
		sequence_in 	: in sequence_unmerged_t;
		
		axi_data_out	: out std_logic_vector(C_M00_AXI_DATA_WIDTH-1 downto 0)
	);
end entity;

architecture rtl of unmgered_reformatter is
	signal axi_data					: std_logic_vector(C_M00_AXI_DATA_WIDTH-1 downto 0);
	signal data_reformatted			: std_logic_vector(7*32 -1 downto 0);
	signal sequence_valid_32b		: std_logic_vector(31 downto 0);
	signal sequence_valid_32b_se    : std_logic_vector(31 downto 0);
	signal literal_length_32b		: std_logic_vector(31 downto 0);
	signal literal_tail_length_32b	: std_logic_vector(31 downto 0);
	signal match_hist_length_32b	: std_logic_vector(31 downto 0);
	signal match_length_32b			: std_logic_vector(31 downto 0);
	signal match_offset_32b			: std_logic_vector(31 downto 0);
	signal match_current_address_32b: std_logic_vector(31 downto 0);
begin
    sequence_valid_32b_se           <= (0 => sequence_in.sequence_valid, others => '0');
	sequence_valid_32b				<= unsigned_to_32b_vector(unsigned(sequence_valid_32b_se));
							
	literal_length_32b				<= unsigned_to_32b_vector(sequence_in.literal_length);
	
	literal_tail_length_32b			<= unsigned_to_32b_vector(sequence_in.literal_tail_length);
	
	match_hist_length_32b			<= unsigned_to_32b_vector(sequence_in.match_hist_length);

	match_length_32b				<= unsigned_to_32b_vector(sequence_in.match_length);
	
	match_offset_32b				<= unsigned_to_32b_vector(sequence_in.match_offset);
	
	match_current_address_32b		<= unsigned_to_32b_vector(sequence_in.match_current_address);
	
	data_reformatted				<= (sequence_valid_32b & literal_length_32b & literal_tail_length_32b & match_hist_length_32b 
										& match_length_32b & match_offset_32b & match_current_address_32b);
	
	axi_data(7*32 -1 downto 0)		<= data_reformatted;
	axi_data(C_M00_AXI_DATA_WIDTH -1 downto 7*32)	<= (others	=> '0');
					
	axi_data_out	<= axi_data;
	
end architecture;