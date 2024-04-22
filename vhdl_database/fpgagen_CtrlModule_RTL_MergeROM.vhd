-- ROM Wrapper - combines two ROMS of different sizes into a single ROM.
-- Useful to reduce block RAM demands.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zpupkg.all;

entity MergeROM is
generic
	(
		maxAddrBitBRAM : integer := maxAddrBitBRAMLimit -- Specify your actual ROM size to save LEs and unnecessary block RAM usage.
	);
port (
	clk : in std_logic;
	areset : in std_logic := '0';
	from_zpu : in ZPU_ToROM;
	to_zpu : out ZPU_FromROM;
	from_rom1 : in ZPU_FromROM;
	to_rom1 : out ZPU_ToROM;
	from_rom2 : in ZPU_FromROM;
	to_rom2 : out ZPU_ToROM
);
end entity;

--	type ZPU_ToROM is record
--		memAWriteEnable : std_logic;
--		memAAddr : std_logic_vector(maxAddrBitBRAMLimit downto minAddrBit);
--		memAWrite : std_logic_vector(wordSize-1 downto 0);
--		memBWriteEnable : std_logic;
--		memBAddr : std_logic_vector(maxAddrBitBRAMLimit downto minAddrBit);
--		memBWrite : std_logic_vector(wordSize-1 downto 0);
--	end record;
--	type ZPU_FromROM is record
--		memARead : std_logic_vector(wordSize-1 downto 0);
--		memBRead : std_logic_vector(wordSize-1 downto 0);
--	end record;

architecture arch of MergeROM is
signal romsel_a : std_logic;
signal romsel_b : std_logic;
begin

process(clk)
begin
	if rising_edge(clk) then
		romsel_a<=from_zpu.memAAddr(maxAddrBitBRAM);
		romsel_b<=from_zpu.memBAddr(maxAddrBitBRAM);
	end if;
end process;

-- use high bit of incoming address to switch between two ROMS
to_rom1.memAAddr<=from_zpu.memAAddr;
to_rom1.memAWrite<=from_zpu.memAWrite;
to_rom1.memBAddr<=from_zpu.memBAddr;
to_rom1.memBWrite<=from_zpu.memBWrite;
to_rom1.memAWriteEnable<=from_zpu.memAWriteEnable when from_zpu.memAAddr(maxAddrBitBRAM)='0' else '0';
to_rom1.memBWriteEnable<=from_zpu.memBWriteEnable when from_zpu.memBAddr(maxAddrBitBRAM)='0' else '0';

to_rom2.memAAddr<=from_zpu.memAAddr;
to_rom2.memAWrite<=from_zpu.memAWrite;
to_rom2.memBAddr<=from_zpu.memBAddr;
to_rom2.memBWrite<=from_zpu.memBWrite;
to_rom2.memAWriteEnable<=from_zpu.memAWriteEnable when from_zpu.memAAddr(maxAddrBitBRAM)='1' else '0';
to_rom2.memBWriteEnable<=from_zpu.memBWriteEnable when from_zpu.memBAddr(maxAddrBitBRAM)='1' else '0';

to_zpu.memARead <= from_rom1.memARead when romsel_a='0' else from_rom2.memARead;
to_zpu.memBRead <= from_rom1.memBRead when romsel_b='0' else from_rom2.memBRead;

end arch;

