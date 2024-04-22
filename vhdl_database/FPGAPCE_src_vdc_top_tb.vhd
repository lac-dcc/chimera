library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb is
end tb;

architecture sim of tb is
signal SW			: std_logic_vector(9 downto 0);
		
signal HEX0		: std_logic_vector(6 downto 0);
signal HEX1		: std_logic_vector(6 downto 0);
signal HEX2		: std_logic_vector(6 downto 0);
signal HEX3		: std_logic_vector(6 downto 0);
		
signal KEY			: std_logic_vector(3 downto 0);
				
signal LEDR		: std_logic_vector(9 downto 0);
signal LEDG		: std_logic_vector(7 downto 0);
		
signal CLOCK_24	: std_logic_vector(1 downto 0);
				
signal FL_ADDR		: std_logic_vector(21 downto 0);
signal FL_DQ		: std_logic_vector(7 downto 0);
signal FL_OE_N		: std_logic;
signal FL_RST_N	: std_logic;
signal FL_WE_N		: std_logic;
		
signal SRAM_ADDR	: std_logic_vector(17 downto 0);
signal SRAM_CE_N	: std_logic;
signal SRAM_DQ		: std_logic_vector(15 downto 0);
signal SRAM_LB_N	: std_logic;
signal SRAM_OE_N	: std_logic;
signal SRAM_UB_N	: std_logic;
signal SRAM_WE_N	: std_logic;

signal RESET		: std_logic;

begin

-- SRAM
vram : entity work.sram_sim 
port map(
	A	=> SRAM_ADDR,
	CEn	=> SRAM_CE_N,
	OEn	=> SRAM_OE_N,
	WEn	=> SRAM_WE_N,
	UBn	=> SRAM_UB_N,
	LBn	=> SRAM_LB_N,
	DQ	=> SRAM_DQ
);

-- FLASH
flash : entity work.flash_sim
port map(
	A	=> FL_ADDR,
	OEn	=> FL_OE_N,
	D	=> FL_DQ
);

sys : entity work.vdc_top
port map(
	SW			=> SW,
		
	HEX0		=> HEX0,
	HEX1		=> HEX1,
	HEX2		=> HEX2,
	HEX3		=> HEX3,
		
	KEY			=> KEY,
				
	LEDR		=> LEDR,
	LEDG		=> LEDG,
		
	CLOCK_24	=> CLOCK_24,
				
	FL_ADDR		=> FL_ADDR,
	FL_DQ		=> FL_DQ,
	FL_OE_N		=> FL_OE_N,
	FL_RST_N	=> FL_RST_N,
	FL_WE_N		=> FL_WE_N,
		
	SRAM_ADDR	=> SRAM_ADDR,
	SRAM_CE_N	=> SRAM_CE_N,
	SRAM_DQ		=> SRAM_DQ,
	SRAM_LB_N	=> SRAM_LB_N,
	SRAM_OE_N	=> SRAM_OE_N,
	SRAM_UB_N	=> SRAM_UB_N,
	SRAM_WE_N	=> SRAM_WE_N
);

SW(9 downto 1) <= "000000000";
KEY <= "1111";

-- CLOCK (24 MHz)
process
begin
	CLOCK_24 <= "00";
	wait for 20.8333 ns;
	CLOCK_24 <= "11";
	wait for 20.8333 ns;
end process;

-- CLOCK (21.477*2 MHz)
-- process
-- begin
	-- CLOCK_24 <= "00";
	-- wait for 11.63 ns;
	-- CLOCK_24 <= "11";
	-- wait for 11.64 ns;
-- end process;

-- RESET
process
begin
	SW(0) <= '1';
	wait for 8000 ns;
	SW(0) <= '0';
	wait;
end process;
RESET <= SW(0);

end sim;