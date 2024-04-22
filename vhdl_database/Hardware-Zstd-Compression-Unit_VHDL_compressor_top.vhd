library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.compressor_pkg.all;
use work.entropy_pkg.all;

entity compressor_top is
	port(
		clk								: in std_logic;
		reset_n							: in std_logic;
		
		start							: in std_logic;
		hash_cleaned                    : out std_logic;
		
		almost_full						: out std_logic;
		
		data_in							: in std_logic_vector(INPUT_WIDTH*8-1 downto 0);
		data_valid_in					: in std_logic_vector(INPUT_WIDTH-1 downto 0);
		data_last_in					: in std_logic;	--whether it is the last line of the input data_in
		
		--output for hash match engines (for verification only)						
		
		--output for best match finder (for verification only)
		bmf_literal_data_out			: out literal_t;
		bmf_literal_last_out			: out std_logic;
		bmf_sequence_out				: out sequence_unmerged_t;
		bmf_sequence_last_out			: out std_logic;		
		
		--output for aligned literal byte (literal data without compression, for no-huffman-compression mode)
		literal_original_data_out		: out literal_aligned_doubled_bytes_t;
		literal_original_last_out		: out std_logic;
		
		--output for match merger (for verification only)
		mm_sequence_merged_out			: out sequence_merged_t;
		
		--the real output
		fse_bitsream_final_out			: out fse_bitsream_final_t;
		fse_bitsream_last_out			: out std_logic;
		
		huffman_bitsream_final_out		: out huffman_bitsream_final_t;
		huffman_bitsream_last_out		: out std_logic;
		
		--output of metadata
		fse_metadata_out				: out block_metadata_fse_t;
		fse_metadata_last_out			: out std_logic;
		
		huffman_metadata_out			: out block_metadata_huffman_t;
		huffman_metadata_last_out		: out std_logic;
		
		block_original_size_out			: out block_original_size_t
		
	);
end entity;
	
architecture rtl of compressor_top is
	--whether the valid bits in the hash tables are all set to low
	signal hash_cleaned_r           : std_logic;
	
	--signals for extention_buffer
	signal eb_data_out				: std_logic_vector(MAX_LOOK_UP_WIDTH * 2 * 8 - 1 downto 0);
	signal eb_data_this_out			: std_logic_vector(MAX_LOOK_UP_WIDTH * 8 - 1 downto 0);
	signal eb_data_next_out			: std_logic_vector(MAX_LOOK_UP_WIDTH * 8 - 1 downto 0);
	
	signal eb_valid_out				: std_logic_vector(MAX_LOOK_UP_WIDTH * 2 - 1 downto 0);
	signal eb_data_this_valid_out	: std_logic_vector(MAX_LOOK_UP_WIDTH - 1 downto 0);
	signal eb_data_next_valid_out	: std_logic_vector(MAX_LOOK_UP_WIDTH - 1 downto 0);
	signal eb_last_out				: std_logic;
	
	signal eb_insert				: std_logic_vector(INSERT_WIDTH*8-1 downto 0);
	signal eb_insert_valid			: std_logic;			
	
	--signals for the hash match engines
	signal hme_idle					: std_logic_vector(NUM_HASH_ENGINES-1 downto 0);
	signal hme_finish				: std_logic_vector(NUM_HASH_ENGINES-1 downto 0);

	signal hme_lookup_match			: matches_t;
	
    type hme_data_hist_t is array(NUM_HASH_ENGINES-1 downto 0) of std_logic_vector(INPUT_WIDTH*8-1 downto 0);
	signal hme_data_hist            : hme_data_hist_t;
	signal hme_data_hist_valid      : std_logic_vector(NUM_HASH_ENGINES-1 downto 0);
	
	type hme_data_t	is array(NUM_HASH_ENGINES-1 downto 0) of std_logic_vector(INPUT_WIDTH*2*8-1 downto 0);
	signal hme_data					: hme_data_t;
	
	type hme_lookup_current_addr_t is array(NUM_HASH_ENGINES-1 downto 0) of unsigned (ADDRESS_WIDTH-1 downto 0);
	signal hme_lookup_current_addr	: hme_lookup_current_addr_t;
	
	type hme_data_valid_t is array(NUM_HASH_ENGINES-1 downto 0) of std_logic_vector(INPUT_WIDTH-1 downto 0);
	signal hme_data_valid			: hme_data_valid_t;

	signal hme_data_last			: std_logic_vector(NUM_HASH_ENGINES-1 downto 0);

	--signals for best match finder
	signal bmf_literal_data			: literal_t;
	signal bmf_literal_last			: std_logic;
	signal bmf_sequence				: sequence_unmerged_t;
	signal bmf_sequence_last		: std_logic;
	signal bmf_data_lookup_next		: std_logic_vector(MAX_LOOK_UP_WIDTH*8-1 downto 0);
	
	--signals sequence_reorder_buffer
	signal srf_sequence_out			: sequence_merged_t;
	signal srf_sequence_last_out	: std_logic;
	
	--signals for match_merger
	signal mm_sequence_merged		: sequence_merged_t;
	signal mm_sequence_last_out		: std_logic;
	
	--buffer_between_stages0
	signal bbs_almost_full			: std_logic;
	signal bbs_sequence_out			: sequence_merged_t;
	
	--repeated_offset_checker0
	signal roc_sequence_out			: sequence_merged_t;
	signal roc_sequence_last_out	: std_logic;
	
	--fse_encoder0
	signal fe_sequence_encoded_bits	: sequence_encoded_bits_t;
	signal fe_sequence_last_out		: std_logic;
	
	--literal_byte_aligner0
	signal lba_literal_aligned_bytes_out	: literal_aligned_bytes_t;
	signal lba_literal_aligned_bytes_last	: std_logic;
	
	--huffman_reorder_buffer0
	signal hrb_literal_out			: literal_aligned_bytes_t;
	signal hrb_literal_last_out		: std_logic;
	
	--huffman_encoder
	signal he_huffman_encoded_out	: huffman_unaligend_code_t;
	signal he_last_out				: std_logic;
	
	--huffman2single_bitstream
	signal h2s_huffman_merged_bitstream	: huffman_merged_bitstream_t;
	signal h2s_huffman_last_out			: std_logic;
	
	--fse2single_bitstream0
	signal f2s_sequence_merged_bitstream	: sequence_merged_bitstream_t;
	signal f2s_sequence_last_out			: std_logic;
	
begin

	extention_buffer0 : entity work.extention_buffer
	port map(
		clk							=> clk,
		reset_n						=> reset_n,
		start						=> start,
		
		data_in						=> data_in,
		data_valid_in				=> data_valid_in,
		data_last_in				=> data_last_in,
		
		data_out					=> eb_data_out,
		data_valid_out				=> eb_valid_out,
		data_last_out				=> eb_last_out
	);
	
	eb_data_this_out		<= eb_data_out(MAX_LOOK_UP_WIDTH * 2 * 8 - 1 downto MAX_LOOK_UP_WIDTH * 8);
	eb_data_next_out		<= eb_data_out(MAX_LOOK_UP_WIDTH * 8 - 1 downto 0);
	eb_data_this_valid_out	<= eb_valid_out(MAX_LOOK_UP_WIDTH * 2 - 1 downto MAX_LOOK_UP_WIDTH);
	eb_data_next_valid_out	<= eb_valid_out(MAX_LOOK_UP_WIDTH  - 1 downto 0);
	eb_insert				<= eb_data_out(MAX_LOOK_UP_WIDTH * 2 * 8 - 1 downto (MAX_LOOK_UP_WIDTH * 2 - INSERT_WIDTH) * 8);
	eb_insert_valid			<= eb_valid_out(MAX_LOOK_UP_WIDTH * 2 - 1);
	
	GENERATE_HASH_MATCH_ENGINES	: for i in 0 to NUM_HASH_ENGINES-1 generate
	hash_match_engine0 : entity work.hash_match_engine
		generic map(
			LOOK_UP_WIDTH	=> (MAX_LOOK_UP_WIDTH-i)
		)
		port map(
			clk						=> clk,
			reset_n					=> reset_n,

			--some control signals
			start					=> start,		--a new job starts, a new should only start when the idle signal is high
			idle					=> hme_idle(i),	--whether the engine is ready to receive new job (the hash table is cleaned up)
			finish					=> hme_finish(i),	--whether all the data is processed by this module (after processing all the data, ready signal will still be low until cleaning up)
	
			--insert data input
			data_insert_in			=> eb_insert,
			data_insert_valid_in	=> eb_insert_valid,	--valid signal for data_in
	
			--look up data input
			data_lookup_in			=> eb_data_this_out(MAX_LOOK_UP_WIDTH*8-i*8-1 downto 0),
			data_lookup_valid_in	=> eb_data_this_valid_out(MAX_LOOK_UP_WIDTH-i-1 downto 0),
			data_lookup_last_in		=> eb_last_out,	--whether it is the last line of the input data_in
		
			--data to history buffer, 4 cycles earlier than the data_out
		    data_hist_out           => hme_data_hist(i),
		    data_hist_valid_out     => hme_data_hist_valid(i),
		
			--raw data output	--the same as the data_in, but delayed for several cycles
			data_out				=> hme_data(i)((INPUT_WIDTH*2-i)*8-1 downto 0), 
			data_valid_out			=> hme_data_valid(i),
			data_last_out			=> hme_data_last(i),
		
			-- lookup match output
			lookup_current_addr_out	=> hme_lookup_current_addr(i),
			lookup_match_out		=> hme_lookup_match(i)	
		);
	end generate GENERATE_HASH_MATCH_ENGINES;
	
	
	delayer0 : entity work.delayer
	generic map(
		DATA_WIDTH	=> MAX_LOOK_UP_WIDTH*8,
		STAGES		=> 7 -- stages of delay, should be at least 1
	)
	port map(
		clk			=> clk,
		data_in		=> eb_data_next_out,
		data_out	=> bmf_data_lookup_next
	);

	best_match_finder0 : entity work.best_match_finder
		generic map(
			HISTORY_BUFFER_WIDTH	=> 8
		)
		port map(
			clk 					=> clk,
			reset_n					=> reset_n,
		
			--some control signals
			start					=> start,		--a new job starts, a new should only start when the idle signal is high
		
			--the uncompressed data and the corresponding matches
			raw_data_in				=> hme_data(0),
			raw_data_next_in		=> bmf_data_lookup_next,
			raw_data_valid_in		=> hme_data_valid(0)(INPUT_WIDTH-1),
			raw_data_last_in		=> hme_data_last(0),
			matches_from_hash_in	=> hme_lookup_match,	--matches generated in hash match engines
			hash_current_addr_in	=> hme_lookup_current_addr(0), --the current address of the first hash match engine
		
			hist_data_in            => hme_data_hist(0),
			hist_data_valid_in      => hme_data_hist_valid(0),
		
			--output the uncompressed literal data
			literal_out				=> bmf_literal_data,
			literal_last_out		=> bmf_literal_last,
		
			--output the sequence(literal length, match length, match_address and match offset)
			sequence_out			=> bmf_sequence,
			sequence_last_out		=> bmf_sequence_last
		);
	

------------------------------------------------
---------Huffman processing streaming-----------
------------------------------------------------	
	literal_byte_aligner0 : entity work.literal_byte_aligner
	port map(
		clk									=> clk,
		reset_n								=> reset_n,
		
		start								=> start,	
		
		literal_byte_in 					=> bmf_literal_data,
		literal_byte_last					=> bmf_literal_last,
		
		literal_aligned_bytes_out			=> lba_literal_aligned_bytes_out,
		literal_aligned_bytes_last			=> lba_literal_aligned_bytes_last,
		
		literal_aligned_bytes_double_out	=> literal_original_data_out,
		literal_aligned_bytes_double_last	=> literal_original_last_out
	);
	
	huffman_reorder_buffer0 : entity work.huffman_reorder_buffer
	port map(
		clk								=> clk,
		reset_n							=> reset_n,
		
		start							=> start,
		
		literal_in						=> lba_literal_aligned_bytes_out,
		literal_last_in					=> lba_literal_aligned_bytes_last,
		
		literal_out						=> hrb_literal_out,
		literal_last_out				=> hrb_literal_last_out
	);
	
	huffman_encoder0 : entity work.huffman_encoder
	port map(
		clk								=> clk,
		reset_n							=> reset_n,
		
		start							=> start,
		
		aligned_huffman_bytes_in		=> hrb_literal_out,
		last_in							=> hrb_literal_last_out,
		
		huffman_encoded_out				=> he_huffman_encoded_out,
		last_out						=> he_last_out,
		
		huffman_metadata_out			=> huffman_metadata_out,
		huffman_metadata_last_out		=> huffman_metadata_last_out
	);
	
	huffman2single_bitstream0 : entity work.huffman2single_bitstream
	port map(
		clk								=> clk,
		reset_n							=> reset_n,
		
		start							=> start,
		
		huffman_encoded					=> he_huffman_encoded_out,
		last_in							=> he_last_out,
		
		huffman_merged_bitstream		=> h2s_huffman_merged_bitstream,
		huffman_last_out				=> h2s_huffman_last_out
	);
	
	huffman_bitstream_aligner0 : entity work.huffman_bitstream_aligner
	port map(
		clk								=> clk,
		reset_n							=> reset_n,
		
		start							=> start,
		
		huffman_merged_bitstream		=> h2s_huffman_merged_bitstream,
		huffman_last_in					=> h2s_huffman_last_out,
		
		huffman_bitsream_final			=> huffman_bitsream_final_out,
		huffman_bitsream_last_out		=> huffman_bitsream_last_out
	);

------------------------------------------------
-------Huffman processing streaming ends--------
------------------------------------------------

------------------------------------------------
-------------FSE processing streaming-----------
------------------------------------------------	
	

	
	match_merger0 : entity work.match_merger
	port map(
		reset_n 					=> reset_n,
		clk							=> clk,
		start						=> start,
		
		sequence_unmerged_in		=> bmf_sequence,
		sequence_last_in			=> bmf_sequence_last,
		
		sequence_merged_out			=> mm_sequence_merged,
		sequence_last_out			=> mm_sequence_last_out,
		
		block_original_size_out		=> block_original_size_out
	);
	
	repeated_offset_checker0 : entity work.repeated_offset_checker
	port map(
		clk							=> clk,
		reset_n						=> reset_n,
		
		start						=> start,
		
		sequence_in					=> mm_sequence_merged,
		sequence_last_in			=> mm_sequence_last_out,
		
		sequence_out				=> roc_sequence_out,
		sequence_last_out			=> roc_sequence_last_out
	);
	
	
	
	sequence_reorder_buffer0 : entity work.sequence_reorder_buffer
	port map (
		clk							=> clk,
		reset_n						=> reset_n,
		
		start						=> start,
		
		sequence_in					=> roc_sequence_out,
		sequence_last_in			=> roc_sequence_last_out,
		
		sequence_out				=> srf_sequence_out,
		sequence_last_out			=> srf_sequence_last_out
	);

	
	fse_encoder0 : entity work.fse_encoder
	port map(
		clk								=> clk,
		reset_n							=> reset_n,
		
		start							=> start,
		
		sequence_in						=> srf_sequence_out,
		sequence_last_in				=> srf_sequence_last_out,
		
		--output for literal_length
		sequence_encoded_bits			=> fe_sequence_encoded_bits,
		sequence_last_out				=> fe_sequence_last_out,
		
		fse_metadata_out				=> fse_metadata_out,
		fse_metadata_last_out			=> fse_metadata_last_out
	);
	
	
	fse2single_bitstream0 : entity work.fse2single_bitstream
	port map(
		clk								=> clk,
		reset_n							=> reset_n,
		
		start							=> start,
		
		sequence_encoded_bits			=> fe_sequence_encoded_bits,
		sequence_last_in				=> fe_sequence_last_out,
		
		sequence_merged_bitstream		=> f2s_sequence_merged_bitstream,
		sequence_last_out				=> f2s_sequence_last_out
	);
	
	fse_bitstream_aligner0 : entity work.fse_bitstream_aligner
	port map(
		clk								=> clk,
		reset_n							=> reset_n,
		
		start							=> start,
		
		sequence_merged_bitstream		=> f2s_sequence_merged_bitstream,
		sequence_last_in				=> f2s_sequence_last_out,
		
		fse_bitsream_final				=> fse_bitsream_final_out,
		fse_bitsream_last_out			=> fse_bitsream_last_out
	);
	
------------------------------------------------
----------FSE processing streaming ends---------
------------------------------------------------	
	
	
	process(clk)
	begin
	   if(rising_edge(clk))then
	       if(reset_n = '0')then
	           hash_cleaned_r      <= '0';
	       elsif(start = '1')then
	           hash_cleaned_r      <= '0';
	       elsif(hme_finish(0) = '1')then
	           hash_cleaned_r      <= '1';
	       end if;
	   end if;
	end process;
	hash_cleaned                <= hash_cleaned_r;
	
		
	bmf_literal_data_out		<= bmf_literal_data;
	bmf_literal_last_out 		<= bmf_literal_last;
	bmf_sequence_out 			<= bmf_sequence;
	bmf_sequence_last_out 		<= bmf_sequence_last;
	
	almost_full					<= bbs_almost_full;	
	
	mm_sequence_merged_out		<= mm_sequence_merged;
	
end architecture;