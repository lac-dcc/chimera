library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity spimaster_tb is
end spimaster_tb;

architecture Behavior of spimaster_tb is

	constant I_clk_period: time := 10 ns;
	
	signal I_clk: std_logic := '0';
	signal I_tx_data: std_logic_vector(7 downto 0) := X"00";
	signal I_tx_start: boolean := false;
	signal I_spi_miso: std_logic := '0';
	
	signal O_spi_clk: std_logic := '0';
	signal O_spi_mosi: std_logic := '0';
	signal O_rx_data: std_logic_vector(7 downto 0) := X"00";
	signal O_busy: boolean := false;


begin

	-- instantiate unit under test
	uut: entity work.spimaster port map(
		I_clk => I_clk,
		I_tx_data => I_tx_data,
		I_tx_start => I_tx_start,
		I_spi_miso => I_spi_miso,
		
		O_spi_clk => O_spi_clk,
		O_spi_mosi => O_spi_mosi,
		O_rx_data => O_rx_data,
		O_busy => O_busy
	);

	proc_clock: process
	begin
		I_clk <= '0';
		wait for I_clk_period/2;
		I_clk <= '1';
		wait for I_clk_period/2;
	end process;

	
	stimuli: process
	begin
	
		wait until falling_edge(I_clk);
		
		I_spi_miso <= '1';
		I_tx_data <= "10101010";
		I_tx_start <= true;
		wait until O_busy = true;
		I_tx_start <= false;
		wait until O_busy = false;

		I_tx_data <= X"00";
		I_spi_miso <= '0';
		I_tx_start <= true;
		wait until O_busy = true;
		I_tx_start <= false;
		wait until O_busy = false;		
		
		
		
		wait for 10*I_clk_period;		
		assert false report "end of simulation" severity failure;
	end process;

end Behavior;