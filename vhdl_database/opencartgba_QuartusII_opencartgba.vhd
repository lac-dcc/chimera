library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity opencartgba is
	port (
		GBA_AD : in std_logic_vector(15 downto 0);
		GBA_CS : in std_logic;
		GBA_RD : in std_logic;
		GBA_WR : in std_logic;
		ROM_A : out std_logic_vector(15 downto 0)
	);
end opencartgba;

architecture cart of opencartgba is
	signal GBA_RD_WR : std_logic;
	signal ADDR : std_logic_vector(15 downto 0);
	signal ADDR_INC : std_logic_vector(15 downto 0);
begin
	GBA_RD_WR <= GBA_RD and GBA_WR;
	process (GBA_CS, GBA_RD_WR) is
	begin
		if GBA_CS = '1' then
			ADDR <= GBA_AD;
		elsif rising_edge(GBA_RD_WR) then
			ADDR <= std_logic_vector(unsigned(ADDR) + 1);
		end if;
	end process;
	ROM_A <= ADDR;
end cart;
