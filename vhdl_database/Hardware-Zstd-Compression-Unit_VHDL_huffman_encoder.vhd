library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.compressor_pkg.all;
use work.entropy_pkg.all;
use work.huffman_tables_pkg.all;

entity huffman_encoder is
	port(
		clk							: in std_logic;
		reset_n						: in std_logic;
		
		start						: in std_logic;
		
		aligned_huffman_bytes_in	: in literal_aligned_bytes_t;
		last_in						: in std_logic;
		
		huffman_encoded_out			: out huffman_unaligend_code_t;
		last_out					: out std_logic;
		
		huffman_metadata_out		: out block_metadata_huffman_t;
		huffman_metadata_last_out	: out std_logic
	);
end entity;

architecture rtl of huffman_encoder is
	--stage1
	signal aligned_huffman_bytes_d			: literal_aligned_bytes_t;
	signal last_d							: std_logic;
	
	--stage2
	signal huffman_encoded					: huffman_unaligend_code_t;
	signal last_d2							: std_logic;
	
	--stage3
	signal huffman_encoded_cleaned			: huffman_unaligend_code_t;
	signal last_d3							: std_logic;
	
	--stage4
	signal huffman_encoded_cleaned_d		: huffman_unaligend_code_t;
	signal encoded_bits_count_clean_flag	: std_logic;
	signal encoded_bits_count				: unsigned(MAX_BLOCK_BITS_SIZE_WIDTH-1 downto 0);
	signal huffman_metadata_valid			: std_logic;
	signal last_d4							: std_logic;
begin
	--stage1
	process(clk)
	begin
		if(rising_edge(clk))then
			aligned_huffman_bytes_d			<= aligned_huffman_bytes_in;
			last_d							<= last_in;
		end if;
	end process;
	
	--stage2
	process(clk)
		variable i									: integer;
	begin
		if(rising_edge(clk))then
			for i in LITERAL_LENGTH_ALIGNED_MAX-1 downto 0 loop
				huffman_encoded.huff_encodes(i)		<= work.huffman_tables_pkg.huffman_encode(unsigned(aligned_huffman_bytes_d.literal_data(i*BITS_PER_BYTE+BITS_PER_BYTE-1 downto i*BITS_PER_BYTE)));
			end loop;
			huffman_encoded.valid					<= aligned_huffman_bytes_d.literal_valid;
			huffman_encoded.block_last				<= aligned_huffman_bytes_d.block_last;
			huffman_encoded.encodes_num				<= aligned_huffman_bytes_d.literal_length;
			last_d2									<= last_d;
		end if;
	end process;
	
	--stage3, clean the invalid codes
	process(clk)
		variable i									: integer;
	begin
		if(rising_edge(clk))then
			for i in LITERAL_LENGTH_ALIGNED_MAX-1 downto 0 loop
				if(huffman_encoded.encodes_num >= (LITERAL_LENGTH_ALIGNED_MAX-i))then
					huffman_encoded_cleaned.huff_encodes(i)		<= huffman_encoded.huff_encodes(i);
				else
					huffman_encoded_cleaned.huff_encodes(i)		<= (others => (others => '0'));
				end if;
			end loop;
			huffman_encoded_cleaned.valid					<= huffman_encoded.valid;
			huffman_encoded_cleaned.block_last				<= huffman_encoded.block_last;
			huffman_encoded_cleaned.encodes_num				<= huffman_encoded.encodes_num;
			last_d3											<= last_d2;
		end if;
	end process;
	
	--stage 4
	process(clk)
	begin
		if(rising_edge(clk))then --accumulate the number of fse bits for each block
			if(reset_n = '0')then
				encoded_bits_count				<= (others => '0');
			elsif(start = '1')then
				encoded_bits_count				<= (others => '0');
			elsif(huffman_encoded_cleaned.valid = '1')then
				if(encoded_bits_count_clean_flag = '1')then
					encoded_bits_count				<= (((resize(huffman_encoded_cleaned.huff_encodes(0).encoded_bits_num, encoded_bits_count'length) + resize(huffman_encoded_cleaned.huff_encodes(1).encoded_bits_num, encoded_bits_count'length) )+
														(resize(huffman_encoded_cleaned.huff_encodes(2).encoded_bits_num, encoded_bits_count'length) + resize(huffman_encoded_cleaned.huff_encodes(3).encoded_bits_num, encoded_bits_count'length) ))+
														((resize(huffman_encoded_cleaned.huff_encodes(4).encoded_bits_num, encoded_bits_count'length) + resize(huffman_encoded_cleaned.huff_encodes(5).encoded_bits_num, encoded_bits_count'length) )+
														(resize(huffman_encoded_cleaned.huff_encodes(6).encoded_bits_num, encoded_bits_count'length) + resize(huffman_encoded_cleaned.huff_encodes(7).encoded_bits_num, encoded_bits_count'length) )));
				else
					encoded_bits_count				<= encoded_bits_count + (((resize(huffman_encoded_cleaned.huff_encodes(0).encoded_bits_num, encoded_bits_count'length) + resize(huffman_encoded_cleaned.huff_encodes(1).encoded_bits_num, encoded_bits_count'length) )+
														(resize(huffman_encoded_cleaned.huff_encodes(2).encoded_bits_num, encoded_bits_count'length) + resize(huffman_encoded_cleaned.huff_encodes(3).encoded_bits_num, encoded_bits_count'length) ))+
														((resize(huffman_encoded_cleaned.huff_encodes(4).encoded_bits_num, encoded_bits_count'length) + resize(huffman_encoded_cleaned.huff_encodes(5).encoded_bits_num, encoded_bits_count'length) )+
														(resize(huffman_encoded_cleaned.huff_encodes(6).encoded_bits_num, encoded_bits_count'length) + resize(huffman_encoded_cleaned.huff_encodes(7).encoded_bits_num, encoded_bits_count'length) )));
				end if;
			end if;
			
			if(reset_n = '0')then
				encoded_bits_count_clean_flag	<= '0';
			elsif(start = '1')then
				encoded_bits_count_clean_flag	<= '0';
			elsif(huffman_encoded_cleaned.valid = '1')then
				if(last_d3 = '1' or huffman_encoded_cleaned.block_last = '1')then
					encoded_bits_count_clean_flag	<= '1';
				else
					encoded_bits_count_clean_flag	<= '0';
				end if;
			end if;
			
			if((last_d3 = '1' or huffman_encoded_cleaned.block_last = '1') and huffman_encoded_cleaned.valid = '1')then
				huffman_metadata_valid					<= '1';
			else
				huffman_metadata_valid					<= '0';
			end if;
			
			huffman_encoded_cleaned_d					<= huffman_encoded_cleaned;
			last_d4										<= last_d3;
		end if;
	end process;
	
	huffman_encoded_out								<= huffman_encoded_cleaned_d;
	last_out										<= last_d4;
	
	huffman_metadata_out.huffman_bits_cnt			<= encoded_bits_count;
	huffman_metadata_out.valid 						<= huffman_metadata_valid;
	huffman_metadata_last_out						<= last_d4;
end architecture;