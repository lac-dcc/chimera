-- Listing 8.5
-- notes to run on logi:
-- * using minicom running on the rpi to act as the uart interface to the fpga
--		--you must have minicom installed and make a connection with 8n1 baud:19200.
-- 		see: http://www.hobbytronics.co.uk/raspberry-pi-serial-port to install and run minicom
-- 		1) run: sudo apt-get install minicom
--		2) run: minicom -b 19200 -o -D /dev/ttyAMA0
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity kb_test is
   port (
      clk, reset_n: in  std_logic;
      ps2d_1, ps2c_1: in  std_logic;
      tx: out  std_logic
   );
end kb_test;

architecture arch of kb_test is
   signal scan_data, w_data: std_logic_vector(7 downto 0);
   signal kb_not_empty, kb_buf_empty: std_logic;
   signal key_code, ascii_code: std_logic_vector(7 downto 0);
	signal reset: std_logic;
	signal ps2c,ps2d: std_logic;
begin
	
	reset <= not(reset_n);
	ps2c <= ps2c_1;
	ps2d <= ps2d_1;

   kb_code_unit: entity work.kb_code(arch)
      port map(clk=>clk, reset=>reset, ps2d=>ps2d, ps2c=>ps2c,
               rd_key_code=>kb_not_empty, key_code=>key_code,
               kb_buf_empty=>kb_buf_empty);
   uart_unit: entity work.uart(str_arch)
      port map(clk=>clk, reset=>reset, rd_uart=>'0',
               wr_uart=>kb_not_empty, rx=>'1',
               w_data=>ascii_code, tx_full=>open,
               rx_empty=>open, r_data=>open, tx=>tx);
   key2a_unit: entity work.key2ascii(arch)
      port map(key_code=>key_code, ascii_code=>ascii_code);

   kb_not_empty <= not kb_buf_empty;
end arch;