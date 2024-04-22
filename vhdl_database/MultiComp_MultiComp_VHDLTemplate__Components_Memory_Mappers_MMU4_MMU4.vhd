-- Memory management unit 

-- based on code by Will Sowerbutts 
-- designed for Grant Searle's MultiComp
-- The Z80 has 64k of ram which is divided up into 4 x 16k blocks
-- each block has an address which maps this block to a physical location in external ram
-- Updated by Rienk Koolstra to support 4x16 k pages (from the original 16x4k)
-- Updated by Max Scane to support 1MB of RAM

--MMU_SELECT .equ 0xF8 -- use 2 bits to select which one of 4 16k blocks to change
--MMU_PAGE17 .equ 0xFA -- not used
--MMU_PERM .equ 0xFB  -- not used
--MMU_FRAMEHI .equ 0xFC -- not used as ram not big enough!
--MMU_FRAMELO .equ 0xFD -- use 6 bits to remap to one of 64 locations in sram


library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.std_logic_unsigned.all;
	
entity MMU4 is
	port (
	   clk			: in std_logic;
		n_wr			: in std_logic;
		n_rd			: in std_logic;
		mmu_reset	: in std_logic;
	   dataIn		: in std_logic_vector(7 downto 0); -- data from the cpu
		cpuAddress	: in std_logic_vector(15 downto 0); -- address from the cpu
		mmuAddressOut : out std_logic_vector(19 downto 0) -- new address sent back to the chip
   );
	
end MMU4;

architecture rtl of MMU4 is
	type mmu_entry_type is
		record
			frame: std_logic_vector(5 downto 0); -- 64 blocks of 16k in a 1M ram
		end record;
	type mmu_entry_array is array(natural range <>) of mmu_entry_type;
	signal mmu_entry : mmu_entry_array(0 to 3);
	signal cpu_entry_select : std_logic_vector(1 downto 0); -- MMU_SELECT .equ 0xF8 
	alias page_number : std_logic_vector( 1 downto 0) is cpuAddress(15 downto 14); -- break up the incoming virtual address
	alias page_offset : std_logic_vector(13 downto 0) is cpuAddress(13 downto  0);

begin
	mmuAddressOut <= mmu_entry(to_integer(unsigned(page_number))).frame & page_offset;  -- decode address

process (n_wr, mmu_reset) begin 
	if (mmu_reset = '0') then
		mmu_entry( 0).frame <= "000000"; -- set first 64k to startup values 
		mmu_entry( 1).frame <= "000001";
		mmu_entry( 2).frame <= "000010";
		mmu_entry( 3).frame <= "000011";
	elsif (rising_edge(n_wr)) then -- write to ports
		case cpuAddress(2 downto 0) is
			when "000" => 
				cpu_entry_select <= dataIn(1 downto 0); -- MMU_SELECT .equ 0xF8 
			when "101" => --MMU_FRAMELO .equ 0xFD
				mmu_entry(to_integer(unsigned(cpu_entry_select(1 downto 0)))).frame(5 downto 0) <= dataIn(5 downto 0);
			when others =>
		end case;
	end if;
end process;

end rtl;	
