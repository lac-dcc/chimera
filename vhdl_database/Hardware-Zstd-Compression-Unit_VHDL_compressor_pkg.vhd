library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.arithmetic_pkg.all;

package compressor_pkg is
	constant HASH_TABLE_HIS_WIDTH      	: integer:= 8; 	--MAX number of bytes of history stored in hash table
	constant HASH_TABLE_HIS_WIDTH_LOG  	: integer:= 3; 	--LOG2(HASH_TABLE_HIS_WIDTH)
	constant ADDRESS_WIDTH			   	: integer:= 32;  --width of the address inside the file, max 64MB, adviced to be 9*n-1, n is the number of BRAM
	constant INPUT_WIDTH			   	: integer:= 4; 	--width of input in bytes
	constant MATCH_REMAIND_WIDTH		: integer:= work.arithmetic_pkg.clog2(INPUT_WIDTH)+1; --3;  --log(INPUT_WIDTH)+1, sincce its value can be from 0 to INPUT_WIDTH
	constant NUMBER_COMPRESSOR		   	: integer:= 4;
--	constant HASH_TABLE_DEPTH	: integer:= 4096;
	
	constant NUM_HASH_ENGINES		: integer := INPUT_WIDTH; --number of hash match engines
	constant NUM_HASH_ENGINES_LOG	: integer := work.arithmetic_pkg.clog2(NUM_HASH_ENGINES);--2; --log2(NUM_HASH_ENGINES)
	
	constant MAX_OFFSET_WIDTH		: natural:= 27;
	constant MAX_OFFSET 			: integer:= 2**MAX_OFFSET_WIDTH - 4;  -- set a max offset to avoid matching too old history
	
	constant INSERT_WIDTH			: integer:= 11; --width of the data to be inserted
	constant MAX_LOOK_UP_WIDTH 		: integer:= 8;
	constant LITERAL_TAIL_LENGTH	: integer:= 1;

	constant HISTORY_DEPTH			: integer:= 4096; --depth of history match buffer in the history match engine
	constant HISTORY_WIDTH			: integer:= 8; --WIDTH
	constant HISTORY_WIDTH_LOG		: integer:= work.arithmetic_pkg.clog2(HISTORY_WIDTH);--3;--work.compressor_pkg.clog2(HISTORY_WIDTH);
	
	constant MIN_MATCH_LENGTH		: integer:= 3; --a match in zstd(and most of compression) must be at least 3
	
	constant DATA_LENGTH_WIDTH			: integer:= 32; --width of length of data from or to host
	--in the hardware, writing to memory will take some cycles, therefore, it is very dangerous to read on the border
	--so minus the history length by HISTORY_SAFE_MINUS when do boundary check
	constant HISTORY_SAFE_MINUS		: integer:= 64;
	
	--just generate a lot of 0 and 1
	constant ALL_ZEROS				: std_logic_vector(200 downto 0) := (others => '0');
	constant ALL_ONES				: std_logic_vector(200 downto 0) := (others => '1');
	
	constant MAX_LITERAL_LENGTH		: integer:= 131071;
	constant MAX_LITERAL_LENGTH_WIDTH: integer:= work.arithmetic_pkg.clog2(MAX_LITERAL_LENGTH+1);
	
	constant MAX_MATCH_LENGTH		: integer:= 131074;
	constant MAX_MATCH_LENGTH_WIDTH	: integer:= work.arithmetic_pkg.clog2(MAX_MATCH_LENGTH+1);
	
	constant BITS_PER_BYTE			: integer:= 8; --as we know, 1 byte = 8 bits
	
	constant SW_INTEGER_WIDTH		: integer:= 32;
	
	--self defined max size of an block for entory stage, must be smaller than 128KB
	constant MAX_BLOCK_SIZE					: integer:= 256*8;
	constant LITERAL_SIZE_THRESH			: integer:= 900;
	constant MAX_BLOCK_SIZE_WIDTH			: integer:= work.arithmetic_pkg.clog2(MAX_BLOCK_SIZE+1);
	constant MAX_BLOCK_SEUQUENCE_NUM		: integer:= 256;
	constant MAX_BLOCK_SEUQUENCE_NUM_LOG	: integer:= work.arithmetic_pkg.clog2(MAX_BLOCK_SEUQUENCE_NUM);
	
	constant MAX_BLOCK_BITS_SIZE			: integer:= MAX_BLOCK_SIZE*BITS_PER_BYTE; --max number of compressed bits for each block
	constant MAX_BLOCK_BITS_SIZE_WIDTH		: integer:= work.arithmetic_pkg.clog2(MAX_BLOCK_BITS_SIZE+1);
	
	type match_t is record
		match_addr			: unsigned (ADDRESS_WIDTH-1 downto 0);
		match_valid			: std_logic;
		match_length		: unsigned (HASH_TABLE_HIS_WIDTH_LOG-1 downto 0);
	end record match_t;
	
	constant LITERAL_LENGTH_UNALIGNED_MAX		: integer:= INPUT_WIDTH+1; --4 input + 1 tail literal
	constant LITERAL_LENGTH_UNALIGNED_MAX_WIDTH	: integer:= work.arithmetic_pkg.clog2(LITERAL_LENGTH_UNALIGNED_MAX+1);
	type literal_t is record
		literal_data		: std_logic_vector(LITERAL_LENGTH_UNALIGNED_MAX*BITS_PER_BYTE -1 downto 0); -- have an extra byte to store the tail byte
		literal_valid		: std_logic;
		literal_length		: unsigned(LITERAL_LENGTH_UNALIGNED_MAX_WIDTH-1 downto 0);
		block_last			: std_logic; -- whether it is the last sequence of the block
	end record literal_t;
	
	constant LITERAL_LENGTH_ALIGNED_MAX			: integer:= 8;-- the aligned data must larger than INPUT_WIDTH bytes, and must by 2^n
	constant LITERAL_LENGTH_ALIGNED_MAX_WIDTH	: integer:= work.arithmetic_pkg.clog2(LITERAL_LENGTH_ALIGNED_MAX+1);
	type literal_aligned_bytes_t is record
		literal_data		: std_logic_vector(LITERAL_LENGTH_ALIGNED_MAX*BITS_PER_BYTE -1 downto 0); 
		literal_valid		: std_logic;
		literal_length		: unsigned(LITERAL_LENGTH_ALIGNED_MAX_WIDTH-1 downto 0);
		block_last			: std_logic; -- whether it is the last sequence of the block
	end record literal_aligned_bytes_t;
	
	type literal_aligned_doubled_bytes_t is record
		literal_data		: std_logic_vector(LITERAL_LENGTH_ALIGNED_MAX*BITS_PER_BYTE*2 -1 downto 0); 
		literal_valid		: std_logic;
		literal_length		: unsigned(LITERAL_LENGTH_ALIGNED_MAX_WIDTH downto 0);
		block_last			: std_logic; -- whether it is the last sequence of the block
	end record literal_aligned_doubled_bytes_t;
	
	type block_original_size_t is record
		sequence_num		: unsigned(SW_INTEGER_WIDTH-1 downto 0); --number of sequence in this block
		litreal_byte_num	: unsigned(SW_INTEGER_WIDTH-1 downto 0); --number of literal bytes in this block
		valid				: std_logic;
	end record;
	
	type matches_t is array(INPUT_WIDTH-1 downto 0) of match_t; 
	
	type matches_from_engines_t	is array(NUM_HASH_ENGINES-1 downto 0) of match_t; 
	
	--the match length here is the actual match length (not minus one)
	--if the sequence is valid, the match length or literal length can be 0, but should not be zero at the same time 
	--one slice(4 bytes) consists of 4 parts: 
	--| Match from history / remaiding from last match | Literal | Match from hash | Tail literal |
	--length of any of them can be 0, and the sum of their length should be at least
	type sequence_unmerged_t is record
		sequence_valid				: std_logic;
		--length of literal in front of the match in the same slice
		literal_length				: unsigned(LITERAL_LENGTH_UNALIGNED_MAX_WIDTH-1 downto 0);
		--a special case: when a match starts and ends in the same slice, there can be some literal data after the match
		--literal_tail_length is to store the length of the tail literal
		literal_tail_length			: unsigned(LITERAL_TAIL_LENGTH-1 downto 0);
		match_hist_length			: unsigned(HISTORY_WIDTH_LOG downto 0); --length of match from the last, from 0 to HISTORY_WIDTH
		match_length				: unsigned(HASH_TABLE_HIS_WIDTH_LOG downto 0);
		match_offset				: unsigned(MAX_OFFSET_WIDTH-1 downto 0);
		match_current_address		: unsigned(ADDRESS_WIDTH-1 downto 0);
		block_last					: std_logic; -- whether it is the last sequence of the block
	end record sequence_unmerged_t;
	
	type sequence_merged_t is record
		sequence_valid				: std_logic;
		literal_length				: unsigned(MAX_LITERAL_LENGTH_WIDTH-1 downto 0);
		match_length				: unsigned(MAX_MATCH_LENGTH_WIDTH-1 downto 0);
		match_offset				: unsigned(MAX_OFFSET_WIDTH-1 downto 0);
		match_current_address		: unsigned(ADDRESS_WIDTH-1 downto 0);  -- just for debug
		block_last					: std_logic; -- whether it is the last sequence of the block
	end record sequence_merged_t;
	
	--the final output of the fse_bitstream, already aligned to right
	constant FSE_BITSTREAM_FINAL_WIDTH 			: integer := 128;
	constant FSE_BITSTREAM_FINAL_NUM_BITS_WIDTH	: integer := work.arithmetic_pkg.clog2(FSE_BITSTREAM_FINAL_WIDTH+1);
	type fse_bitsream_final_t is record
		bitstream					: unsigned(FSE_BITSTREAM_FINAL_WIDTH-1 downto 0);
		bitstream_num				: unsigned(FSE_BITSTREAM_FINAL_NUM_BITS_WIDTH-1 downto 0);
		valid						: std_logic;
		block_last					: std_logic;
	end record;
	
	--the final output of the huffman_bitstream, already aligned to right
	constant HUFFMAN_BITSTREAM_FINAL_WIDTH 			: integer := 128;
	constant HUFFMAN_BITSTREAM_FINAL_NUM_BITS_WIDTH	: integer := work.arithmetic_pkg.clog2(HUFFMAN_BITSTREAM_FINAL_WIDTH+1);
	type huffman_bitsream_final_t is record
		bitstream					: unsigned(HUFFMAN_BITSTREAM_FINAL_WIDTH-1 downto 0);
		bitstream_num				: unsigned(HUFFMAN_BITSTREAM_FINAL_NUM_BITS_WIDTH-1 downto 0);
		valid						: std_logic;
		block_last					: std_logic;
	end record;
	
	function hash_3_bytes(input_data: in std_logic_vector(23 downto 0) ) return unsigned;

	function compare_matches(match0 : in match_t; match1 : in match_t) return match_t;
	
	function resize_unsigned(input_data	: in unsigned; upper_bound	: in integer; lower_bound : in integer)	return unsigned;

	function update_match_selector(matches_from_hash 	: in matches_t; remainder_selected_length : in unsigned(MATCH_REMAIND_WIDTH-1 downto 0) )return unsigned;
	
	function has_remainder(match_length : unsigned (HASH_TABLE_HIS_WIDTH_LOG-1 downto 0) )return boolean;

	function is_history_engine_needed(match : in match_t; engine_number	: in integer) return boolean;

	function leading_zero_counter( vector : in std_logic_vector(INPUT_WIDTH-1 downto 0)	)return unsigned;
--	constant HASH_TABLE_DEPTH_LOG: natural:= work.compressor_pkg.clog2(HASH_TABLE_DEPTH); --log2(HASH_TABLE_DEPTH)
	
	function unsigned_to_32b_vector( num : in unsigned) return std_logic_vector;

	function endian_convert_32b(vec	: in std_logic_vector(31 downto 0) )return std_logic_vector;

end package compressor_pkg;

package body compressor_pkg is
	--hash functions
	function hash_3_bytes(
		input_data: in std_logic_vector(23 downto 0) )
		return unsigned is 
		variable hash_value 	: unsigned (32-1 downto 0);
		variable hash_temp 		: unsigned (63 downto 0);
		variable input_extend 	: std_logic_vector(31 downto 0) := (others => '0');
		constant prime_3bytes	: unsigned := to_unsigned(506832829,32);
	begin
		input_extend(31 downto 8)	:= input_data;
		hash_temp 					:= unsigned(input_extend) * prime_3bytes;   --append zero, multiply
		hash_value 					:= hash_temp(32-1 downto 0);
		return hash_value;
	end function hash_3_bytes;

	--return part of the input number
	function resize_unsigned(
		input_data	: in unsigned;
		upper_bound	: in integer;
		lower_bound	: in integer)
		return unsigned is
	begin
		return input_data(upper_bound downto lower_bound);
	end function resize_unsigned;

	--extend vector to a certain size, append 0 on the left
	function extend_vector(
		input_data		: in std_logic_vector;
		extended_size	: in positive
	)return std_logic_vector is
	variable output_data : std_logic_vector(extended_size-1 downto 0);
	begin
		output_data := std_logic_vector(resize(unsigned(input_data), extended_size));
		return output_data;
	end function;

	--function to pick the better match
	function compare_matches(
		match0 : in match_t;
		match1 : in match_t)
		return match_t is
		variable better_match : match_t;
		variable better_match_choose : std_logic;
	begin
		--compare two matches
		if(match0.match_valid = '0')then
			better_match_choose	:= '1';
		elsif(match1.match_valid = '0')then --if one of table does not find match, use match from another one
			better_match_choose	:= '0';
		else if(match0.match_length>match1.match_length)then
				better_match_choose	:= '0';	
			elsif(match0.match_length<match1.match_length)then
				better_match_choose	:= '1';
			else --if length is the same compare address
				if(match0.match_addr>match1.match_addr)then
					better_match_choose	:= '0';
				else
					better_match_choose	:= '1';
				end if; --it should not happen that the addresses are the same
			end if;
		end if;
		
		--assign the match to the output
		if(better_match_choose = '0')then
			better_match.match_addr		:= match0.match_addr;
			better_match.match_length	:= match0.match_length;
		else
			better_match.match_addr		:= match1.match_addr;
			better_match.match_length	:= match1.match_length;
		end if;
		better_match.match_valid	:= match0.match_valid or match1.match_valid;
		return better_match;
	end function compare_matches;
	
	function min_vector_size(N: natural) return positive is
    begin
        if N < 2 then
            return 1;
        else
            return 1 + min_vector_size(N / 2);
        end if;
    end;

	function is_history_engine_needed(
		match			: in match_t;
		engine_number	: in integer)
		return boolean is
		variable match_length_max	: unsigned(HASH_TABLE_HIS_WIDTH_LOG-1 downto 0); --the max match length this engine can generate
	begin
		match_length_max := to_unsigned(HASH_TABLE_HIS_WIDTH-engine_number-1, HASH_TABLE_HIS_WIDTH_LOG);
		--we need the history match engine only if 
		if(match.match_valid = '1' and match_length_max = match.match_length)then
			return true;
		else
			return false;
		end if;
	end function;
	
	--check whether a match can be totally processed in this cycle
	function has_remainder(
		match_length : unsigned (HASH_TABLE_HIS_WIDTH_LOG-1 downto 0)
	)return boolean is
	begin
		if(match_length(HASH_TABLE_HIS_WIDTH_LOG-1) = '1')then
			return true;
		else
			return false;
		end if;
	end function;
		
	--it is possible that the selected match is invalid, in this case, we need to choose
	--the first valid match on the right. If now valid match on the right side, return 
	--the right most one
	function update_match_selector(
		matches_from_hash 			: in matches_t;
		remainder_selected_length	: in unsigned(MATCH_REMAIND_WIDTH-1 downto 0) 
	)return unsigned is
		variable match_valid_vector	: unsigned(NUM_HASH_ENGINES-1 downto 0);
		variable match_valid_mask	: unsigned(NUM_HASH_ENGINES-1 downto 0);
		variable updated_selector	: unsigned(MATCH_REMAIND_WIDTH-1 downto 0);
	begin
		for i in 0 to NUM_HASH_ENGINES-1 loop
			match_valid_vector(i)	:= matches_from_hash(i).match_valid;
		end loop;
		match_valid_mask	:= (others => '1');
		match_valid_mask	:= shift_left(match_valid_mask, to_integer(remainder_selected_length));
		match_valid_vector	:= match_valid_vector and match_valid_mask;
		
		updated_selector	:= (others => '0');
		for i in 0 to NUM_HASH_ENGINES-1  loop
			if(match_valid_vector(i) = '0')then
				updated_selector := updated_selector + 1;
			else
				exit;
			end if;
		end loop;
		return updated_selector;
	end function;
	
	function leading_zero_counter(
		vector	: in std_logic_vector(INPUT_WIDTH-1 downto 0)
	)return unsigned is
		variable count	: unsigned(MATCH_REMAIND_WIDTH-1 downto 0);
	begin
		count	:= (others => '0');
		for i in (INPUT_WIDTH-1) downto 0 loop
			if(vector(i) = '1')then
				count	:= count + 1;
			else
				exit;
			end if;
		end loop;
		return count;
	end function;
	
	function unsigned_to_32b_vector(
		num		: in unsigned
	)return std_logic_vector is
	begin
		return std_logic_vector(resize(num, 32));
	end function;
	
	--big endian to small or small to big
	function endian_convert_32b(
		vec		: in std_logic_vector(31 downto 0)
	)return std_logic_vector is
		variable result		: std_logic_vector(31 downto 0);
	begin
		for i in 3 downto 0 loop
			result(i*8+7 downto i*8)	:= vec((3-i)*8+7 downto (3-i)*8);
		end loop;
		return result;
	end function;
	
end package body compressor_pkg;