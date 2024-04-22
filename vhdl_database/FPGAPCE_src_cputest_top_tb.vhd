library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb is
end tb;

architecture sim of tb is

signal RESET		: std_logic;
signal CLOCK		: std_logic;

-- FLASH
signal FL_ADDR		: std_logic_vector(21 downto 0);
signal FL_DQ		: std_logic_vector(7 downto 0);
signal FL_OE_N		: std_logic;

-- SRAM
signal SRAM_ADDR	: std_logic_vector(17 downto 0);
signal SRAM_CE_N	: std_logic;
signal SRAM_DQ		: std_logic_vector(15 downto 0);
signal SRAM_LB_N	: std_logic;
signal SRAM_OE_N	: std_logic;
signal SRAM_UB_N	: std_logic;
signal SRAM_WE_N	: std_logic;

--IRQs
signal NMI_N		: std_logic;
signal IRQ1_N		: std_logic;
signal IRQ2_N		: std_logic;

begin

-- SRAM
SRAM : entity work.sram_sim 
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
FLASH : entity work.flash_sim
port map(
	A	=> FL_ADDR,
	OEn	=> FL_OE_N,
	D	=> FL_DQ
);

-- SYSTEM
SYS : entity work.cputest_top
port map(
	RESET		=> RESET,
	CLOCK		=> CLOCK,

	NMI_N		=> NMI_N,
	IRQ1_N		=> IRQ1_N,
	IRQ2_N		=> IRQ2_N,
	
	FL_ADDR		=> FL_ADDR,
	FL_DQ		=> FL_DQ,
	FL_OE_N		=> FL_OE_N,
	
	SRAM_ADDR	=> SRAM_ADDR,
	SRAM_CE_N	=> SRAM_CE_N,
	SRAM_DQ		=> SRAM_DQ,
	SRAM_LB_N	=> SRAM_LB_N,
	SRAM_OE_N	=> SRAM_OE_N,
	SRAM_UB_N	=> SRAM_UB_N,
	SRAM_WE_N	=> SRAM_WE_N
);

-- CLOCK (1 MHz)
process
begin
	CLOCK <= '0';
	wait for 100 ns;
	CLOCK <= '1';
	wait for 100 ns;
end process;

-- RESET
process
begin
	RESET <= '1';
	wait for 8000 ns;
	RESET <= '0';
	wait;
end process;

-- IRQs
NMI_N <= '1';
IRQ1_N <= '1';
IRQ2_N <= '1';

-- process
-- begin
	-- IRQ2_N <= '1';
	-- wait for 21000 ns;
	-- IRQ2_N <= '0';
	-- wait for 5000 ns;
	-- IRQ2_N <= '1';
	-- wait;
-- end process;

end sim;