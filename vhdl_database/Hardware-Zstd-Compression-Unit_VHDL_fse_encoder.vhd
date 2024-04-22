library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.arithmetic_pkg.all;
use work.entropy_pkg.all;
use work.compressor_pkg.all;
use work.fse_tables_pkg.all;

entity fse_encoder is
	port(
		clk								: in std_logic;
		reset_n							: in std_logic;
		
		start							: in std_logic;
		
		sequence_in						: in sequence_merged_t;
		sequence_last_in				: in std_logic;
		
		--output for fse
		sequence_encoded_bits			: out sequence_encoded_bits_t;
		sequence_last_out				: out std_logic;
		
		--output for fse metadata		
		fse_metadata_out				: out block_metadata_fse_t;
		fse_metadata_last_out			: out std_logic
	);
	
end entity;

architecture rtl of fse_encoder is
	--stage1
	signal sequence_d					: sequence_merged_t;
	signal sequence_d2					: sequence_merged_t;
	signal sequence_d3					: sequence_merged_t;
	signal sequence_d4					: sequence_merged_t;
	signal sequence_d5					: sequence_merged_t;
	
	signal sequence_last_d				: std_logic;
	signal sequence_last_d2				: std_logic;
	signal sequence_last_d3				: std_logic;
	signal sequence_last_d4				: std_logic;
	signal sequence_last_d5				: std_logic;
	
	
	--stage2
	signal lit_length_encode			: lit_length_encode_t;
	signal match_length_encode			: match_length_encode_t;
	signal match_offset_encode			: match_offset_encode_t;
	
	--stage3
	signal ll_symbolTT_delta_find_state : ll_delta_find_state_t;
	signal ll_symbolTT_delta_nb_bits	: ll_delta_nb_bits_t;
	signal lit_length_encode_d			: lit_length_encode_t;
	
	signal ml_symbolTT_delta_find_state	: ml_delta_find_state_t;
	signal ml_symbolTT_delta_nb_bits	: ml_delta_nb_bits_t;
	signal match_length_encode_d		: match_length_encode_t;
	
	signal off_symbolTT_delta_find_state: off_delta_find_state_t;
	signal off_symbolTT_delta_nb_bits	: off_delta_nb_bits_t;
	signal match_offset_encode_d		: match_offset_encode_t;
	
	--stage4
	signal first_seq_flag				: std_logic;
	
	signal ll_state						: unsigned(LL_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
	signal ll_nbits_out					: unsigned(LL_STATE_TABLE_ELEMENT_WIDTH-1 downto 0);
	signal lit_length_encoded_bits		: lit_length_encoded_bits_t;
	
	signal ml_state						: unsigned(ML_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
	signal ml_nbits_out					: unsigned(ML_STATE_TABLE_ELEMENT_WIDTH-1 downto 0);
	signal match_length_encoded_bits	: match_length_encoded_bits_t;
	
	signal off_state					: unsigned(OFF_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
	signal off_nbits_out				: unsigned(OFF_STATE_TABLE_ELEMENT_WIDTH-1 downto 0);
	signal match_offset_encoded_bits	: match_offset_encoded_bits_t;
	
	--stage5
	signal lit_length_encoded_bits_masked	: lit_length_encoded_bits_t;
	signal match_length_encoded_bits_masked	: match_length_encoded_bits_t;
	signal match_offset_encoded_bits_masked	: match_offset_encoded_bits_t;
	
	signal ll_state_d					: unsigned(LL_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
	signal ml_state_d					: unsigned(ML_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
	signal off_state_d					: unsigned(OFF_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
	
	signal encoded_bits_count_clean_flag: std_logic;
	signal encoded_bits_count			: unsigned(MAX_BLOCK_BITS_SIZE_WIDTH-1 downto 0);
	signal fse_metadata_valid			: std_logic;
	
	---debug
	signal debug1						: integer;
	signal debug_ll_symbol_delta_find_state_table_aucm : ll_symbol_delta_find_state_table_t := ll_symbol_delta_find_state_table_aucm;
	signal debug_ll_encoded 			: FSE_encode_ll2bits_return_t;
	signal debug_mask					: unsigned(LL_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
begin
	--stage 1
	process(clk)
	begin
		if(rising_edge(clk))then
			sequence_d					<= sequence_in;
			sequence_d2					<= sequence_d;
			sequence_d3					<= sequence_d2;
			sequence_d4					<= sequence_d3;
			sequence_d5					<= sequence_d4;
			
			sequence_last_d				<= sequence_last_in;
			sequence_last_d2			<= sequence_last_d;
			sequence_last_d3			<= sequence_last_d2;
			sequence_last_d4			<= sequence_last_d3;
			sequence_last_d5			<= sequence_last_d4;
		end if;
	end process;

	--stage2
	process(clk)
	begin
		if(rising_edge(clk))then
			lit_length_encode		<= work.entropy_pkg.literal_len2code(sequence_d.literal_length);
			match_length_encode		<= work.entropy_pkg.match_len2code(sequence_d.match_length);
			match_offset_encode		<= work.entropy_pkg.match_off2code(sequence_d.match_offset);
		end if;
	end process;
	
	--stage3
	process(clk)
	begin
		if(rising_edge(clk))then
			---for literal length
			ll_symbolTT_delta_find_state		<= ll_symbol_delta_find_state_table_aucm(to_integer(lit_length_encode.code));
			ll_symbolTT_delta_nb_bits			<= ll_symbol_delta_nb_bits_table_aucm(to_integer(lit_length_encode.code));

			if(sequence_d2.sequence_valid = '1')then
				 assert lit_length_encode.code < LIT_LENGTH_CODE_MAX report "ll encoding wrong" severity error;
			end if;
			lit_length_encode_d					<= lit_length_encode;
			
			---for match length
			ml_symbolTT_delta_find_state		<= ml_symbol_delta_find_state_table_aucm(to_integer(match_length_encode.code));
			ml_symbolTT_delta_nb_bits			<= ml_symbol_delta_nb_bits_table_aucm(to_integer(match_length_encode.code));
			if(sequence_d2.sequence_valid = '1')then
				 assert match_length_encode.code < MATCH_LENGTH_CODE_MAX report "ml encoding wrong" severity error;
			end if;
			match_length_encode_d				<= match_length_encode;
			
			---for match offset length
			off_symbolTT_delta_find_state		<= off_symbol_delta_find_state_table_aucm(to_integer(match_offset_encode.code));
			off_symbolTT_delta_nb_bits			<= off_symbol_delta_nb_bits_table_aucm(to_integer(match_offset_encode.code));
			match_offset_encode_d				<= match_offset_encode;
			
		end if;
	end process;
	
	--stage4
	process(clk)
		variable ll_encoded : FSE_encode_ll2bits_return_t;
		variable ml_encoded : FSE_encode_ml2bits_return_t;
		variable off_encoded: FSE_encode_off2bits_return_t;
	begin
		if(rising_edge(clk))then
			if(reset_n = '0')then
				first_seq_flag		<= '0';
			elsif(start = '1')then
				first_seq_flag		<= '0';
			elsif(sequence_d3.sequence_valid = '1' and sequence_d3.block_last = '1')then
				first_seq_flag		<= '0';
			elsif(sequence_d3.sequence_valid = '1' and sequence_d3.match_length /= 0)then
				first_seq_flag		<= '1';
			end if;
			
			if(sequence_d3.sequence_valid = '1')then
				assert sequence_d3.match_length /= 0 report "get an literal only sequence" severity warning;
			end if;

			---for literal length
			if(first_seq_flag = '0')then
				ll_encoded 	:= work.fse_tables_pkg.fse_encode_ll_bits_init(ll_symbolTT_delta_find_state, ll_symbolTT_delta_nb_bits);
			else
				ll_encoded 	:= work.fse_tables_pkg.fse_encode_ll_bits(ll_state, ll_symbolTT_delta_find_state, ll_symbolTT_delta_nb_bits);
			end if;
			
			debug_ll_encoded		<= ll_encoded;
			
			if(sequence_d3.sequence_valid = '1' and sequence_d3.match_length /= 0)then
				ll_state	<= ll_encoded.updated_state;
			end if;
			
			ll_nbits_out	<= ll_encoded.nb_bits_out;
			
			--the last sequence is literal only, should not been processed
			if(sequence_d3.match_length /= 0)then
				lit_length_encoded_bits.code_bits_num		<= ll_encoded.nb_bits_out;
				lit_length_encoded_bits.stream_bits_num		<= lit_length_encode_d.stream_bits_num;
			else
				lit_length_encoded_bits.code_bits_num		<= (others => '0');
				lit_length_encoded_bits.stream_bits_num		<= (others => '0');
			end if;
			lit_length_encoded_bits.code_bits			<= ll_state;
			lit_length_encoded_bits.stream_bits			<= lit_length_encode_d.stream_bits;
			
			---for match length
			if(first_seq_flag = '0')then
				ml_encoded 	:= work.fse_tables_pkg.fse_encode_ml_bits_init(ml_symbolTT_delta_find_state, ml_symbolTT_delta_nb_bits);
			else
				ml_encoded 	:= work.fse_tables_pkg.fse_encode_ml_bits(ml_state, ml_symbolTT_delta_find_state, ml_symbolTT_delta_nb_bits);
			end if;
			
			if(sequence_d3.sequence_valid = '1' and sequence_d3.match_length /= 0)then
				ml_state	<= ml_encoded.updated_state;
			end if;
			
			ml_nbits_out	<= ml_encoded.nb_bits_out;
			
			--the last sequence is literal only, should not been processed
			if(sequence_d3.match_length /= 0)then
				match_length_encoded_bits.code_bits_num		<= ml_encoded.nb_bits_out;
				match_length_encoded_bits.stream_bits_num	<= match_length_encode_d.stream_bits_num;
			else
				match_length_encoded_bits.code_bits_num		<= (others => '0');
				match_length_encoded_bits.stream_bits_num	<= (others => '0');
			end if;
			match_length_encoded_bits.code_bits			<= ml_state;
			match_length_encoded_bits.stream_bits		<= match_length_encode_d.stream_bits;
			
			---for match offset
			if(first_seq_flag = '0')then
				off_encoded	:= work.fse_tables_pkg.fse_encode_off_bits_init(off_symbolTT_delta_find_state, off_symbolTT_delta_nb_bits);
			else
				off_encoded	:= work.fse_tables_pkg.fse_encode_off_bits(off_state, off_symbolTT_delta_find_state, off_symbolTT_delta_nb_bits);
			end if;
			
			if(sequence_d3.sequence_valid = '1' and sequence_d3.match_length /= 0)then
				off_state	<= off_encoded.updated_state;
			end if;
			
			off_nbits_out	<= off_encoded.nb_bits_out;
			
			--the last sequence is literal only, should not been processed
			if(sequence_d3.match_length /= 0)then
				match_offset_encoded_bits.code_bits_num		<= off_encoded.nb_bits_out;
				match_offset_encoded_bits.stream_bits_num	<= match_offset_encode_d.stream_bits_num;
			else
				match_offset_encoded_bits.code_bits_num		<= (others => '0');
				match_offset_encoded_bits.stream_bits_num	<= (others => '0');
			end if;
			match_offset_encoded_bits.code_bits			<= off_state;
			match_offset_encoded_bits.stream_bits		<= match_offset_encode_d.stream_bits;
		end if;
	end process;
	
	--stage 5
	--set redundent bits to 0
	process(clk)
		variable ll_code_mask		: unsigned(LL_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
		variable ml_code_mask		: unsigned(ML_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
		variable off_code_mask		: unsigned(OFF_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
		variable ll_stream_mask		: unsigned(LIT_LENGTH_NBITS_MAX-1 downto 0);
		variable ml_stream_mask		: unsigned(MATCH_LENGTH_NBITS_MAX-1 downto 0);
		variable off_stream_mask	: unsigned(MATCH_OFFSET_NBITS_MAX-1 downto 0);
 	begin
		if(rising_edge(clk))then
			ll_code_mask						:= (others => '1');
			ll_code_mask						:= shift_right(ll_code_mask, LL_STATE_TABLE_ELEMENT_NBITS-to_integer(lit_length_encoded_bits.code_bits_num));
			debug1								<= LL_STATE_TABLE_ELEMENT_NBITS-to_integer(lit_length_encoded_bits.code_bits_num);
			debug_mask							<= ll_code_mask;
			
			ml_code_mask						:= (others => '1');
			ml_code_mask						:= shift_right(ml_code_mask, ML_STATE_TABLE_ELEMENT_NBITS-to_integer(match_length_encoded_bits.code_bits_num));
			
			off_code_mask						:= (others => '1');
			off_code_mask						:= shift_right(off_code_mask, OFF_STATE_TABLE_ELEMENT_NBITS-to_integer(match_offset_encoded_bits.code_bits_num));
			
			ll_stream_mask						:= (others => '1');
			ll_stream_mask						:= shift_right(ll_stream_mask, LIT_LENGTH_NBITS_MAX-to_integer(lit_length_encoded_bits.stream_bits_num));
			
			ml_stream_mask						:= (others => '1');
			ml_stream_mask						:= shift_right(ml_stream_mask, MATCH_LENGTH_NBITS_MAX-to_integer(match_length_encoded_bits.stream_bits_num));
			
			off_stream_mask						:= (others => '1');
			off_stream_mask						:= shift_right(off_stream_mask, MATCH_OFFSET_NBITS_MAX-to_integer(match_offset_encoded_bits.stream_bits_num));
		
			lit_length_encoded_bits_masked					<= lit_length_encoded_bits;
			lit_length_encoded_bits_masked.code_bits		<= lit_length_encoded_bits.code_bits and ll_code_mask;
			lit_length_encoded_bits_masked.stream_bits		<= lit_length_encoded_bits.stream_bits and ll_stream_mask;
			
			match_length_encoded_bits_masked				<= match_length_encoded_bits;
			match_length_encoded_bits_masked.code_bits		<= match_length_encoded_bits.code_bits and ml_code_mask;
			match_length_encoded_bits_masked.stream_bits	<= match_length_encoded_bits.stream_bits and ml_stream_mask;
			
			match_offset_encoded_bits_masked				<= match_offset_encoded_bits;
			match_offset_encoded_bits_masked.code_bits		<= match_offset_encoded_bits.code_bits and off_code_mask;
			match_offset_encoded_bits_masked.stream_bits	<= match_offset_encoded_bits.stream_bits and off_stream_mask;
		end if;
	end process;
	
	process(clk)
	begin
		if(rising_edge(clk))then --accumulate the number of fse bits for each block
			if(reset_n = '0')then
				encoded_bits_count				<= (others => '0');
			elsif(start = '1')then
				encoded_bits_count				<= (others => '0');
			elsif(sequence_d4.sequence_valid = '1')then
				if(encoded_bits_count_clean_flag = '1')then
					encoded_bits_count				<= (resize(lit_length_encoded_bits.stream_bits_num, encoded_bits_count'length) + resize(lit_length_encoded_bits.code_bits_num, encoded_bits_count'length))
														+ (resize(match_length_encoded_bits.stream_bits_num, encoded_bits_count'length) + resize(match_length_encoded_bits.code_bits_num, encoded_bits_count'length)
														+ resize(match_offset_encoded_bits.stream_bits_num, encoded_bits_count'length) + resize(match_offset_encoded_bits.code_bits_num, encoded_bits_count'length));
				else
					encoded_bits_count				<= (encoded_bits_count + resize(lit_length_encoded_bits.stream_bits_num, encoded_bits_count'length) + resize(lit_length_encoded_bits.code_bits_num, encoded_bits_count'length))
														+ (resize(match_length_encoded_bits.stream_bits_num, encoded_bits_count'length) + resize(match_length_encoded_bits.code_bits_num, encoded_bits_count'length)
														+ resize(match_offset_encoded_bits.stream_bits_num, encoded_bits_count'length) + resize(match_offset_encoded_bits.code_bits_num, encoded_bits_count'length));
				end if;
			end if;
			
			if(reset_n = '0')then
				encoded_bits_count_clean_flag	<= '0';
			elsif(start = '1')then
				encoded_bits_count_clean_flag	<= '0';
			elsif(sequence_d4.sequence_valid = '1')then
				if(sequence_last_d4 = '1' or sequence_d4.block_last = '1')then
					encoded_bits_count_clean_flag	<= '1';
				else
					encoded_bits_count_clean_flag	<= '0';
				end if;
			end if;
			
			ll_state_d								<= ll_state;
			ml_state_d								<= ml_state;
			off_state_d								<= off_state;
			
			if((sequence_last_d4 = '1' or sequence_d4.block_last = '1') and sequence_d4.sequence_valid = '1')then
				fse_metadata_valid					<= '1';
			else
				fse_metadata_valid					<= '0';
			end if;
		end if;
	end process;
	
	sequence_encoded_bits.lit_length_encoded_bits				<= lit_length_encoded_bits_masked;
	sequence_encoded_bits.match_length_encoded_bits				<= match_length_encoded_bits_masked;
	sequence_encoded_bits.match_offset_encoded_bits				<= match_offset_encoded_bits_masked;
	sequence_encoded_bits.valid									<= sequence_d5.sequence_valid;
	sequence_encoded_bits.block_last							<= sequence_d5.block_last;
	sequence_last_out											<= sequence_last_d5;
	
	fse_metadata_out.valid										<= fse_metadata_valid;
	fse_metadata_out.fse_bits_cnt								<= encoded_bits_count;
	fse_metadata_out.ll_state_last								<= ll_state_d;
	fse_metadata_out.ml_state_last								<= ml_state_d;
	fse_metadata_out.off_state_last								<= off_state_d;
	fse_metadata_last_out										<= sequence_last_d5;

end architecture;