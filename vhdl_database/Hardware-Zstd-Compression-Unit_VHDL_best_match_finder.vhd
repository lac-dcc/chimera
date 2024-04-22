library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.compressor_pkg.all;

--Rule to handle the last slice
--In Zstd compression software, it seems that the compression must end up with a literal only sequence
--In hardware, i inherite this feature, for the last 3 slice: .....| third last slice | second last slice | last slice |
--I have some special limit on it: the third last slice is treated as normal one, and the match from this slice can be extended to the second slice
--We do not try to find a match from the second last slice and the last slice
--if we find a slice from the third slice to the end of second last slice, we do not try to trigger history match engine 
--the last slice can be not completely full, but should contain at least 1 byte

entity best_match_finder is
	generic(
		HISTORY_BUFFER_WIDTH	: integer := 8 --output width of history buffer in bytes
	);
	port(
		clk 		: in std_logic;
		reset_n		: in std_logic;
		
		--some control signals
		start					: in std_logic;		--a new job starts, a new should only start when the idle signal is high
		
		--the uncompressed data and the corresponding matches
		raw_data_in				: in std_logic_vector(INPUT_WIDTH*2*8-1 downto 0);
		raw_data_next_in		: in std_logic_vector(INPUT_WIDTH*2*8-1 downto 0);
		raw_data_valid_in		: in std_logic;
		raw_data_last_in		: in std_logic;
		matches_from_hash_in	: in matches_t;	--matches generated in hash match engines
		hash_current_addr_in	: in unsigned(ADDRESS_WIDTH-1 downto 0); --the current address of the first hash match engine
		
		hist_data_in			: in std_logic_vector(INPUT_WIDTH*8-1 downto 0);  
		hist_data_valid_in		: in std_logic;
		
		--output the uncompressed literal data
		literal_out				: out literal_t;
		literal_last_out		: out std_logic;
		
		--output the sequence(literal length, match length, match_address and match offset)
		sequence_out			: out sequence_unmerged_t;
		sequence_last_out		: out std_logic
	);
end entity;

architecture rtl of best_match_finder is
	constant HIST_ENGINE_ADDR_WIDTH : integer := work.arithmetic_pkg.clog2(HISTORY_DEPTH);
	constant HISTORY_BUFFER_WIDTH_LOG : integer := work.arithmetic_pkg.clog2(HISTORY_BUFFER_WIDTH);

	constant NUM_HASH_ENGINES_LOG	: integer := work.arithmetic_pkg.clog2(NUM_HASH_ENGINES);
	
	constant TIME_EXTEND			: integer:= 4; --how many time the input data is extended
	constant TIME_EXTEND_WIDTH		: integer:= work.arithmetic_pkg.clog2(TIME_EXTEND+1);
	
	--stage1
	signal matches_from_hash_d		: matches_t;
	signal matches_from_hash_valid	: matches_t;
	signal hash_current_addr_d		: unsigned (ADDRESS_WIDTH-1 downto 0);
	
	signal raw_data_d				: std_logic_vector(INPUT_WIDTH*2*8-1 downto 0);
	signal raw_data_d2				: std_logic_vector(INPUT_WIDTH*2*8-1 downto 0);
	signal raw_data_d3				: std_logic_vector(INPUT_WIDTH*2*8-1 downto 0);
	signal raw_data_d4				: std_logic_vector(INPUT_WIDTH*2*8-1 downto 0);
	signal raw_data_d5				: std_logic_vector(INPUT_WIDTH*2*8-1 downto 0);
	
	signal raw_data_next_d			: std_logic_vector(INPUT_WIDTH*2*8-1 downto 0);
	signal raw_data_next_d2			: std_logic_vector(INPUT_WIDTH*2*8-1 downto 0);
	signal raw_data_next_d3			: std_logic_vector(INPUT_WIDTH*2*8-1 downto 0);
	signal raw_data_next_d4			: std_logic_vector(INPUT_WIDTH*2*8-1 downto 0);
	signal raw_data_next_d5			: std_logic_vector(INPUT_WIDTH*2*8-1 downto 0);
	
	signal raw_data_last_d			: std_logic;
	signal raw_data_last_d2			: std_logic;
	signal raw_data_last_d3			: std_logic;	
	signal raw_data_last_d4			: std_logic;
	signal raw_data_last_d5			: std_logic;
	signal raw_data_last_d6			: std_logic;
	
	signal raw_data_valid_d			: std_logic;
	signal raw_data_valid_d2		: std_logic;	
	signal raw_data_valid_d3		: std_logic;
	signal raw_data_valid_d4		: std_logic;
	signal raw_data_valid_d5		: std_logic;
	signal raw_data_valid_d6		: std_logic;
	
	type hash_engine_offset_t is array(NUM_HASH_ENGINES -1 downto 0) of unsigned(ADDRESS_WIDTH-1 downto 0);
	signal hash_engine_offset		: hash_engine_offset_t;
	
	--stage2
	signal hash_current_addr_d2		: unsigned (ADDRESS_WIDTH-1 downto 0);
	signal matches_from_hash_d2		: matches_t;
	type hist_engine_addresses_t is array(NUM_HASH_ENGINES -1 downto 0) of unsigned(HIST_ENGINE_ADDR_WIDTH-1 downto 0);
	signal hist_engine_addresses	: hist_engine_addresses_t; 
	
	type hist_engine_shift_t is array(NUM_HASH_ENGINES -1 downto 0) of unsigned(HISTORY_BUFFER_WIDTH_LOG-1 downto 0);
	signal hist_engine_shift 		: hist_engine_shift_t;
	
	type match_remainds_t	is array(NUM_HASH_ENGINES -1 downto 0) of unsigned(MATCH_REMAIND_WIDTH-1 downto 0);
	signal match_remainds			: match_remainds_t;

	signal hist_req_vector			: std_logic_vector(NUM_HASH_ENGINES-1 downto 0); --whether the match need to invoke history match
	
	--stage3
	type hist_ack_state_t is (HIST_ACK_INITIAL, HIST_ACK_GAP, HIST_ACK_WAITING);
	signal hist_ack_state_w			: hist_ack_state_t;
	signal hist_ack_state_r			: hist_ack_state_t;
	
	signal hash_current_addr_d3		: unsigned(ADDRESS_WIDTH-1 downto 0);
	signal matches_from_hash_d3		: matches_t;
	signal unmerged_seq_valid		: std_logic;
	signal match_remainds_d			: match_remainds_t;
	signal hist_match_valid			: std_logic;

	--the input bandwidth is 4 Bytes, the max match length is longer
	--so it is possible that the last match cannot be processed in one cycle,
	--therefore, we need a signal to record choice to the next cycle
	signal match_selector			: unsigned(MATCH_REMAIND_WIDTH-1 downto 0);
	signal remainder_selected_length: unsigned(MATCH_REMAIND_WIDTH-1 downto 0); -- length of remainding match from the previous match
	signal remainder_selected_length_d	: unsigned(MATCH_REMAIND_WIDTH-1 downto 0);

	signal hist_match_selector_d	: unsigned(MATCH_REMAIND_WIDTH-1 downto 0);
	signal hist_match_remainding_d	: unsigned(MATCH_REMAIND_WIDTH-1 downto 0);
	signal hist_match_valid_d		: std_logic;
	signal hist_match_ack			: std_logic;
	signal hist_match_valid_done	: std_logic;
	signal hist_match_length		: unsigned(HASH_TABLE_HIS_WIDTH_LOG downto 0);
	signal hist_match_next			: std_logic;

	--stage4
	signal literal_data				: std_logic_vector(LITERAL_LENGTH_UNALIGNED_MAX*8-1 downto 0); --the valid bytes starts from the leftmost byte
	signal literal_data_length		: unsigned(LITERAL_LENGTH_UNALIGNED_MAX_WIDTH-1 downto 0); --length of valid raw data in this cycle 
	signal literal_data_valid		: std_logic;
	signal sequence_unmerged		: sequence_unmerged_t;
	signal matches_from_hash_d4		: matches_t;
	signal hash_current_addr_d4		: unsigned (ADDRESS_WIDTH-1 downto 0);
	signal hist_match_valid_d2		: std_logic;
	signal hist_current_addr		: unsigned(ADDRESS_WIDTH-1 downto 0);
	
	--signals for history match engine
	signal hist_match_selector		: unsigned(MATCH_REMAIND_WIDTH-1 downto 0);
	signal hist_match_remainding	: unsigned(MATCH_REMAIND_WIDTH-1 downto 0);
	signal hist_match_ready			: std_logic;
	signal hist_match_handshake		: std_logic;
	
	signal hist_wr_data				: std_logic_vector(HISTORY_WIDTH*8-1 downto 0);
	
	signal hist_next_data_offset	: unsigned(HISTORY_WIDTH_LOG-1 downto 0);
	signal hist_next_address		: unsigned(HIST_ENGINE_ADDR_WIDTH-1 downto 0);
	
	signal hist_rd_address			: unsigned(HIST_ENGINE_ADDR_WIDTH-1 downto 0);
	signal hist_rd_data_offset		: unsigned(HISTORY_WIDTH_LOG-1 downto 0);
	signal hist_rd_task_valid		: std_logic;
	signal hist_match_selector_d2	: unsigned(MATCH_REMAIND_WIDTH-1 downto 0);
	signal remainder_selected_length_d2	: unsigned(MATCH_REMAIND_WIDTH-1 downto 0);
	
	--stage5
	signal sequence_unmerged_d		: sequence_unmerged_t;
	signal tail_byte				: std_logic_vector(BITS_PER_BYTE-1 downto 0);
	signal tail_byte_valid			: unsigned(0 downto 0);
	
	--stage6
	signal last_buffer				: std_logic_vector(INPUT_WIDTH*3*8-1 downto 0);
	type last_slice_state_t is (LS_NORMAL, LS_LAST_SOLVING);
	signal last_slice_state			: last_slice_state_t;
	signal last_literal				: literal_t;
	signal last_sequence			: sequence_unmerged_t;
	signal last_remainder			: unsigned(MATCH_REMAIND_WIDTH-1 downto 0);
	signal last_cnt					: unsigned(TIME_EXTEND_WIDTH-1 downto 0);
	signal last_literal_last		: std_logic;
	signal last_sequence_last		: std_logic;		
	
	--stage7
	signal lit_length_count			: unsigned(MAX_BLOCK_SIZE_WIDTH-1 downto 0);
	signal seq_count				: unsigned(MAX_BLOCK_SEUQUENCE_NUM_LOG-1 downto 0);
	type block_last_state_t	is (PROCESSING, WAITING);
	signal block_last_state			: block_last_state_t;
	signal sequence_checked_block	: sequence_unmerged_t;
	signal literal_checked_block	: literal_t;
	signal last_literal_last_d		: std_logic;
	signal last_sequence_last_d		: std_logic;
	
	--for debug only
	signal debug1 					: std_logic_vector(3 downto 0);
begin

	history_match_engine0 : entity work.history_match_engine
	port map(
		clk							=> clk,
		reset_n						=> reset_n,
		
		--some control signals
		start						=> start,
		
		--write valid data in
		wr_data_in					=> hist_data_in,
		wr_data_valid_in			=> hist_data_valid_in,
		
		--read
		rd_data_in					=> raw_data_next_d2, --: in std_logic_vector(HISTORY_WIDTH*8-1 downto 0);
		rd_task_valid_in			=> hist_rd_task_valid,
		rd_address_in				=> hist_rd_address,
		rd_data_offset_in			=> hist_rd_data_offset,
		
		--output the match
		match_selector_out			=> hist_match_selector,
		match_remainding_out		=> hist_match_remainding,
		match_ready_out				=> hist_match_ready,
		match_ack_in				=> hist_match_ack   --whether best_match_finder acknewledge the reading of match

	);

	--stage1
	process(clk)
	begin
		if(rising_edge(clk))then --buffer some signals
			hash_current_addr_d		<= hash_current_addr_in;
			hash_current_addr_d2	<= hash_current_addr_d;
			hash_current_addr_d3	<= hash_current_addr_d2;
			hash_current_addr_d4	<= hash_current_addr_d3;
			
			raw_data_valid_d		<= raw_data_valid_in;
			raw_data_valid_d2		<= raw_data_valid_d;
			raw_data_valid_d3		<= raw_data_valid_d2;
			raw_data_valid_d4		<= raw_data_valid_d3;
			raw_data_valid_d5		<= raw_data_valid_d4;
			raw_data_valid_d6       <= raw_data_valid_d5;
			
			raw_data_next_d			<= raw_data_next_in;
			raw_data_next_d2		<= raw_data_next_d;
			raw_data_next_d3		<= raw_data_next_d2;
			raw_data_next_d4		<= raw_data_next_d3;
			raw_data_next_d5		<= raw_data_next_d4;
			
		end if;
	end process;
	
	process(clk)
	begin
		if(rising_edge(clk))then
			matches_from_hash_d		<= matches_from_hash_in;
			matches_from_hash_d2	<= matches_from_hash_d;
			matches_from_hash_d3	<= matches_from_hash_d2;
			matches_from_hash_d4	<= matches_from_hash_d3;
		end if;
	end process;
	
	--calculate the length of offset for each match
	process(clk)
		variable hash_current_addresses_v	: hash_engine_offset_t;
	begin
		if(rising_edge(clk))then
			for i in 0 to NUM_HASH_ENGINES-1 loop
				--the starting bits of addresses of all match engines are the same, only the tailing 2 bits are different, from 0 to 3
				hash_current_addresses_v(i)		:= hash_current_addr_in(ADDRESS_WIDTH-1 downto NUM_HASH_ENGINES_LOG) & to_unsigned(i,NUM_HASH_ENGINES_LOG);
				hash_engine_offset(i)			<= hash_current_addresses_v(i) - matches_from_hash_in(i).match_addr;
			end loop;			
		end if;
	end process;

	process(clk)
	begin
		if(rising_edge(clk))then
			raw_data_d		<= raw_data_in;
			raw_data_d2		<= raw_data_d;
			raw_data_d3		<= raw_data_d2;
			raw_data_d4		<= raw_data_d3;
			raw_data_d5		<= raw_data_d4;	
			
			raw_data_last_d		<= raw_data_last_in;
			raw_data_last_d2	<= raw_data_last_d;
			raw_data_last_d3	<= raw_data_last_d2;
			raw_data_last_d4	<= raw_data_last_d3;
			raw_data_last_d5	<= raw_data_last_d4;
			raw_data_last_d6    <= raw_data_last_d5;
		end if;
	end process;


	--stage2
	--a small trick to reduce the computation in stage3, the signals in this process are only used for history buffer
	--if a match is invalid, change the content of the hist_engine_addresses to the first valid match on the right
	--if the match valid bits is like this:
	--| match(0).valid: 0  	 | match(1).valid: 1 		| match(2).valid: 0 		| match(3).valid: 1			|
	--Original:
	--| hist_engine_addresses(0)| hist_engine_addresses(1)	| hist_engine_addresses(2)	| hist_engine_addresses(3)	|
	--after change:
	--| hist_engine_addresses(1)| hist_engine_addresses(1)	| hist_engine_addresses(3)	| hist_engine_addresses(3)	|
	process(clk)
		variable hist_engine_addresses_v	: hist_engine_addresses_t;
		variable hist_engine_shift_v		: hist_engine_shift_t;
		variable hist_req_vector_v			: std_logic_vector(NUM_HASH_ENGINES-1 downto 0);
	begin
		if(rising_edge(clk))then
			for i in 0 to NUM_HASH_ENGINES-1 loop
				hist_engine_addresses_v(i) 	:= work.compressor_pkg.resize_unsigned(matches_from_hash_d(i).match_addr + matches_from_hash_d(i).match_length + 1, HIST_ENGINE_ADDR_WIDTH+HISTORY_BUFFER_WIDTH_LOG-1, HISTORY_BUFFER_WIDTH_LOG);
				hist_engine_shift_v(i)		:= work.compressor_pkg.resize_unsigned(matches_from_hash_d(i).match_addr + matches_from_hash_d(i).match_length + 1, HISTORY_BUFFER_WIDTH_LOG-1, 0);
			end loop;
		
			for i in 0 to NUM_HASH_ENGINES-1 loop
			--check whether each candidate match needs to trigger the history match engine
			--check whether to request in this cycle to save time for the next cycle
			--only trigger when: 1. match extend to the end of current slice. 2. match is valid. 3. offset of match is not too old
			--in the hardware, writing to memory will take some cycles, therefore, it is very dangerous to read on the border
			--so minus the history length by HISTORY_SAFE_MINUS when do boundary check
				if(is_history_engine_needed(matches_from_hash_d(i), i) and raw_data_valid_d = '1' and hash_engine_offset(i) < (HISTORY_DEPTH*HISTORY_WIDTH - HISTORY_SAFE_MINUS))then
					hist_req_vector_v(i) := '1';
				else
					hist_req_vector_v(i) := '0';
				end if;
			end loop;
		
			debug1	<= hist_req_vector_v;
		
			if(matches_from_hash_d(0).match_valid = '1')then
				hist_engine_addresses(0)	<= hist_engine_addresses_v(0);
				hist_engine_shift(0)		<= hist_engine_shift_v(0);
				hist_req_vector(0)			<= hist_req_vector_v(0);
			elsif(matches_from_hash_d(1).match_valid = '1')then
				hist_engine_addresses(0)	<= hist_engine_addresses_v(1);
				hist_engine_shift(0)		<= hist_engine_shift_v(1);
				hist_req_vector(0)			<= hist_req_vector_v(1);
			elsif(matches_from_hash_d(2).match_valid = '1')then
				hist_engine_addresses(0)	<= hist_engine_addresses_v(2);
				hist_engine_shift(0)		<= hist_engine_shift_v(2);
				hist_req_vector(0)			<= hist_req_vector_v(2);
			else
				hist_engine_addresses(0)	<= hist_engine_addresses_v(3);
				hist_engine_shift(0)		<= hist_engine_shift_v(3);
				hist_req_vector(0)			<= hist_req_vector_v(3);
			end if;
		
			if(matches_from_hash_d(1).match_valid = '1')then
				hist_engine_addresses(1)	<= hist_engine_addresses_v(1);
				hist_engine_shift(1)		<= hist_engine_shift_v(1);
				hist_req_vector(1)			<= hist_req_vector_v(1);
			elsif(matches_from_hash_d(2).match_valid = '1')then
				hist_engine_addresses(1)	<= hist_engine_addresses_v(2);
				hist_engine_shift(1)		<= hist_engine_shift_v(2);
				hist_req_vector(1)			<= hist_req_vector_v(2);
			else
				hist_engine_addresses(1)	<= hist_engine_addresses_v(3);
				hist_engine_shift(1)		<= hist_engine_shift_v(3);
				hist_req_vector(1)			<= hist_req_vector_v(3);
			end if;
		
			if(matches_from_hash_d(2).match_valid = '1')then
				hist_engine_addresses(2)	<= hist_engine_addresses_v(2);
				hist_engine_shift(2)		<= hist_engine_shift_v(2);
				hist_req_vector(2)			<= hist_req_vector_v(2);
			else
				hist_engine_addresses(2)	<= hist_engine_addresses_v(3);
				hist_engine_shift(2)		<= hist_engine_shift_v(3);
				hist_req_vector(2)			<= hist_req_vector_v(3);
			end if;
			
			hist_engine_addresses(3)	<= hist_engine_addresses_v(3);
			hist_engine_shift(3)		<= hist_engine_shift_v(3);
			hist_req_vector(3)			<= hist_req_vector_v(3);
			
		end if;
	end process;
	
	--In order to reduce the amount of calculation in the next cycle, calculate all possible lengthes of remainding in this cycle
	--check whether each candidate match can be processed in one cycle, if no, set the remaind bits and store (length of remainder - 1) 
	process(clk)
	begin
		if(rising_edge(clk))then
			for i in 0 to NUM_HASH_ENGINES-1 loop
				--the match_length stores length of match minus one, and match_remainds store the length of remainder
				if(matches_from_hash_d(i).match_valid = '1' and matches_from_hash_d(i).match_length(MATCH_REMAIND_WIDTH-1 downto 0) >= to_unsigned(INPUT_WIDTH-1-i, MATCH_REMAIND_WIDTH))then
					match_remainds(i)	<= matches_from_hash_d(i).match_length(MATCH_REMAIND_WIDTH-1 downto 0) - to_unsigned(INPUT_WIDTH-1-i, MATCH_REMAIND_WIDTH); 
				else
					match_remainds(i)	<= (others => '0');
				end if;
			end loop;
		end if;
	end process;

	
	--stage3, the request to history match engine will be sent in this stage, so do computation
	--in this stage as less as possible
	--in this stage, there are two key signals: match_selector and remainder_selected_length
	--match_selector indicates the position of match found in THIS slice, and if match_selector = INPUT_WIDTH, there is no match
	--remainder_selected_length is the extra length of match extending to the NEXT slice
	--for example, if remainder_selected_length = 2, which means the process of the next slice should start from the 3rd byte because the first 2 bytes are processed in this slice
	process(clk) --update the selector
		variable match_selector_v			: unsigned(MATCH_REMAIND_WIDTH-1 downto 0);
	begin
		if(rising_edge(clk))then
			--select a match in this cycle, no match selected if match_selector_v = INPUT_WIDTH
			if(hist_match_valid = '1')then
				match_selector_v	:= update_match_selector(matches_from_hash_d2, hist_match_selector);
			else
				match_selector_v	:= update_match_selector(matches_from_hash_d2, remainder_selected_length);
			end if;
			
			--to reduce the computation of this stage, i pre-calculate the possible values of remainder_selected_length from history_match_engine and hash_match_engines
			--and in this stage, i select one of them
			--the remainder_selected_length from history_match_engine should get priority because it can be merged to the last match
			if(start = '1')then
				remainder_selected_length		<= (others => '0');
			elsif(raw_data_valid_d2 = '1')then
				if(hist_match_valid = '1')then
					if(hist_match_selector = 4)then --if the match from history has less than 4 bytes and there is an extra match
						remainder_selected_length		<= hist_match_remainding;
					elsif(match_selector_v = INPUT_WIDTH)then
						remainder_selected_length		<= (others => '0');
					else
						remainder_selected_length		<= match_remainds(to_integer(match_selector_v(MATCH_REMAIND_WIDTH-2 downto 0)));
					end if;
				else
					if(remainder_selected_length = INPUT_WIDTH)then
						remainder_selected_length		<= (others => '0');
					elsif(match_selector_v = INPUT_WIDTH)then
						remainder_selected_length		<= (others => '0');
					else
						remainder_selected_length		<= match_remainds(to_integer(match_selector_v(MATCH_REMAIND_WIDTH-2 downto 0)));
					end if;
				end if;	
			end if;
			
			match_selector				<= match_selector_v;
			
			--buffer some output of the history match engine
			if(start = '1' or reset_n = '0')then
				hist_match_selector_d		<= (others => '0');
				hist_match_remainding_d		<= (others => '0');
			elsif(raw_data_valid_d2 = '1')then
				hist_match_selector_d		<= hist_match_selector;
				hist_match_remainding_d		<= hist_match_remainding;
			end if;
			
			--Normally, sequence should be valid if the input data is valid, it can contain literal 
			--or(and) match, only one exception: the last match is too long, the 4 byte input data this cycle
			--is covered by the last sequence
			if(raw_data_valid_d2 = '1' and remainder_selected_length < INPUT_WIDTH)then
				unmerged_seq_valid	<= '1';
			else
				unmerged_seq_valid	<= '0';
			end if;
			
			remainder_selected_length_d		<= remainder_selected_length;

			hist_match_valid_d		<= hist_match_valid;
			
		end if;
	end process;
	
	
	process(clk)
	begin
		if(rising_edge(clk))then
			if(reset_n = '0')then
				hist_ack_state_r	<= HIST_ACK_INITIAL;
			elsif(start = '1')then
				hist_ack_state_r	<= HIST_ACK_INITIAL;
			else
				hist_ack_state_r	<= hist_ack_state_w;
			end if;
		end if;
	end process;
	
	
	process(all)
	begin
		--use a state machine to control the acknewledge of data from history_match_engine
		case hist_ack_state_r is
			when HIST_ACK_INITIAL => --waiting for a request to history_match_engine
				if(hist_rd_task_valid = '1')then
					hist_ack_state_w		<= HIST_ACK_GAP;
				else
					hist_ack_state_w	<= hist_ack_state_r;
				end if;
						
			--after receiving a request or consequtive reading, we can give an acknewledge after two requirements are fullfilled:
			--1. after one cycle to wait until the data in history_match_engine is ready 
			--2. receive a valid slice
			--the state will keep in HIST_ACK_GAP until these two requirements are met
			when HIST_ACK_GAP => 
				if(raw_data_valid_d2 = '1')then
					hist_ack_state_w		<= HIST_ACK_WAITING;
				else
					hist_ack_state_w	<= hist_ack_state_r;
				end if;
						
			
			--there are 3 situations in the state HIST_ACK_WAITING:
			--1. normal case: give and acknewledge, jump to HIST_ACK_INITIAL and wait for next request comes
			--2. consequtive reading case: history_match_engine found a full match (8 bytes) and it will give another match,
			--   jump to state HIST_ACK_GAP and about to give next acknewledge
			--3. request-after-request case: give an request and request at the same time, which means the history_match_engine has to process
			--   a request right after processing another request, in this case, also jump to HIST_ACK_GAP and about to give next acknewledge
			when HIST_ACK_WAITING =>
				if(raw_data_valid_d2 = '1')then 
					if(hist_match_remainding = INPUT_WIDTH)then --2. for consequtive reading
						hist_ack_state_w	<= HIST_ACK_GAP;
					else
						if(hist_rd_task_valid = '1')then --3. request-after-request
							hist_ack_state_w		<= HIST_ACK_GAP;
						else --1. normal case
							hist_ack_state_w		<= HIST_ACK_INITIAL;
						end if;
					end if;
				else
					hist_ack_state_w	<= hist_ack_state_r;
				end if;
			when others =>
				hist_ack_state_w			<= HIST_ACK_INITIAL;
		end case;
	end process;
	
	--a match is only valid when a match has longer than 1 byte
	process(all)
	begin
		if(hist_match_handshake = '1' and hist_match_selector /= 0)then
				hist_match_valid		<= '1';
			else
				hist_match_valid		<= '0';
			end if;
	end process;
	
	--some combinational logic to control the history_match_engine
	process(all)
	--since the sequence matches from left to right is |3|2|1|0|, we need to changhe the remainder_selected_length
		variable hist_selector_v	: unsigned(NUM_HASH_ENGINES_LOG -1 downto 0);
	begin
		hist_match_handshake	<= hist_match_ack and hist_match_ready;
	
		--it should only give acknewledge when a valid slice comes and in state HIST_ACK_WAITING
		if(hist_ack_state_r	= HIST_ACK_WAITING and raw_data_valid_d2 = '1')then
			hist_match_ack		<= '1';
		else
			hist_match_ack		<= '0';
		end if;
		
		--for a slice, the selector can be from two sources: the last slice or history_match_engine
		--and the history_match_engine gets priority
		if(hist_match_valid = '1')then
			hist_selector_v		:= work.compressor_pkg.resize_unsigned(hist_match_selector,NUM_HASH_ENGINES_LOG-1,0);
		else
			hist_selector_v		:= work.compressor_pkg.resize_unsigned(remainder_selected_length,NUM_HASH_ENGINES_LOG-1,0);
		end if;
		
		--select address, offset and whether request to the history_match_engine
		if(hist_match_handshake = '1' and hist_match_selector = INPUT_WIDTH)then --if find a match of more than 4 bytes, should not request in this cycle
			hist_rd_task_valid		<= '0';
		elsif(remainder_selected_length = NUM_HASH_ENGINES)then --if the last slice has a match which covers all bytes of this slice, should not request
			hist_rd_task_valid		<= '0';
		else
			hist_rd_task_valid		<= hist_req_vector(to_integer(hist_selector_v(NUM_HASH_ENGINES_LOG-1 downto 0))); --choose one from 3
		end if;
		hist_rd_address			<= hist_engine_addresses(to_integer(hist_selector_v(NUM_HASH_ENGINES_LOG-1 downto 0)));
		hist_rd_data_offset		<= hist_engine_shift(to_integer(hist_selector_v(NUM_HASH_ENGINES_LOG-1 downto 0)));
		
	end process;

	
	--stage4
	--calculate literal content
	process(clk)
		variable literal_data_length_v		: unsigned(MATCH_REMAIND_WIDTH-1 downto 0);
	begin
		if(rising_edge(clk))then
			
			--match_selector is the position of selected match, remainder_selected_length is the
			--length in this slice extended from the last match (these bytes are already processed in the last slice),
			--so match_selector - remainder_selected_length_d is the literal length	
			if(hist_match_valid_d = '1')then
				literal_data_length_v				:= match_selector - hist_match_selector_d;
			else
				literal_data_length_v				:= match_selector - remainder_selected_length_d;
			end if;
			
			hist_match_selector_d2					<= hist_match_selector_d; 
			
			sequence_unmerged.literal_length		<= literal_data_length_v;
			
			--match_selector can only be from 0 to INPUT_WIDTH, check if it is too large
			if(raw_data_valid_d3 = '1')then
					assert match_selector <= INPUT_WIDTH report "selector wrong" severity failure;
			end if;

		end if;
	end process;
	
	--calculate sequence
	--if the data of this slice is totally covered by the match of the last cycle, this sequence is invalid
	process(clk)
		variable match_selected_v				: match_t;
		variable match_current_address_v		: unsigned (ADDRESS_WIDTH-1 downto 0);
	begin
		if(rising_edge(clk))then
			match_selected_v						:= matches_from_hash_d3(to_integer(match_selector(1 downto 0)));
			match_current_address_v					:= hash_current_addr_d3(ADDRESS_WIDTH-1 downto 2) & match_selector(1 downto 0);
			sequence_unmerged.sequence_valid		<= unmerged_seq_valid;
			
			--the match_length in the match_t is the real length-1, now change it to real length
			--if match_selector = INPUT_WIDTH, no match
			if(match_selected_v.match_valid = '1' and match_selector /= INPUT_WIDTH)then
				sequence_unmerged.match_length			<= ('0' & match_selected_v.match_length) + 1; --append a 0 to avoid overflow
				sequence_unmerged.match_current_address	<= match_current_address_v;
			else
				sequence_unmerged.match_length			<= (others => '0');
				sequence_unmerged.match_current_address	<= match_current_address_v	+ INPUT_WIDTH;
			end if;

			--if there is a match from history match engine, store the length of it
			if(hist_match_valid_d = '1')then
				sequence_unmerged.match_hist_length	<= ('0' & hist_match_selector_d) + hist_match_remainding_d ; --append 0 to avoid overflow
			else
				sequence_unmerged.match_hist_length	<= (others => '0');
			end if;
			
			hist_current_addr		<= hash_current_addr_d3;
			hist_match_valid_d2		<= hist_match_valid_d;
			
			--In the hash table module, the offset is already checked and should not be too large, the resizing should not loss any information
			sequence_unmerged.match_offset			<= resize_unsigned(match_current_address_v-match_selected_v.match_addr, MAX_OFFSET_WIDTH-1,0);
		end if;
	end process;
	
	--stage 5
	process(clk)
		variable has_tail_literal						: std_logic;
	begin
		if(rising_edge(clk))then
			if(sequence_unmerged.match_length = 3 and sequence_unmerged.match_current_address(MATCH_REMAIND_WIDTH-2 downto 0) = 0 )then
				has_tail_literal						:= '1';
			else
				has_tail_literal						:= '0';
			end if;
		
			sequence_unmerged_d.sequence_valid			<= sequence_unmerged.sequence_valid;
			sequence_unmerged_d.match_length			<= sequence_unmerged.match_length;
			sequence_unmerged_d.match_current_address	<= sequence_unmerged.match_current_address;
			
			remainder_selected_length_d2				<= remainder_selected_length_d;
			
			if(reset_n = '0')then
				tail_byte_valid							<= (others => '0');
			elsif(sequence_unmerged.sequence_valid = '1')then
				if(has_tail_literal = '1')then
					tail_byte_valid						<= (others => '1');
				else
					tail_byte_valid						<= (others => '0');
				end if;
				tail_byte								<= raw_data_d4(INPUT_WIDTH*8+7 downto INPUT_WIDTH*8);
			end if;
			
			--Currently the width of input is 4-byte, so there can only be tail literal when the match started in the first byte and length is 3
			if(has_tail_literal = '1')then
			    sequence_unmerged_d.literal_tail_length <= "1";
				literal_data_length						<= resize(tail_byte_valid, literal_data_length'length);
				if(tail_byte_valid = 1)then
					literal_data	 					<= tail_byte & std_logic_vector(shift_left(unsigned(raw_data_d4(INPUT_WIDTH*2*8-1 downto INPUT_WIDTH*8)), (INPUT_WIDTH-1)*8));--left shift the literal data to make the valid bytes aligned to the left
				else
					literal_data	 					<= std_logic_vector(shift_left(unsigned(raw_data_d4(INPUT_WIDTH*2*8-1 downto INPUT_WIDTH*8)), (INPUT_WIDTH-1)*8)) & ALL_ZEROS(7 downto 0);--left shift the literal data to make the valid bytes aligned to the left
				end if;
--				literal_data_valid						<= sequence_unmerged.sequence_valid;
			else
			    sequence_unmerged_d.literal_tail_length <= "0";
				if(sequence_unmerged.match_hist_length  >= INPUT_WIDTH)then
--					literal_data_valid					<= '0';
					literal_data_length					<= resize(tail_byte_valid, literal_data_length'length);
				else
					literal_data_length					<= sequence_unmerged.literal_length + tail_byte_valid;
--					if(sequence_unmerged.literal_length > 0)then literal_data_valid	<= sequence_unmerged.sequence_valid; else literal_data_valid	<= '0'; end if;
				end if;

				
				if(tail_byte_valid = 1)then
					literal_data	 					<= tail_byte & std_logic_vector(shift_left(unsigned(raw_data_d4(INPUT_WIDTH*2*8-1 downto INPUT_WIDTH*8)), to_integer(sequence_unmerged.match_hist_length + remainder_selected_length_d2)*8));--left shift the literal data to make the valid bytes aligned to the left
				else
					literal_data	 					<= std_logic_vector(shift_left(unsigned(raw_data_d4(INPUT_WIDTH*2*8-1 downto INPUT_WIDTH*8)), to_integer(sequence_unmerged.match_hist_length + remainder_selected_length_d2)*8)) & ALL_ZEROS(7 downto 0);--left shift the literal data to make the valid bytes aligned to the left & ALL_ZEROS(7 downto 0);--left shift the literal data to make the valid bytes aligned to the left
				end if;
				
--				if(sequence_unmerged.sequence_valid = '1')then
--					assert(to_integer(sequence_unmerged.match_hist_length) + to_integer(remainder_selected_length_d2) <= INPUT_WIDTH) report "shift too much" severity failure;
--				end if;
				
			end if;
			literal_data_valid						<= sequence_unmerged.sequence_valid;
			sequence_unmerged_d.literal_length			<= sequence_unmerged.literal_length;
			
			sequence_unmerged_d.match_offset			<= sequence_unmerged.match_offset;
			sequence_unmerged_d.match_hist_length		<= sequence_unmerged.match_hist_length;					
		
		end if;
	end process;
	
	--stage 6
	process(clk)
	begin
		if(rising_edge(clk))then
			if(reset_n = '0')then
				last_slice_state	<= LS_NORMAL;
			elsif(start = '1')then
				last_slice_state	<= LS_NORMAL;
			else
				case(last_slice_state)is
					when LS_NORMAL =>
						last_literal.literal_data		<= literal_data;
						last_literal.literal_valid		<= literal_data_valid;
						last_literal.literal_length		<= literal_data_length;
						last_buffer						<= raw_data_d5(INPUT_WIDTH*8-1 downto 0) & raw_data_next_d5;
						last_sequence					<= sequence_unmerged_d;
						if(raw_data_valid_d5 = '1' and raw_data_last_d5 = '1')then
							last_slice_state				<= LS_LAST_SOLVING;
							last_remainder					<= remainder_selected_length_d2;
						end if;
						last_cnt						<= (others => '0');
						last_literal_last				<= '0';
						last_sequence_last				<= '0';
					when LS_LAST_SOLVING =>
						last_remainder					<= to_unsigned(0, last_remainder'length);
						last_literal.literal_data		<= std_logic_vector(shift_left(unsigned(last_buffer(INPUT_WIDTH*3*8-1 downto INPUT_WIDTH*2*8)), to_integer(last_remainder)*8)) & ALL_ZEROS(7 downto 0); --TODO: tail literal
						last_literal.literal_length		<= resize(INPUT_WIDTH-last_remainder, last_literal.literal_length'length);
						last_buffer						<= std_logic_vector(shift_left(unsigned(last_buffer), BITS_PER_BYTE*INPUT_WIDTH));
				
						last_sequence.match_length		<= (others => '0');		
						last_sequence.match_offset		<= (others => '0');
						last_sequence.match_hist_length	<= (others => '0');
						last_sequence.literal_tail_length<= (others => '0');
						last_sequence.literal_length	<= to_unsigned(INPUT_WIDTH, MATCH_REMAIND_WIDTH) - last_remainder;
						
						if(last_remainder = INPUT_WIDTH)then
							last_literal.literal_valid		<= '0';
							last_sequence.sequence_valid	<= '0';
						else
							last_literal.literal_valid		<= '1';
							last_sequence.sequence_valid	<= '1';
						end if;
						last_cnt						<= last_cnt + to_unsigned(1, TIME_EXTEND_WIDTH);
						if(last_cnt = (TIME_EXTEND-2))then
							last_literal_last				<= '1';
							last_sequence_last				<= '1';
							last_slice_state				<= LS_NORMAL;
						end if;
				end case;
			end if;
		end if;
	end process;
	
	--stage 7: to generate the block_last signal
	process(clk)
	begin
		if(rising_edge(clk))then
			sequence_checked_block					<= last_sequence;
			literal_checked_block					<= last_literal;
			literal_checked_block.block_last		<= '0';
			sequence_checked_block.block_last		<= '0';
			
			last_literal_last_d						<= last_literal_last;
			last_sequence_last_d					<= last_literal_last;
			
			if(reset_n = '0')then
				lit_length_count		<= (others => '0');
				seq_count				<= (others => '0');
				block_last_state		<= PROCESSING;
			elsif(start = '1')then
			    lit_length_count		<= (others => '0');
				seq_count				<= (others => '0');
				block_last_state		<= PROCESSING;
			elsif(last_sequence.sequence_valid = '1')then
				case(block_last_state)is
				
				when PROCESSING =>
					lit_length_count						<= lit_length_count + (last_sequence.literal_tail_length + last_sequence.literal_length);
					if(last_sequence.match_length > 0)then
						seq_count							<= seq_count + to_unsigned(1, seq_count'LENGTH);
					end if;
					literal_checked_block.block_last		<= '0';
					sequence_checked_block.block_last		<= '0';
					--if number of sequence or number of literal bytes reaches threshold or 
					if((last_sequence.match_length > 0 and seq_count = (MAX_BLOCK_SEUQUENCE_NUM-3)) or lit_length_count>=LITERAL_SIZE_THRESH)then
						block_last_state					<= WAITING;
					end if;
					
				when WAITING =>
					if(last_sequence.match_length > 0)then
						literal_checked_block.block_last	<= '1';
						sequence_checked_block.block_last	<= '1';
						block_last_state					<= PROCESSING;
					end if;
					lit_length_count						<= (others => '0');
					seq_count								<= (others => '0');
				end case;
			end if;
			
		end if;
	end process;
	
	
	--assign to the output
	literal_out					<= literal_checked_block;
	literal_last_out			<= last_literal_last_d;
	
	sequence_out				<= sequence_checked_block;
	sequence_last_out			<= last_sequence_last_d;

end architecture;