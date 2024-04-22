library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity sram_external_wb8 is
	generic(
		ADDRBITS: integer := 19;
		DATABITS: integer := 8
	);
	port(
		-- signal naming according to Wishbone B4 spec
		CLK_I: in std_logic;
		STB_I: in std_logic;
		WE_I: in std_logic;
		ADR_I: in std_logic_vector(ADDRBITS-1 downto 0);
		DAT_I: in std_logic_vector(DATABITS-1 downto 0);
		DAT_O: out std_logic_vector(DATABITS-1 downto 0);
		ACK_O: out std_logic;
		
		-- interface to external SRAM
		O_sram_adr: out std_logic_vector(ADDRBITS-1 downto 0);
		O_sram_we: out std_logic := '1';
		O_sram_ce: out std_logic := '1';
		O_sram_oe: out std_logic := '1';
		IO_sram_dat: inout std_logic_vector(DATABITS-1 downto 0) := X"00"
		
	);
end sram_external_wb8;


architecture Behavioral of sram_external_wb8 is
begin

	sram_external_instance: entity work.sram_external port map(
		I_addr => ADR_I,
		I_data => DAT_I,
		I_en => STB_I,
		I_we => (WE_I and STB_I),
		O_data => DAT_O,
		
		IO_external_data => IO_sram_dat,
		O_external_addr => O_sram_adr(ADDRBITS-1 downto 0),
		O_external_ce => O_sram_ce,
		O_external_oe => O_sram_oe,
		O_external_we => O_sram_we
	);
	
	process(CLK_I, STB_I)
		variable ack: std_logic := '0';
	begin
		if rising_edge(CLK_I) then
			ack := '0';
			if STB_I = '1' then
				ack := '1';
			end if;
		end if;
		
		ACK_O <= ack and STB_I;
		
	end process;

end Behavioral;