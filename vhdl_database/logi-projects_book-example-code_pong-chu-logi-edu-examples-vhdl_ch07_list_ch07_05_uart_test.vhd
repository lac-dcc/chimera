-- Listing 7.5
-- * notes to run on logi
-- * using led-sseg display to show the led values
-- * using onboard leds to show the buffer full/empty
-- * using minicom running on the rpi to act as the uart interface to the fpga
--		--you must have minicom installed and make a connection with 8n1 baud:19200.
-- 		see: http://www.hobbytronics.co.uk/raspberry-pi-serial-port to install and run minicom
-- 		1) run: sudo apt-get install minicom
--		2) run: minicom -b 19200 -o -D /dev/ttyAMA0



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity uart_test is
   port(
      clk: in std_logic;
      btn_n: in std_logic_vector(1 downto 0);
		led: out std_logic_vector(1 downto 0);
      rx: in std_logic;
      tx: out std_logic;
      sseg: out std_logic_vector(7 downto 0);
      an: out std_logic_vector(3 downto 0)
   );
end uart_test;

architecture arch of uart_test is

   signal tx_full, rx_empty: std_logic;
   signal rec_data,rec_data1: std_logic_vector(7 downto 0);
   signal btn_tick: std_logic;
	signal btn: std_logic_vector(1 downto 0);
	signal led_sseg: std_logic_vector(7 downto 0);
	
begin

	btn <= not(btn_n);
	--reset <= not(reset_n);

   -- instantiate uart
   uart_unit: entity work.uart(str_arch)
      port map(clk=>clk, reset=>'0', rd_uart=>btn_tick,
               wr_uart=>btn_tick, rx=>rx, w_data=>rec_data1,
               tx_full=>tx_full, rx_empty=>rx_empty,
               r_data=>rec_data, tx=>tx);
   -- instantiate debounce circuit
   btn_db_unit: entity work.debounce(fsmd_arch)
      port map(clk=>clk, reset=>'0', sw=>btn(0),
               db_level=>open, db_tick=>btn_tick);
   -- incremented data loop back
   rec_data1 <= std_logic_vector(unsigned(rec_data)+1);
   --  led display
   led_sseg <= rec_data;
   --an <= "0001";
   --sseg <= '1' & (not tx_full) & "11" & (not rx_empty) & "111";
	--sseg <= '0' & (not tx_full) & "00" & (not rx_empty) & "000";	--invert the an signals for nmos
	led(0) <= tx_full;
	led(1) <= rx_empty;
	
	
	 --INSTANTIATION TEMPLATE
 led8_sseg_unit: entity work.led8_sseg
	 port map (
		   clk  => clk,
		   reset  => '0', 
		   led => led_sseg, 
		   an_edu => an, 
		   sseg_out => sseg
	 );
	
end arch;
