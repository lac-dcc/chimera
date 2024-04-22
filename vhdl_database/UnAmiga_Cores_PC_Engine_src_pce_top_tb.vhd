library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

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
		
signal CLOCK_50	: std_logic;
				
signal FL_ADDR		: std_logic_vector(21 downto 0);
signal FL_DQ		: std_logic_vector(7 downto 0);
signal FL_OE_N		: std_logic;
signal FL_RST_N	: std_logic;
signal FL_WE_N		: std_logic;


signal DRAM_ADDR	: unsigned(11 downto 0);
signal DRAM_BA_0	: std_logic;
signal DRAM_BA_1	: std_logic;
signal DRAM_CAS_N	: std_logic;
signal DRAM_CKE		: std_logic;
signal DRAM_CLK		: std_logic;
signal DRAM_CS_N	: std_logic;
signal DRAM_DQ		: unsigned(15 downto 0);
signal DRAM_LDQM	: std_logic;
signal DRAM_RAS_N	: std_logic;
signal DRAM_UDQM	: std_logic;
signal DRAM_WE_N	: std_logic;
		

signal RESET		: std_logic;

begin

-- FLASH
flash : entity work.flash_sim
port map(
	A	=> FL_ADDR,
	OEn	=> FL_OE_N,
	D	=> FL_DQ
);

sdram : entity work.sdram_sim
port map(
	DRAM_ADDR	=> DRAM_ADDR,
	DRAM_BA_0	=> DRAM_BA_0,
	DRAM_BA_1	=> DRAM_BA_1,
	DRAM_CAS_N	=> DRAM_CAS_N,
	DRAM_CKE	=> DRAM_CKE,
	DRAM_CLK	=> DRAM_CLK,
	DRAM_CS_N	=> DRAM_CS_N,
	DRAM_DQ		=> DRAM_DQ,
	DRAM_LDQM	=> DRAM_LDQM,
	DRAM_RAS_N	=> DRAM_RAS_N,
	DRAM_UDQM	=> DRAM_UDQM,
	DRAM_WE_N	=> DRAM_WE_N
);

sys : entity work.pce_top
port map(
	SW			=> SW,
		
	HEX0		=> HEX0,
	HEX1		=> HEX1,
	HEX2		=> HEX2,
	HEX3		=> HEX3,
		
	KEY			=> KEY,
				
	LEDR		=> LEDR,
	LEDG		=> LEDG,
		
	CLOCK_24	=> "00",
	CLOCK_27	=> "00",
	CLOCK_50	=> CLOCK_50,
				
	FL_ADDR		=> FL_ADDR,
	FL_DQ		=> FL_DQ,
	FL_OE_N		=> FL_OE_N,
	FL_RST_N	=> FL_RST_N,
	FL_WE_N		=> FL_WE_N,

	DRAM_ADDR	=> DRAM_ADDR,
	DRAM_BA_0	=> DRAM_BA_0,
	DRAM_BA_1	=> DRAM_BA_1,
	DRAM_CAS_N	=> DRAM_CAS_N,
	DRAM_CKE	=> DRAM_CKE,
	DRAM_CLK	=> DRAM_CLK,
	DRAM_CS_N	=> DRAM_CS_N,
	DRAM_DQ		=> DRAM_DQ,
	DRAM_LDQM	=> DRAM_LDQM,
	DRAM_RAS_N	=> DRAM_RAS_N,
	DRAM_UDQM	=> DRAM_UDQM,
	DRAM_WE_N	=> DRAM_WE_N

);

SW(9 downto 2) <= "00000000";
KEY <= "1111";

-- Header present switch
SW(1) <= '1';


-- CLOCK (50 MHz)
process
begin
	CLOCK_50 <= '0';
	wait for 10 ns;
	CLOCK_50 <= '1';
	wait for 10 ns;
end process;

-- CLOCK (24 MHz)
-- process
-- begin
	-- CLOCK_24 <= "00";
	-- wait for 20.8333 ns;
	-- CLOCK_24 <= "11";
	-- wait for 20.8333 ns;
-- end process;

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