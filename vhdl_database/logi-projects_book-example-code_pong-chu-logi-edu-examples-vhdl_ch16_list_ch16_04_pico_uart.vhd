--Listing 16.4
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity pico_uart is
   port(
      clk, reset: in std_logic;
      sw: in std_logic_vector(7 downto 0);
      btn: in std_logic_vector(3 downto 0);
      rx: in std_logic;
      an: out std_logic_vector(3 downto 0);
      sseg: out std_logic_vector(7 downto 0);
      tx: out  std_logic
   );
end pico_uart;

architecture arch of pico_uart is
   -- KCPSM3/ROM signals
   signal address: std_logic_vector(9 downto 0);
   signal instruction: std_logic_vector(17 downto 0);
   signal port_id: std_logic_vector(7 downto 0);
   signal in_port, out_port: std_logic_vector(7 downto 0);
   signal write_strobe, read_strobe: std_logic;
   signal interrupt, interrupt_ack: std_logic;
   signal kcpsm_reset: std_logic;
   -- I/O port signals
   -- output enable
   signal en_d: std_logic_vector(6 downto 0);
   -- four-digit seven-segment led display
   signal ds3_reg, ds2_reg: std_logic_vector(7 downto 0);
   signal ds1_reg, ds0_reg: std_logic_vector(7 downto 0);
   -- two push buttons
   signal btnc_flag_reg, btnc_flag_next: std_logic;
   signal btns_flag_reg, btns_flag_next: std_logic;
   signal set_btnc_flag, set_btns_flag: std_logic;
   signal clr_btn_flag: std_logic;
   -- uart
   signal w_data: std_logic_vector(7 downto 0);
   signal rd_uart, rx_not_empty, rx_empty: std_logic;
   signal wr_uart, tx_full: std_logic;
   signal rx_char: std_logic_vector(7 downto 0);
   -- multiplier
   signal m_src0_reg, m_src1_reg: std_logic_vector(7 downto 0);
   signal prod: std_logic_vector(15 downto 0);
begin
   -- =====================================================
   --  I/O modules
   -- =====================================================
   disp_unit: entity work.disp_mux
      port map(
         clk=>clk, reset=>'0',
         in3=>ds3_reg, in2=>ds2_reg, in1=>ds1_reg,
         in0=>ds0_reg, an=>an, sseg=>sseg);
   uart_unit: entity work.uart(str_arch)
      port map(
         clk=>clk, reset=>reset, rd_uart=>rd_uart,
         wr_uart=>wr_uart, rx=>rx,
         w_data=>out_port, tx_full=>tx_full,
         rx_empty=>rx_empty, r_data=>rx_char, tx=>tx);
   btnc_db_unit: entity work.debounce
      port map(
         clk=>clk, reset=>reset, sw=>btn(0),
         db_level=>open, db_tick=>set_btnc_flag);
   btns_db_unit: entity work.debounce
      port map(
         clk=>clk, reset=>reset, sw=>btn(1),
         db_level=>open, db_tick=>set_btns_flag);
   -- combinational multiplier
   prod <= std_logic_vector
           (unsigned(m_src0_reg) * unsigned(m_src1_reg));
   -- =====================================================
   --  KCPSM and ROM instantiation
   -- =====================================================
   proc_unit: entity work.kcpsm3
      port map(
         clk=>clk, reset =>kcpsm_reset,
         address=>address, instruction=>instruction,
         port_id=>port_id, write_strobe=>write_strobe,
         out_port=>out_port, read_strobe=>read_strobe,
         in_port=>in_port, interrupt=>interrupt,
         interrupt_ack=>interrupt_ack);
   rom_unit: entity work.uart_rom
      port map(
          clk => clk, address=>address,
          instruction=>instruction);
   -- Unused inputs on processor
   kcpsm_reset <= '0';
   interrupt <= '0';
   -- =====================================================
   --  output interface
   -- =====================================================
   --    outport port id:
   --      0x00: ds0
   --      0x01: ds1
   --      0x02: ds2
   --      0x03: ds3
   --      0x04: uart_tx_fifo
   --      0x05: m_src0
   --      0x06: m_src1
   -- =====================================================
   -- registers
   process (clk)
   begin
      if (clk'event and clk='1') then
         if en_d(0)='1' then ds0_reg <= out_port; end if;
         if en_d(1)='1' then ds1_reg <= out_port; end if;
         if en_d(2)='1' then ds2_reg <= out_port; end if;
         if en_d(3)='1' then ds3_reg <= out_port; end if;
         if en_d(5)='1' then m_src0_reg <= out_port; end if;
         if en_d(6)='1' then m_src1_reg <= out_port; end if;
      end if;
   end process;
  -- decoding circuit for enable signals
   process(port_id,write_strobe)
   begin
      en_d <= (others=>'0');
      if write_strobe='1' then
         case port_id(2 downto 0) is
            when "000" => en_d <="0000001";
            when "001" => en_d <="0000010";
            when "010" => en_d <="0000100";
            when "011" => en_d <="0001000";
            when "100" => en_d <="0010000";
            when "101" => en_d <="0100000";
            when others => en_d <="1000000";
         end case;
      end if;
   end process;
   wr_uart <= en_d(4);
   -- =====================================================
   --  input interface
   -- =====================================================
   --    input port id
   --      0x00: flag
   --      0x01: switch
   --      0x02: uart_rx_fifo
   --      0x03: prod lower byte
   --      0x04: prod upper byte
   -- =====================================================
   -- input register (for flags)
   process(clk)
   begin
      if (clk'event and clk='1') then
         btnc_flag_reg <= btnc_flag_next;
         btns_flag_reg <= btns_flag_next;
      end if;
   end process;

   btnc_flag_next <= '1' when set_btnc_flag='1' else
                     '0' when clr_btn_flag='1' else
                      btnc_flag_reg;
   btns_flag_next <= '1' when set_btns_flag='1' else
                     '0' when clr_btn_flag='1' else
                      btns_flag_reg;
   -- decoding circuit for clear signals
   clr_btn_flag <='1' when read_strobe='1' and
                           port_id(2 downto 0)="000" else
                  '0';
   rd_uart <= '1' when read_strobe='1' and
                       port_id(2 downto 0)="010" else
              '0';
   -- input multiplexing
   rx_not_empty <= not rx_empty;
   process(port_id,tx_full,rx_not_empty,
           btns_flag_reg,btnc_flag_reg,sw,rx_char,prod)
   begin
      case port_id(2 downto 0) is
         when "000" =>
            in_port <= "0000" & tx_full & rx_not_empty &
                       btns_flag_reg & btnc_flag_reg;
         when "001" =>
            in_port <= sw;
         when "010" =>
            in_port <= rx_char;
         when "011" =>
            in_port <=prod(7 downto 0);
         when others =>
            in_port <= prod(15 downto 8);
      end case;
   end process;
end arch;