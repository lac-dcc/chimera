library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.arithmetic_pkg.all;

--before merge  | 00...00 bistream1 | 00...00 bitsream2 |
--after merge	| 00...0000000000 bitstream1 bitstream2 |
entity bitstream_2to1_merger is
	generic(
		BITSTREAM1_WIDTH_MAX			: integer;
		BITSTREAM2_WIDTH_MAX			: integer;
		BITSTREAM1_NUM_BITS_MAX			: integer := work.arithmetic_pkg.clog2(BITSTREAM1_WIDTH_MAX+1);
		BITSTREAM2_NUM_BITS_MAX			: integer := work.arithmetic_pkg.clog2(BITSTREAM2_WIDTH_MAX+1);
		BITSTREAM_MERGED_WIDTH_MAX		: integer := BITSTREAM1_WIDTH_MAX + BITSTREAM2_WIDTH_MAX;
		BITSTREAM_MERGED_NUM_BITS_MAX	: integer := work.arithmetic_pkg.clog2(BITSTREAM_MERGED_WIDTH_MAX+1)
	);
	port(
		clk								: in std_logic;
		
		bitstream1						: in unsigned(BITSTREAM1_WIDTH_MAX-1 downto 0);
		bitstream1_num_bits				: in unsigned(BITSTREAM1_NUM_BITS_MAX-1 downto 0);
		
		bitstream2						: in unsigned(BITSTREAM2_WIDTH_MAX-1 downto 0);
		bitstream2_num_bits				: in unsigned(BITSTREAM2_NUM_BITS_MAX-1 downto 0);
		
		bitstream_merged				: out unsigned(BITSTREAM_MERGED_WIDTH_MAX -1 downto 0);
		bitstream_merged_num_bits		: out unsigned(BITSTREAM_MERGED_NUM_BITS_MAX-1 downto 0)
	);
end entity;

architecture rtl of bitstream_2to1_merger is
	signal bitstream1_extended			: unsigned(BITSTREAM_MERGED_WIDTH_MAX-1 downto 0);
	signal bitstream2_extended			: unsigned(BITSTREAM_MERGED_WIDTH_MAX-1 downto 0);
begin
	bitstream1_extended					<= resize(bitstream1, BITSTREAM_MERGED_WIDTH_MAX);
	bitstream2_extended					<= resize(bitstream2, BITSTREAM_MERGED_WIDTH_MAX);

	process(clk)
	begin
		if(rising_edge(clk))then
			bitstream_merged			<= bitstream2_extended or shift_left(bitstream1_extended, to_integer(bitstream2_num_bits));
			bitstream_merged_num_bits	<= resize(bitstream1_num_bits, BITSTREAM_MERGED_NUM_BITS_MAX) + bitstream2_num_bits;
		end if;
	end process;

end architecture;