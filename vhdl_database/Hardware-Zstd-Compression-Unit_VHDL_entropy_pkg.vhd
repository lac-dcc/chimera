library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.arithmetic_pkg.all;
use work.compressor_pkg.all;

package entropy_pkg is
	constant BLOCK_SIZE_MAX				: integer:= 128*1024; --the max size of original data of an entropy block
	constant HUFF_NBIT_MAX     			: integer:= 12; --max number of bits for one byte after huffman compression
	constant HUFF_NBIT_MAX_WIDTH		: integer:= work.arithmetic_pkg.clog2(HUFF_NBIT_MAX+1);
	
	constant LIT_LENGTH_CODE_MAX		: integer:= 35;
	constant LIT_LENGTH_CODE_WIDTH		: integer:= work.arithmetic_pkg.clog2(LIT_LENGTH_CODE_MAX+1);
	constant LIT_LENGTH_NBITS_MAX		: integer:= 16;
	constant LIT_LENGTH_NBITS_WIDTH		: integer:= work.arithmetic_pkg.clog2(LIT_LENGTH_NBITS_MAX+1);
	
	constant MATCH_LENGTH_CODE_MAX		: integer:= 52;
	constant MATCH_LENGTH_CODE_WIDTH	: integer:= work.arithmetic_pkg.clog2(MATCH_LENGTH_CODE_MAX+1);
	constant MATCH_LENGTH_NBITS_MAX		: integer:= 16;
	constant MATCH_LENGTH_NBITS_WIDTH	: integer:= work.arithmetic_pkg.clog2(MATCH_LENGTH_NBITS_MAX+1);
	
	constant MATCH_OFFSET_CODE_MAX		: integer:= 31;
	constant MATCH_OFFSET_CODE_WIDTH	: integer:= work.arithmetic_pkg.clog2(MATCH_LENGTH_NBITS_MAX+1);
	constant MATCH_OFFSET_NBITS_MAX		: integer:= 31;
	constant MATCH_OFFSET_NBITS_WIDTH	: integer:= work.arithmetic_pkg.clog2(MATCH_OFFSET_NBITS_MAX+1);
	
	--the number of max encoded bits for FSE
	--31 is the max bits for the software function BIT_addBits(), i think the real limitation should be lower, but i did not find it
	constant FSE_NBITS_MAX				: integer:= 31;
	constant FSE_NBITS_MAX_WIDTH		: integer:= work.arithmetic_pkg.clog2(FSE_NBITS_MAX+1);
	
	--in SW, he uses U16 to store it, but maybe it can be smaller?
	--And this number is also the width of state value, but the intermidiate result should be more than this
	constant LL_STATE_TABLE_ELEMENT_NBITS : integer := 16; 
	constant LL_STATE_TABLE_ELEMENT_WIDTH : integer := work.arithmetic_pkg.clog2(LL_STATE_TABLE_ELEMENT_NBITS+1);
	constant LL_STATE_INITIAL			  : integer := 512;
	
	constant ML_STATE_TABLE_ELEMENT_NBITS : integer := 16; 
	constant ML_STATE_TABLE_ELEMENT_WIDTH : integer := work.arithmetic_pkg.clog2(LL_STATE_TABLE_ELEMENT_NBITS+1);
	constant ML_STATE_INITIAL			  : integer := 512;	
	
	constant OFF_STATE_TABLE_ELEMENT_NBITS : integer := 16; 
	constant OFF_STATE_TABLE_ELEMENT_WIDTH : integer := work.arithmetic_pkg.clog2(LL_STATE_TABLE_ELEMENT_NBITS+1);
	constant OFF_STATE_INITIAL			  : integer := 256;	
	
	constant REPEATED_OFFSET1_INIT		: unsigned(MAX_OFFSET_WIDTH-1 downto 0)	:= to_unsigned(1, MAX_OFFSET_WIDTH);
	constant REPEATED_OFFSET2_INIT		: unsigned(MAX_OFFSET_WIDTH-1 downto 0)	:= to_unsigned(4, MAX_OFFSET_WIDTH);
	constant REPEATED_OFFSET3_INIT		: unsigned(MAX_OFFSET_WIDTH-1 downto 0)	:= to_unsigned(8, MAX_OFFSET_WIDTH);

	-------------------------------
	-----------for fse-------------
	-------------------------------	
	type repeated_offset_t is record
		offset_1				: unsigned(MAX_OFFSET_WIDTH-1 downto 0);
		offset_2				: unsigned(MAX_OFFSET_WIDTH-1 downto 0);
		offset_3				: unsigned(MAX_OFFSET_WIDTH-1 downto 0);
	end record repeated_offset_t;

	type repeated_offset_check_result_t is record
		offsets					: repeated_offset_t;
		updated_offset			: unsigned(MAX_OFFSET_WIDTH-1 downto 0);
	end record repeated_offset_check_result_t;
	
	constant HUFFMAN_TABLE_SIZE			: integer:= 256;
	
	type lit_length_encode_t is record
		valid					: std_logic;
		code					: unsigned(LIT_LENGTH_CODE_WIDTH-1 downto 0);
		stream_bits				: unsigned(LIT_LENGTH_NBITS_MAX-1 downto 0);
		stream_bits_num			: unsigned(LIT_LENGTH_NBITS_WIDTH-1 downto 0);			
	end record lit_length_encode_t;
	
	type lit_length_encoded_bits_t is record
		code_bits				: unsigned(LL_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
		code_bits_num			: unsigned(LL_STATE_TABLE_ELEMENT_WIDTH-1 downto 0);
		stream_bits				: unsigned(LIT_LENGTH_NBITS_MAX-1 downto 0);
		stream_bits_num			: unsigned(LIT_LENGTH_NBITS_WIDTH-1 downto 0);	
	end record lit_length_encoded_bits_t;
	
	type match_length_encode_t is record
		valid					: std_logic;
		code					: unsigned(MATCH_LENGTH_CODE_WIDTH-1 downto 0);
		stream_bits				: unsigned(MATCH_LENGTH_NBITS_MAX-1 downto 0);
		stream_bits_num			: unsigned(MATCH_LENGTH_NBITS_WIDTH-1 downto 0);
	end record match_length_encode_t;
	
	type match_length_encoded_bits_t is record
		code_bits				: unsigned(ML_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
		code_bits_num			: unsigned(ML_STATE_TABLE_ELEMENT_WIDTH-1 downto 0);
		stream_bits				: unsigned(MATCH_LENGTH_NBITS_MAX-1 downto 0);
		stream_bits_num			: unsigned(MATCH_LENGTH_NBITS_WIDTH-1 downto 0);
	end record match_length_encoded_bits_t;
	
	type match_offset_encode_t is record
		valid					: std_logic;
		code					: unsigned(MATCH_OFFSET_CODE_WIDTH-1 downto 0);
		stream_bits				: unsigned(MATCH_OFFSET_NBITS_MAX-1 downto 0);
		stream_bits_num			: unsigned(MATCH_OFFSET_NBITS_WIDTH-1 downto 0);
	end record match_offset_encode_t;
	
	type match_offset_encoded_bits_t is record
		code_bits				: unsigned(OFF_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
		code_bits_num			: unsigned(OFF_STATE_TABLE_ELEMENT_WIDTH-1 downto 0);
		stream_bits				: unsigned(MATCH_OFFSET_NBITS_MAX-1 downto 0);
		stream_bits_num			: unsigned(MATCH_OFFSET_NBITS_WIDTH-1 downto 0);
	end record match_offset_encoded_bits_t;
	
	type sequence_encoded_bits_t is record
		lit_length_encoded_bits		: lit_length_encoded_bits_t;
		match_length_encoded_bits	: match_length_encoded_bits_t;
		match_offset_encoded_bits	: match_offset_encoded_bits_t;
		valid						: std_logic;
		block_last					: std_logic;
	end record sequence_encoded_bits_t;
	
	--max number of bits a sequence can be changed to
	constant SEQUENCE_BITS_MERGED_NUM_MAX		:integer := LL_STATE_TABLE_ELEMENT_NBITS + ML_STATE_TABLE_ELEMENT_NBITS + OFF_STATE_TABLE_ELEMENT_NBITS + LIT_LENGTH_NBITS_MAX + MATCH_LENGTH_NBITS_MAX + MATCH_OFFSET_NBITS_MAX;
	constant SEQUENCE_BITS_MERGED_NUM_WIDTH		:integer := work.arithmetic_pkg.clog2(SEQUENCE_BITS_MERGED_NUM_MAX+1);
	type sequence_merged_bitstream_t is record
		bitstream					: unsigned(SEQUENCE_BITS_MERGED_NUM_MAX-1 downto 0);
		bitstream_num				: unsigned(SEQUENCE_BITS_MERGED_NUM_WIDTH-1 downto 0);
		valid						: std_logic;
		block_last					: std_logic;
	end record sequence_merged_bitstream_t;
	
	-------------------------------
	-------for huffman-------------
	-------------------------------
		
	type huff_encode_bits_t is record
		encoded_bits				: unsigned(HUFF_NBIT_MAX-1 downto 0);
		encoded_bits_num			: unsigned(HUFF_NBIT_MAX_WIDTH-1 downto 0);
	end record huff_encode_bits_t;
	
	type huff_encodes_t is array(LITERAL_LENGTH_ALIGNED_MAX-1 downto 0) of huff_encode_bits_t;
	
	type huffman_unaligend_code_t is record
		huff_encodes				: huff_encodes_t;
		encodes_num					: unsigned(LITERAL_LENGTH_ALIGNED_MAX_WIDTH-1 downto 0);
		valid						: std_logic;
		block_last					: std_logic;
	end record huffman_unaligend_code_t;
	
	constant HUFFMAN_BITS_MERGED_NUM_MAX		:integer := HUFF_NBIT_MAX * LITERAL_LENGTH_ALIGNED_MAX;
	constant HUFFMAN_BITS_MERGED_NUM_WIDTH		:integer := work.arithmetic_pkg.clog2(HUFFMAN_BITS_MERGED_NUM_MAX+1);
	type huffman_merged_bitstream_t is record
		bitstream					: unsigned(HUFFMAN_BITS_MERGED_NUM_MAX-1 downto 0);
		bitstream_num				: unsigned(HUFFMAN_BITS_MERGED_NUM_WIDTH-1 downto 0);
		valid						: std_logic;
		block_last					: std_logic;
	end record huffman_merged_bitstream_t;
	
	type block_metadata_fse_t is record
		valid				: std_logic;
		fse_bits_cnt		: unsigned(MAX_BLOCK_BITS_SIZE_WIDTH-1 downto 0);
		ll_state_last		: unsigned(LL_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
		ml_state_last		: unsigned(ML_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
		off_state_last		: unsigned(OFF_STATE_TABLE_ELEMENT_NBITS-1 downto 0);
	end record block_metadata_fse_t;
	
	type block_metadata_huffman_t is record
		valid				: std_logic;
		huffman_bits_cnt	: unsigned(MAX_BLOCK_BITS_SIZE_WIDTH-1 downto 0);
	end record block_metadata_huffman_t;
	
	function literal_len2code(num : in unsigned) return lit_length_encode_t;
	
	function match_len2code(num : in unsigned) return match_length_encode_t;
	
	function match_off2code(num : in unsigned) return match_offset_encode_t;
	
	function update_offset(repeated_offsets		: in repeated_offset_t; offset	: in unsigned(MAX_OFFSET_WIDTH-1 downto 0);literal_length	: in unsigned(MAX_LITERAL_LENGTH_WIDTH-1 downto 0) ) return repeated_offset_check_result_t;
	
end package entropy_pkg;

package body entropy_pkg is
	function literal_len2code(num : in unsigned) 
		return lit_length_encode_t is
		variable result		: lit_length_encode_t;
	begin
		if(num(16) = '1')then 				result.code := to_unsigned(35,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(16, LIT_LENGTH_NBITS_WIDTH);
		elsif(num(15) = '1')then 			result.code := to_unsigned(34,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(15, LIT_LENGTH_NBITS_WIDTH);
		elsif(num(14) = '1')then 			result.code := to_unsigned(33,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(14, LIT_LENGTH_NBITS_WIDTH);
		elsif(num(13) = '1')then 			result.code := to_unsigned(32,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(13, LIT_LENGTH_NBITS_WIDTH);
		elsif(num(12) = '1')then 			result.code := to_unsigned(31,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(12, LIT_LENGTH_NBITS_WIDTH);
		elsif(num(11) = '1')then 			result.code := to_unsigned(30,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(11, LIT_LENGTH_NBITS_WIDTH);
		elsif(num(10) = '1')then 			result.code := to_unsigned(29,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(10, LIT_LENGTH_NBITS_WIDTH);
		elsif(num(9) = '1')then 			result.code := to_unsigned(28,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(9, LIT_LENGTH_NBITS_WIDTH);
		elsif(num(8) = '1')then 			result.code := to_unsigned(27,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(8, LIT_LENGTH_NBITS_WIDTH);
		elsif(num(7) = '1')then 			result.code := to_unsigned(26,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(7, LIT_LENGTH_NBITS_WIDTH);
		elsif(num(6) = '1')	then 			result.code := to_unsigned(25,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(6, LIT_LENGTH_NBITS_WIDTH);
		elsif(num(5 downto 0) >= 48)then 	result.code := to_unsigned(24,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(4, LIT_LENGTH_NBITS_WIDTH);
		elsif(num(5 downto 0) >= 40)then 	result.code := to_unsigned(23,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(3, LIT_LENGTH_NBITS_WIDTH);
		elsif(num(5 downto 0) >= 32)then 	result.code := to_unsigned(22,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(3, LIT_LENGTH_NBITS_WIDTH);
		elsif(num(4 downto 0) >= 28)then 	result.code := to_unsigned(21,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(2, LIT_LENGTH_NBITS_WIDTH);
		elsif(num(4 downto 0) >= 24)then 	result.code := to_unsigned(20,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(2, LIT_LENGTH_NBITS_WIDTH);
		elsif(num(4 downto 0) >= 22)then 	result.code := to_unsigned(19,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(1, LIT_LENGTH_NBITS_WIDTH);
		elsif(num(4 downto 0) >= 20)then 	result.code := to_unsigned(18,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(1, LIT_LENGTH_NBITS_WIDTH);
		elsif(num(4 downto 0) >= 18)then 	result.code := to_unsigned(17,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(1, LIT_LENGTH_NBITS_WIDTH);
		elsif(num(4 downto 0) >= 16)then 	result.code := to_unsigned(16,LIT_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(1, LIT_LENGTH_NBITS_WIDTH);
		else 								result.code := resize(num(3 downto 0),LIT_LENGTH_CODE_WIDTH); 	result.stream_bits_num := to_unsigned(0, LIT_LENGTH_NBITS_WIDTH);
		end if;
		result.stream_bits		:= resize(num, LIT_LENGTH_NBITS_MAX); -- the highest bit should not be in bitstreaming
		return result;
	end function literal_len2code;
	
	function match_len2code(num : in unsigned) 
		return match_length_encode_t is
		variable result		: match_length_encode_t;
		variable num_minus3	: unsigned(MAX_MATCH_LENGTH_WIDTH-1 downto 0);
	begin
		if(num = 0)then
			num_minus3	:= (others => '0');
		else
			num_minus3	:= num -3;
		end if;
		
		if(num_minus3(16) = '1')then 				result.code := to_unsigned(52, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(16, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(15) = '1')then 			result.code := to_unsigned(51, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(15, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(14) = '1')then 			result.code := to_unsigned(50, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(14, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(13) = '1')then 			result.code := to_unsigned(49, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(13, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(12) = '1')then 			result.code := to_unsigned(48, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(12, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(11) = '1')then 			result.code := to_unsigned(47, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(11, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(10) = '1')then 			result.code := to_unsigned(46, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(10, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(9) = '1')then 				result.code := to_unsigned(45, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(9, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(8) = '1')then 				result.code := to_unsigned(44, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(8, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(7) = '1')then 				result.code := to_unsigned(43, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(7, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(6 downto 0) >= 96)then 	result.code := to_unsigned(42, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(5, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(6 downto 0) >= 80)then 	result.code := to_unsigned(41, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(4, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(6 downto 0) >= 64)then 	result.code := to_unsigned(40, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(4, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(5 downto 0) >= 56)then 	result.code := to_unsigned(39, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(3, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(5 downto 0) >= 48)then 	result.code := to_unsigned(38, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(3, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(5 downto 0) >= 44)then 	result.code := to_unsigned(37, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(2, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(5 downto 0) >= 40)then 	result.code := to_unsigned(36, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(2, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(5 downto 0) >= 38)then 	result.code := to_unsigned(35, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(1, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(5 downto 0) >= 36)then 	result.code := to_unsigned(34, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(1, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(5 downto 0) >= 34)then 	result.code := to_unsigned(33, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(1, MATCH_LENGTH_NBITS_WIDTH);
		elsif(num_minus3(5 downto 0) >= 32)then 	result.code := to_unsigned(32, MATCH_LENGTH_CODE_WIDTH); 			result.stream_bits_num := to_unsigned(1, MATCH_LENGTH_NBITS_WIDTH);
		else 										result.code := resize(num_minus3(4 downto 0), MATCH_LENGTH_CODE_WIDTH); 	result.stream_bits_num := to_unsigned(0, MATCH_LENGTH_NBITS_WIDTH);
		end if;
		result.stream_bits		:= resize(num_minus3, MATCH_LENGTH_NBITS_MAX);
		return result;
	end function;
	
	function match_off2code(num : in unsigned)
		return match_offset_encode_t is
		variable offset_value 	: unsigned (MAX_OFFSET_WIDTH-1 downto 0); 
		variable result			: match_offset_encode_t;
		variable i				: integer;
	begin
		result.stream_bits		:= resize(num, MATCH_OFFSET_NBITS_MAX);
		result.code				:= to_unsigned(0, MATCH_OFFSET_CODE_WIDTH);
		result.stream_bits_num	:= to_unsigned(0, MATCH_OFFSET_NBITS_WIDTH);
		for i in MAX_OFFSET_WIDTH-1 downto 0 loop
			if(num(i) = '1')then
				result.code				:= to_unsigned(i, MATCH_OFFSET_CODE_WIDTH);
				result.stream_bits_num	:= to_unsigned(i, MATCH_OFFSET_NBITS_WIDTH);
				exit;
			end if;
		end loop;
		
		result.stream_bits		:= resize(num, MATCH_OFFSET_NBITS_MAX);
		return result;
	end function;
	
	function update_offset(
		repeated_offsets		: in repeated_offset_t;
		offset					: in unsigned(MAX_OFFSET_WIDTH-1 downto 0);
		literal_length			: in unsigned(MAX_LITERAL_LENGTH_WIDTH-1 downto 0) )
		return repeated_offset_check_result_t is
		variable result 		: repeated_offset_check_result_t;
	begin
		if(offset = 0)then
			result.updated_offset		:= offset;
		elsif(offset = repeated_offsets.offset_1)then
			if(literal_length = 0)then
				result.updated_offset	:= to_unsigned(0, MAX_OFFSET_WIDTH);
			else
				result.updated_offset	:= to_unsigned(1, MAX_OFFSET_WIDTH);
			end if;
			result.offsets				:= repeated_offsets;
		elsif(offset = repeated_offsets.offset_2)then
			if(literal_length = 0)then
				result.updated_offset	:= to_unsigned(1, MAX_OFFSET_WIDTH);
			else
				result.updated_offset	:= to_unsigned(2, MAX_OFFSET_WIDTH);
			end if;
			result.offsets				:= (repeated_offsets.offset_2, repeated_offsets.offset_1, repeated_offsets.offset_3);
		elsif(offset = repeated_offsets.offset_3)then
			if(literal_length = 0)then
				result.updated_offset	:= to_unsigned(2, MAX_OFFSET_WIDTH);
			else
				result.updated_offset	:= to_unsigned(3, MAX_OFFSET_WIDTH);
			end if;
			result.offsets				:= (repeated_offsets.offset_3, repeated_offsets.offset_1, repeated_offsets.offset_2);
		else
			result.updated_offset		:= offset + to_unsigned(3, MAX_OFFSET_WIDTH);
			result.offsets				:= (offset, repeated_offsets.offset_1, repeated_offsets.offset_2);
		end if;
		return result;
	end function;
	
end package body entropy_pkg;