library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity spimaster is
	port(
		I_clk: in std_logic := '0';
		I_tx_data: in std_logic_vector(7 downto 0) := X"00";
		I_tx_start: in boolean := false;
		I_spi_miso: in std_logic := '0';
		
		O_spi_clk: out std_logic := '0';
		O_spi_mosi: out std_logic := '0';
		O_rx_data: out std_logic_vector(7 downto 0) := X"00";
		O_busy: out boolean := false
	);
end spimaster;


architecture Behavioral of spimaster is
	signal tx_buf, rx_buf: std_logic_vector(7 downto 0) := X"00";
	signal busy: boolean := false;
begin

	process(I_clk)
		type spistates is (SPI_IDLE, SPI_ACTIVE);
		variable spistate: spistates := SPI_IDLE;
		variable spiclk, lastspiclk: std_logic := '0';
		variable spirising, spifalling: boolean := false;
		variable bitcounter: integer range 0 to 8 := 0;
		variable spicounter: std_logic_vector(0 downto 0) := "0";
	begin
	
		if rising_edge(I_clk) then
		
			lastspiclk := spiclk;			
			spicounter := std_logic_vector(unsigned(spicounter) + 1);
			spiclk := spicounter(spicounter'left);


			spirising := lastspiclk = '0' and spiclk = '1';
			spifalling := lastspiclk = '1' and spiclk = '0';
			
			if I_tx_start then
				busy <= true;
			end if;
			
			case spistate is

				when SPI_IDLE =>
					O_spi_clk <= '0';
					tx_buf <= X"00";
					if busy and spifalling then
						bitcounter := 8;
						tx_buf <= I_tx_data;
						spistate := SPI_ACTIVE;
					end if;

				when SPI_ACTIVE =>
					O_spi_clk <= spiclk;

					-- shift data in on rising edges
					if spirising then
						rx_buf <= rx_buf(6 downto 0) & I_spi_miso;
						bitcounter := bitcounter - 1;
					end if;

					-- shift data out on falling edges
					if spifalling then
						tx_buf <= tx_buf(6 downto 0) & '0';
						if bitcounter = 0 then
							spistate := SPI_IDLE;
							busy <= false;
						end if;
					end if;

			end case;
		
		end if;
		
	end process;
	
	O_spi_mosi <= tx_buf(tx_buf'left);
	O_rx_data <= rx_buf;
	O_busy <= busy;

end Behavioral;