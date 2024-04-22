library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

library work;
use work.zpu_config.all;
use work.zpuino_config.all;
use work.zpuinopkg.all;
use work.zpupkg.all;
use work.wishbonepkg.all;

library unisim;
use unisim.vcomponents.all;

entity sram_ctrl8 is
  generic (
    WIDTH_BITS: integer := 19
  );
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;

    wb_dat_o: out std_logic_vector(31 downto 0);
    wb_dat_i: in std_logic_vector(31 downto 0);
    wb_adr_i: in std_logic_vector(maxIOBit downto minIOBit);
    wb_sel_i: in std_logic_vector(3 downto 0);
--    wb_cti_i: in std_logic_vector(2 downto 0);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_ack_o: out std_logic;
    wb_stall_o: out std_logic;
    -- extra clocking
    clk_we: in std_logic;
    clk_wen: in std_logic;
    -- SRAM signals
    sram_addr:  out std_logic_vector(WIDTH_BITS-1 downto 0);
    sram_data:  inout std_logic_vector(7 downto 0);
    sram_ce:    out std_logic := '1';
    sram_we:    out std_logic;
    sram_oe:    out std_logic
  );

end entity sram_ctrl8;


architecture behave of sram_ctrl8 is

signal sram_data_write: std_logic_vector(7 downto 0);
signal out_write_enable: std_logic;

type state_type is (
  idle,
  stage1,
  stage2,
  stage3,
  stage4
);

signal state: state_type;

signal strobe_addr: std_logic;
signal even_odd: std_logic_vector(1 downto 0);
signal sram_addr_q: std_logic_vector(WIDTH_BITS-1 downto 0);
signal bus_tristate: std_logic;
signal sram_data_read: std_logic_vector(7 downto 0);
signal sram_data_write_i: std_logic_vector(7 downto 0);

signal sram_data_read_q: std_logic_vector(31 downto 0);
signal out_addr: std_logic_vector(maxIOBit downto minIOBit);
signal addr_save_q: std_logic_vector(maxIOBit downto minIOBit);
signal write_save_q: std_logic;
signal sel_q: std_logic_vector(3 downto 0);
signal ack_q: std_logic;
signal stall: std_logic;
signal ntristate: std_logic;

signal sram_ce_i: std_logic :='1';
signal sram_we_i: std_logic :='1';
signal sram_be_i: std_logic :='0';
signal sram_oe_i: std_logic :='1';

attribute IOB : string;
attribute IOB of sram_data_write: signal is "FORCE";
attribute IOB of sram_ce_i: signal is "FORCE";
--attribute IOB of sram_we_i: signal is "FORCE";
attribute IOB of sram_oe_i: signal is "FORCE";
--attribute IOB of sram_be_i: signal is "FORCE";
--attribute IOB of sram_addr_q: signal is "FORCE";

--attribute keep: string;
--attribute keep of sram_addr_q: signal is "true";
--attribute keep of out_addr: signal is "true";
--attribute keep of strobe_addr: signal is "true";

begin

sram_ce <= sram_ce_i;
sram_we <= sram_we_i;
sram_oe <= sram_oe_i;

wb_stall_o <= stall;


--with sram_oe_i select
--  sram_data <= transport sram_data_write_i after 1.7 ns when '1',
--               (others => 'Z') after 8 ns when others;

sram_data <= sram_data_write_i when ntristate='1' else (others => 'Z') after 8 ns;

sram_data_write_i <= transport sram_data_write after 1.7 ns;


process(state,wb_cyc_i,wb_stb_i,wb_we_i,write_save_q,wb_sel_i, sel_q)
begin
  case state is
    when idle | stage4 =>
      if wb_cyc_i='1' and wb_stb_i='1' then
        out_write_enable <= not (wb_we_i and wb_sel_i(0));
      else
        out_write_enable <= '1';
      end if;
    when stage1 =>
      out_write_enable <= not (write_save_q and sel_q(1));
    when stage2 =>
      out_write_enable <= not (write_save_q and sel_q(2));
    when stage3 =>
      out_write_enable <= not (write_save_q and sel_q(3));
  end case;
end process;

sram_addr <= sram_addr_q;

sram_data_read <= transport sram_data after 3 ns;

ODDR2_nWE : ODDR2
   generic map(
      DDR_ALIGNMENT => "NONE",    -- Sets output alignment to "NONE", "C0", "C1" 
      INIT          => '1',     -- Sets initial state of the Q output to '0' or '1'
      SRTYPE        => "ASYNC") -- Specifies "SYNC" or "ASYNC" set/reset
   port map (
      Q  => sram_we_i,              -- 1-bit output data
      C0 => clk_we,              -- 1-bit clock input
      C1 => wb_clk_i,--clk_wen,             -- 1-bit clock input
      CE => '1',                  -- 1-bit clock enable input
      D0 => '1', -- 1-bit data input (associated with C0)
      D1 => out_write_enable, -- 1-bit data input (associated with C1)
      R  => '0',                   -- 1-bit reset input
      S  => '0'                   -- 1-bit set input
   );


saq: for index in 2 to WIDTH_BITS-1 generate

  addrff: ODDR2
    generic map (
      DDR_ALIGNMENT => "NONE",  
      INIT          => '0',
      SRTYPE        => "ASYNC") 
    port map (
      D0 => out_addr(index),
      Q => sram_addr_q(index),
      C0 => wb_clk_i,
      D1 => '0',
      C1 => '0',
      CE => strobe_addr,
      R  => '0',
      S  => '0'
    );

end generate;

lsaq: for index in 0 to 1 generate

  sram_addr_qlow: ODDR2
    generic map (
      DDR_ALIGNMENT => "NONE",  
      INIT          => '0',
      SRTYPE        => "ASYNC") 
    port map (
      D0 => even_odd(index),
      D1 => '0',
      Q => sram_addr_q(index),
      C0 => wb_clk_i,
      C1 => '0',
      CE => strobe_addr,
      R => '0',
      S => '0'
    );
end generate;

--? JPG
process(state,wb_cyc_i,wb_stb_i,wb_adr_i,addr_save_q)
begin
  strobe_addr <='0';
  even_odd <= (others =>DontCareValue);
  case state is
    when idle | stage4=>
      even_odd <= "00";
      if wb_cyc_i='1' and wb_stb_i='1' then
        out_addr <= wb_adr_i;
        strobe_addr<='1';
      else
        out_addr <= (others => DontCareValue);
      end if;
    when stage1 =>
      out_addr <= addr_save_q;
      strobe_addr<='1';
      even_odd <= "01";
    when stage2 =>
      out_addr <= addr_save_q;
      strobe_addr<='1';
      even_odd <= "10";
    when stage3 =>
      out_addr <= addr_save_q;
      strobe_addr<='1';
      even_odd <= "11";
    when others =>
      even_odd <= "00";
      out_addr <= (others => DontCareValue);
  end case;
end process;

process(wb_clk_i)
begin
  if falling_edge(wb_clk_i) then
    sram_data_read_q(31 downto 24) <= sram_data_read;
	  sram_data_read_q(23 downto 0) <= sram_data_read_q(31 downto 8);
  end if;
end process;

process(state, wb_cyc_i, wb_stb_i)
begin
  case state is
    when idle =>
      stall <= '0';
    when stage1 =>
      stall <= '1';
    when stage2 =>
      stall <= '1';
    when stage3 =>
      stall <= '1';
    when others =>
      stall <= '0';
  end case;
end process;


process(wb_clk_i)
begin
  if rising_edge(wb_clk_i) then
    if wb_rst_i='1' then
      wb_ack_o<='0';
    else
      if wb_stb_i='1' and wb_cyc_i='1' and stall='0' then
        addr_save_q <= wb_adr_i;
        write_save_q <= wb_we_i;
        sel_q <= wb_sel_i;
      end if;
  
      wb_dat_o <= sram_data_read_q;
      wb_ack_o <= ack_q;
    end if;
  end if;
end process;

process(wb_clk_i)
begin
  if rising_edge(wb_clk_i) then
    if wb_rst_i='1' then
      state <= idle;
      sram_ce_i <= '1';
      sram_oe_i <= '1';
      ntristate <= '1';
      ack_q  <= '0';
      sram_data_write <= (others => DontCareValue);
    else
      sram_ce_i <= '1';
      sram_oe_i <= '1';
      ntristate <= '1';
      sram_data_write <= (others => DontCareValue);
      ack_q <= '0';
      case state is

        when idle =>
          if wb_cyc_i='1' and wb_stb_i='1' then

            sram_data_write <= wb_dat_i(7 downto 0);
            sram_oe_i <= wb_we_i;
            ntristate <= wb_we_i;
            sram_ce_i <= '0';

            state <= stage1;
          else
            sram_ce_i <= '1';
            sram_oe_i <= '1';
            ntristate <= '1';
          end if;

        when stage1 =>

          sram_data_write <= wb_dat_i(15 downto 8);
          sram_oe_i <= write_save_q;
          ntristate <= write_save_q;
          sram_ce_i <= '0';
          state <= stage2;

        when stage2 =>

            sram_data_write <= wb_dat_i(23 downto 16);
            sram_oe_i <= write_save_q;
            ntristate <= write_save_q;
            sram_ce_i <= '0';
            state <= stage3;
		  
        when stage3 =>

            sram_data_write <= wb_dat_i(31 downto 24);
            sram_oe_i <= write_save_q;
            ntristate <= write_save_q;
            sram_ce_i <= '0';
            state <= stage4;

        when stage4 =>

          ack_q <= '1';
          sram_oe_i <= write_save_q;
          ntristate <= write_save_q;
          sram_ce_i <= '0';
          if wb_stb_i='1' and wb_cyc_i='1' then
            sram_data_write <= wb_dat_i(7 downto 0);
            sram_oe_i <= wb_we_i;
            ntristate <= wb_we_i;
            sram_ce_i <= '0';
            state <= stage1; --Should this be stage1? I think so, JPG
          else
            --sram_oe_i <= '1';
            --ntristate <= '1';
            --sram_ce_i <= '0';
            state <= idle;
          end if;

        when others =>
      end case;
    end if;
  end if;
end process;


end behave;
