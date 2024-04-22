-- Listing 8.2
-- * notes to run on logi
-- * using minicom running on the rpi to act as the uart interface to the fpga
--		--you must have minicom installed and make a connection with 8n1 baud:19200.
-- 		see: http://www.hobbytronics.co.uk/raspberry-pi-serial-port to install and run minicom
-- 		1) run: sudo apt-get install minicom
--		2) run: minicom -b 19200 -o -D /dev/ttyAMA0
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity kb_monitor is
   port (
      clk, reset_n: in  std_logic;
      ps2d_1, ps2c_1: in  std_logic;
      tx: out  std_logic
   );
end kb_monitor;

architecture arch of kb_monitor is
   constant SP: std_logic_vector(7 downto 0):="00100000";
   -- space in ASCII
   type statetype is (idle, send1, send0, sendb);
   signal state_reg, state_next: statetype;
   signal scan_data, w_data: std_logic_vector(7 downto 0);
   signal scan_done_tick, wr_uart: std_logic;
   signal ascii_code: std_logic_vector(7 downto 0);
   signal hex_in: std_logic_vector(3 downto 0);
	
	signal reset, ps2d, ps2c: std_logic;
	
begin
	reset <= not(reset_n);

	ps2d <= ps2d_1;
	ps2c <= ps2c_1;

   --====================================================
   -- Instantiation
   --====================================================
   -- instantiate PS2 receiver
   ps2_rx_unit: entity work.ps2_rx(arch)
      port map(clk=>clk, reset=>reset, rx_en=>'1',
               ps2d=>ps2d, ps2c=>ps2c,
               rx_done_tick=>scan_done_tick,
               dout=>scan_data);

   -- instantiate UART
   uart_unit: entity work.uart(str_arch)
      port map(clk=>clk, reset=>reset, rd_uart=>'0',
               wr_uart=>wr_uart, rx=>'1', w_data=>w_data,
               tx_full=>open, rx_empty=>open, r_data=>open,
               tx=>tx);

   --====================================================
   -- FSM to send 3 ASCII characters
   --====================================================
   -- state registers
   process (clk, reset)
   begin
      if reset='1' then
         state_reg <= idle;
      elsif (clk'event and clk='1') then
         state_reg <= state_next;
      end if;
   end process;
   -- next-state logic
   process(state_reg, scan_done_tick, ascii_code)
   begin
      wr_uart <= '0';
      w_data <= SP;
      state_next <= state_reg;
      case state_reg is
         when idle =>  -- start when a scan code received
            if scan_done_tick='1' then
               state_next <= send1;
            end if;
         when send1 => -- send higher hex char
            w_data <= ascii_code;
            wr_uart <= '1';
            state_next <= send0;
         when send0 => -- send lower hex char
            w_data <= ascii_code;
            wr_uart <= '1';
            state_next <= sendb;
         when sendb => -- send blank char
            w_data <= SP;
            wr_uart <= '1';
            state_next <= idle;
      end case;
   end process;

   --====================================================
   -- scan code to ASCII code
   --====================================================
   -- split the scan code into two 4-bit hex
   hex_in <= scan_data(7 downto 4) when state_reg=send1 else
             scan_data(3 downto 0);
   -- hex digit to ASCII code
   with hex_in select
      ascii_code <=
         "00110000" when "0000",  -- 0
         "00110001" when "0001",  -- 1
         "00110010" when "0010",  -- 2
         "00110011" when "0011",  -- 3
         "00110100" when "0100",  -- 4
         "00110101" when "0101",  -- 5
         "00110110" when "0110",  -- 6
         "00110111" when "0111",  -- 7
         "00111000" when "1000",  -- 8
         "00111001" when "1001",  -- 9
         "01000001" when "1010",  -- A
         "01000010" when "1011",  -- B
         "01000011" when "1100",  -- C
         "01000100" when "1101",  -- D
         "01000101" when "1110",  -- E
         "01000110" when others;  -- F
end arch;
