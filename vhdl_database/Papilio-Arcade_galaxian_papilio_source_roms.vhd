library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library UNISIM;
	use UNISIM.Vcomponents.all;

entity GALAXIAN_ROMS is
	port (
		I_ROM_CLK   : in  std_logic;
		I_ADDR      : in  std_logic_vector(18 downto 0);
		O_DATA      : out std_logic_vector(7 downto 0)
	);
end;

architecture RTL of GALAXIAN_ROMS is

--CPU-Roms
signal ROM_D    : std_logic_vector(7 downto 0) := (others => '0');
signal DATA_OUT : std_logic_vector(7 downto 0) := (others => '0');

begin
	u_rom : entity work.ROM_PGM_0
	port map (
		CLK  => I_ROM_CLK,
		ADDR => I_ADDR(13 downto 0),
		DATA => ROM_D,
		ENA  => '1'
	);

--    address map
----------------------------------------------------
-- 0x00000 - 0x007FF       galmidw.u        CPU-ROM
-- 0x00800 - 0x00FFF       galmidw.v        CPU-ROM
-- 0x01000 - 0x017FF       galmidw.w        CPU-ROM
-- 0x01800 - 0x01FFF       galmidw.y        CPU-ROM
-- 0x02000 - 0x027FF       7l               CPU-ROM
-- 0x04000 - 0x047FF       1k.bin           VID-ROM
-- 0x05000 - 0x057FF       1h.bin           VID-ROM
-- 0x10000 - 0x3FFFF       mc_wav_2.bin     Sound(Wav)Data
	process (I_ROM_CLK)
	begin
		if rising_edge(I_ROM_CLK) then
			if (I_ADDR < "00"& x"4000") then
				O_DATA <= ROM_D;
			end if;
		end if;
	end process;
end;
