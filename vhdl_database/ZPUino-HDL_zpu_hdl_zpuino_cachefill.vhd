library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

library work;
use work.wishbonepkg.all;

entity cachefill is

  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;

    -- This is a wishbone master interface

    wb_dat_i: in std_logic_vector(31 downto 0);
    wb_dat_o: out std_logic_vector(31 downto 0);
    wb_adr_o: out std_logic_vector(31 downto 0);
    wb_sel_o: out std_logic_vector(3 downto 0);
    wb_cti_o: out std_logic_vector(2 downto 0);
    wb_we_o:  out std_logic;
    wb_cyc_o: out std_logic;
    wb_stb_o: out std_logic;
    wb_ack_i: in std_logic;

    read: out std_logic_vector(15 downto 0);
    readclk: in std_logic;
    read_enable: in std_logic;
    empty: out std_logic;
    clear: in std_logic
  );

end entity cachefill;

architecture behave of cachefill is

  component gh_fifo_async_rrd_sr_wf is
	GENERIC (add_width: INTEGER :=8; -- min value is 2 (4 memory locations)
	         data_width: INTEGER :=8 ); -- size of data bus
	port (					
		clk_WR  : in STD_LOGIC; -- write clock
		clk_RD  : in STD_LOGIC; -- read clock
		rst     : in STD_LOGIC; -- resets counters
		srst    : in STD_LOGIC:='0'; -- resets counters (sync with clk_WR)
		WR      : in STD_LOGIC; -- write control 
		RD      : in STD_LOGIC; -- read control
		D       : in STD_LOGIC_VECTOR (data_width-1 downto 0);
		Q       : out STD_LOGIC_VECTOR (data_width-1 downto 0);
		empty   : out STD_LOGIC;
		qfull   : out STD_LOGIC;
		hfull   : out STD_LOGIC;
		qqqfull : out STD_LOGIC;
    afull   : out STD_LOGIC;
		full    : out STD_LOGIC);
  end component;

  signal fifo_full: std_logic;
  signal fifo_almost_full: std_logic;
  signal reset_address: std_logic := '0';
  signal address: unsigned(18 downto 0);
  signal fifo_write_enable: std_logic;
  signal fifo_quad_full: std_logic;
  signal fifo_half_full: std_logic;
  signal trigger_read_n: std_logic;

  constant max_burst_size: integer := 30;
  signal burst: integer;

type state_type is (
  idle,
  request,
  stop,
  waitend
);

signal state: state_type;

begin


myfifo: gh_fifo_async_rrd_sr_wf
  generic map (
    data_width => 16,
    add_width => 10
  )
  port map (
		clk_WR  => wb_clk_i,
		clk_RD  => readclk,
		rst     => clear,
		srst    => '0',
		WR      => fifo_write_enable,
		RD      => read_enable,
		D       => wb_dat_i(15 downto 0),
		Q       => read,
		empty   => empty,
		qfull   => fifo_quad_full,
		hfull   => fifo_half_full,
		qqqfull => fifo_almost_full,
		full    => fifo_full
  );


wb_we_o <= '0';
wb_dat_o <= (others => 'X');

wb_sel_o <= "1111";

wb_adr_o(31 downto address'high+1) <= (others => '0');
wb_adr_o(18 downto 0) <= std_logic_vector(address);

fifo_write_enable<='1' when wb_ack_i='1' and state/=idle else '0';

trigger_read_n <= fifo_half_full;

process( wb_clk_i, clear, wb_rst_i )
begin

  if clear='1' or wb_rst_i='1' then
    address <= (others => '0');
    state <= idle;
    wb_cyc_o <= '0';
  elsif rising_edge(wb_clk_i) then
      wb_cti_o <= (others => 'X');
      wb_cyc_o <= '0';
      wb_stb_o <= 'X';

      case state is
        when idle =>
          if trigger_read_n='0' then
            state <= request;
            burst <= max_burst_size;
          end if;
        when request =>
          wb_cyc_o <= '1';
          wb_stb_o <= '1';
          wb_cti_o <= CTI_CYCLE_INCRADDR;
          if wb_ack_i='1' and ( fifo_almost_full='1' or burst=0) then
            state <= stop;
            wb_cti_o <= CTI_CYCLE_ENDOFBURST;
          end if;
          if wb_ack_i='1' then
            burst <= burst - 1;
            address <= address+1;
          end if;
        when stop =>
          wb_cyc_o <= '1';
          wb_stb_o <= '1';
          wb_cti_o <= CTI_CYCLE_ENDOFBURST;
          if wb_ack_i='1' then
            address <= address+1;
            state <= idle;
            wb_cyc_o <= '0';
            wb_stb_o <= '0';
          end if;
        when waitend =>
          if wb_ack_i='1' then
            state <= idle;
            wb_cyc_o <= '0';
            address <= address+1;
          end if;
        when others =>

      end case;

  end if;
end process;
end behave;
