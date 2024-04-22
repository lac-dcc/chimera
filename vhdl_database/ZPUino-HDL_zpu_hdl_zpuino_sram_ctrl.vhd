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

entity sram_ctrl is
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;

    wb_dat_o: out std_logic_vector(31 downto 0);
    wb_dat_i: in std_logic_vector(31 downto 0);
    wb_adr_i: in std_logic_vector(maxIOBit downto minIOBit);
--    wb_sel_i: in std_logic_vector(3 downto 0);
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
    sram_addr:  out std_logic_vector(18 downto 0);
    sram_data:  inout std_logic_vector(15 downto 0);
    sram_ce:    out std_logic := '1';
    sram_we:    out std_logic;
    sram_oe:    out std_logic;
    sram_be:    out std_logic
  );

end entity sram_ctrl;


architecture behave of sram_ctrl is

signal sram_data_write: std_logic_vector(15 downto 0);
signal out_write_enable: std_logic;

type state_type is (
  idle,
  stage1,
  stage2
);

signal state: state_type;

signal strobe_addr: std_logic;
signal even_odd: std_logic;
signal sram_addr_q: std_logic_vector(18 downto 0);
signal bus_tristate: std_logic;
signal sram_data_read: std_logic_vector(15 downto 0);
signal sram_data_write_i: std_logic_vector(15 downto 0);

signal sram_data_read_q: std_logic_vector(31 downto 0);
signal out_addr: std_logic_vector(maxIOBit downto minIOBit);
signal addr_save_q: std_logic_vector(maxIOBit downto minIOBit);
signal write_save_q: std_logic;
signal stall: std_logic;

signal ack_q, ack_q_q, ack_q_q_q: std_logic;

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

sram_be_i <= '0';

sram_ce <= sram_ce_i;
sram_we <= sram_we_i;
sram_be <= sram_be_i;
sram_oe <= sram_oe_i;

wb_stall_o <= stall;

sram_data <= sram_data_write_i when wb_we_i='1' and wb_cyc_i='1' else (others => 'Z');

sram_data_write_i <= transport sram_data_write after 1.7 ns;


process(state,wb_cyc_i,wb_stb_i,wb_we_i,write_save_q)
begin
  case state is
    when idle =>
      if wb_cyc_i='1' and wb_stb_i='1' then
        out_write_enable <= not wb_we_i;
      else
        out_write_enable <= '1';
      end if;
    when stage1 | stage2 =>
      out_write_enable <= not write_save_q;
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


saq: for index in 1 to 18 generate
  addrff: ODDR2
    generic map (
      DDR_ALIGNMENT => "NONE",  
      INIT          => '0',
      SRTYPE        => "ASYNC") 
    port map (
      D0 => out_addr(index+1),
      Q => sram_addr_q(index),
      C0 => wb_clk_i,
      D1 => '0',
      C1 => '0',
      CE => strobe_addr,
      R  => '0',
      S  => '0'
    );

end generate;

  sram_addr_q_0: ODDR2
    generic map (
      DDR_ALIGNMENT => "NONE",  
      INIT          => '0',
      SRTYPE        => "ASYNC") 
    port map (
      D0 => even_odd,
      D1 => '0',
      Q => sram_addr_q(0),
      C0 => wb_clk_i,
      C1 => '0',
      CE => strobe_addr,
      R => '0',
      S => '0'
    );

process(state,wb_cyc_i,wb_stb_i,wb_adr_i,addr_save_q)
begin
  strobe_addr <='0';
  even_odd <= DontCareValue;
  case state is
    when idle | stage2=>
      if wb_cyc_i='1' and wb_stb_i='1' then
        out_addr <= wb_adr_i;
        strobe_addr<='1';
        even_odd <= '0';
      else
        out_addr <= (others => DontCareValue);
      end if;
    when stage1 =>
      out_addr <= addr_save_q;
      strobe_addr<='1';
      even_odd <= '1';
    when others =>
      out_addr <= (others => DontCareValue);
  end case;
end process;


process(wb_clk_i)
begin
  if falling_edge(wb_clk_i) then
    sram_data_read_q(31 downto 16) <= sram_data_read;
    sram_data_read_q(15 downto 0) <= sram_data_read_q(31 downto 16);
  end if;
end process;

--process(clk_wen)
--begin
--  if rising_edge(clk_wen) then
--    sram_data_read_q(31 downto 16) <= sram_data_read;
--    sram_data_read_q(15 downto 0) <= sram_data_read_q(31 downto 16);
--  end if;
--end process;

process(state, wb_cyc_i, wb_stb_i)
begin
  case state is
    when idle =>
      --if wb_cyc_i='1' and wb_stb_i='1' then
      --  _stall <= '1';
      --else
      stall <= '0';
      --end if;
    when stage1 =>
      stall <= '1';
    when others =>
      stall <= '0';
  end case;
end process;


process(wb_clk_i)
begin
  if rising_edge(wb_clk_i) then
    if wb_stb_i='1' and stall<='0' then
      addr_save_q <= wb_adr_i;
      write_save_q <= wb_we_i;
    end if;

    wb_dat_o <= sram_data_read_q;

  end if;
end process;

wb_ack_o <= ack_q_q;

process(wb_clk_i)
begin
  if rising_edge(wb_clk_i) then
    if wb_rst_i='1' then
      state <= idle;
      --out_write_enable<='1';
      --sram_we <= '1';
      sram_ce_i <= '1';
      sram_oe_i <= '1';
      ack_q_q_q <= '0';
      ack_q_q   <= '0';
--      ack_q     <= '0';
      sram_data_write <= (others => DontCareValue);
    else
      sram_ce_i <= '1';
      sram_oe_i <= '1';
      sram_data_write <= (others => DontCareValue);
      ack_q_q_q <= '0';
      ack_q_q <= ack_q_q_q;
--      ack_q <= ack_q_q;

      case state is

        when idle =>
          if wb_cyc_i='1' and wb_stb_i='1' then

            sram_data_write <= wb_dat_i(15 downto 0);
            sram_oe_i <= wb_we_i;
            sram_ce_i <= '0';

            state <= stage1;

          end if;

        when stage1 =>

          sram_data_write <= wb_dat_i(31 downto 16);
          sram_oe_i <= write_save_q;
          sram_ce_i <= '0';
          state <= stage2;

        when stage2 =>

          if wb_stb_i='1' then
            sram_data_write <= wb_dat_i(15 downto 0);
            sram_oe_i <= wb_we_i;
            sram_ce_i <= '0';
            state <= stage1;
          else
            sram_oe_i <= '1';
            sram_ce_i <= '1';
            state <= idle;
          end if;
          ack_q_q_q <= '1';

        when others =>
      end case;
    end if;
  end if;
end process;


end behave;
