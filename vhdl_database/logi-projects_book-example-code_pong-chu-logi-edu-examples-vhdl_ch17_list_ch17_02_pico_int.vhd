-- Listing 17.2
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity pico_int is
   port(
      clk, reset: in std_logic;
      sw: in std_logic_vector(7 downto 0);
      btn: in std_logic_vector(1 downto 0);
      an: out std_logic_vector(3 downto 0);
      sseg: out std_logic_vector(7 downto 0)
   );
end pico_int;

architecture arch of pico_int is
   -- KCPSM3/ROM signals
   signal address: std_logic_vector(9 downto 0);
   signal instruction: std_logic_vector(17 downto 0);
   signal port_id: std_logic_vector(7 downto 0);
   signal in_port, out_port: std_logic_vector(7 downto 0);
   signal write_strobe, read_strobe: std_logic;
   signal interrupt, interrupt_ack: std_logic;
   -- I/O port signals
   -- output enable
   signal en_d: std_logic_vector(1 downto 0);
   -- four-digit seven-segment led display
   signal sseg_reg: std_logic_vector(7 downto 0);
   signal an_reg: std_logic_vector(3 downto 0);
   -- two push buttons
   signal btnc_flag_reg, btnc_flag_next: std_logic;
   signal btns_flag_reg, btns_flag_next: std_logic;
   signal set_btnc_flag, set_btns_flag: std_logic;
   signal clr_btn_flag: std_logic;
   -- interrupt related signals
   signal timer_reg, timer_next: unsigned(8 downto 0);
   signal ten_us_tick: std_logic;
   signal timer_flag_reg, timer_flag_next: std_logic;
begin
   -- =====================================================
   --  I/O modules
   -- =====================================================
   btnc_db_unit: entity work.debounce
      port map(
         clk=>clk, reset=>reset, sw=>btn(0),
         db_level=>open, db_tick=>set_btnc_flag);
   btns_db_unit: entity work.debounce
      port map(
         clk=>clk, reset=>reset, sw=>btn(1),
         db_level=>open, db_tick=>set_btns_flag);
   -- =====================================================
   --  KCPSM and ROM instantiation
   -- =====================================================
   proc_unit: entity work.kcpsm3
      port map(
         clk=>clk, reset =>reset,
         address=>address, instruction=>instruction,
         port_id=>port_id, write_strobe=>write_strobe,
         out_port=>out_port, read_strobe=>read_strobe,
         in_port=>in_port, interrupt=>interrupt,
         interrupt_ack=>interrupt_ack);
   rom_unit: entity work.int_rom
      port map(
          clk => clk, address=>address,
          instruction=>instruction);
   -- =====================================================
   --  output interface
   -- =====================================================
   --    outport port id:
   --      0x00: an
   --      0x01: ssg
   -- =====================================================
   -- registers
   process (clk)
   begin
      if (clk'event and clk='1') then
         if en_d(0)='1' then
            an_reg <= out_port(3 downto 0);
         end if;
         if en_d(1)='1' then sseg_reg <= out_port; end if;
      end if;
   end process;
   an <= an_reg;
   sseg <= sseg_reg;
   -- decoding circuit for enable signals
   process(port_id,write_strobe)
   begin
      en_d <= (others=>'0');
      if write_strobe='1' then
         case port_id(0) is
            when '0' => en_d <="01";
            when others => en_d <="10";
         end case;
      end if;
   end process;
   -- =====================================================
   --  input interface
   -- =====================================================
   --    input port id
   --      0x00: flag
   --      0x01: switch
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
                           port_id(0)='0' else
                  '0';
   -- input multiplexing
   process(port_id,btns_flag_reg,btnc_flag_reg,sw)
   begin
      case port_id(0) is
         when '0' =>
            in_port <= "000000" &
                       btns_flag_reg & btnc_flag_reg;
         when others =>
            in_port <= sw;
      end case;
   end process;
   -- =====================================================
   --  interrupt interface
   -- =====================================================
   -- 10 us counter
   process(clk)
   begin
      if (clk'event and clk='1') then
         timer_reg <= timer_next;
      end if;
   end process;
   timer_next <= (others=>'0') when timer_reg=499 else
                 timer_reg+1;
   ten_us_tick <= '1' when timer_reg=499 else '0';
   -- 10 us tick flag
   process(clk)
   begin
      if (clk'event and clk='1') then
         timer_flag_reg <= timer_flag_next;
      end if;
   end process;
   timer_flag_next <= '1' when ten_us_tick='1' else
                      '0' when interrupt_ack='1' else
                      timer_flag_reg;
   -- interrupt request
   interrupt <= timer_flag_reg;
end arch;