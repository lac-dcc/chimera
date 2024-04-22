library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity sram_external_spirom_wb8 is
	generic(
		ADDRBITS: integer := 19;
		DATABITS: integer := 8
	);
	
	port(
		-- bus signal naming according to Wishbone B4 spec
		CLK_I: in std_logic;
		STB_I: in std_logic;
		WE_I: in std_logic;
		ADR_I: in std_logic_vector(31 downto 0);
		DAT_I: in std_logic_vector(DATABITS-1 downto 0);
		RST_I: in std_logic;
		DAT_O: out std_logic_vector(DATABITS-1 downto 0);
		ACK_O: out std_logic;
		
		-- SPI signal lines
		I_spi_miso: in std_logic := '0';
		O_spi_sel: out std_logic := '1';
		O_spi_clk: out std_logic := '0';
		O_spi_mosi: out std_logic := '0';
		
		-- interface to external SRAM
		O_sram_adr: out std_logic_vector(ADDRBITS-1 downto 0);
		O_sram_we: out std_logic := '1';
		O_sram_ce: out std_logic := '1';
		O_sram_oe: out std_logic := '1';
		IO_sram_dat: inout std_logic_vector(DATABITS-1 downto 0) := X"00"
	);
end sram_external_spirom_wb8;


architecture Behavioral of sram_external_spirom_wb8 is
	signal tx_data, rx_data: std_logic_vector(7 downto 0) := X"00";
	signal tx_start: boolean := false;
	signal spi_busy: boolean := true;
	signal sram_datin, sram_datout: std_logic_vector(DATABITS-1 downto 0) := (others => '0');
	signal sram_addr: std_logic_vector(ADDRBITS-1 downto 0) := (others => '0');
	signal sram_en, sram_we: std_logic := '0';
begin

	spimaster_instance: entity work.spimaster port map(
		I_clk => CLK_I,
		I_tx_data => tx_data,
		I_tx_start => tx_start,
		I_spi_miso => I_spi_miso,
		
		O_spi_clk => O_spi_clk,
		O_spi_mosi => O_spi_mosi,
		O_rx_data => rx_data,
		O_busy => spi_busy
	);
	
	sram_external_instance: entity work.sram_external port map(
		I_addr => sram_addr,
		I_data => sram_datin,
		I_en => sram_en,
		I_we => (sram_we and sram_en),
		O_data => sram_datout,
		
		IO_external_data => IO_sram_dat,
		O_external_addr => O_sram_adr(ADDRBITS-1 downto 0),
		O_external_ce => O_sram_ce,
		O_external_oe => O_sram_oe,
		O_external_we => O_sram_we
	);
	

	process(CLK_I, STB_I, sram_datout, rx_data, ADR_I, DAT_I)
		type ctrlstates is (RESET, FILLRAM1, FILLRAM2, IDLE, READ1, READ2, READ3, READ4, READ5, READ6, READ7, TX1, TX2);
		variable state, retstate: ctrlstates := RESET;
		variable ack: std_logic := '0';
		variable addr: std_logic_vector(23 downto 0) := X"000000";
		variable init: std_logic := '1';
		variable initaddr: std_logic_vector(ADDRBITS-1 downto 0);
	begin
	
		if rising_edge(CLK_I) then
			ack := '0';
			O_spi_sel <= '0'; -- select device
			
			sram_en <= '0';
			sram_we <= '0';
			
			if RST_I = '1' then
				state := RESET;
			end if;
		
			case state is
			
				when RESET =>
					O_spi_sel <= '1'; -- deselect device
					init := '1';
					initaddr := (others => '0');
					state := FILLRAM1;
			
				when FILLRAM1 =>
					addr := (others => '0');
					addr(initaddr'left downto 0) := initaddr;
					state := READ1;
				
				when FILLRAM2 =>
					O_spi_sel <= '1'; -- deselect device

					sram_addr <= (others => '0');
					sram_addr(initaddr'left downto 0) <= initaddr;
					sram_datin <= rx_data;
					sram_en <= '1';
					sram_we <= '1';
					
					-- increase address counter
					initaddr := std_logic_vector((unsigned(initaddr) + 1));
					if unsigned(initaddr) = 0 then
						-- init address wrapped back to zero, we're finished
						init := '0';
						state := IDLE;
					else
						-- fetch next byte to initialize RAM
						state := FILLRAM1;
					end if;
			
				when IDLE =>
					O_spi_sel <= '1'; -- deselect device

					sram_addr <= ADR_I(sram_addr'left downto 0);
					sram_datin <= DAT_I;					

					if STB_I = '1' then
						sram_en <= '1';
						sram_we <= WE_I;
						ack := '1';
					end if;
				
			
				when READ1 =>
					-- start reading SPI ROM by submitting the READ opcode
					tx_data <= X"03";
					state := TX1;
					retstate := READ2;
				
				when READ2 =>
					-- transmit first part of the address
					tx_data <= addr(23 downto 16);
					state := TX1;
					retstate := READ3;
					
				when READ3 =>
					-- transmit second part of the address
					tx_data <= addr(15 downto 8);
					state := TX1;
					retstate := READ4;
					
				when READ4 =>
					-- transmit third part of the address
					tx_data <= addr(7 downto 0);
					state := TX1;
					retstate := READ5;
					
				when READ5 =>
					-- read byte from SPI ROM (transmitted data doesn't matter)
					tx_data <= X"00";
					state := TX1;
					retstate := READ6;
					
				when READ6 =>
					state := FILLRAM2;
					
				when TX1 =>
					-- signal beginning of transmission
					tx_start <= true;
					-- wait for ack that transmission is in progress
					if spi_busy then
						state := TX2;
					end if;
				
				when TX2 =>
					tx_start <= false;
					-- wait until transmission has ended
					if not spi_busy then
						state := retstate;
					end if;
					
				when others => null;
					
			
			end case;
		
		end if;
		

		ACK_O <= ack and STB_I and (not init);
		DAT_O <= sram_datout;
		
	end process;

end Behavioral;

