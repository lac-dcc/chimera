-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.all;
use work.FGPU_definitions.all;
use ieee.std_logic_textio.all;
use std.textio.all;
---------------------------------------------------------------------------------------------------------}}}
entity axi_controllers is 
port( -- {{{
  -- to tag controller
  ---- axi read control
  axi_rdAddr          : in gmem_addr_array_no_bank(N_WR_FIFOS-1 downto 0) := (others=>(others=>'0'));
  wr_fifo_go          : in std_logic_vector(N_WR_FIFOS-1 downto 0) := (others=>'0');
  wr_fifo_free        : out std_logic_vector(N_WR_FIFOS-1 downto 0) := (others=>'0'); --free ports have to respond to go ports immediately (in one clock cycle)
  ---- axi write controls 
  axi_wrAddr          : in gmem_addr_array_no_bank(N_AXI-1 downto 0) := (others=>(others=>'0'));
  axi_writer_go       : in std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  axi_writer_free     : out std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  axi_writer_id       : in std_logic_vector(N_TAG_MANAGERS_W-1 downto 0) := (others=>'0');
  axi_writer_ack      : out std_logic_vector(N_TAG_MANAGERS-1 downto 0) := (others=>'0'); -- high for just one clock cycle
  -- to cache controller
  wr_fifo_cache_rqst  : out std_logic_vector(N_WR_FIFOS-1 downto 0) := (others=>'0');
  rd_fifo_cache_rqst  : out std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  wr_fifo_cache_ack   : in std_logic_vector(N_WR_FIFOS-1 downto 0) := (others=>'0');
  rd_fifo_cache_ack   : in std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  wr_fifo_rqst_addr   : out cache_addr_array(N_WR_FIFOS-1 downto 0) := (others=>(others=>'0'));
  rd_fifo_rqst_addr   : out cache_addr_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  wr_fifo_dout        : out cache_word_array(N_WR_FIFOS-1 downto 0) := (others=>(others=>'0'));
  cache_dob           : in std_logic_vector(DATA_W*2**N-1 downto 0) := (others=>'0');
  rd_fifo_din_v       : in std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  ---- be signals
  fifo_be_din         : in std_logic_vector(DATA_W/8*2**N-1 downto 0) := (others=>'0');

  -- axi signals {{{
  --Read address channel
  axi_araddr          : out GMEM_ADDR_ARRAY(N_AXI-1 downto 0) := (others=>(others=>'0'));
  axi_arvalid         : out std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  axi_arready         : in std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  axi_arid            : out id_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  -- Read data channel
  axi_rdata           : in gmem_word_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  axi_rlast           : in std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  axi_rvalid          : in std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  axi_rready          : out std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  axi_rid             : in id_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  -- write address channel
  axi_awaddr          : out GMEM_ADDR_ARRAY(N_AXI-1 downto 0) := (others=>(others=>'0'));
  axi_awvalid         : out std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  axi_awready         : in std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  axi_awid            : out id_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  -- write data channel
  axi_wdata           : out gmem_word_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  axi_wstrb           : out gmem_be_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  axi_wlast           : out std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  axi_wvalid          : out std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  axi_wready          : in std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  -- write response channel
  axi_bvalid          : in std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  axi_bready          : out std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  axi_bid             : in id_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  --}}}
  clk, nrst           : std_logic
);
-- }}}
end entity; 
architecture basic of axi_controllers is
  -- internal signals {{{
  signal axi_arvalid_i                    : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal axi_rready_i                     : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal axi_awvalid_i                    : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal wr_fifo_free_i                   : std_logic_vector(N_WR_FIFOS-1 downto 0) := (others=>'0');
  signal axi_araddr_i                     : GMEM_ADDR_ARRAY(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal axi_arid_i                       : id_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal rd_fifo_cache_rqst_i             : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal wr_fifo_rqst_addr_i              : cache_addr_array(N_WR_FIFOS-1 downto 0)  := (others=>(others=>'0'));
  signal rd_fifo_rqst_addr_i              : cache_addr_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal axi_wvalid_i                     : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  -- }}}
  -- functions & constants {{{
  function distribute_fifos_on_axis (n_fifos: integer; n_axis: integer) return nat_array is
    variable res: nat_array(n_fifos-1 downto 0) := (others=>0);
    variable axi_indx: integer range 0 to n_axis-1 := 0;
  begin
    for i in 0 to n_fifos-1 loop
      res(i) := axi_indx;
      if axi_indx /= n_axis-1 then
        axi_indx := axi_indx + 1;
      else
        axi_indx := 0;
      end if;
    end loop;
    return res;
  end;
  function axi_wr_fifos_indcs(n_axis: natural; n_fifos_axi: natural) return nat_2d_array is
    variable res: nat_2d_array(n_axis-1 downto 0, n_fifos_axi-1 downto 0) := (others=>(others=>0));
  begin
    for i in 0 to n_axis-1 loop
      for j in 0 to n_fifos_axi-1 loop
        res(i,j) := i+j*n_axis;
      end loop;
    end loop;
    return res;
  end function;
  function find_fifo_indx (n_fifos: integer; n_axis: integer) return nat_array is
    variable res: nat_array(n_fifos-1 downto 0) := (others=>0);
  begin
    for i in 0 to n_fifos-1 loop
      res(i) := i / n_axis ;
    end loop;
    return res;
  end;
  constant c_wr_fifo_axi_indx             : nat_array(N_WR_FIFOS-1 downto 0) := distribute_fifos_on_axis(N_WR_FIFOS, N_AXI);              -- fifo -> axi 
  constant c_axi_wr_fifos                 : nat_2d_array(N_AXI-1 downto 0, N_WR_FIFOS_AXI-1 downto 0) := axi_wr_fifos_indcs(N_AXI, N_WR_FIFOS_AXI);  -- axi -> fifo
  constant c_wr_fifo_indx                 : nat_array(N_WR_FIFOS-1 downto 0) := find_fifo_indx(N_WR_FIFOS, N_AXI);                  -- 0 <= fifo indx < N_WR_FIFOS_AXI-1
  -- }}}
  -- axi interfaces {{{
  type st_addr_channel is (idle, active);
  type st_addr_channel_array is array(natural range <>) of st_addr_channel;
  signal st_ar, st_ar_n                : st_addr_channel_array(N_AXI-1 downto 0) := (others=>idle);
  signal axi_arvalid_n, axi_rready_n          : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal wr_fifo_free_n                : std_logic_vector(N_WR_FIFOS-1 downto 0) := (others=>'0');

  signal axi_araddr_n                  : GMEM_ADDR_ARRAY(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal axi_set_araddr_ack              : std_logic_vector(N_WR_FIFOS-1 downto 0) := (others=>'0');
  signal axi_set_araddr_ack_n              : std_logic_vector(N_WR_FIFOS-1 downto 0) := (others=>'0');
  signal axi_arid_n                  : id_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal axi_writer_free_n              : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');

  -- }}}
  -- a fifo can write (wr_fifo) the cache or can read (rd_fifo) from the cache
  -- write fifos (read axi channels) {{{
  type st_wr_fifo_type is (idle, send_address, get_data, wait_empty, wait_for_writing_cache, wait2);
  type st_wr_fifo_array is array (natural range <>) of st_wr_fifo_type;
  signal st_wr_fifo, st_wr_fifo_n         : st_wr_fifo_array(N_WR_FIFOS-1 downto 0) := (others=>idle); 
  signal wr_fifo_rqst_addr_n              : cache_addr_array(N_WR_FIFOS-1 downto 0)  := (others=>(others=>'0'));
  signal wr_fifo_push, wr_fifo_push_n     : std_logic_vector(N_WR_FIFOS-1 downto 0) := (others=>'0');
  signal wr_fifo_set_araddr               : std_logic_vector(N_WR_FIFOS-1 downto 0) := (others=>'0');
  signal wr_fifo_set_araddr_n             : std_logic_vector(N_WR_FIFOS-1 downto 0) := (others=>'0');

  type wr_fifo_narrow_port_addr_vec  is array (natural range <>) of unsigned(BURST_W-1 downto 0);
  type fifo_wide_port_addr_vec is array (natural range <>) of unsigned(BURST_WORDS_W-CACHE_N_BANKS_W-1 downto 0);
  signal wr_fifo_wrAddr                   : wr_fifo_narrow_port_addr_vec(N_WR_FIFOS-1 downto 0) := (others=>(others=>'0'));
  signal wr_fifo_wrAddr_n                 : wr_fifo_narrow_port_addr_vec(N_WR_FIFOS-1 downto 0) := (others=>(others=>'0'));
  signal wr_fifo_rdAddr                   : fifo_wide_port_addr_vec(N_WR_FIFOS-1 downto 0) := (others=>(others=>'0'));
  signal wr_fifo_rdAddr_n                 : fifo_wide_port_addr_vec(N_WR_FIFOS-1 downto 0) := (others=>(others=>'0'));
  signal wr_fifo_full, wr_fifo_full_n     : std_logic_vector(N_WR_FIFOS-1 downto 0) := (others=>'0');
  type wr_fifo_vec is array(natural range <>) of gmem_word_array(2**BURST_W-1 downto 0);
  signal wr_fifo                          : wr_fifo_vec(N_WR_FIFOS-1 downto 0) := (others=>(others=>(others=>'0')));
  signal axi_rdata_d0                     : gmem_word_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal axi_rdata_wr_fifo                : gmem_word_array(N_WR_FIFOS-1 downto 0) := (others=>(others=>'0'));
  attribute max_fanout of wr_fifo_rdAddr  : signal is 60;
  -- }}}
  -- read fifos (write axi channels) {{{
  type rd_fifo_vec is array(natural range <>) of gmem_word_array(2**RD_FIFO_W-1 downto 0);
  signal rd_fifo                          : rd_fifo_vec(N_AXI-1 downto 0) := (others=>(others=>(others=>'0')));
  signal rd_fifo_cache_rqst_n             : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal rd_fifo_rqst_addr_n              : cache_addr_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal fifo_cache_rqst_rd_data          : gmem_word_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal rd_fifo_pop, rd_fifo_slice_filled: std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal axi_written                      : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  type st_rd_fifo_fill_type is (idle, fill_fifo, wait_w_channel);
  type st_rd_fifo_fill_array is array (natural range <>) of st_rd_fifo_fill_type;
  signal st_rd_fifo_data                  : st_rd_fifo_fill_array(N_AXI-1 downto 0) := (others=>idle);
  signal st_rd_fifo_data_n                : st_rd_fifo_fill_array(N_AXI-1 downto 0) := (others=>idle);
  type rd_fifo_wrAddr_array is array (natural range <>) of unsigned(RD_FIFO_N_BURSTS_W+BURST_WORDS_W-CACHE_N_BANKS_W-1 downto 0);
  signal rd_fifo_wrAddr                   : rd_fifo_wrAddr_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal rd_fifo_wrAddr_n                 : rd_fifo_wrAddr_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  attribute max_fanout of rd_fifo_wrAddr  : signal is 60;
  type rd_fifo_rdAddr_array is array (natural range <>) of unsigned(RD_FIFO_N_BURSTS_W+BURST_WORDS_W-GMEM_N_BANK_W-1 downto 0);
  signal rd_fifo_rdAddr, rd_fifo_rdAddr_n : rd_fifo_rdAddr_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal rd_fifo_nempty, rd_fifo_nempty_n : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  type rd_fifo_n_filled_array is array (natural range <>) of unsigned(RD_FIFO_W-1 downto 0);
  signal rd_fifo_n_filled                 : rd_fifo_n_filled_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal rd_fifo_n_filled_n               : rd_fifo_n_filled_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal rd_fifo_n_filled_on_ack          : rd_fifo_n_filled_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal rd_fifo_n_filled_on_ack_n        : rd_fifo_n_filled_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal cache_dob_latched                : std_logic_vector(DATA_W*2**N-1 downto 0) := (others=>'0');
  signal axi_wlast_p0                     : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal rd_fifo_din_v_d0                 : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal cache_dob_d0                     : std_logic_vector(DATA_W*2**N-1 downto 0) := (others=>'0');
  signal fifo_be_din_d0                   : std_logic_vector(DATA_W/8*2**N-1 downto 0) := (others=>'0');
  -- be fifos
  type fifo_be_vec is array(natural range <>) of gmem_be_array(2**RD_FIFO_W-1 downto 0);
  signal fifo_be                          : fifo_be_vec(N_AXI-1 downto 0) := (others=>(others=>(others=>'0')));

  type awaddr_fifo_type is array(natural range <>) of gmem_addr_array(2**RD_FIFO_N_BURSTS_W-1 downto 0);
  signal awaddr_fifo                      : awaddr_fifo_type(N_AXI-1 downto 0) := (others=>(others=>(others=>'0')));
  type tmanager_indx_array is array(natural range <>) of std_logic_vector(N_TAG_MANAGERS_W-1 downto 0);
  type awid_fifo_type is array(natural range <>) of tmanager_indx_array(2**RD_FIFO_N_BURSTS_W-1 downto 0);
  signal awid_fifo                        : awid_fifo_type(N_AXI-1 downto 0) := (others=>(others=>(others=>'0')));
  type awaddr_fifo_addr_vec is array(natural range <>) of unsigned(RD_FIFO_N_BURSTS_W-1 downto 0);
  signal awaddr_fifo_wrAddr               : awaddr_fifo_addr_vec(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal awaddr_fifo_wrAddr_n             : awaddr_fifo_addr_vec(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal awaddr_fifo_rdAddr               : awaddr_fifo_addr_vec(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal awaddr_fifo_rdAddr_n             : awaddr_fifo_addr_vec(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal awaddr_fifo_pop_n                : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal awaddr_fifo_pop                  : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal awaddr_fifo_full_n               : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal awaddr_fifo_full                 : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal awaddr_fifo_nempty_n             : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal awaddr_fifo_nempty               : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  
  signal axi_wdata_n                      : gmem_word_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal axi_wstrb_n                      : gmem_be_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  --}}}
begin
  -- internal & fixed signals assignments -------------------------------------------------------------------------{{{
  axi_arvalid <= axi_arvalid_i;
  axi_wvalid <= axi_wvalid_i;
  axi_rready <= axi_rready_i;
  axi_awvalid <= axi_awvalid_i;
  axi_bready <= (others=>'1');
  wr_fifo_free <= wr_fifo_free_i;
  rd_fifo_cache_rqst <= rd_fifo_cache_rqst_i;
  wr_fifo_rqst_addr <= wr_fifo_rqst_addr_i;
  rd_fifo_rqst_addr <= rd_fifo_rqst_addr_i;
  axi_araddr <= axi_araddr_i;
  axi_arid <= axi_arid_i;
  assert N_TAG_MANAGERS_W <= ID_WIDTH report "Width of AWID channel is not enough for sending the tag manager id" severity failure;
  ---------------------------------------------------------------------------------------------------------}}}
  -- axi fifos wr (to cache) ----------------------------------------------------------------------------------------{{{
  wr_fifo_cache_rqst <= wr_fifo_full;
  wr_fifos: for i in 0 to N_WR_FIFOS-1 generate
  begin
    process(clk)
    begin
      if rising_edge(clk) then
        if wr_fifo_push(i) = '1' then
          wr_fifo(i)(to_integer(wr_fifo_wrAddr(i))) <= axi_rdata_wr_fifo(i);
          -- wr_fifo(i)(to_integer(wr_fifo_wrAddr(i))) <= axi_rdata_d0(c_wr_fifo_axi_indx(i));
        end if;
        wr_fifo_push(i) <= wr_fifo_push_n(i);
        wr_fifo_free_i(i) <= wr_fifo_free_n(i);
        if nrst = '0' then
          st_wr_fifo(i) <= idle;
          wr_fifo_set_araddr(i) <= '0';
          wr_fifo_rqst_addr_i(i) <= (others=>'0');
        else
          st_wr_fifo(i) <= st_wr_fifo_n(i);
          wr_fifo_set_araddr(i) <= wr_fifo_set_araddr_n(i);
          wr_fifo_rqst_addr_i(i) <= wr_fifo_rqst_addr_n(i);
        end if;
      end if;
    end process;

    process(st_wr_fifo(i), wr_fifo_set_araddr(i), wr_fifo_free_i(i), wr_fifo_go(i), axi_rdAddr(i), axi_set_araddr_ack(i), wr_fifo_rqst_addr_i(i),
        axi_rvalid(c_wr_fifo_axi_indx(i)), wr_fifo_cache_ack(i), axi_rlast(c_wr_fifo_axi_indx(i)), axi_rid(c_wr_fifo_axi_indx(i)),
        wr_fifo_rdAddr(i))
    begin
      st_wr_fifo_n(i) <= st_wr_fifo(i);
      wr_fifo_set_araddr_n(i) <= wr_fifo_set_araddr(i);
      wr_fifo_free_n(i) <= wr_fifo_free_i(i);
      wr_fifo_rqst_addr_n(i) <= wr_fifo_rqst_addr_i(i);
      if wr_fifo_cache_ack(i) = '1' or wr_fifo_rdAddr(i) /= (wr_fifo_rdAddr(i)'reverse_range => '0') then
        wr_fifo_rqst_addr_n(i) <= wr_fifo_rqst_addr_i(i) + 1;
      end if;
      wr_fifo_push_n(i) <= '0';

      case st_wr_fifo(i) is
        when idle =>
          wr_fifo_free_n(i) <= '1';
          if wr_fifo_go(i) = '1' then
            wr_fifo_free_n(i) <= '0';
            wr_fifo_set_araddr_n(i) <= '1';
            st_wr_fifo_n(i) <= send_address;
            wr_fifo_rqst_addr_n(i) <= axi_rdAddr(i)(M+L-1 downto 0); -- this signal has priority on wr_fifo_cache_ack when setting wr_fifo_rqst_addr_n
          end if;
        when send_address => 
          if axi_set_araddr_ack(i) = '1' then
            st_wr_fifo_n(i) <= get_data;
            wr_fifo_set_araddr_n(i) <= '0';
          end if;
        when get_data =>
          if axi_rvalid(c_wr_fifo_axi_indx(i)) = '1' and to_integer(unsigned(axi_rid(c_wr_fifo_axi_indx(i)))) = c_wr_fifo_indx(i) then
            wr_fifo_push_n(i) <= '1';
            if axi_rlast(c_wr_fifo_axi_indx(i)) = '1' then
              st_wr_fifo_n(i) <= wait_empty;
            end if;
          end if;
        when wait_empty =>
          -- if wr_fifo_cache_ack(i) = '1' then
          if wr_fifo_rdAddr(i) = (wr_fifo_rdAddr(i)'reverse_range => '1') then
            -- st_wr_fifo_n(i) <= wait_for_writing_cache;
            st_wr_fifo_n(i) <= idle;
            wr_fifo_free_n(i) <= '1';
          end if;
        when wait_for_writing_cache =>
          -- st_wr_fifo_n(i) <= wait2;
          st_wr_fifo_n(i) <= idle;
          wr_fifo_free_n(i) <= '1';
        when wait2 =>
          wr_fifo_free_n(i) <= '1';
          st_wr_fifo_n(i) <= idle;
      end case;
    end process;

    wr_fifo_out: process(wr_fifo(i), wr_fifo_rdAddr(i))
      variable indx: unsigned(BURST_W-1 downto 0) := (others=>'0');
    begin
      for j in 0 to CACHE_N_BANKS/GMEM_N_BANK-1 loop
        if CACHE_N_BANKS_W > GMEM_N_BANK_W then
          indx(max(CACHE_N_BANKS_W-GMEM_N_BANK_W-1, 0) downto 0) := to_unsigned(j, CACHE_N_BANKS_W-GMEM_N_BANK_W);
        end if;
        indx(indx'high downto CACHE_N_BANKS_W-GMEM_N_BANK_W) := wr_fifo_rdAddr(i);
        wr_fifo_dout(i)((j+1)*GMEM_DATA_W-1 downto j*GMEM_DATA_W) <= wr_fifo(i)(to_integer(indx));
      end loop;
    end process;

    process(wr_fifo_rdAddr(i), wr_fifo_cache_ack(i), wr_fifo_push(i), wr_fifo_wrAddr(i), wr_fifo_full(i))
    begin
      wr_fifo_rdAddr_n(i) <= wr_fifo_rdAddr(i);
      wr_fifo_wrAddr_n(i) <= wr_fifo_wrAddr(i);
      wr_fifo_full_n(i) <= wr_fifo_full(i);
      if wr_fifo_cache_ack(i) = '1' or wr_fifo_rdAddr(i) /= (wr_fifo_rdAddr(i)'reverse_range => '0') then
        wr_fifo_rdAddr_n(i) <= wr_fifo_rdAddr(i) + 1;
      end if;
      if wr_fifo_push(i) = '1' then
        wr_fifo_wrAddr_n(i) <= wr_fifo_wrAddr(i) + 1;
      end if;
      if wr_fifo_push(i) = '1' and wr_fifo_wrAddr(i) = (wr_fifo_wrAddr(i)'reverse_range => '1') then
        wr_fifo_full_n(i) <= '1';
      elsif wr_fifo_cache_ack(i) = '1' then
        wr_fifo_full_n(i) <= '0';
      end if;
    end process;

    process(clk)
    begin
      if rising_edge(clk) then
        if nrst = '0' then
          wr_fifo_wrAddr(i) <= (others=>'0');
          wr_fifo_rdAddr(i) <= (others=>'0');
          wr_fifo_full(i) <= '0';
        else
          
          wr_fifo_rdAddr(i) <= wr_fifo_rdAddr_n(i);
          wr_fifo_wrAddr(i) <= wr_fifo_wrAddr_n(i);
          wr_fifo_full(i) <= wr_fifo_full_n(i);
        end if;
      end if;
    end process;
  end generate;
  ---------------------------------------------------------------------------------------------------------}}}
  -- axi read channels ------------------------------------------------------------------------------------------- {{{
  axi_trans_read: process(clk)
  begin
    if rising_edge(clk) then
      axi_set_araddr_ack <= axi_set_araddr_ack_n;
      cache_dob_d0 <= cache_dob;
      axi_arid_i <= axi_arid_n;
      rd_fifo_din_v_d0 <= rd_fifo_din_v;
      fifo_be_din_d0 <= fifo_be_din;
      if nrst = '0' then
        axi_arvalid_i <= (others=>'0');
        axi_rready_i <= (others=>'0');
        axi_araddr_i <= (others=>(others=>'0'));
        st_ar <= (others=>idle);
      else
        -- read signals
        axi_arvalid_i <= axi_arvalid_n;
        axi_rready_i <= axi_rready_n;
        axi_araddr_i <= axi_araddr_n;
        st_ar <= st_ar_n;
      end if;
    end if;
  end process;

  process(st_ar, wr_fifo_set_araddr, axi_arvalid_i, axi_arready, axi_araddr_i, axi_arid_i, axi_rdAddr)
  begin
    for i in 0 to N_AXI-1 loop
      st_ar_n(i) <= st_ar(i);
      axi_arvalid_n(i) <= axi_arvalid_i(i);
      axi_araddr_n(i) <= axi_araddr_i(i);
      axi_araddr_n(i)(2+N-1 downto 0) <= (others=>'0');
      axi_arid_n(i) <= axi_arid_i(i);
      for j in 0 to N_WR_FIFOS_AXI-1 loop
        axi_set_araddr_ack_n(c_axi_wr_fifos(i, j)) <= '0';
      end loop;
      case st_ar(i) is
        when idle =>
          for j in 0 to N_WR_FIFOS_AXI-1 loop
            if wr_fifo_set_araddr(c_axi_wr_fifos(i, j)) = '1' then
              st_ar_n(i) <= active;
              axi_arvalid_n(i) <= '1';
              axi_araddr_n(i)(GMEM_ADDR_W-1 downto 2+N) <= axi_rdAddr(c_axi_wr_fifos(i, j));
              axi_set_araddr_ack_n(c_axi_wr_fifos(i, j)) <= '1';
              axi_arid_n(i) <= std_logic_vector(to_unsigned(j, ID_WIDTH));
              exit;
            end if;
          end loop;
        when active =>
          if axi_arready(i) = '1' then
            axi_arvalid_n(i) <= '0';
            st_ar_n(i) <= idle;
          end if;
      end case;
      axi_rready_n(i) <= '1';
    end loop;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- axi fifos rd (from cache) ------------------------------------------------------------------------------------{{{
  fifos_rd: for i in 0 to N_AXI-1 generate
  begin
    fifor_rd_fill: process(clk)
      variable indx: unsigned(BURST_W+RD_FIFO_N_BURSTS_W-1 downto 0) := (others=>'0');
    begin
      if rising_edge(clk) then
        if axi_written(i) = '1' or rd_fifo_slice_filled(i) = '0' then
          axi_wdata(i) <= rd_fifo(i)(to_integer(rd_fifo_rdAddr(i)));
          axi_wstrb(i) <= fifo_be(i)(to_integer(rd_fifo_rdAddr(i)));
          axi_wvalid_i(i) <= rd_fifo_nempty(i);
          axi_wlast(i) <= axi_wlast_p0(i);
        end if;
        
        if rd_fifo_din_v_d0(i) = '1' then
          for j in 0 to CACHE_N_BANKS/GMEM_N_BANK-1 loop
            if CACHE_N_BANKS_W > GMEM_N_BANK_W then
              indx(max(CACHE_N_BANKS_W-GMEM_N_BANK_W-1,0) downto 0) := to_unsigned(j, CACHE_N_BANKS_W-GMEM_N_BANK_W);
            end if;
            indx(indx'high downto CACHE_N_BANKS_W-GMEM_N_BANK_W) := rd_fifo_wrAddr(i);
            rd_fifo(i)(to_integer(indx)) <= cache_dob_d0((j+1)*GMEM_DATA_W-1 downto j*GMEM_DATA_W);
            fifo_be(i)(to_integer(indx)) <= fifo_be_din_d0((j+1)*GMEM_DATA_W/8-1 downto j*GMEM_DATA_W/8);
          end loop;
        end if;
      end if;
    end process;
    
    rd_fifo_trans: process(clk)
      variable tmp: std_logic_vector(BURST_W-1 downto 0) := (others=>'0');
    begin
      if rising_edge(clk) then
        rd_fifo_rqst_addr_i(i) <= rd_fifo_rqst_addr_n(i);
        axi_writer_free(i) <= axi_writer_free_n(i);
        rd_fifo_nempty(i) <= rd_fifo_nempty_n(i);
        axi_writer_ack <= (others=>'0');
        for i in 0 to N_TAG_MANAGERS-1 loop
          if axi_bvalid(c_wr_fifo_axi_indx(i)) = '1' then
            axi_writer_ack(to_integer(unsigned(axi_bid(c_wr_fifo_axi_indx(i))))) <= '1';
          end if;
        end loop;
        -- for i in 0 to N_AXI-1 loop
        --   if axi_bvalid(i) = '1' then
      --     axi_writer_ack(to_integer(unsigned(axi_bid(i)))) <= '1';
        --   end if;
        -- end loop;
        
        if nrst = '0' then
          st_rd_fifo_data(i) <= idle;
          rd_fifo_cache_rqst_i(i) <= '0';
          rd_fifo_rdAddr(i) <= (others=>'0');
          rd_fifo_wrAddr(i) <= (others=>'0');
          rd_fifo_n_filled(i) <= (others=>'0');
          rd_fifo_n_filled_on_ack(i) <= (others=>'0');
          axi_wlast_p0(i) <= '0';
          rd_fifo_slice_filled(i) <= '0';
        else
          st_rd_fifo_data(i) <= st_rd_fifo_data_n(i);
          rd_fifo_cache_rqst_i(i) <= rd_fifo_cache_rqst_n(i);
          rd_fifo_rdAddr(i) <= rd_fifo_rdAddr_n(i);
          rd_fifo_wrAddr(i) <= rd_fifo_wrAddr_n(i);
          rd_fifo_n_filled(i) <= rd_fifo_n_filled_n(i);
          rd_fifo_n_filled_on_ack(i) <= rd_fifo_n_filled_on_ack_n(i);
          if axi_written(i) = '1' or rd_fifo_slice_filled(i) = '0' then
            axi_wlast_p0(i) <= '0';
            if rd_fifo_rdAddr(i)(BURST_W-1 downto 1) = (1 to BURST_W-1 =>'1') and rd_fifo_rdAddr(i)(0) = '0' and rd_fifo_pop(i) = '1' then
              axi_wlast_p0(i) <= '1';
            end if;
          end if;
          -- if axi_wready(i) = '1' and rd_fifo_nempty(i) = '1' then
          --   axi_wlast_p0(i) <= '0';
          -- end if;
          if axi_written(i) = '1' and rd_fifo_nempty(i) = '0' then
            rd_fifo_slice_filled(i) <= '0';
          end if;
          if rd_fifo_slice_filled(i) = '0' and rd_fifo_nempty(i) = '1' then
            rd_fifo_slice_filled(i) <= '1';
          end if;
        end if;
      end if;
    end process;
    rd_fifo_proc: process(rd_fifo_wrAddr(i), rd_fifo_rdAddr(i), rd_fifo_pop(i), rd_fifo_din_v_d0(i), rd_fifo_n_filled(i), rd_fifo_n_filled_on_ack(i), rd_fifo_cache_ack(i))
    begin
      rd_fifo_rdAddr_n(i) <= rd_fifo_rdAddr(i);
      rd_fifo_wrAddr_n(i) <= rd_fifo_wrAddr(i);
      if rd_fifo_pop(i) = '1' then
        rd_fifo_rdAddr_n(i) <= rd_fifo_rdAddr(i) + 1;
      end if;
      if rd_fifo_din_v_d0(i) = '1' then
        rd_fifo_wrAddr_n(i) <= rd_fifo_wrAddr(i) + 1;
      end if;

      if rd_fifo_pop(i) = '0' and rd_fifo_din_v_d0(i) = '0' then
        rd_fifo_n_filled_n(i) <= rd_fifo_n_filled(i);
      elsif rd_fifo_pop(i) = '1' and rd_fifo_din_v_d0(i) = '0' then
        rd_fifo_n_filled_n(i) <= rd_fifo_n_filled(i) - 1;
      elsif rd_fifo_pop(i) = '1' and rd_fifo_din_v_d0(i) = '1' then
        rd_fifo_n_filled_n(i) <= rd_fifo_n_filled(i) - 1 + CACHE_N_BANKS/GMEM_N_BANK;
      else
        rd_fifo_n_filled_n(i) <= rd_fifo_n_filled(i) + CACHE_N_BANKS/GMEM_N_BANK;
      end if;
      -- consider the rd_fifo_cache_ack as the push signal for not overfilling the fifo
      if rd_fifo_pop(i) = '0' and rd_fifo_cache_ack(i) = '0' then
        rd_fifo_n_filled_on_ack_n(i) <= rd_fifo_n_filled_on_ack(i);
      elsif rd_fifo_pop(i) = '1' and rd_fifo_cache_ack(i) = '0' then
        rd_fifo_n_filled_on_ack_n(i) <= rd_fifo_n_filled_on_ack(i) - 1;
      elsif rd_fifo_pop(i) = '1' and rd_fifo_cache_ack(i) = '1' then
        rd_fifo_n_filled_on_ack_n(i) <= rd_fifo_n_filled_on_ack(i) - 1 + (2**BURST_WORDS_W)/GMEM_N_BANK;
      else
        rd_fifo_n_filled_on_ack_n(i) <= rd_fifo_n_filled_on_ack(i) + 2**(BURST_WORDS_W)/GMEM_N_BANK;
      end if;
    end process;
  
    rd_fifo_nempty_n(i) <= '0' when rd_fifo_n_filled_n(i) = (rd_fifo_n_filled_n(i)'reverse_range=>'0') else '1';
    axi_written(i) <= axi_wready(i) and axi_wvalid_i(i);
    rd_fifo_pop(i) <= rd_fifo_nempty(i) and (axi_written(i) or (not rd_fifo_slice_filled(i)));

    process(st_rd_fifo_data(i), axi_writer_go(i), rd_fifo_rqst_addr_i(i), rd_fifo_cache_ack(i), axi_wrAddr(i)(M+L-1 downto 0), rd_fifo_cache_rqst_i(i),
        awaddr_fifo_full(i), rd_fifo_n_filled_on_ack_n(i)) --, axi_awvalid_i(i), axi_awready(i))
    begin
      st_rd_fifo_data_n(i) <= st_rd_fifo_data(i);
      rd_fifo_rqst_addr_n(i) <= rd_fifo_rqst_addr_i(i);
      rd_fifo_cache_rqst_n(i) <= rd_fifo_cache_rqst_i(i);
      axi_writer_free_n(i) <= not awaddr_fifo_full(i);
      case st_rd_fifo_data(i) is
        when idle =>
          if axi_writer_go(i) = '1' then
            st_rd_fifo_data_n(i) <= fill_fifo;
            rd_fifo_rqst_addr_n(i) <= axi_wrAddr(i)(M+L-1 downto 0);
            rd_fifo_cache_rqst_n(i) <= '1';
            axi_writer_free_n(i) <= '0';
          end if;
        when fill_fifo =>
          axi_writer_free_n(i) <= '0';
          if rd_fifo_cache_ack(i) = '1' then
            rd_fifo_cache_rqst_n(i) <= '0';
            if rd_fifo_n_filled_on_ack_n(i)(rd_fifo_n_filled_on_ack_n(i)'high downto BURST_W) /= (0 to rd_fifo_n_filled_on_ack_n(i)'high-BURST_W =>'1') then
              axi_writer_free_n(i) <= not awaddr_fifo_full(i);
              st_rd_fifo_data_n(i) <= idle;
            else
              st_rd_fifo_data_n(i) <= wait_w_channel;
            end if;
          end if;
        when wait_w_channel =>
          axi_writer_free_n(i) <= '0';
          if rd_fifo_n_filled_on_ack_n(i)(rd_fifo_n_filled_on_ack_n(i)'high downto BURST_W) /= (0 to rd_fifo_n_filled_on_ack_n(i)'high-BURST_W =>'1') then
            axi_writer_free_n(i) <= not awaddr_fifo_full(i);
            st_rd_fifo_data_n(i) <= idle;
          end if;
      end case;
    end process;
  end generate;
  ---------------------------------------------------------------------------------------------------------}}}
  -- awaddr fifo -------------------------------------------------------------------------------------------{{{
  awaddr_fifos: for i in 0 to N_AXI-1 generate
  begin
    awaddr_fifo_trans: process(clk)
    begin
      if rising_edge(clk) then
        if axi_writer_go(i) = '1' then
          awaddr_fifo(i)(to_integer(awaddr_fifo_wrAddr(i)))(GMEM_ADDR_W-1 downto 2+N) <= axi_wrAddr(i);
          awaddr_fifo(i)(to_integer(awaddr_fifo_wrAddr(i)))(2+N-1 downto 0) <= (others=>'0');
          awid_fifo(i)(to_integer(awaddr_fifo_wrAddr(i))) <= axi_writer_id;
        end if;

        for i in 0 to N_WR_FIFOS-1 loop
          axi_rdata_wr_fifo(i) <= axi_rdata(c_wr_fifo_axi_indx(i));
        end loop;
        -- axi_rdata_d0(i) <= axi_rdata(i);
        if nrst = '0' then
          awaddr_fifo_wrAddr(i) <= (others=>'0');
          awaddr_fifo_rdAddr(i) <= (others=>'0');
          awaddr_fifo_full(i) <= '0';
          awaddr_fifo_nempty(i) <= '0';
        else
          awaddr_fifo_nempty(i) <= awaddr_fifo_nempty_n(i);
          awaddr_fifo_full(i) <= awaddr_fifo_full_n(i);
          awaddr_fifo_wrAddr(i) <= awaddr_fifo_wrAddr_n(i);
          awaddr_fifo_rdAddr(i) <= awaddr_fifo_rdAddr_n(i);
        end if;
      end if;
    end process;
    axi_awaddr(i) <= awaddr_fifo(i)(to_integer(awaddr_fifo_rdAddr(i)));
    axi_awid(i)(N_TAG_MANAGERS_W-1 downto 0) <= awid_fifo(i)(to_integer(awaddr_fifo_rdAddr(i)));
    axi_awid(i)(ID_WIDTH-1 downto N_TAG_MANAGERS_W) <= (others=>'0');
    
    awaddr_fifo_proc: process(awaddr_fifo_wrAddr(i),  axi_writer_go(i), awaddr_fifo_rdAddr(i), axi_awready(i), axi_awvalid_i(i))
    begin
      awaddr_fifo_wrAddr_n(i) <= awaddr_fifo_wrAddr(i);
      awaddr_fifo_rdAddr_n(i) <= awaddr_fifo_rdAddr(i);
      if axi_writer_go(i) = '1' then
        awaddr_fifo_wrAddr_n(i) <= awaddr_fifo_wrAddr(i) + 1;
      end if;
      if axi_awvalid_i(i) = '1' and axi_awready(i) = '1' then
        awaddr_fifo_rdAddr_n(i) <= awaddr_fifo_rdAddr(i) + 1;
      end if;
        
    end process;
    axi_awvalid_i(i) <= awaddr_fifo_nempty(i);
    awaddr_fifo_proc1: process(axi_writer_go(i), awaddr_fifo_full(i), awaddr_fifo_nempty(i), awaddr_fifo_wrAddr(i), awaddr_fifo_wrAddr_n(i), awaddr_fifo_rdAddr(i), 
              awaddr_fifo_rdAddr_n(i), axi_awvalid_i(i), axi_awready(i))
    begin
      awaddr_fifo_full_n(i) <= awaddr_fifo_full(i);
      awaddr_fifo_nempty_n(i) <= awaddr_fifo_nempty(i);
      if axi_writer_go(i) = '1' and (axi_awvalid_i(i) = '0' or axi_awready(i) = '0') and awaddr_fifo_wrAddr_n(i) = awaddr_fifo_rdAddr(i) then
        awaddr_fifo_full_n(i) <= '1';
      elsif axi_writer_go(i) = '0' and axi_awvalid_i(i) = '1' and axi_awready(i) = '1' then
        awaddr_fifo_full_n(i) <= '0';
      end if;
      if axi_writer_go(i) = '1' and (axi_awvalid_i(i) = '0' or axi_awready(i) = '0') then
        awaddr_fifo_nempty_n(i) <= '1';
      elsif axi_writer_go(i) = '0' and axi_awvalid_i(i) = '1' and axi_awready(i) = '1' and awaddr_fifo_wrAddr(i) = awaddr_fifo_rdAddr_n(i) then
        awaddr_fifo_nempty_n(i) <= '0';
      end if;
    end process;
  end generate;
  ---------------------------------------------------------------------------------------------------------------}}}
end architecture;

