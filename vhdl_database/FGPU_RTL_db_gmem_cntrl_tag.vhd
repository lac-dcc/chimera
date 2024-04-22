-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library fgpu;
use fgpu.definitions.all;
use fgpu.components.all;
---------------------------------------------------------------------------------------------------------}}}
entity gmem_cntrl_tag is -- {{{
port(
  -- axi signals
  wr_fifo_free        : in std_logic_vector(N_WR_FIFOS-1 downto 0); --free ports have to respond to go ports immediately (in one clock cycle)
  wr_fifo_go          : out std_logic_vector(N_WR_FIFOS-1 downto 0);
  wr_fifo_cache_ack   : in std_logic_vector(N_WR_FIFOS-1 downto 0);
  axi_rdAddr          : out gmem_addr_array_no_bank(N_WR_FIFOS-1 downto 0);

  axi_writer_go       : out std_logic_vector(N_AXI-1 downto 0);
  axi_wrAddr          : out gmem_addr_array_no_bank(N_AXI-1 downto 0);
  axi_writer_free     : in std_logic_vector(N_AXI-1 downto 0);
  axi_rd_fifo_filled  : in std_logic_vector(N_AXI-1 downto 0);
  axi_wvalid          : in std_logic_vector(N_AXI-1 downto 0);
  axi_writer_ack      : in std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  axi_writer_id       : out std_logic_vector(N_TAG_MANAGERS_W-1 downto 0);


  --receivers signals
  rcv_alloc_tag       : in std_logic_vector(N_RECEIVERS-1 downto 0); -- rcv_alloc_tag need to be set whether it is a tag to be allocated or a page to be validate
  -- rcv_validate_page      : in std_logic_vector(N_RECEIVERS-1 downto 0);
  rcv_gmem_addr       : in gmem_word_addr_array(N_RECEIVERS-1 downto 0);
  rcv_rnw             : in std_logic_vector(N_RECEIVERS-1 downto 0);
  rcv_tag_written     : out std_logic_vector(N_RECEIVERS-1 downto 0);
  rcv_tag_updated     : out std_logic_vector(N_RECEIVERS-1 downto 0);
  rcv_page_validated  : out std_logic_vector(N_RECEIVERS-1 downto 0);

  rcv_read_tag        : in std_logic_vector(N_RECEIVERS-1 downto 0);
  rcv_read_tag_ack    : out std_logic_vector(N_RECEIVERS-1 downto 0);

  rdData_page_v       : out std_logic_vector(N_RD_PORTS-1 downto 0);
  rdData_tag_v        : out std_logic_vector(N_RD_PORTS-1 downto 0);
  rdData_tag          : out tag_array(N_RD_PORTS-1 downto 0);

  -- cache port a signals
  cache_we            : in std_logic;
  cache_addra         : in unsigned(M+L-1 downto 0);
  cache_wea           : in std_logic_vector((2**N)*DATA_W/8-1 downto 0);


  -- finish
  WGsDispatched       : in std_logic;
  CUs_gmem_idle       : in std_logic;
  rcv_all_idle        : in std_logic;
  rcv_idle            : in std_logic_vector(N_RECEIVERS-1 downto 0);
  finish_exec         : out std_logic;
  start_kernel        : in std_logic;
  clean_cache         : in std_logic;
  atomic_can_finish   : in std_logic;

  -- write pipeline
  write_pipe_active   : in std_logic_vector(4 downto 0);
  write_pipe_wrTag    : in tag_addr_array(4 downto 0);

  -- debug
  debug_cache_miss_counter  : out unsigned(DATA_W-1 downto 0);
  debug_reset_all_counters  : in std_logic;

  clk, nrst           : in std_logic
);
end entity;  -- }}}
architecture basic of gmem_cntrl_tag is

  -- internal signals definitions {{{
  signal axi_wrAddr_i                     : gmem_addr_array_no_bank(N_AXI-1 downto 0);
  signal rdData_tag_i                     : tag_array(N_RD_PORTS-1 downto 0); -- on a critical path
  -- }}}

  -- axi signals {{{
  signal wr_fifo_go_n                     : std_logic_vector(N_WR_FIFOS-1 downto 0);
  signal axi_writer_go_n                  : std_logic_vector(N_AXI-1 downto 0);
  signal axi_writer_id_n                  : std_logic_vector(N_TAG_MANAGERS_W-1 downto 0);
  --}}}

  -- functions & constants {{{
  function map_rd_fifo_to_axis(n_rd_fifos : natural; n_axis: natural) return nat_array is
    variable res : nat_array(n_rd_fifos-1 downto 0) := (others => 0);
  begin
    for i in 0 to n_rd_fifos-1 loop
      res(i) := i mod n_axis;
    end loop;
    return res;
  end function;
  constant c_rd_fifo_axi                  : nat_array(N_TAG_MANAGERS-1 downto 0) := map_rd_fifo_to_axis(N_TAG_MANAGERS, N_AXI);
  -- }}}

  -- mem signals {{{
  signal tag                              : tag_array(0 to 2**M-1) := (others => (others => '0'));
  signal wrAddr_tag, wrAddr_tag_n         : unsigned(M-1 downto 0);
  signal wrData_tag, wrData_tag_n         : unsigned(TAG_W-1 downto 0);
  signal rdAddr_tag, rdAddr_tag_n         : tag_addr_array(N_RD_PORTS-1 downto 0);
  signal we_tag, we_tag_n                 : std_logic;

  signal tag_v                            : std_logic_vector(0 to 2**M-1) := (others => '0');
  signal we_tag_v, we_tag_v_n             : std_logic;
  signal wrAddr_tag_v, wrAddr_tag_v_n     : unsigned(M-1 downto 0);
  signal wrData_tag_v, wrData_tag_v_n     : std_logic;
  signal clear_tag, clear_tag_n           : std_logic;

  signal page_v                           : std_logic_vector(0 to 2**M-1) := (others => '0');
  signal we_page_v, we_page_v_n           : std_logic;
  signal wrAddr_page_v, wrAddr_page_v_n   : unsigned(M-1 downto 0);
  signal wrData_page_v, wrData_page_v_n   : std_logic;
  -- }}}

  -- receivers signals {{{
  signal rcv_tag_written_n                : std_logic_vector(N_RECEIVERS-1 downto 0);
  signal rcv_tag_updated_n                : std_logic_vector(N_RECEIVERS-1 downto 0);
  signal rcv_page_validated_n             : std_logic_vector(N_RECEIVERS-1 downto 0);
  -- }}}

  -- Tag managers signals {{{
  type st_tmanager_type is (idle, define_rcv_indx, check_tag_being_processed, invalidate_tag_v, invalidate_page_v, clear_tag_st, clear_dirty,
      check_dirty, validate_new_tag, issue_write, read_tag, wait_write_finish, issue_read, wait_read_finish, validate_new_page, wait_page_v,
      wait_a_little, wait_bid);
  type st_tmanager_array is array (N_TAG_MANAGERS-1 downto 0) of st_tmanager_type;
  type rcv_alloc_for_tmanager_type is array(N_TAG_MANAGERS-1 downto 0) of std_logic_vector(N_RECEIVERS/N_TAG_MANAGERS-1 downto 0);
  signal st_tmanager, st_tmanager_n       : st_tmanager_array;
  -- attribute mark_debug of st_tmanager : signal is "true";
  signal tmanager_free, tmanager_free_n   : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal rcv_alloc_tag_ltchd, rcv_alloc_tag_ltchd_n  : rcv_alloc_for_tmanager_type;
  signal tmanager_gmem_addr               : gmem_addr_array_no_bank(N_TAG_MANAGERS-1 downto 0);
  signal tmanager_gmem_addr_n             : gmem_addr_array_no_bank(N_TAG_MANAGERS-1 downto 0);
  -- attribute mark_debug of tmanager_gmem_addr : signal is "true";
  type rcv_indx_tmanager_type is array (0 to N_TAG_MANAGERS-1) of natural range 0 to N_RECEIVERS-1;
  signal rcv_indx_tmanager                : rcv_indx_tmanager_type;
  signal rcv_indx_tmanager_n              : rcv_indx_tmanager_type;
  signal tmanager_rcv_served              : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal tmanager_rcv_served_n            : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal invalidate_tag, invalidate_tag_n : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  -- attribute mark_debug of invalidate_tag : signal is "true";
  signal invalidate_tag_ack               : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal invalidate_page                  : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal invalidate_page_n                : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  -- attribute mark_debug of invalidate_page : signal is "true";
  signal validate_page, validate_page_n   : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  -- attribute mark_debug of validate_page : signal is "true";
  signal page_v_tmanager_ack              : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal clear_tag_tmanager               : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal clear_tag_tmanager_n             : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  -- attribute mark_debug of clear_tag_tmanager : signal is "true";
  signal alloc_tag, alloc_tag_n           : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  -- attribute mark_debug of alloc_tag : signal is "true";
  signal alloc_tag_ack                    : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal tmanager_issue_write             : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  -- attribute mark_debug of tmanager_issue_write : signal is "true";
  signal tmanager_issue_write_n           : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal wr_issued_tmanager               : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal wr_issued_tmanager_n             : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal tmanager_busy, tmanager_busy_n   : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  -- attribute mark_debug of tmanager_busy : signal is "true";
  constant TAG_PROTECT_LEN                : natural := 7;
    -- # of clock cycles before a processed tag from a tag manager can be processed by another one
  type tmanager_tag_protect_vec_type is array(natural range<>) of std_logic_vector(TAG_PROTECT_LEN-1 downto 0);
  signal tmanager_tag_protect_vec         : tmanager_tag_protect_vec_type(N_TAG_MANAGERS-1 downto 0);
    -- helps a tag manager to clear the protection of tag
  signal tmanager_tag_protect_vec_n       : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal tmanager_tag_protect_v           : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal tmanager_tag_protect_v_n         : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  -- attribute mark_debug of tmanager_tag_protect_v : signal is "true";
  signal tmanager_tag_protect             : tag_addr_array(N_TAG_MANAGERS-1 downto 0);
  -- attribute mark_debug of tmanager_tag_protect : signal is "true";
    -- after a tag has been processed by a tag manager, it will be stored with this signal.
    -- It is not allowed to process the tag again before TAG_PROTECT_LEN clock cycles
    -- It helps to avoid frequent allocation/deallocation of the same tag (not necessary but improve the performance)
    -- It helps to insure data consistency by using the B axi channel response to clear it (necessary if the kernel reads/writes the same address region)
  signal tmanager_tag_protect_n           : tag_addr_array(N_TAG_MANAGERS-1 downto 0);
  signal tmanager_gmem_addr_protected     : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  constant RCV_SERVED_WAIT_LEN            : natural := 2**(WRITE_PHASE_W+1);
  type tmanager_rcv_served_wait_vec_type is array(natural range<>) of std_logic_vector(RCV_SERVED_WAIT_LEN-1 downto 0);
  signal tmanager_rcv_served_wait_vec     : tmanager_rcv_served_wait_vec_type(N_TAG_MANAGERS-1 downto 0);
    -- helps a tag manager to wait for some time before issuing a receiver that its write requested has been executed
  signal tmanager_rcv_served_wait_vec_n   : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal tmanager_get_busy                : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  -- attribute mark_debug of tmanager_get_busy : signal is "true";
  signal tmanager_get_busy_ack            : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  -- attribute mark_debug of tmanager_get_busy_ack : signal is "true";
  constant wait_len                       : natural := 4;
  type wait_vec_type is array (natural range <>) of std_logic_vector(wait_len-1 downto 0);
  type wait_vec_invalidate_tag_type is array (natural range <>) of std_logic_vector(wait_len downto 0);
  signal wait_vec                         : wait_vec_type(N_TAG_MANAGERS-1 downto 0);
  signal wait_vec_n                       : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal wait_vec_invalidate_tag          : wait_vec_invalidate_tag_type(N_TAG_MANAGERS-1 downto 0);
  signal wait_vec_invalidate_tag_n        : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal wait_done, wait_done_n           : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  -- attribute mark_debug of wait_done : signal is "true";
  signal tmanager_read_tag                : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  -- attribute mark_debug of tmanager_read_tag : signal is "true";
  signal tmanager_read_tag_n              : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal tmanager_read_tag_ack_n          : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal tmanager_read_tag_ack            : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal tmanager_read_tag_ack_d0         : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal tmanager_tag_to_write            : tag_array(N_TAG_MANAGERS-1 downto 0);
  signal tmanager_clear_dirty             : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  -- attribute mark_debug of tmanager_clear_dirty : signal is "true";
  signal tmanager_clear_dirty_n           : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal tmanager_clear_dirty_ack_n       : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal tmanager_clear_dirty_ack         : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal tmanager_wait_for_fifo_empty     : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal tmanager_wait_for_fifo_empty_n   : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  --}}}

  -- dirty signals {{{
  signal dirty                            : std_logic_vector(2**M-1 downto 0);
  signal we_dirty, we_dirty_n             : std_logic;
  signal wrData_dirty, wrData_dirty_n     : std_logic;
  signal wrAddr_dirty, wrAddr_dirty_n     : unsigned(M-1 downto 0);
  signal rdAddr_dirty, rdAddr_dirty_n     : tag_addr_array(N_TAG_MANAGERS-1 downto 0);
  signal rdData_dirty                     : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  -- }}}

  -- axi signals {{{
  type axi_interface is (find_free_fifo, issue_order);
  type wr_fifo_indx_array is array (0 to N_TAG_MANAGERS-1) of natural range 0 to N_WR_FIFOS-1;
  type axi_wr_channel_indx is array (0 to N_TAG_MANAGERS-1) of natural range 0 to N_AXI-1;
  signal st_axi_wr, st_axi_wr_n                       : axi_interface;
  signal axi_wrAddr_n                                 : gmem_addr_array_no_bank(N_AXI-1 downto 0);
  signal axi_wr_indx_tmanager, axi_wr_indx_tmanager_n : axi_wr_channel_indx;
  --}}}

  -- final cache clean signals {{{
  signal rcv_all_idle_vec                 : std_logic_vector(2 downto 0);
    -- It is necessary to make sure that rcv_all_idle is stable for 3 clock cycles before cache cleaning at the end
  signal finish_active, finish_active_n   : std_logic;
  signal finish_tag_addr                  : unsigned(M-1 downto 0);
  signal finish_tag_addr_n                : unsigned(M-1 downto 0);
  signal finish_tag_addr_d0               : unsigned(M-1 downto 0);
  signal finish_tag_addr_d1               : unsigned(M-1 downto 0);
  signal finish_we, finish_we_n           : std_logic;
  signal rdData_tag_d0                    : unsigned(TAG_W-1 downto 0);
  signal finish_issue_write               : std_logic;
  signal finish_issue_write_n             : std_logic;
  signal finish_exec_masked               : std_logic;
  signal finish_exec_masked_n             : std_logic;
  type finish_fifo_type is array(natural range <>) of unsigned(TAG_W+M-1 downto 0);
  signal finish_fifo                            : finish_fifo_type(2**FINISH_FIFO_ADDR_W-1 downto 0);
  signal finish_fifo_rdAddr                     : unsigned(FINISH_FIFO_ADDR_W-1 downto 0);
  signal finish_fifo_wrAddr                     : unsigned(FINISH_FIFO_ADDR_W-1 downto 0);
  signal finish_fifo_dout                       : unsigned(TAG_W+M-1 downto 0);
  signal finish_fifo_pop, finish_fifo_push_n    : std_logic;
  signal finish_fifo_push                       : std_logic_vector(1 downto 0);
  type st_fill_finish_fifo_type is (idle1, idle2, pre_active, active, finish);
  signal st_fill_finish_fifo, st_fill_finish_fifo_n  : st_fill_finish_fifo_type;
  signal finish_fifo_n_rqsts, finish_fifo_n_rqsts_n  : integer range 0 to 2**FINISH_FIFO_ADDR_W;
  -- }}}

  -- write pipeline signals {{{
  signal write_pipe_contains_gmem_addr    : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal tmanager_waited_for_write_pipe   : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal tmanager_waited_for_write_pipe_n : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  -- attribute mark_debug of tmanager_waited_for_write_pipe : signal is "true";
  type st_finish_writer_type is (idle, issue, wait_fifo_dout);
  signal st_finish_writer                 : st_finish_writer_type;
  signal st_finish_writer_n               : st_finish_writer_type;
  --}}}

  -- bvalid processing ------------------------------------------------------------------------------------{{{
  -- signal write_response_rcvd              : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal wait_for_write_response          : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  signal wait_for_write_response_n        : std_logic_vector(N_TAG_MANAGERS-1 downto 0);
  ---------------------------------------------------------------------------------------------------------}}}

  -- debug signals {{{
  signal debug_cache_miss_counter_i, debug_cache_miss_counter_n     : unsigned(DATA_W-1 downto 0);
    -- counts how many times the we_tag signal rises
  -- }}}

begin

  -- internal signals assignments -------------------------------------------------------------------------{{{
  axi_wrAddr <= axi_wrAddr_i;
  assert N_RD_FIFOS_TAG_MANAGER_W = 0 report "There must be a single rd fifo (from cache) for each tag manager. Otherwise b channel communcation fails!" severity failure;
  rdData_tag <= rdData_tag_i;
  debug_cache_miss_counter <= debug_cache_miss_counter_i; -- debug
  ---------------------------------------------------------------------------------------------------------}}}

  -- error handling-------------------------------------------------------------------------------------------{{{
  assert(N_TAG_MANAGERS = N_WR_FIFOS);
  assert(N_RD_PORTS > 1);
  -- assert(addra(7 downto 0) /= X"B7" or addra(8) /= '0' or wea(7 downto 4) /= "F");
  ---------------------------------------------------------------------------------------------------------}}}

  -- finish FSM -------------------------------------------------------------------------------------------{{{
  rcv_all_idle_vec(rcv_all_idle_vec'high) <= rcv_all_idle;
  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        finish_active <= '0';
        finish_issue_write <= '0';
        st_fill_finish_fifo <= idle1;
        finish_fifo_push <= (others => '0');
        finish_fifo_wrAddr <= (others => '0');
        finish_fifo_n_rqsts <= 0;
        st_finish_writer <= idle;
        finish_fifo_rdAddr <= (others => '0');

        finish_exec_masked <= '0'; -- NOT NEEDED
        finish_exec        <= '0'; -- NOT NEEDED
        finish_we          <= '0'; -- NOT NEEDED
        finish_fifo_dout   <= (others => '0'); -- NOT NEEDED
      else
        finish_active <= finish_active_n;
        finish_issue_write <= finish_issue_write_n;

        st_fill_finish_fifo <= st_fill_finish_fifo_n;
        finish_fifo_push(finish_fifo_push'high-1 downto 0) <= finish_fifo_push(finish_fifo_push'high downto 1);
        finish_fifo_push(finish_fifo_push'high) <= finish_fifo_push_n;
        if finish_fifo_push(0) = '1' and rdData_dirty(0) = '1' then
          finish_fifo_wrAddr <= finish_fifo_wrAddr + 1;
        end if;
        st_finish_writer <= st_finish_writer_n;
        if finish_fifo_pop = '1' then
          finish_fifo_rdAddr <= finish_fifo_rdAddr + 1;
        end if;
        if finish_fifo_push(0) = '1' and rdData_dirty(0) = '1' and finish_fifo_pop = '0' then
          finish_fifo_n_rqsts <= finish_fifo_n_rqsts + 1;
        elsif (finish_fifo_push(0) = '0' or rdData_dirty(0) = '0') and finish_fifo_pop = '1' then
          finish_fifo_n_rqsts <= finish_fifo_n_rqsts - 1;
        end if;

        -- set final finish signal {{{
        finish_exec_masked <= finish_exec_masked_n;
        finish_exec <= '0';
        if finish_exec_masked = '1' then
          if clean_cache = '1' then
            if axi_writer_free = (axi_writer_free'reverse_range => '1') and axi_wvalid = (0 to N_AXI-1 =>'0') then
              finish_exec <= '1';
            end if;
          else
              finish_exec <= '1';
          end if;
        end if;
        if start_kernel = '1' then
          finish_exec <= '0';
        end if;
        -- }}}
        finish_we <= finish_we_n;
        finish_fifo_dout <= finish_fifo(to_integer(finish_fifo_rdAddr));
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      -- pipes {{{
        rcv_all_idle_vec(rcv_all_idle_vec'high-1 downto 0) <= rcv_all_idle_vec(rcv_all_idle_vec'high downto 1);
        finish_tag_addr    <= finish_tag_addr_n;
        finish_tag_addr_d0 <= finish_tag_addr;
        finish_tag_addr_d1 <= finish_tag_addr_d0;
        -- }}}

      if finish_fifo_push(0) = '1' and rdData_dirty(0) = '1' then
        finish_fifo(to_integer(finish_fifo_wrAddr)) <= rdData_tag_i(N_RD_PORTS-1) & finish_tag_addr_d1;
      end if;
    end if;
  end process;

  process(st_finish_writer, finish_fifo_n_rqsts, finish_issue_write)
  begin
    st_finish_writer_n <= st_finish_writer;
    finish_issue_write_n <= finish_issue_write;
    case st_finish_writer is
      when idle =>
        if finish_fifo_n_rqsts /= 0 then
          finish_issue_write_n <= '1';
          st_finish_writer_n <= issue;
        end if;
      when issue =>
        finish_issue_write_n <= '0';
        st_finish_writer_n <= wait_fifo_dout;
      when wait_fifo_dout =>
        st_finish_writer_n <= idle;
    end case;
  end process;

  process(st_fill_finish_fifo, finish_tag_addr, WGsDispatched, start_kernel, CUs_gmem_idle, rcv_all_idle_vec, finish_active,
          finish_fifo_n_rqsts, clean_cache, atomic_can_finish)
  begin
    st_fill_finish_fifo_n <= st_fill_finish_fifo;
    finish_tag_addr_n <= finish_tag_addr;
    finish_active_n <= finish_active;
    finish_fifo_push_n <= '0';
    finish_we_n <= '0';
    finish_exec_masked_n <= '0';

    case st_fill_finish_fifo is

      when idle1 =>
        finish_tag_addr_n <= (others => '0');
        if WGsDispatched = '1' then
          st_fill_finish_fifo_n <= idle2;
        end if;

      when idle2 =>
        if CUs_gmem_idle = '1' and rcv_all_idle_vec = (rcv_all_idle_vec'reverse_range =>'1') and (ATOMIC_IMPLEMENT = 0 or atomic_can_finish = '1') then
          if clean_cache = '0' then
            st_fill_finish_fifo_n <= finish;
          else
            finish_active_n <= '1';
          end if;
        end if;
        if finish_active = '1' then
          st_fill_finish_fifo_n <= pre_active;
          if STAT = 1 then
            -- if kernel_name /= sum_half then
              -- report "Finish begins";
            -- end if;
          end if;
        end if;

      when pre_active =>
        finish_tag_addr_n <= finish_tag_addr + 1;
        finish_fifo_push_n <= '1';
        finish_we_n <= '1';
        st_fill_finish_fifo_n <= active;

      when active =>
        if finish_fifo_n_rqsts < 2**FINISH_FIFO_ADDR_W-2 then
          finish_tag_addr_n <= finish_tag_addr + 1;
          finish_fifo_push_n <= '1';
          finish_we_n <= '1';
        end if;
        if finish_tag_addr = (finish_tag_addr'reverse_range => '0') then
          st_fill_finish_fifo_n <= finish;
        end if;

      when finish =>
        finish_exec_masked_n  <= '1';
        if start_kernel = '1' then
          finish_exec_masked_n <= '0';
          finish_active_n <= '0';
          st_fill_finish_fifo_n <= idle1;
        end if;

    end case;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}

  -- write pipeline check  --------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        write_pipe_contains_gmem_addr <= (others => '0'); -- NOT NEEDED
      else
        write_pipe_contains_gmem_addr <= (others => '0');
        for i in 0 to N_TAG_MANAGERS-1 loop
          for j in 0 to 4 loop
            if (tmanager_gmem_addr(i)(M+L-1 downto L) = write_pipe_wrTag(j)) and (write_pipe_active(j) = '1') then
              write_pipe_contains_gmem_addr(i) <= '1';
            end if;
          end loop;
        end loop;
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}

  -- tag managers -------------------------------------------------------------------------------------------{{{
  trans: process(clk) -- {{{
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        st_tmanager <= (others => idle);
        tmanager_free <= (others => '0');
        invalidate_tag <= (others => '0');
        invalidate_page <= (others => '0');
        validate_page <= (others => '0');
        clear_tag_tmanager <= (others => '0');
        tmanager_issue_write <= (others => '0');
        tmanager_busy <= (others => '0');
        alloc_tag <= (others => '0');
        tmanager_read_tag <= (others => '0');
        tmanager_clear_dirty <= (others => '0');
        wait_done <= (others => '0');
        tmanager_wait_for_fifo_empty <= (others => '0');
        tmanager_waited_for_write_pipe <= (others => '0');

        rcv_alloc_tag_ltchd          <= (others => (others => '0')); -- NOT NEEDED
        tmanager_gmem_addr           <= (others => (others => '0')); -- NOT NEEDED
        rcv_indx_tmanager            <= (others => 0); -- NOT NEEDED
        tmanager_rcv_served          <= (others => '0'); -- NOT NEEDED
        tmanager_get_busy_ack        <= (others => '0'); -- NOT NEEDED
        wr_fifo_go                   <= (others => '0'); -- NOT NEEDED
        tmanager_tag_protect         <= (others => (others => '0')); -- NOT NEEDED
        tmanager_gmem_addr_protected <= (others => '0'); -- NOT NEEDED
        tmanager_tag_protect_v       <= (others => '0'); -- NOT NEEDED
      else
        st_tmanager <= st_tmanager_n;
        tmanager_free <= tmanager_free_n;
        invalidate_tag <= invalidate_tag_n;
        invalidate_page <= invalidate_page_n;
        validate_page <= validate_page_n;
        clear_tag_tmanager <= clear_tag_tmanager_n;
        tmanager_issue_write <= tmanager_issue_write_n;
        tmanager_busy <= tmanager_busy_n;
        alloc_tag <= alloc_tag_n;
        tmanager_read_tag <= tmanager_read_tag_n;
        tmanager_clear_dirty <= tmanager_clear_dirty_n;
        wait_done <= wait_done_n;
        tmanager_wait_for_fifo_empty <= tmanager_wait_for_fifo_empty_n;
        tmanager_waited_for_write_pipe <= tmanager_waited_for_write_pipe_n;

        rcv_alloc_tag_ltchd <= rcv_alloc_tag_ltchd_n;
        tmanager_gmem_addr <= tmanager_gmem_addr_n;
        rcv_indx_tmanager <= rcv_indx_tmanager_n;
        if WRITE_PHASE_W > 1 then
          tmanager_rcv_served <= tmanager_rcv_served_n;
        end if;
        tmanager_get_busy_ack <= (others => '0');
        for i in 0 to N_TAG_MANAGERS-1 loop
          if tmanager_get_busy(i) = '1' then
            tmanager_get_busy_ack(i) <= '1';
            exit;
          end if;
        end loop;
        wr_fifo_go <= wr_fifo_go_n;
        tmanager_tag_protect <= tmanager_tag_protect_n;

        tmanager_gmem_addr_protected <= (others => '0');
        for i in 0 to N_TAG_MANAGERS-1 loop
          for j in 0 to N_TAG_MANAGERS-1 loop
            if j /= i then
              if tmanager_tag_protect_v(j) = '1' and tmanager_gmem_addr(i)(M+L-1 downto L) = tmanager_tag_protect(j) then
                tmanager_gmem_addr_protected(i) <= '1';
              end if;
            end if;
          end loop;
        end loop;
        tmanager_tag_protect_v <= tmanager_tag_protect_v_n;
      end if;
    end if;
  end process; --}}}

  trans_mem: process(clk)
  begin
    if rising_edge(clk) then
      for i in 0 to N_TAG_MANAGERS-1 loop
        tmanager_tag_protect_vec(i)(TAG_PROTECT_LEN-2 downto 0) <= tmanager_tag_protect_vec(i)(TAG_PROTECT_LEN-1 downto 1);
        tmanager_tag_protect_vec(i)(TAG_PROTECT_LEN-1) <= tmanager_tag_protect_vec_n(i);
        tmanager_rcv_served_wait_vec(i)(RCV_SERVED_WAIT_LEN-2 downto 0) <= tmanager_rcv_served_wait_vec(i)(RCV_SERVED_WAIT_LEN-1 downto 1);
        tmanager_rcv_served_wait_vec(i)(RCV_SERVED_WAIT_LEN-1) <= tmanager_rcv_served_wait_vec_n(i);
      end loop;

      for i in N_TAG_MANAGERS-1 downto 0 loop
        wait_vec(i)(wait_len-2 downto 0) <= wait_vec(i)(wait_len-1 downto 1);
        wait_vec(i)(wait_len-1) <= wait_vec_n(i);
        wait_vec_invalidate_tag(i)(wait_len-1 downto 0) <= wait_vec_invalidate_tag(i)(wait_len downto 1);
        wait_vec_invalidate_tag(i)(wait_len) <= wait_vec_invalidate_tag_n(i);
        if tmanager_read_tag_ack_d0(i) = '1' then
          tmanager_tag_to_write(i) <= rdData_tag_i(N_RD_PORTS-1);
        end if;
      end loop;
    end if;
  end process;

  tmanagers: for i in 0 to N_TAG_MANAGERS-1 generate
    process(st_tmanager(i), tmanager_free(i), rcv_alloc_tag, tmanager_gmem_addr, rcv_alloc_tag_ltchd, rcv_indx_tmanager(i), rcv_gmem_addr, -- {{{
      tmanager_tag_protect_v, invalidate_tag(i), invalidate_tag_ack(i), clear_tag_tmanager(i), rdData_dirty(i), tmanager_issue_write(i),
      tmanager_tag_protect, rcv_idle, axi_wr_indx_tmanager(i), wr_issued_tmanager(i), wr_fifo_free(i), wait_done(i), tmanager_waited_for_write_pipe(i),
      tmanager_rcv_served(i), tmanager_rcv_served_wait_vec(i)(0), page_v_tmanager_ack(i), invalidate_page(i), alloc_tag_ack(i), validate_page(i),
      tmanager_busy(i), tmanager_get_busy_ack(i), tmanager_tag_protect_vec(i), rcv_rnw, wait_vec(i)(0), wait_vec_invalidate_tag(i)(0),
      tmanager_read_tag(i), tmanager_read_tag_ack_d0(i), axi_rd_fifo_filled, tmanager_clear_dirty(i), alloc_tag(i), tmanager_read_tag_ack_n(i),
      tmanager_clear_dirty_ack(i), write_pipe_contains_gmem_addr(i), tmanager_wait_for_fifo_empty(i), tmanager_gmem_addr_protected(i),
      tmanager_tag_to_write(i), wait_for_write_response(i))
      -- }}}
    begin
      -- next initialization {{{
      st_tmanager_n(i) <= st_tmanager(i);
      tmanager_free_n(i) <= tmanager_free(i);
      rcv_alloc_tag_ltchd_n(i) <= rcv_alloc_tag_ltchd(i);
      tmanager_gmem_addr_n(i) <= tmanager_gmem_addr(i);
      rcv_indx_tmanager_n(i) <= rcv_indx_tmanager(i);
      invalidate_tag_n(i) <= invalidate_tag(i);
      invalidate_page_n(i) <= invalidate_page(i);
      validate_page_n(i) <= validate_page(i);
      clear_tag_tmanager_n(i) <= clear_tag_tmanager(i);
      tmanager_issue_write_n(i) <= tmanager_issue_write(i);
      tmanager_busy_n(i) <= tmanager_busy(i);
      tmanager_get_busy(i) <= '0';
      alloc_tag_n(i) <= alloc_tag(i);
      wait_vec_n(i) <= '0';
      wait_vec_invalidate_tag_n(i) <= '0';
      tmanager_read_tag_n(i) <= tmanager_read_tag(i);
      tmanager_clear_dirty_n(i) <= tmanager_clear_dirty(i);
      wait_done_n(i) <= wait_done(i);
      tmanager_wait_for_fifo_empty_n(i) <= tmanager_wait_for_fifo_empty(i);
      tmanager_waited_for_write_pipe_n(i) <= tmanager_waited_for_write_pipe(i);
      if tmanager_tag_protect_vec(i)(0) = '1' then
        tmanager_tag_protect_v_n(i) <= '0';
      else
        tmanager_tag_protect_v_n(i) <= tmanager_tag_protect_v(i);
      end if;


      tmanager_rcv_served_n(i) <= tmanager_rcv_served(i);
      --

      if WRITE_PHASE_W > 1 then
        if rcv_idle(rcv_indx_tmanager(i)) = '1' or tmanager_rcv_served_wait_vec(i)(0) = '1' then
          tmanager_rcv_served_n(i) <= '1';
        end if;
      end if;
      tmanager_tag_protect_n(i) <= tmanager_tag_protect(i);
      tmanager_tag_protect_vec_n(i) <= '0';
      tmanager_rcv_served_wait_vec_n(i) <= '0';
      wr_fifo_go_n(i) <= '0';
      -- }}}

      case st_tmanager(i) is

        when idle => -- {{{
          tmanager_waited_for_write_pipe_n(i) <= '0';
          rcv_alloc_tag_ltchd_n(i) <= rcv_alloc_tag((i+1)*N_RECEIVERS/N_TAG_MANAGERS-1 downto i*N_RECEIVERS/N_TAG_MANAGERS);
          if tmanager_rcv_served(i) = '1' or WRITE_PHASE_W = 1 then
            if rcv_alloc_tag((i+1)*N_RECEIVERS/N_TAG_MANAGERS-1 downto i*N_RECEIVERS/N_TAG_MANAGERS) /= (0 to N_RECEIVERS/N_TAG_MANAGERS-1 =>'0') then
              st_tmanager_n(i) <= define_rcv_indx;
            end if;
          end if;
          -- }}}

        when define_rcv_indx => -- {{{
          st_tmanager_n(i) <= idle; -- in case rcv_alloc_tag_ltchd are all zeros
          for j in 0 to N_RECEIVERS/N_TAG_MANAGERS-1 loop
            if rcv_alloc_tag_ltchd(i)(j) = '1' and rcv_alloc_tag(i*N_RECEIVERS/N_TAG_MANAGERS+j) = '1' then
                -- rcv_alloc_tag must be checked because it may be deasserted while rcv_alloc_tag_latched is still asserted
              rcv_indx_tmanager_n(i) <= j+ i*N_RECEIVERS/N_TAG_MANAGERS;
              rcv_alloc_tag_ltchd_n(i)(j) <= '0';
              tmanager_gmem_addr_n(i) <= rcv_gmem_addr(j+ i*N_RECEIVERS/N_TAG_MANAGERS)(GMEM_WORD_ADDR_W-1 downto N);
              st_tmanager_n(i) <= check_tag_being_processed;
              exit;
            end if;
          end loop;
          -- }}}

        when check_tag_being_processed => -- check if the corresponding cache addr is being processed by another tmanager {{{
          -- if an address of the requested tag is already in the write pipeline; the FSM should go and try to pick up a new alloc request
          -- Otherwise it may  stay in this state, as long as no anther tmanager is processing the tag and the alloc request deasserted, e.g. another tmanager allocated the tag
          -- Processing a no more requested tag may lead to the following problem:
          -- a rcv wants to write, a tmanager thinks wrongly that somebody wants to read the address,
          -- as soon as the tag is allocated, the rcv may write and the data may be overwritten!
          tmanager_get_busy(i) <= '1';
          if tmanager_get_busy_ack(i) = '1' then
            if write_pipe_contains_gmem_addr(i) = '0' and tmanager_gmem_addr_protected(i) = '0' then
                  -- tmanager_gmem_addr_protected has a delay of 1 clock cycle
              invalidate_tag_n(i) <= '1';
              st_tmanager_n(i) <= invalidate_tag_v;
              tmanager_busy_n(i) <= '1';
              tmanager_tag_protect_v_n(i) <= '1';
              tmanager_tag_protect_n(i) <= tmanager_gmem_addr(i)(M+L-1 downto L);
            else
              st_tmanager_n(i) <= define_rcv_indx;
              tmanager_get_busy(i) <= '0';
            end if;
          end if;

          for j in 0 to N_TAG_MANAGERS-1 loop
            if j /= i then
              if (tmanager_busy(j) = '1' and tmanager_gmem_addr(i)(M+L-1 downto L) = tmanager_gmem_addr(j)(M+L-1 downto L)) then
              -- (tmanager_gmem_addr_protected(i) = '1' and tmanager_get_busy_ack(i) = '1') then
                -- (tmanager_tag_protect_v(j) = '1' and tmanager_gmem_addr(i)(M+N+L-1 downto L+N) = tmanager_tag_protect(j)) then
                tmanager_get_busy(i) <= '0';
                tmanager_busy_n(i) <= '0';
                tmanager_tag_protect_v_n(i) <= '0';
                invalidate_tag_n(i) <= '0';
                st_tmanager_n(i) <= define_rcv_indx;
              end if;
            end if;
          end loop;
          -- }}}

        when invalidate_tag_v => -- {{{
          -- if tmanager_tag_protect_vec(i)(0) = '1' then
          --   report "heeeere" severity failure;
          -- end if;
          -- tmanager_tag_protect_v_n(i) <= '1';
          -- tmanager_tag_protect_n(i) <= tmanager_gmem_addr(i)(M+N+L-1 downto N+L);
          if WRITE_PHASE_W > 1 then
            tmanager_rcv_served_n(i) <= '0';
          end if;
          if invalidate_tag_ack(i) = '1' then
            invalidate_tag_n(i) <= '0';
            st_tmanager_n(i) <= clear_tag_st;
            clear_tag_tmanager_n(i) <= '1';
            alloc_tag_n(i) <= '1';
          end if;
          -- }}}

        when clear_tag_st => -- {{{
          if alloc_tag_ack(i) = '1' then
            clear_tag_tmanager_n(i) <= '0';
            alloc_tag_n(i) <= '0';
            st_tmanager_n(i) <= invalidate_page_v;
            invalidate_page_n(i) <= '1';
          end if;
          -- }}}

        when invalidate_page_v => -- {{{
          if page_v_tmanager_ack(i) = '1' then
            invalidate_page_n(i) <= '0';
            st_tmanager_n(i) <= check_dirty;
            wait_vec_invalidate_tag_n(i) <= '1';
            if write_pipe_contains_gmem_addr(i) = '1' then
              tmanager_waited_for_write_pipe_n(i) <= '1';
            end if;
          end if;
          -- }}}

        when check_dirty => -- {{{
          if write_pipe_contains_gmem_addr(i) = '1' then
            tmanager_waited_for_write_pipe_n(i) <= '1';
            if wait_vec_invalidate_tag(i)(0) = '1' then
              wait_done_n(i) <= '1';
            end if;
          else
            wait_done_n(i) <= '0';
            if wait_vec_invalidate_tag(i)(0) = '1' or wait_done(i) = '1' then
              if tmanager_waited_for_write_pipe(i) = '1' or rdData_dirty(i) = '1' then
                st_tmanager_n(i) <= read_tag;
                tmanager_read_tag_n(i) <= '1';
                tmanager_clear_dirty_n(i) <= '1';
              else
                -- -
                -- st_tmanager_n(i) <= validate_new_tag;
                -- alloc_tag_n(i) <= '1';
                -- -

                -- +
                -- Populating the cache line with the new content should be done before validating the new tag
                -- Otherwise, some receivers may write the cache directly after tag validation and the written data will
                -- be overwritten by the one from the global memory
                -- Therefore, issue_read -> validate_tag -> validate_page
                if rcv_rnw(rcv_indx_tmanager(i)) = '1' then
                  st_tmanager_n(i) <= issue_read;
                  wr_fifo_go_n(i) <= '1';
                else
                  st_tmanager_n(i) <= validate_new_tag;
                  alloc_tag_n(i) <= '1';
                end if;
                -- +
              end if;
            end if;
          end if;
          -- }}}

        when validate_new_tag => -- {{{
          if alloc_tag_ack(i) = '1' then
            alloc_tag_n(i) <= '0';
            -- -
            -- if rcv_rnw(rcv_indx_tmanager(i)) = '1' then
            --   st_tmanager_n(i) <= issue_read;
            --   wr_fifo_go_n(i) <= '1';
            -- else
            --   st_tmanager_n(i) <= wait_a_little;
            --   wait_vec_n(i) <= '1';
            -- end if;
            -- -

            -- +
            if rcv_rnw(rcv_indx_tmanager(i)) = '1' then
              st_tmanager_n(i) <= validate_new_page;
              validate_page_n(i) <= '1';
            else
              st_tmanager_n(i) <= wait_a_little;
              wait_vec_n(i) <= '1';
            end if;
            -- +
          end if;
          -- }}}

        when wait_a_little => --necessary because rcv_alloc_tag does not react immediately in case of validating a tag for a write {{{
          -- tmanager_tag_protect_v_n(i) <= '1'; -- setting tag protect should be done 2 cycles before going to idle
          -- tmanager_tag_protect_n(i) <= tmanager_gmem_addr(i)(M+N+L-1 downto N+L);
          if wait_vec(i)(0) = '1' then
            st_tmanager_n(i) <= idle;
            tmanager_busy_n(i) <= '0';
            tmanager_tag_protect_vec_n(i) <= '1';
            tmanager_rcv_served_wait_vec_n(i) <= '1';
          end if;
          -- }}}

        when read_tag => -- {{{
          -- report "tag read by tmanager";
          tmanager_waited_for_write_pipe_n(i) <= '0';
          if tmanager_read_tag_ack_d0(i) = '1' then
            st_tmanager_n(i) <= issue_write;
            tmanager_issue_write_n(i) <= '1';
          end if;
          -- }}}

        when issue_write => -- {{{
          -- report "write issued";
          if wr_issued_tmanager(i) = '1' then
            st_tmanager_n(i) <= wait_write_finish;
            tmanager_issue_write_n(i) <= '0';
          end if;
          -- }}}

        when wait_write_finish => -- {{{
          if axi_rd_fifo_filled(axi_wr_indx_tmanager(i)) = '1' then
            if tmanager_tag_to_write(i) = tmanager_gmem_addr(i)(TAG_W+M+L-1 downto M+L) then
              -- the tag to read is the same dirty one!
              -- the tmanager should wait until the write transaction is completely finished
              -- otherwise data may become inconsistent
              st_tmanager_n(i) <= wait_bid;
              -- report "match";
            elsif tmanager_clear_dirty(i) = '1' then
              st_tmanager_n(i) <= clear_dirty;
            else
              -- -
              -- st_tmanager_n(i) <= validate_new_tag;
              -- alloc_tag_n(i) <= '1';
              -- -

              -- +
              if rcv_rnw(rcv_indx_tmanager(i)) = '1' then
                st_tmanager_n(i) <= issue_read;
                wr_fifo_go_n(i) <= '1';
              else
                st_tmanager_n(i) <= validate_new_tag;
                alloc_tag_n(i) <= '1';
              end if;
              -- +
            end if;
          end if;
          -- }}}

        when wait_bid => -- {{{
          if wait_for_write_response(i) = '0' then
            if tmanager_clear_dirty(i) = '1' then
              st_tmanager_n(i) <= clear_dirty;
            else
              -- -
              -- st_tmanager_n(i) <= validate_new_tag;
              -- alloc_tag_n(i) <= '1';
              -- -

              -- +
              if rcv_rnw(rcv_indx_tmanager(i)) = '1' then
                st_tmanager_n(i) <= issue_read;
                wr_fifo_go_n(i) <= '1';
              else
                st_tmanager_n(i) <= validate_new_tag;
                alloc_tag_n(i) <= '1';
              end if;
              -- +

            end if;
          end if;
          -- }}}

        when clear_dirty => -- {{{
          if tmanager_clear_dirty(i) = '0' then
            -- -
            -- st_tmanager_n(i) <= validate_new_tag;
            -- alloc_tag_n(i) <= '1';
            -- -

            -- +
            if rcv_rnw(rcv_indx_tmanager(i)) = '1' then
              st_tmanager_n(i) <= issue_read;
              wr_fifo_go_n(i) <= '1';
            else
              st_tmanager_n(i) <= validate_new_tag;
              alloc_tag_n(i) <= '1';
            end if;
            -- +
          end if;
          -- }}}

        when issue_read => -- {{{
          st_tmanager_n(i) <= wait_read_finish;
          -- }}}

        when wait_read_finish => -- {{{
          if wr_fifo_free(i) = '1' then
            -- -
            -- st_tmanager_n(i) <= validate_new_page;
            -- validate_page_n(i) <= '1';
            -- -

            -- +
            st_tmanager_n(i) <= validate_new_tag;
            alloc_tag_n(i) <= '1';
            -- +
          end if;
          --}}}

        when validate_new_page => -- {{{
          -- tmanager_wait_for_fifo_empty_n(i) <= '0';
          -- tmanager_tag_protect_v_n(i) <= '1'; -- setting tag protect should be done 2 cycles before going to idle
          -- tmanager_tag_protect_n(i) <= tmanager_gmem_addr(i)(M+L-1 downto L);
          if page_v_tmanager_ack(i) = '1' then
            validate_page_n(i) <= '0';
            st_tmanager_n(i) <= wait_page_v;
          end if;
          -- }}}

        when wait_page_v => -- {{{
          st_tmanager_n(i) <= idle;
          tmanager_busy_n(i) <= '0';
          tmanager_tag_protect_vec_n(i) <= '1';
          tmanager_rcv_served_wait_vec_n(i) <= '1';
          -- }}}
      end case;

      if tmanager_read_tag_ack_n(i) = '1' then
        tmanager_read_tag_n(i) <= '0';
      end if;
      if tmanager_clear_dirty_ack(i) = '1' then
        tmanager_clear_dirty_n(i) <= '0';
      end if;
    end process;
  end generate;
  ---------------------------------------------------------------------------------------------------------}}}

  -- tag mem -------------------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        clear_tag                <= '0'; -- NOT NEEDED
        we_tag                   <= '0'; -- NOT NEEDED
        tmanager_read_tag_ack    <= (others => '0'); -- NOT NEEDED
        tmanager_read_tag_ack_d0 <= (others => '0'); -- NOT NEEDED
        wrData_tag               <= (others => '0'); -- NOT NEEDED
        wrAddr_tag               <= (others => '0'); -- NOT NEEDED
        rdAddr_tag               <= (others => (others => '0')); -- NOT NEEDED
        rdData_tag_d0            <= (others => '0'); -- NOT NEEDED
      else
        clear_tag <= clear_tag_n;
        we_tag <= we_tag_n;
        tmanager_read_tag_ack <= tmanager_read_tag_ack_n;
        tmanager_read_tag_ack_d0 <= tmanager_read_tag_ack;
        wrData_tag <= wrData_tag_n;
        wrAddr_tag <= wrAddr_tag_n;
        rdAddr_tag <= rdAddr_tag_n;
        rdData_tag_d0 <= rdData_tag_i(N_RD_PORTS-1);
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        rdData_tag_i <= (others => (others => '0')); -- NOT NEEDED
      else
        for i in 0 to N_RD_PORTS-1 loop
          rdData_tag_i(i) <= tag(to_integer(rdAddr_tag(i)));
        end loop;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if we_tag = '1' then
        tag(to_integer(wrAddr_tag)) <= wrData_tag;
      end if;
    end if;
  end process;

  process(tmanager_gmem_addr, alloc_tag, clear_tag_tmanager, rcv_read_tag, rcv_gmem_addr, tmanager_read_tag, finish_active, finish_tag_addr)
  begin
    -- write tag
    alloc_tag_ack <= (others => '0');
    we_tag_n <= '0';
    wrData_tag_n <= tmanager_gmem_addr(0)(GMEM_WORD_ADDR_W-N-1 downto L+M);
    wrAddr_tag_n <= tmanager_gmem_addr(0)(M+L-1 downto L);
    clear_tag_n <= '0';
    for i in 0 to N_TAG_MANAGERS-1 loop -- linked with we_tag_v, don't change the order of the loop
      if alloc_tag(i) = '1' then
        alloc_tag_ack(i) <= '1';
        we_tag_n <= not clear_tag_tmanager(i);
        clear_tag_n <= clear_tag_tmanager(i);
        wrData_tag_n <= tmanager_gmem_addr(i)(GMEM_WORD_ADDR_W-N-1 downto L+M);
        wrAddr_tag_n <= tmanager_gmem_addr(i)(M+L-1 downto L);
        exit;
      end if;
    end loop;

    -- read tag
    rcv_read_tag_ack <= (others => '0');
    -- first ports (default 3) serve the receivers
    for i in 0 to N_RD_PORTS-2 loop
      rdAddr_tag_n(i) <= rcv_gmem_addr(0)(L+M+N-1 downto L+N);
      for j in 0 to (N_RECEIVERS/N_RD_PORTS)-1 loop
        if rcv_read_tag(i + j*N_RD_PORTS) = '1' then
          rdAddr_tag_n(i) <= rcv_gmem_addr(i + j*N_RD_PORTS)(L+M+N-1 downto L+N);
          rcv_read_tag_ack(i + j*N_RD_PORTS) <= '1';
          exit;
        end if;
      end loop;
    end loop;
    -- the last read port serves the tmanagers in addition to the receivers
    rdAddr_tag_n(N_RD_PORTS-1) <= rcv_gmem_addr(0)(L+M+N-1 downto L+N);
    tmanager_read_tag_ack_n <= (others => '0');
    if finish_active = '1' then
      rdAddr_tag_n(N_RD_PORTS-1) <= finish_tag_addr;
    elsif tmanager_read_tag /= (tmanager_read_tag'reverse_range => '0') then
      for j in 0 to N_TAG_MANAGERS-1 loop
        if tmanager_read_tag(j) = '1' then
          rdAddr_tag_n(N_RD_PORTS-1) <= tmanager_gmem_addr(j)(L+M-1 downto L);
          tmanager_read_tag_ack_n(j) <= '1';
          exit;
        end if;
      end loop;
    else
      for j in 0 to (N_RECEIVERS/N_RD_PORTS)-1 loop
        if rcv_read_tag(N_RD_PORTS-1 + j*N_RD_PORTS) = '1' then
          rdAddr_tag_n(N_RD_PORTS-1) <= rcv_gmem_addr(N_RD_PORTS-1 + j*N_RD_PORTS)(L+M+N-1 downto L+N);
          rcv_read_tag_ack(N_RD_PORTS-1 + j*N_RD_PORTS) <= '1';
          exit;
        end if;
      end loop;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}

  -- tag_valid -------------------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        we_tag_v     <= '0'; -- NOT NEEDED
        wrAddr_tag_v <= (others => '0'); -- NOT NEEDED
        wrData_tag_v <= '0'; -- NOT NEEDED
      else
        we_tag_v     <= we_tag_v_n;
        wrAddr_tag_v <= wrAddr_tag_v_n;
        wrData_tag_v <= wrData_tag_v_n;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        rdData_tag_v <= (others => '0'); -- NOT NEEDED
      else
        for i in 0 to N_RD_PORTS-1 loop
          rdData_tag_v(i) <= tag_v(to_integer(rdAddr_tag(i)));
        end loop;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if we_tag_v = '1' then
        tag_v(to_integer(wrAddr_tag_v)) <= wrData_tag_v;
      end if;
    end if;
  end process;

  process(invalidate_tag, tmanager_gmem_addr, alloc_tag, clear_tag_tmanager, finish_active, finish_tag_addr_d0, finish_we)
  begin
    invalidate_tag_ack <= (others => '0');
    we_tag_v_n <= '0';
    wrData_tag_v_n <= '0';
    wrAddr_tag_v_n <= tmanager_gmem_addr(0)(M+L-1 downto L);
    if finish_active = '0' then
      if (alloc_tag and not clear_tag_tmanager) = (alloc_tag'reverse_range=>'0') then
        -- no tmanager simultaneously has condition ( alloc_tag(i) = 1 and clear_tag_manager(i) = 0 ).
        -- This condition indicates that a tmanager is allocating that particular tag.
        -- Therefore, the condition above means: no other tmanager is simultaneously writing the corresponding tag_v.
        for i in 0 to N_TAG_MANAGERS-1 loop
          if invalidate_tag(i) = '1' then -- cleans up the corresponding value of tag_v
            invalidate_tag_ack(i) <= '1';
            we_tag_v_n <= '1';
            wrData_tag_v_n <= '0';
            wrAddr_tag_v_n <= tmanager_gmem_addr(i)(M+L-1 downto L);
            exit;
          end if;
        end loop;
      else
        -- there is at least one tmanager that simultaneously has the condition ( alloc_tag(i) = 1 and clear_tag_manager(i) = 0 )
        -- this write has priority and it happes at the same time a tag is written
        for i in 0 to N_TAG_MANAGERS-1 loop
          if alloc_tag(i) = '1' then
            if clear_tag_tmanager(i) = '0' then
              -- executes the next 3 lines of code for precisely those tmanagers for which the condition ( alloc_tag(i) = 1 and clear_tag_manager(i) = 0 ) applies.
              -- sets the corresponding  value of tag_v to 1
              we_tag_v_n <= '1';
              wrAddr_tag_v_n <= tmanager_gmem_addr(i)(M+L-1 downto L);
              wrData_tag_v_n <= '1';
            end if;
            exit;
          end if;
        end loop;
      end if;
    else
      we_tag_v_n <= finish_we;
      wrAddr_tag_v_n <= finish_tag_addr_d0;
      wrData_tag_v_n <= '0';
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}

  -- dirty mem -------------------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        rdData_dirty <= (others => '0'); -- NOT NEEDED
        dirty        <= (others => '0'); -- NOT NEEDED
      else
        -- dirty memory
        for i in 0 to N_TAG_MANAGERS-1 loop
          rdData_dirty(i) <= dirty(to_integer(rdAddr_dirty(i)));
        end loop;
        if we_dirty = '1' then
          dirty(to_integer(wrAddr_dirty)) <= wrData_dirty;
        end if;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        we_dirty                 <= '0';
        tmanager_clear_dirty_ack <= (others => '0');
        rdAddr_dirty             <= (others => (others => '0'));
        wrData_dirty             <= '0';
        wrAddr_dirty             <= (others => '0');
      else
        we_dirty <= we_dirty_n;
        tmanager_clear_dirty_ack <= tmanager_clear_dirty_ack_n;
        if finish_active = '0' then
          rdAddr_dirty(0) <= tmanager_gmem_addr(0)(M+L-1 downto L);
        else
          rdAddr_dirty(0) <= finish_tag_addr;
        end if;
        if N_TAG_MANAGERS > 1 then
          for i in 1 to max(N_TAG_MANAGERS-1,1) loop
            rdAddr_dirty(i) <= tmanager_gmem_addr(i)(M+L-1 downto L);
          end loop;
        end if;
        wrData_dirty <= wrData_dirty_n;
        wrAddr_dirty <= wrAddr_dirty_n;
      end if;
    end if;
  end process;

  process(cache_we, cache_addra, finish_active, finish_we, tmanager_clear_dirty, tmanager_gmem_addr, finish_tag_addr_d0)
  begin
    wrAddr_dirty_n <= cache_addra(M+L-1 downto L);
    tmanager_clear_dirty_ack_n <= (others => '0');
    if cache_we = '1' then
      wrData_dirty_n <= '1';
      we_dirty_n <= '1';
    elsif finish_active = '0' then
      wrData_dirty_n <= '0';
      we_dirty_n <= '0';
      for i in 0 to N_TAG_MANAGERS-1 loop
        if tmanager_clear_dirty(i) = '1' then
          tmanager_clear_dirty_ack_n(i) <= '1';
          we_dirty_n <= '1';
          wrAddr_dirty_n <= tmanager_gmem_addr(i)(M+L-1 downto L);
          exit;
        end if;
      end loop;
    else
      wrData_dirty_n <= '0';
      we_dirty_n <= finish_we;
      wrAddr_dirty_n <= finish_tag_addr_d0;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}

  -- axi channels control -------------------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        axi_wr_indx_tmanager    <= (others => 0); -- NOT NEEDED
        wr_issued_tmanager      <= (others => '0'); -- NOT NEEDED
        axi_wrAddr_i            <= (others => (others => '0')); -- NOT NEEDED
        axi_writer_go           <= (others => '0'); -- NOT NEEDED
        axi_writer_id           <= (others => '0'); -- NOT NEEDED
        axi_rdAddr              <= (others => (others => '0')); -- NOT NEEDED
        st_axi_wr               <= find_free_fifo; -- NOT NEEDED
        wait_for_write_response <= (others => '0'); -- NOT NEEDED
      else
        st_axi_wr <= st_axi_wr_n;
        wait_for_write_response <= wait_for_write_response_n;

        axi_wr_indx_tmanager <= axi_wr_indx_tmanager_n;
        wr_issued_tmanager <= wr_issued_tmanager_n;
        axi_wrAddr_i <= axi_wrAddr_n;
        axi_writer_go <= axi_writer_go_n;
        axi_writer_id <= axi_writer_id_n;
        for j in 0 to N_WR_FIFOS-1 loop
          axi_rdAddr(j)(L-1 downto 0) <= (others => '0');
          axi_rdAddr(j)(GMEM_WORD_ADDR_W-N-1 downto L) <= tmanager_gmem_addr(j)(GMEM_WORD_ADDR_W-N-1 downto L);
        end loop;
      end if;
    end if;
  end process;

  issue_wr_axi: process(st_axi_wr, tmanager_issue_write, axi_writer_free, axi_wrAddr_i, tmanager_gmem_addr, tmanager_tag_to_write,
            finish_issue_write,  axi_wr_indx_tmanager, finish_fifo_dout, wait_for_write_response, axi_writer_ack)
  begin
    axi_wr_indx_tmanager_n <= axi_wr_indx_tmanager;
    wr_issued_tmanager_n <= (others => '0');
    st_axi_wr_n <= st_axi_wr;
    for j in 0 to N_AXI-1 loop
      axi_wrAddr_n(j) <= axi_wrAddr_i(j);
    end loop;
    axi_writer_go_n <= (others => '0');
    axi_writer_id_n <= (others => '0');
    finish_fifo_pop <= '0';
    for i in 0 to N_TAG_MANAGERS-1 loop
      if axi_writer_ack(i) = '1' then
        wait_for_write_response_n(i) <= '0';
      else
        wait_for_write_response_n(i) <= wait_for_write_response(i);
      end if;
    end loop;

    case st_axi_wr is

      when find_free_fifo =>
        for i in 0 to N_TAG_MANAGERS-1 loop
          if  tmanager_issue_write(i) = '1' and axi_writer_free(c_rd_fifo_axi(i)) = '1' and wait_for_write_response(i) = '0'  then
            axi_wr_indx_tmanager_n(i) <= c_rd_fifo_axi(i);
            wr_issued_tmanager_n(i) <= '1';
            wait_for_write_response_n(i) <= '1';
            axi_wrAddr_n(c_rd_fifo_axi(i))(GMEM_WORD_ADDR_W-N-1 downto L) <= tmanager_tag_to_write(i) & tmanager_gmem_addr(i)(M+L-1 downto L);
            -- if tmanager_tag_to_write(i) = tmanager_gmem_addr(i)(TAG_W+M+L-1 downto M+L) then
            --   report "match";
            -- end if;
            axi_writer_go_n(c_rd_fifo_axi(i)) <= '1';
            axi_writer_id_n <= std_logic_vector(to_unsigned(i, N_TAG_MANAGERS_W));

            st_axi_wr_n <= issue_order;
            exit;
          end if;
        end loop;
        if finish_issue_write = '1' then
          for j in 0 to N_AXI-1 loop
            if axi_writer_free(j) = '1' then
              finish_fifo_pop <= '1';
              axi_wrAddr_n(j)(GMEM_WORD_ADDR_W-N-1 downto L) <=  finish_fifo_dout;
              axi_writer_go_n(j) <= '1';
              st_axi_wr_n <= issue_order;
              exit;
            end if;
          end loop;
        end if;

      when issue_order => -- just a wait state
        st_axi_wr_n <= find_free_fifo;

    end case;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}

  -- page_valid ------------------------------------------------------------------------------------------- {{{
  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        wrAddr_page_v <= (others => '0'); -- NOT NEEDED
        wrData_page_v <= '0'; -- NOT NEEDED
        we_page_v     <= '0'; -- NOT NEEDED
      else
        wrAddr_page_v <= wrAddr_page_v_n;
        wrData_page_v <= wrData_page_v_n;
        we_page_v     <= we_page_v_n;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        rdData_page_v <= (others => '0'); -- NOT NEEDED
      else
        for i in 0 to N_RD_PORTS-1 loop
          rdData_page_v(i) <= page_v(to_integer(rdAddr_tag(i)));
        end loop;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if we_page_v = '1' then
        page_v(to_integer(wrAddr_page_v)) <= wrData_page_v;
      end if;
    end if;
  end process;

  process(invalidate_page, validate_page, tmanager_gmem_addr, finish_active, finish_tag_addr_d0, finish_we)
  begin
    page_v_tmanager_ack <= (others => '0');
    we_page_v_n <= '0';
    wrData_page_v_n <= '0';
    wrAddr_page_v_n <= tmanager_gmem_addr(0)(M+L-1 downto L);
    for i in 0 to N_TAG_MANAGERS-1 loop
      if invalidate_page(i) = '1' then  -- cleans up the corresponding value of page_v
        page_v_tmanager_ack(i) <= '1';
        we_page_v_n <= '1';
        wrData_page_v_n <= '0';
        wrAddr_page_v_n <= tmanager_gmem_addr(i)(M+L-1 downto L);
        exit;
      end if;
      if validate_page(i) = '1' then
        page_v_tmanager_ack(i) <= '1';
        we_page_v_n <= '1';
        wrData_page_v_n <= '1';
        wrAddr_page_v_n <= tmanager_gmem_addr(i)(M+L-1 downto L);
        exit;
      end if;
    end loop;

    if finish_active = '1' then
      we_page_v_n <= finish_we;
      wrData_page_v_n <= '0';
      wrAddr_page_v_n <= finish_tag_addr_d0;
    end if;

  end process;
  --------------------------------------------------------------------------------------------------------- }}}

  -- rcv status eraly update -----------------------------------------------------------------------------------{{{
  tag_trans: process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        rcv_tag_written    <= (others => '0');
        rcv_tag_updated    <= (others => '0');
        rcv_page_validated <= (others => '0');
      else
        rcv_tag_written <= rcv_tag_written_n;
        rcv_tag_updated <= rcv_tag_updated_n;
        rcv_page_validated <= rcv_page_validated_n;
      end if;
    end if;
  end process;

  process(we_page_v, rcv_gmem_addr, wrAddr_page_v, wrData_page_v)
  begin
    rcv_page_validated_n <= (others => '0');
    if we_page_v = '1' and wrData_page_v = '1' then
      for i in 0 to N_RECEIVERS-1 loop
        if rcv_gmem_addr(i)(M+L+N-1 downto N+L) = wrAddr_page_v then
          rcv_page_validated_n(i) <= '1';
        end if;
      end loop;
    end if;
    -- for i in 0 to N_TAG_MANAGERS-1 loop
    --   if validate_page(i) = '1' then
    --     rcv_page_validated_n((i+1)*N_RECEIVERS/N_TAG_MANAGERS-1 downto i*N_RECEIVERS/N_TAG_MANAGERS) <= (others => '1');
    --   end if;
    -- end loop;
  end process;

  process(rcv_gmem_addr, wrAddr_tag, we_tag, wrData_tag, clear_tag)
    variable wrData_compared: std_logic := '0';
  begin
    for i in 0 to N_RECEIVERS-1 loop
      if rcv_gmem_addr(i)(GMEM_WORD_ADDR_W-1 downto L+M+N) = wrData_tag then
        wrData_compared := '1';
      else
        wrData_compared := '0';
      end if;
      rcv_tag_written_n(i) <= '0';
      rcv_tag_updated_n(i) <= '0';
      if rcv_gmem_addr(i)(L+M+N-1 downto L+N) = wrAddr_tag then
        if we_tag = '1' and wrData_compared = '1' then
          rcv_tag_written_n(i) <= '1';
        end if;
        if clear_tag = '1' or (we_tag = '1' and wrData_compared = '0') then
          rcv_tag_updated_n(i) <= '1';
        end if;
      end if;
    end loop;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}

  -- debug -----------------------------------------------------------------------------------{{{

  DEBUG_GEN_FALSE: if DEBUG_IMPLEMENT = 0 generate
    debug_cache_miss_counter_i <= (others => '0');
    debug_cache_miss_counter_n <= (others => '0');
  end generate;

  DEBUG_GEN_TRUE: if DEBUG_IMPLEMENT /= 0 generate

    process(clk)
    begin
      if rising_edge(clk) then
        if nrst = '0' then
          debug_cache_miss_counter_i <= (others => '0');
        else
          if (debug_reset_all_counters = '1') then
            debug_cache_miss_counter_i <= (others => '0');
          else
            debug_cache_miss_counter_i <= debug_cache_miss_counter_n;
          end if;
        end if;
      end if;
    end process;

    process(we_tag, debug_cache_miss_counter_i)
    begin
        if (we_tag = '1') then
          debug_cache_miss_counter_n <= debug_cache_miss_counter_i + 1;
        else
          debug_cache_miss_counter_n <= debug_cache_miss_counter_i;
        end if;
    end process;

  end generate;
  -- }}}

end architecture;
