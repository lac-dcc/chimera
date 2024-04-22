library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.constants.all;

entity spiromram_wb8 is
	generic(
		ADDRLEN: integer := 12
	);
	
	port(
		-- bus signal naming according to Wishbone B4 spec
		CLK_I: in std_logic;
		STB_I: in std_logic;
		WE_I: in std_logic;
		ADR_I: in std_logic_vector(XLEN-1 downto 0);
		DAT_I: in std_logic_vector(7 downto 0);
		RST_I: in std_logic;
		DAT_O: out std_logic_vector(7 downto 0);
		ACK_O: out std_logic;
		
		-- SPI signal lines
		I_spi_miso: in std_logic := '0';
		O_spi_sel: out std_logic := '1';
		O_spi_clk: out std_logic := '0';
		O_spi_mosi: out std_logic := '0'
	);
end spiromram_wb8;


architecture Behavioral of spiromram_wb8 is
	type store_t is array(0 to (2**ADDRLEN)-1) of std_logic_vector(7 downto 0);
	signal ram: store_t := (others => X"00");
	attribute ramstyle : string;
	attribute ramstyle of ram : signal is "no_rw_check";
	
	signal tx_data, rx_data: std_logic_vector(7 downto 0) := X"00";
	signal tx_start: boolean := false;
	signal spi_busy: boolean := true;
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
	

	process(CLK_I)
		type ctrlstates is (RESET, FILLRAM1, FILLRAM2, IDLE, READ1, READ2, READ3, READ4, READ5, READ6, READ7, TX1, TX2);
		variable state, retstate: ctrlstates := RESET;
		variable ack: std_logic := '0';
		variable addr: std_logic_vector(23 downto 0) := X"000000";
		variable init: std_logic := '1';
		variable initaddr: std_logic_vector(ADDRLEN-1 downto 0);
	begin
	
		if rising_edge(CLK_I) then
			ack := '0';
			O_spi_sel <= '0'; -- select device
			
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
					addr(ADDRLEN-1 downto 0) := initaddr;
					state := READ1;
				
				when FILLRAM2 =>
					O_spi_sel <= '1'; -- deselect device
					ram(to_integer(unsigned(initaddr))) <= rx_data;
					
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
					if ADR_I(24) = '0' then
						---------------
						-- access RAM
						---------------
						if STB_I = '1' then
							if(WE_I = '1') then
								ram(to_integer(unsigned(ADR_I(ADDRLEN-1 downto 0)))) <= DAT_I;
							else
								DAT_O <= ram(to_integer(unsigned(ADR_I(ADDRLEN-1 downto 0))));
							end if;
							ack := '1';
						end if;
				
					else
						--------------
						-- access ROM
						--------------
						if not spi_busy and STB_I = '1' then
							addr := ADR_I(23 downto 0);
							state := READ1;
						end if;
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
					-- output read data and ACK
					ack := '1';
					DAT_O <= rx_data;
					state := READ7;
					
				when READ7 =>
					if init = '0' then
						state := IDLE;
					else
						state := FILLRAM2;
					end if;
				
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
					
			
			end case;
		
		end if;

		ACK_O <= ack and STB_I and (not init);
		
		
	end process;

end Behavioral;

