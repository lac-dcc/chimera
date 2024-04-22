-- Listing 9.3
-- notes to run on logi:
-- * data from sw will have 6 bits static and low 2 bits from the sw.
-- * using minicom running on the rpi to act as the uart interface to the fpga
--		--you must have minicom installed and make a connection with 8n1 baud:19200.
-- 		see: http://www.hobbytronics.co.uk/raspberry-pi-serial-port to install and run minicom
-- 		1) run: sudo apt-get install minicom
--		2) run: minicom -b 19200 -o -D /dev/ttyAMA0
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity ps2_monitor is
   port (
      clk: in  std_logic;
      sw_n: in std_logic_vector(1 downto 0);
      btn_n: in std_logic_vector(1 downto 0);
      ps2d_1, ps2c_1: inout  std_logic;
      tx: out  std_logic
   );
end ps2_monitor;

architecture arch of ps2_monitor is
   -- space in ASCII
   constant SP: std_logic_vector(7 downto 0):="00100000";
   type state_type is (idle, sendh, sendl, sendb);
   signal state_reg, state_next: state_type;
   signal rx_data, w_data: std_logic_vector(7 downto 0);
   signal psrx_done_tick: std_logic;
   signal wr_ps2, wr_uart: std_logic;
   signal ascii_code: std_logic_vector(7 downto 0);
   signal hex_in: std_logic_vector(3 downto 0);
	signal reset: std_logic;
	signal ps2d, ps2c: std_logic;
	signal btn, sw: std_logic_vector(1 downto 0);

begin

	--A = 0x45 = 0d61 = 0b(0100 0101)
	-- static upper 6 bits = 0b010001 - lower 2 bits = sw value.
	

	--reset <= not(reset_n);
	btn <= not(btn_n);
	sw <= not(sw_n);
	reset <= btn(0);
	ps2d <= ps2d_1;		--would have to tristate for io ioperation
	ps2c <= ps2c_1;
	
   --===========================================
   -- instantiation
   --===========================================
   btn_db_unit: entity work.debounce(fsmd_arch)
      port map(clk=>clk, 
					reset=>reset, 
					sw=>btn(1),
               db_level=>open, 
					db_tick=>wr_ps2
					);
   ps2_rxtx_unit: entity work.ps2_rxtx(arch)
      port map(clk=>clk, 
					reset=>reset, 
					wr_ps2=>wr_ps2,
               din=>"010001" & sw, 
					dout=>rx_data, 
					ps2d=>ps2d_1, 
					ps2c=>ps2c_1,	--! update signal name
               rx_done_tick=>psrx_done_tick, 
					tx_done_tick=>open);
   -- only use the UART transmitter
   uart_unit: entity work.uart(str_arch)
      generic map(FIFO_W=>4)
      port map(clk=>clk, 
					reset=>reset, 
					rd_uart=>'0',
               wr_uart=>wr_uart, 
					rx=>'1', 
					w_data=>w_data,
               tx_full=>open, 
					rx_empty=>open, 
					r_data=>open,
               tx=>tx
					);
   --===========================================
   -- FSM to send 3 ASCII characters
   --===========================================
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
   process(state_reg,psrx_done_tick,ascii_code)
   begin
      wr_uart <= '0';
      w_data <= SP;
      state_next <= state_reg;
      case state_reg is
         when idle =>
            if psrx_done_tick='1' then
               state_next <= sendh;
            end if;
         when sendh => -- send higher hex char
            w_data <= ascii_code;
            wr_uart <= '1';
            state_next <= sendl;
         when sendl => -- send lower hex char
            w_data <= ascii_code;
            wr_uart <= '1';
            state_next <= sendb;
         when sendb => -- send blank char
            w_data <= SP;
            wr_uart <= '1';
            state_next <= idle;
      end case;
   end process;
   --===========================================
   -- byte to ASCII code
   --===========================================
   -- split the scan code into two 4-bit hex
   hex_in <= rx_data(7 downto 4) when state_reg=sendh else
             rx_data(3 downto 0);
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