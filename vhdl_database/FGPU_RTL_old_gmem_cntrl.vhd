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
entity gmem_cntrl is -- {{{
port(
  clk                 : in std_logic;
  start_kernel        : in std_logic;
  clean_cache         : in std_logic;
  WGsDispatched       : in std_logic;
  CUs_gmem_idle       : in std_logic;
  finish_exec         : out std_logic := '0';

  cu_valid            : in std_logic_vector(N_CU-1 downto 0);  
  cu_ready            : out std_logic_vector(N_CU-1 downto 0) := (others=>'0');
  cu_we               : in be_array(N_CU-1 downto 0);
  cu_rnw, cu_atomic   : in std_logic_vector(N_CU-1 downto 0);
  cu_atomic_sgntr     : in atomic_sgntr_array(N_CU-1 downto 0);
  cu_rqst_addr        : in GMEM_WORD_ADDR_ARRAY(N_CU-1 downto 0);
  cu_wrData           : in SLV32_ARRAY(N_CU-1 downto 0);

  rdAck               : out std_logic_vector(N_CU-1 downto 0) := (others=>'0');
  rdAddr              : out unsigned(GMEM_WORD_ADDR_W-1-CACHE_N_BANKS_W downto 0) := (others=>'0');
  rdData              : out std_logic_vector(DATA_W*CACHE_N_BANKS-1 downto 0) := (others => '0');
  atomic_rdData       : out std_logic_vector(DATA_W-1 downto 0) := (others=>'0');
  atomic_rdData_v     : out std_logic_vector(N_CU-1 downto 0) := (others=>'0');
  atomic_sgntr        : out std_logic_vector(N_CU_STATIONS_W-1 downto 0) := (others=>'0');
  -- AXI Interface signals {{{
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
  -- }}}
  nrst                : in std_logic
);
end gmem_cntrl; --}}}
architecture Behavioral of gmem_cntrl is
  -- internal signals {{{
  signal cu_ready_i                       : std_logic_vector(N_CU-1 downto 0) := (others=>'0');
  signal axi_wvalid_i                     : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal rdData_i                         : std_logic_vector(DATA_W*CACHE_N_BANKS-1 downto 0) := (others => '0');
  signal finish_exec_i                    : std_logic := '0';
  -- }}}
  -- axi signals {{{
  signal axi_rdAddr                       : gmem_addr_array_no_bank(N_WR_FIFOS-1 downto 0) := (others=>(others=>'0'));
  signal wr_fifo_go                       : std_logic_vector(N_WR_FIFOS-1 downto 0) := (others=>'0');
  -- attribute mark_debug of wr_fifo_go : signal is "true";
  signal axi_writer_go                    : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal wr_fifo_free                     : std_logic_vector(N_WR_FIFOS-1 downto 0) := (others=>'0');
  signal axi_writer_free                  : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal axi_wrAddr                       : gmem_addr_array_no_bank(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal axi_writer_ack                   : std_logic_vector(N_TAG_MANAGERS-1 downto 0) := (others=>'0');
  signal axi_writer_id                    : std_logic_vector(N_TAG_MANAGERS_W-1 downto 0) := (others=>'0');
  -- attribute mark_debug of axi_writer_id : signal is "true";
  --}}}
  -- doc part (obselete) -------------------------------------------------------------------------------{{{
  -- rmem = request mem
  -- rmem_blk = request memory block. There are GMEM_N_BANKS of rmem_block
  -- mir_blk = request memory mirror of a block.
  --                                                                                                                        
  -- byte count  :         |7         6        5        |4        |3       2       1       0       |                      
  --                       |_____|______________________|____|____|________________________________|                      |
  --                       | cnt |         TAG          | we | re |            Data to write       |                      |   
  --           _         _ |_____|______________________|____|____|________________________________|           _          |
  --          |         |  |     |         TAG          |____|____|________________________________|            |         |
  --          |   rqst  |  |     |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|____|____|________________________________|  rqst line |  2^L    |
  --          |   entry |  |     |         XXX          |____|____|________________________________|            |         |
  --          |         |_ |_____|______________________|____|____|________________________________|           _|         |  * 2^N rmem_block 
  --     2^M  |            |     |                      |    |    |                                |                      |
  --          |            |     |                      |    |    |                                |                      |
  --          :            :     :                      :    :    :                                :                      :
  --          :            :     :                      :    :    :                                :                      :
  --          |            |     |                      |    |    |                                |                      |
  --          |_           |_____|______________________|____|____|________________________________|                      |
  --
  -- 2^N = GMEM_N_BANKS (default=2^1)
  -- 2^M = number of rqst entries (default=2^5)
  -- 2^N = number of rqst lines/entry = burst length (default=2^4)
  -- TAG should be identical in all instances of request memory blocks
  -- cnt is the number of set bits either in re or we. It's limited in bit width and needs to sturated while incrementing.
  ------------------------------------------------------------------------------------------------}}}
  -- functions ------------------------------------------------------------------ {{{
  function distribute_rcvs_on_CUs (n_rcvs: integer; n_cus: integer) return nat_array is
    variable res: nat_array(n_rcvs-1 downto 0) := (others=>0);
  begin
    for i in 0 to n_rcvs-1 loop
      for k in 0 to n_cus-1 loop
        if i < (k+1)*(n_rcvs/n_cus) and i >= k*(n_rcvs/n_cus) then
          res(i) := k;
          exit;
        end if;
      end loop;
    end loop;
    return res;
  end;

  function distribute_rcvs_on_gmem_banks (n_rcvs: natural; n_banks: natural) return nat_array is
    variable res: nat_array(n_rcvs-1 downto 0) := (others=>0);
  begin
    for i in 0 to n_rcvs-1 loop
      for k in 0 to n_banks-1 loop
        for j in 0 to (n_rcvs/n_banks)-1 loop
          if i = k + j*n_banks then
            res(i) := k;
            exit;
          end if;
        end loop;
      end loop;
    end loop;
    return res;
  end function distribute_rcvs_on_gmem_banks;
  -------------------------------------------------------------------------------------}}}
  -- Constants & types -------------------------------------------------------------------------------{{{
  CONSTANT c_rcv_cu_indx                  : nat_array(N_RECEIVERS-1 downto 0) := distribute_rcvs_on_CUs(N_RECEIVERS, N_CU);
  CONSTANT c_rcv_bank_indx                : nat_array(N_RECEIVERS-1 downto 0) := distribute_rcvs_on_gmem_banks(N_RECEIVERS, N_RD_PORTS);
  
  type cache_bank is array(natural range <>) of unsigned(DATA_W-1 downto 0);
  type cache_type is array(natural range <>) of cache_bank(2**(L+M)-1 downto 0);
  ------------------------------------------------------------------------------------------------}}}
  -- CUs' interface{{{
  signal cu_ready_n                       : std_logic_vector(N_CU-1 downto 0) := (others=>'0');
  signal cuIndx_msb                       : std_logic := '0';
  signal cu_atomic_ack_p0                 : std_logic_vector(N_CU-1 downto 0) := (others=>'0');
  -- }}}
  -- receivers signals {{{
  type st_rcv_type is ( get_addr, get_read_tag_ticket, wait_read_tag, check_tag_rd, check_tag_wr, alloc_tag, clean, request_write_addr, 
                        request_write_data, write_cache, read_cache, requesting_atomic);
  type st_rcv_array is array (N_RECEIVERS-1 downto 0) of st_rcv_type;
  signal st_rcv, st_rcv_n                 : st_rcv_array := (others=>get_addr);
  signal rcv_idle, rcv_idle_n             : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_all_idle                     : std_logic := '0';
  signal rcv_gmem_addr, rcv_gmem_addr_n   : gmem_word_addr_array(N_RECEIVERS-1 downto 0) := (others=>(others=>'0'));
  signal rcv_gmem_data, rcv_gmem_data_n   : SLV32_ARRAY(N_RECEIVERS-1 downto 0) := (others=>(others=>'0'));
  signal rcv_rnw, rcv_rnw_n               : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_atomic, rcv_atomic_n         : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_be, rcv_be_n                 : be_array(N_RECEIVERS-1 downto 0) := (others=>(others=>'0'));
  signal rcv_atomic_sgntr                 : atomic_sgntr_array(N_RECEIVERS-1 downto 0) := (others=>(others=>'0'));
  signal rcv_atomic_sgntr_n               : atomic_sgntr_array(N_RECEIVERS-1 downto 0) := (others=>(others=>'0'));
  signal rcv_go, rcv_go_n                 : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_must_read                    : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_read_tag, rcv_read_tag_n     : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_atomic_rqst                  : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_atomic_rqst_n                : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_atomic_ack                   : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_atomic_performed             : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal atomic_sgntr_p0                  : std_logic_vector(N_CU_STATIONS_W-1 downto 0) := (others=>'0');
  alias  rcv_atomic_type                  : be_array(N_RECEIVERS-1 downto 0) is rcv_be;
  signal rcv_read_tag_ack                 : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_alloc_tag, rcv_alloc_tag_n   : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal cu_rqst_addr_d0                  : gmem_word_addr_array(N_CU-1 downto 0) := (others=>(others=>'0'));
  signal cu_wrData_d0                     : SLV32_ARRAY(N_CU-1 downto 0) := (others=>(others=>'0'));
  signal cu_rnw_d0, cu_atomic_d0          : std_logic_vector(N_CU-1 downto 0) := (others=>'0');
  signal cu_we_d0                         : be_array(N_CU-1 downto 0) := (others=>(others=>'0'));
  signal cu_atomic_sgntr_d0               : atomic_sgntr_array(N_CU-1 downto 0) := (others=>(others=>'0'));
  signal rcv_tag_written, rcv_tag_updated : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_page_validated               : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_perform_read                 : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_perform_read_n               : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_request_write_addr           : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_request_write_addr_n         : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  attribute max_fanout of rcv_request_write_addr : signal is 50;
  signal rcv_request_write_data           : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_request_write_data_n         : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_tag_compared                 : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_wait_1st_cycle               : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_wait_1st_cycle_n             : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  -- }}}
  -- tag signals {{{
  signal rdData_tag                       : tag_array(N_RD_PORTS-1 downto 0) := (others=>(others=>'0'));
  signal rdData_tag_v                     : std_logic_vector(N_RD_PORTS-1 downto 0) := (others=>'0');
  signal rdData_page_v, rdData_page_v_d0  : std_logic_vector(N_RD_PORTS-1 downto 0) := (others=>'0');
  -- }}}
  -- cache signals {{{
  signal cache_mem                        : cache_type(2**N-1 downto 0) := (others=>(others=>(others=>'0')));
  signal cache_wea, cache_wea_n           : std_logic_vector((2**N)*DATA_W/8-1 downto 0) := (others=>'0');
  signal cache_we, cache_we_n             : std_logic := '0';
  signal cache_addra, cache_addra_n       : unsigned(M+L-1 downto 0) := (others=>'0');
  signal cache_read_v, cache_read_v_p0    : std_logic := '0';
  signal rcv_rd_done, rcv_rd_done_n       : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  attribute max_fanout of cache_read_v    : signal is 100;
  signal cache_read_v_p0_n                : std_logic := '0';
  signal cache_read_v_d0                  : std_logic := '0';
  signal cache_last_rdAddr                : unsigned(M+L-1 downto 0) := (others=>'0');   
  -- }}}
  -- responder signals {{{
  signal rcv_to_read, rcv_to_read_n       : integer range 0 to N_RECEIVERS-1 := 0;
  signal rdAddr_p0, rdAddr_p1             : unsigned(GMEM_WORD_ADDR_W-N-1 downto 0) := (others=>'0');
  signal cache_wrData                     : std_logic_vector((2**N)*DATA_W-1 downto 0) := (others=>'0');
  constant c_n_priority_classes_w         : natural := 2;
  type rcv_priority_vec is array (natural range <>) of unsigned(RCV_PRIORITY_W-1 downto 0);
  signal rcv_priority, rcv_priority_n     : rcv_priority_vec(N_RECEIVERS-1 downto 0) := (others=>(others=>'0'));
  constant c_served_vec_len               : natural := 2; -- max(CACHE_N_BANKS-1, 2);
  type served_vec is array (natural range <>) of std_logic_vector(c_served_vec_len-1 downto 0);
  signal cu_served                        : served_vec(N_CU-1 downto 0) := (others=>(others=>'0'));
  signal write_phase                      : unsigned(WRITE_PHASE_W-1 downto 0) := (others=>'0');
  attribute max_fanout of write_phase     : signal is 8;
  signal cu_served_n                      : std_logic_vector(N_CU-1 downto 0) := (others=>'0');
  type rcv_to_read_priority_vec is array (natural range <>) of integer range 0 to N_RECEIVERS-1;
  signal rcv_to_read_pri                  : rcv_to_read_priority_vec(2**c_n_priority_classes_w-1 downto 0) := (others=>0);
  signal rcv_to_read_pri_n                : rcv_to_read_priority_vec(2**c_n_priority_classes_w-1 downto 0) := (others=>0);
  signal rcv_to_write_pri                 : rcv_to_read_priority_vec(2**c_n_priority_classes_w-1 downto 0) := (others=>0);
  signal rcv_to_write_pri_n               : rcv_to_read_priority_vec(2**c_n_priority_classes_w-1 downto 0) := (others=>0);
  signal rcv_to_read_pri_v_n              : std_logic_vector(2**c_n_priority_classes_w-1 downto 0) := (others=>'0');
  signal rcv_to_read_pri_v                : std_logic_vector(2**c_n_priority_classes_w-1 downto 0) := (others=>'0');
  signal rcv_to_write_pri_v_n             : std_logic_vector(2**c_n_priority_classes_w-1 downto 0) := (others=>'0');
  signal rcv_to_write_pri_v               : std_logic_vector(2**c_n_priority_classes_w-1 downto 0) := (others=>'0');
  --}}}
  -- write pipeline {{{
  signal rcv_to_write, rcv_to_write_n     : natural range 0 to N_RECEIVERS-1 := 0;
  attribute max_fanout of rcv_to_write : signal is 60;
  signal rcv_write_in_pipeline            : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_write_in_pipeline_n          : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal write_addr                       : cache_addr_array(3 downto 0) := (others=>(others=>'0'));
  signal rcv_will_write, rcv_will_write_n : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal rcv_will_write_d0                : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal write_word                       : std_logic_vector(DATA_W*2**N-1 downto 0) := (others=>'0');
  type write_word_rcv_indx_type is array (natural range <>) of integer range 0 to N_RECEIVERS-1;
  signal write_word_rcv_indx              : write_word_rcv_indx_type(DATA_W/8*2**N-1 downto 0) := (others=>0);
  signal write_word_rcv_indx_n            : write_word_rcv_indx_type(DATA_W/8*2**N-1 downto 0) := (others=>0);
  signal write_be_p0                      : std_logic_vector(DATA_W/8*2**N-1 downto 0) := (others=>'0'); 
  signal write_be_p0_n                    : std_logic_vector(DATA_W/8*2**N-1 downto 0) := (others=>'0'); 
  signal stall_write_pipe                 : std_logic := '0';
  signal write_v                          : std_logic_vector(3 downto 0) := (others=>'0');
  signal write_v_n                        : std_logic := '0';
  signal write_be                         : std_logic_vector(DATA_W/8*2**N-1 downto 0) := (others=>'0');
  signal write_pipe_wrTag                 : tag_addr_array(4 downto 0) := (others=>(others=>'0'));
  signal write_pipe_wrTag_valid           : std_logic_vector(4 downto 0) := (others=>'0');
  signal write_addr_match                 : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  signal write_addr_match_n               : std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  --}}}
  -- fifos {{{
  signal wr_fifo_cache_rqst               : std_logic_vector(N_WR_FIFOS-1 downto 0) := (others=>'0');
  signal rd_fifo_cache_rqst               : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal wr_fifo_cache_ack                : std_logic_vector(N_WR_FIFOS-1 downto 0) := (others=>'0');
  signal rd_fifo_cache_ack                : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal wr_fifo_rqst_addr                : cache_addr_array(N_WR_FIFOS-1 downto 0) := (others=>(others=>'0'));
  signal rd_fifo_rqst_addr                : cache_addr_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal wr_fifo_dout                     : cache_word_array(N_WR_FIFOS-1 downto 0) := (others=>(others=>'0'));
  signal cache_dob                        : std_logic_vector(DATA_W*2**N-1 downto 0) := (others=>'0');
  signal rd_fifo_din_v                    : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal fifo_be_din                      : std_logic_vector(DATA_W/8*2**N-1 downto 0) := (others=>'0');
  --}}}
  -- atomics -------------------------------------------------------------------------------------------{{{
  signal flush_ack, flush_ack_n           : std_logic := '0';
  signal flush_done                       : std_logic := '0';
  signal flush_rcv_index                  : integer range 0 to N_RECEIVERS-1 := 0;
  signal flush_rcv_index_n                : integer range 0 to N_RECEIVERS-1 := 0;
  signal flush_v                          : std_logic := '0';
  signal flush_gmem_addr                  : unsigned(GMEM_WORD_ADDR_W-1 downto 0) := (others=>'0');
  signal flush_data                       : std_logic_vector(DATA_W-1 downto 0) := (others=>'0');
  signal atomic_can_finish                : std_logic := '0';
  ---------------------------------------------------------------------------------------------------------}}}
begin
  -- internal & fixed signals assignments -------------------------------------------------------------------------{{{
  cu_ready <= cu_ready_i;
  axi_wvalid <= axi_wvalid_i;
  rdData <= rdData_i;
  finish_exec <= finish_exec_i;
  ---------------------------------------------------------------------------------------------------------}}}
  -- error handling ------------------------------------------------------------------------------------------- {{{
  assert GMEM_WORD_ADDR_W-BRMEM_ADDR_W-CACHE_N_BANKS_W <= 24;
  assert CACHE_N_BANKS_W > 0  and CACHE_N_BANKS_W <= 3;
  assert (N_RECEIVERS/2**N)*2**N = N_RECEIVERS;
  assert N_AXI = 1 or N_AXI = 2 or N_AXI = 4;
  assert BURST_WORDS_W >= CACHE_N_BANKS_W;
  ---------------------------------------------------------------------------------------------------------------}}}
  -- cache -------------------------------------------------------------------------------------------{{{
  cache_inst: entity cache port map(
    clk               => clk,
    nrst              => nrst,

    ena               => '1',
    wea               => cache_wea,
    addra             => cache_addra,
    dia               => cache_wrData,
    doa               => rdData_i,

    enb               => '1',
    enb_be            => '1',
    wr_fifo_rqst_addr => wr_fifo_rqst_addr,
    rd_fifo_rqst_addr => rd_fifo_rqst_addr,
    wr_fifo_dout      => wr_fifo_dout,
    dob               => cache_dob,
    rd_fifo_din_v     => rd_fifo_din_v,
    be_rdData         => fifo_be_din,


    ticket_rqst_wr    => wr_fifo_cache_rqst,
    ticket_rqst_rd    => rd_fifo_cache_rqst,
    ticket_ack_wr_fifo=> wr_fifo_cache_ack,
    ticket_ack_rd_fifo=> rd_fifo_cache_ack
  );
  ---------------------------------------------------------------------------------------------------------}}}
  -- write pipeline -------------------------------------------------------------------------------------- {{{
  process(clk)
  begin
    if rising_edge(clk) then
      write_phase <= write_phase + 1;
      rcv_to_write_pri <= rcv_to_write_pri_n;
      rcv_to_write_pri_v <= rcv_to_write_pri_v_n;

      if stall_write_pipe = '0' or write_v(2) = '0' or write_v(1) = '0' or write_v(0) = '0'then --stage 0
        rcv_to_write <= rcv_to_write_n;
        write_v(0) <= write_v_n;
        rcv_write_in_pipeline <= rcv_write_in_pipeline_n;
      end if;
      
      if stall_write_pipe = '0' or write_v(2) = '0' or write_v(1) = '0' then --stage 1
        write_addr(1) <= write_addr(0);
        write_v(1) <= write_v(0);
        write_addr_match <= write_addr_match_n;
      end if;


      if stall_write_pipe = '0' or write_v(2) = '0' then -- stage 2
        rcv_will_write <= rcv_will_write_n;
        write_word_rcv_indx <= write_word_rcv_indx_n;
        write_be_p0 <= write_be_p0_n;
        write_addr(2) <= write_addr(1);
        write_v(2) <= write_v(1);
      end if;

      -- write_be <= (others=>'0');
      if stall_write_pipe = '0' then -- stage 3
        rcv_will_write_d0 <= rcv_will_write;
        write_addr(3) <= write_addr(2);
        write_be <= (others=>'0');
        write_v(3) <= write_v(2);
        write_be <= write_be_p0;
        if SUB_INTEGER_IMPLEMENT /= 0 then
          for k in 0 to DATA_W/8-1 loop
            for j in 0 to 2**N-1 loop
              write_word(j*DATA_W+(k+1)*8-1 downto j*DATA_W+k*8) <= rcv_gmem_data(write_word_rcv_indx(j*DATA_W/8+k))(8*(k+1)-1 downto 8*k);
            end loop;
          end loop;
        else
          for j in 0 to 2**N-1 loop
            write_word((j+1)*DATA_W-1 downto j*DATA_W) <= rcv_gmem_data(write_word_rcv_indx(j));
          end loop;
        end if;
      end if;
    end if;
  end process;
  process(rcv_priority, rcv_request_write_addr, write_phase)
    variable indx      : unsigned(N_RECEIVERS_W-1 downto 0) := (others=>'0');
  begin
    indx(N_RECEIVERS_W-1 downto N_RECEIVERS_W-WRITE_PHASE_W) := write_phase;
    for j in 0 to 2**c_n_priority_classes_w-1 loop
      rcv_to_write_pri_n(j) <= 0;
      rcv_to_write_pri_v_n(j) <= '0';
      for i in 0 to N_RECEIVERS/2**WRITE_PHASE_W-1 loop
        indx(N_RECEIVERS_W-WRITE_PHASE_W-1 downto 0) := to_unsigned(i, N_RECEIVERS_W-WRITE_PHASE_W);
        if    rcv_request_write_addr(to_integer(indx)) = '1' and
              to_integer(rcv_priority(to_integer(indx))(RCV_PRIORITY_W-1 downto RCV_PRIORITY_W-c_n_priority_classes_w)) = j then
          rcv_to_write_pri_n(j) <= to_integer(indx);
          rcv_to_write_pri_v_n(j) <= '1';
        end if;
      end loop;
    end loop;
  end process;
  process(rcv_gmem_addr, rcv_to_write, write_v, rcv_request_write_data, rcv_to_write_pri_v, rcv_to_write_pri, rcv_be, write_addr_match,
          rcv_request_write_addr)
    variable rcv_indx      : unsigned(N_RECEIVERS_W-1 downto 0) := (others=>'0');
  begin
    rcv_to_write_n <= rcv_to_write;
    write_v_n <= '0';
    rcv_write_in_pipeline_n <= (others=>'0');
    -- stage 0: define the rcv indx to write
    for j in 2**c_n_priority_classes_w-1 downto 0 loop
      if rcv_to_write_pri_v(j) = '1' and rcv_request_write_addr(rcv_to_write_pri(j)) = '1' then
        rcv_to_write_n <= rcv_to_write_pri(j);
        write_v_n <= '1';
        rcv_write_in_pipeline_n(rcv_to_write_pri(j)) <= '1';
        exit;
      end if;
    end loop;

    -- stage 1: define the address to be written
    write_addr(0) <= rcv_gmem_addr(rcv_to_write)(M+L+N-1 downto N);
    write_addr_match_n <= (others=>'0');
    for i in 0 to N_RECEIVERS-1 loop
      if rcv_gmem_addr(i)(M+L+N-1 downto N) = rcv_gmem_addr(rcv_to_write)(M+L+N-1 downto N) and rcv_request_write_data(i) = '1' then
        write_addr_match_n(i) <= '1';
      end if;
    end loop;
    -- stage 2: define which receivers will write
    rcv_will_write_n <= (others=>'0');
    write_word_rcv_indx_n <= (others=>0);
    write_be_p0_n <= (others=>'0');
    if write_v(1) = '1' then
      if SUB_INTEGER_IMPLEMENT /= 0 then
        for k in 0 to DATA_W/8-1 loop
          for j in 0 to 2**N-1 loop
            for i in 0 to N_RECEIVERS-1 loop
              if write_addr_match(i) = '1' and to_integer(rcv_gmem_addr(i)(N-1 downto 0)) = j and rcv_be(i)(k) = '1' and rcv_request_write_data(i) = '1' then
              -- if rcv_gmem_addr(i)(M+L+N-1 downto N) = write_addr(1) and rcv_request_write_data(i) = '1' and 
              --     to_integer(rcv_gmem_addr(i)(N-1 downto 0)) = j and rcv_be(i)(k) = '1' then
                rcv_will_write_n(i) <= '1';
                write_word_rcv_indx_n(j*DATA_W/8+k) <= i;
                write_be_p0_n(j*DATA_W/8+k) <= '1';
                -- exit;
              end if;
            end loop;
          end loop;
        end loop;
      else
        for j in 0 to 2**N-1 loop
          for i in 0 to N_RECEIVERS-1 loop
            if write_addr_match(i) = '1' and to_integer(rcv_gmem_addr(i)(N-1 downto 0)) = j and rcv_be(i)(0) = '1' and rcv_request_write_data(i) = '1' then
              rcv_will_write_n(i) <= '1';
              write_word_rcv_indx_n(j) <= i;
              write_be_p0_n((j+1)*DATA_W/8-1 downto j*DATA_W/8) <= (others=>'1');
            end if;
          end loop;
        end loop;
      end if;
    end if;
    -- stage 3: form the data word to be written
  end process;
  --------------------------------------------------------------------------------------------------------- }}}
  -- responder -------------------------------------------------------------------------------------------{{{
  -- TODO: the effeciency of this should be studied on the real hardware
  read_priority_pipe_true: if ENABLE_READ_PRIORIRY_PIPE generate
    process(rcv_priority, rcv_perform_read, rcv_to_read_pri, cu_served)
    begin
      for j in 0 to 2**c_n_priority_classes_w-1 loop
        rcv_to_read_pri_n(j) <= rcv_to_read_pri(j);
        rcv_to_read_pri_v_n(j) <= '0';
        for i in N_RECEIVERS-1 downto 0 loop
          if    rcv_perform_read(i) = '1' and to_integer(rcv_priority(i)(RCV_PRIORITY_W-1 downto RCV_PRIORITY_W-c_n_priority_classes_w)) = j and 
              cu_served(c_rcv_cu_indx(i)) = (c_served_vec_len-1 downto 0 => '0') then
            rcv_to_read_pri_n(j) <= i;
            rcv_to_read_pri_v_n(j) <= '1';
          end if;
        end loop;
      end loop;
    end process;
    process(rcv_to_read_pri_v, rcv_to_read_pri, rcv_to_read, rcv_perform_read)
    begin
      rcv_to_read_n <= rcv_to_read;
      cache_read_v_p0_n <= '0';
      cu_served_n <= (others=>'0');
      for j in 2**c_n_priority_classes_w-1 downto 0 loop
        if rcv_to_read_pri_v(j) = '1' and rcv_perform_read(rcv_to_read_pri(j)) = '1' then
          rcv_to_read_n <= rcv_to_read_pri(j);
          cache_read_v_p0_n <= '1';
          cu_served_n(c_rcv_cu_indx(rcv_to_read_pri(j))) <= '1';
          exit;
        end if;
      end loop;
    end process;
  end generate;

  read_priority_pipe_false: if not ENABLE_READ_PRIORIRY_PIPE generate
    process(rcv_priority, rcv_perform_read, rcv_to_read_pri, cu_served)
    begin
      for j in 0 to 2**c_n_priority_classes_w-1 loop
        rcv_to_read_pri_n(j) <= rcv_to_read_pri(j);
        rcv_to_read_pri_v_n(j) <= '0';
        for i in N_RECEIVERS-1 downto 0 loop
          if    rcv_perform_read(i) = '1' and to_integer(rcv_priority(i)(RCV_PRIORITY_W-1 downto RCV_PRIORITY_W-c_n_priority_classes_w)) = j and 
              cu_served(c_rcv_cu_indx(i)) = (0 to c_served_vec_len-1 => '0') then
            rcv_to_read_pri_n(j) <= i;
            rcv_to_read_pri_v_n(j) <= '1';
          end if;
        end loop;
      end loop;
    end process;
    process(rcv_to_read_pri_v_n, rcv_to_read_pri_n, rcv_to_read)
    begin
      rcv_to_read_n <= rcv_to_read;
      cache_read_v_p0_n <= '0';
      cu_served_n <= (others=>'0');
      for j in 2**c_n_priority_classes_w-1 downto 0 loop
        if rcv_to_read_pri_v_n(j) = '1' then
          rcv_to_read_n <= rcv_to_read_pri_n(j);
          cache_read_v_p0_n <= '1';
          cu_served_n(c_rcv_cu_indx(rcv_to_read_pri_n(j))) <= '1';
          exit;
        end if;
      end loop;
    end process;
  end generate;
  process(clk)
    variable rcv_indx      : unsigned(N_RECEIVERS_W-1 downto 0) := (others=>'0');
  begin
    if rising_edge(clk) then


      for i in 0 to N_CU-1 loop
        cu_served(i)(c_served_vec_len-2 downto 0) <= cu_served(i)(c_served_vec_len-1 downto 1);
        cu_served(i)(c_served_vec_len-1) <= cu_served_n(i);
        -- cu_served(i)(c_served_vec_len-1) <= '0';
      end loop;
      rcv_to_read_pri_v <= rcv_to_read_pri_v_n;
      cache_read_v_p0 <= '0';
      cache_wea <= cache_wea_n;
      cache_we <= cache_we_n;
      -- assert cache_we = '0' or cache_addra /= X"23" severity failure;

      --stage 0 (read)

      --stage 1 (read)
      cache_addra <= cache_addra_n;
      rdAddr_p1 <= rcv_gmem_addr(rcv_to_read)(GMEM_WORD_ADDR_W-1 downto N);
      -- stage 1(write)
      cache_wrData <= write_word;
      
      --stage 2
      rdAddr_p0 <= rdAddr_p1;
      rcv_rd_done <= rcv_rd_done_n;
      
      --stage 3
      rdAddr <= rdAddr_p0;
      rdAck <= (others=>'0');
      for i in 0 to N_RECEIVERS-1 loop
        if rcv_rd_done(i) = '1' then
          rdAck(c_rcv_cu_indx(i)) <= '1';
        end if;
      end loop;

      if nrst = '0' then
        cache_read_v <= '0';
        cache_read_v_d0 <= '0';

        rcv_to_read <= 0;
        rcv_to_read_pri <= (others=>0);
      else
        --stage 0 (read)
        rcv_to_read_pri <= rcv_to_read_pri_n;
        rcv_to_read <= rcv_to_read_n;
        cache_read_v_p0 <= cache_read_v_p0_n;

        --stage 1 (read)
        cache_read_v <= cache_read_v_p0;
        -- stage 1(write)
        
        --stage 2
        cache_read_v_d0 <= cache_read_v;
      end if;
    end if;
  end process;
  -- process(rcv_gmem_addr, rcv_to_read, cache_read_v_p0, write_addr(3), write_v(3), cache_addra)
  -- begin
  --   cache_addra_n <= cache_addra;
  --   if cache_read_v_p0 = '1' then
  --     cache_addra_n <= rcv_gmem_addr(rcv_to_read)(L+M+N-1 downto N);
  --   elsif write_v(3) = '1' then
  --     cache_addra_n <= write_addr(3);
  --   end if;
  -- end process;
  process(rcv_gmem_addr, rcv_to_read, cache_read_v_p0, write_addr(3))
  begin
    if cache_read_v_p0 = '1' then
      cache_addra_n <= rcv_gmem_addr(rcv_to_read)(L+M+N-1 downto N);
    else
      cache_addra_n <= write_addr(3);
    end if;
  end process;
  process(write_v(3), cache_read_v_p0, write_be)
  begin
    if write_v(3) = '0' or cache_read_v_p0 = '0' then
      stall_write_pipe <= '0';
    else
      stall_write_pipe <= '1';
    end if;
    cache_wea_n <= (others=>'0');
    cache_we_n <= '0';
    if write_v(3) = '1' and cache_read_v_p0 = '0' then
      cache_wea_n <= write_be;
      cache_we_n <= '1';
    end if;
  end process;

  ---------------------------------------------------------------------------------------------------------}}}
  -- axi controllers --------------------------------------------------------------------------------------{{{
  axi_cntrl: entity axi_controllers port map(
    clk               => clk,
    axi_rdAddr        => axi_rdAddr,
    axi_wrAddr        => axi_wrAddr,
    wr_fifo_go        => wr_fifo_go,
    axi_writer_go     => axi_writer_go,
    axi_writer_ack    => axi_writer_ack,
    axi_writer_id     => axi_writer_id,
    wr_fifo_free      => wr_fifo_free,
    axi_writer_free   => axi_writer_free,
    wr_fifo_cache_rqst=> wr_fifo_cache_rqst,
    rd_fifo_cache_rqst=> rd_fifo_cache_rqst,
    wr_fifo_cache_ack => wr_fifo_cache_ack,
    rd_fifo_cache_ack => rd_fifo_cache_ack,
    wr_fifo_rqst_addr => wr_fifo_rqst_addr,
    rd_fifo_rqst_addr => rd_fifo_rqst_addr,
    wr_fifo_dout      => wr_fifo_dout,
    cache_dob         => cache_dob,
    rd_fifo_din_v     => rd_fifo_din_v,
    fifo_be_din       => fifo_be_din,

    axi_araddr        => axi_araddr,
    axi_arvalid       => axi_arvalid,
    axi_arready       => axi_arready,
    axi_arid          => axi_arid,
    axi_rdata         => axi_rdata,
    axi_rlast         => axi_rlast,
    axi_rvalid        => axi_rvalid,
    axi_rready        => axi_rready,
    axi_rid           => axi_rid,
    axi_awaddr        => axi_awaddr,
    axi_awvalid       => axi_awvalid,
    axi_awready       => axi_awready,
    axi_awid          => axi_awid,
    axi_wdata         => axi_wdata,
    axi_wstrb         => axi_wstrb,
    axi_wlast         => axi_wlast,
    axi_wvalid        => axi_wvalid_i,
    axi_wready        => axi_wready,
    axi_bvalid        => axi_bvalid,
    axi_bready        => axi_bready,
    axi_bid           => axi_bid,
    nrst              => nrst
  );
  ---------------------------------------------------------------------------------------------------------}}}
  -- tags mem ------------------------------------------------------------------------------------------- {{{
  process(write_addr, write_v, cache_addra, cache_we)
  begin
    for i in 0 to 3 loop
      write_pipe_wrTag(i) <= write_addr(i)(M+L-1 downto L);
      write_pipe_wrTag_valid(i) <= write_v(i);
    end loop;
    write_pipe_wrTag(4) <= cache_addra(M+L-1 downto L);
    write_pipe_wrTag_valid(4) <= cache_we;
  end process;

  tags_controller: entity gmem_cntrl_tag 
  port map(
    clk               => clk,
    wr_fifo_go        => wr_fifo_go,
    axi_writer_go     => axi_writer_go,
    axi_writer_ack    => axi_writer_ack,
    axi_writer_id     => axi_writer_id,
    wr_fifo_free      => wr_fifo_free,
    axi_writer_free   => axi_writer_free,
    axi_rd_fifo_filled=> rd_fifo_cache_ack,
    axi_rdAddr        => axi_rdAddr,
    axi_wrAddr        => axi_wrAddr,
    wr_fifo_cache_ack => wr_fifo_cache_ack,
    axi_wvalid        => axi_wvalid_i,

    --receivers signals 
    rcv_alloc_tag     => rcv_alloc_tag,
    rcv_rnw           => rcv_rnw,
    rcv_gmem_addr     => rcv_gmem_addr,

    rcv_read_tag      => rcv_read_tag,
    rcv_read_tag_ack  => rcv_read_tag_ack,
    
    rdData_page_v     => rdData_page_v,
    rdData_tag_v      => rdData_tag_v,
    rdData_tag        => rdData_tag,
    
    rcv_tag_written   => rcv_tag_written,
    rcv_tag_updated   => rcv_tag_updated,
    rcv_page_validated=> rcv_page_validated,  -- it is a one-cycle message

    cache_we          => cache_we,
    cache_addra       => cache_addra,
    cache_wea         => cache_wea,
    
    --finish
    WGsDispatched     => WGsDispatched,
    CUs_gmem_idle     => CUs_gmem_idle,
    rcv_all_idle      => rcv_all_idle,
    rcv_idle          => rcv_idle,
    finish_exec       => finish_exec_i,
    start_kernel      => start_kernel,
    clean_cache       => clean_cache,
    atomic_can_finish => atomic_can_finish,

    -- write pipeline
    write_pipe_active => write_pipe_wrTag_valid,
    write_pipe_wrTag  => write_pipe_wrTag,

    nrst              => nrst
  );
  ---------------------------------------------------------------------------------------------------------}}}
  -- atomics ----------------------------------------------------------------------------------------------{{{
  atomics_if: if ATOMIC_IMPLEMENT /=0 generate
    atomics_inst: entity gmem_atomics port map(
      clk               => clk,
      rcv_atomic_rqst   => rcv_atomic_rqst,
      rcv_atomic_ack    => rcv_atomic_ack,
      rcv_atomic_type   => rcv_atomic_type,
      rcv_gmem_addr     => rcv_gmem_addr,
      rcv_must_read     => rcv_must_read,
      rcv_gmem_data     => rcv_gmem_data,
      gmem_rdAddr_p0    => rdAddr_p0,
      gmem_rdData       => rdData_i,
      gmem_rdData_v_p0  => cache_read_v_d0,
      rcv_retire        => rcv_atomic_performed,
      atomic_rdData     => atomic_rdData,
      flush_ack         => flush_ack,
      flush_done        => flush_done,
      flush_v           => flush_v,
      flush_gmem_addr   => flush_gmem_addr,
      flush_data        => flush_data,
      finish            => finish_exec_i,
      atomic_can_finish => atomic_can_finish,
      WGsDispatched     => WGsDispatched,
      nrst              => nrst
    );
  end generate;
  ---------------------------------------------------------------------------------------------------------}}}
  -- receivers -------------------------------------------------------------------------------------------{{{
  receivers_trans: process(clk) -- {{{
  begin
    if rising_edge(clk) then
      rcv_gmem_addr <= rcv_gmem_addr_n;
      rcv_gmem_data <= rcv_gmem_data_n;
      rcv_be <= rcv_be_n;
      rcv_rnw <= rcv_rnw_n;

      cu_rnw_d0 <= cu_rnw;
      cu_we_d0 <= cu_we;
      cu_rqst_addr_d0 <= cu_rqst_addr;
      cu_wrData_d0 <= cu_wrData;
      

      if ATOMIC_IMPLEMENT /= 0 then
        rcv_atomic_sgntr <= rcv_atomic_sgntr_n;
        rcv_atomic <= rcv_atomic_n;
        cu_atomic_d0 <= cu_atomic;
        cu_atomic_sgntr_d0 <= cu_atomic_sgntr;
        cu_atomic_ack_p0 <= (others=>'0');
        if flush_ack = '1' then
          cu_atomic_d0(0) <= '0';
          cu_rqst_addr_d0(0) <= flush_gmem_addr;
          cu_wrData_d0(0) <= flush_data;
          cu_we_d0(0) <= (others=>'1');
          cu_rnw_d0(0) <= '0';
        end if;
        for i in 0 to N_RECEIVERS-1 loop
          if rcv_atomic_performed(i) = '1' then
            cu_atomic_ack_p0(c_rcv_cu_indx(i)) <= '1';
          end if;
        end loop;
        atomic_rdData_v <= cu_atomic_ack_p0;

        for i in 0 to N_RECEIVERS-1 loop
          if rcv_atomic_performed(i) = '1' then
            atomic_sgntr_p0 <= rcv_atomic_sgntr(i);
          end if;
        end loop;
        atomic_sgntr <= atomic_sgntr_p0;
      end if;



      if rcv_idle = (rcv_idle'reverse_range => '1') then
        rcv_all_idle <= '1';
      else
        rcv_all_idle <= '0';
      end if;
      rcv_priority <= rcv_priority_n;
      rcv_go <= rcv_go_n;
      for i in 0 to N_RECEIVERS-1 loop
        if rdData_tag(c_rcv_bank_indx(i)) = rcv_gmem_addr(i)(GMEM_WORD_ADDR_W-1 downto L+M+N) and rdData_tag_v(c_rcv_bank_indx(i)) = '1' then
          rcv_tag_compared(i) <= '1';
        else
          rcv_tag_compared(i) <= '0';
        end if;
      end loop;
      rdData_page_v_d0 <= rdData_page_v;
      rcv_wait_1st_cycle <= rcv_wait_1st_cycle_n;
      rcv_request_write_data <= rcv_request_write_data_n;
      if nrst = '0' then
        st_rcv <= (others=>get_addr);
        rcv_idle <= (others=>'0');
        rcv_read_tag <= (others=>'0');
        if ATOMIC_IMPLEMENT /= 0 then
          rcv_atomic_rqst <= (others=>'0');
        end if;
        rcv_alloc_tag <= (others=>'0');
        rcv_perform_read <= (others=>'0');
        rcv_request_write_addr <= (others=>'0');
      else
        st_rcv <= st_rcv_n;
        rcv_idle <= rcv_idle_n;
        rcv_read_tag <= rcv_read_tag_n;
        if ATOMIC_IMPLEMENT /= 0 then
          rcv_atomic_rqst <= rcv_atomic_rqst_n;
        end if;
        rcv_alloc_tag <= rcv_alloc_tag_n;
        rcv_perform_read <= rcv_perform_read_n;
        rcv_request_write_addr <= rcv_request_write_addr_n;
      end if;
    end if;
  end process; -- }}}
  rcv_comb: for i in 0 to N_RECEIVERS-1 generate
  begin
    rcv_com: process  (st_rcv(i), rcv_gmem_addr(i), cu_rqst_addr_d0(c_rcv_cu_indx(i)), rcv_read_tag(i), rcv_be(i), rcv_rnw(i), rcv_idle(i),   -- {{{
                      rcv_write_in_pipeline(i), cu_we_d0(c_rcv_cu_indx(i)), rcv_tag_compared(i), rcv_go(i), rcv_read_tag_ack(i), rcv_atomic_sgntr(i),
                      rcv_alloc_tag(i), rdData_page_v_d0(c_rcv_bank_indx(i)), rcv_atomic_rqst(i), cu_rnw_d0(c_rcv_cu_indx(i)),
                      cu_wrData_d0(c_rcv_cu_indx(i)), rcv_tag_written(i), rcv_tag_updated(i), rcv_request_write_addr(i), rcv_request_write_data(i),
                      rcv_perform_read(i), cache_addra, cache_read_v, rcv_page_validated(i), cache_we, rcv_will_write(i), rcv_gmem_data(i), 
                      rcv_priority(i), rcv_atomic_ack(i), rcv_will_write_d0(i), rcv_wait_1st_cycle(i), cu_atomic_d0(c_rcv_cu_indx(i)), rcv_atomic(i), 
                      rcv_must_read(i), rcv_atomic_performed(i),
                      cu_atomic_sgntr_d0(c_rcv_cu_indx(i))) 
      variable li          : line; -- }}}
    begin
      -- assignments {{{
      st_rcv_n(i) <= st_rcv(i); 
      rcv_gmem_addr_n(i) <= rcv_gmem_addr(i);
      rcv_gmem_data_n(i) <= rcv_gmem_data(i);
      rcv_read_tag_n(i) <= rcv_read_tag(i);
      if ATOMIC_IMPLEMENT /= 0 then
        rcv_atomic_rqst_n(i) <= rcv_atomic_rqst(i);
      end if;
      rcv_rnw_n(i) <= rcv_rnw(i);
      rcv_atomic_n(i) <= rcv_atomic(i);
      rcv_perform_read_n(i) <= rcv_perform_read(i);
      rcv_request_write_addr_n(i) <= rcv_request_write_addr(i);
      rcv_request_write_data_n(i) <= rcv_request_write_data(i);
      rcv_wait_1st_cycle_n(i) <= rcv_wait_1st_cycle(i);
      rcv_alloc_tag_n(i) <= rcv_alloc_tag(i);
      rcv_be_n(i) <= rcv_be(i);
      rcv_atomic_sgntr_n(i) <= rcv_atomic_sgntr(i);
      rcv_idle_n(i) <= rcv_idle(i);
      rcv_priority_n(i) <= rcv_priority(i);
      rcv_rd_done_n(i) <= '0';
      --}}}
      case st_rcv(i) is
        when get_addr => -- {{{
          -- rcv_be_n(i) <= (others=>'0');
          rcv_idle_n(i) <= '1';
          rcv_wait_1st_cycle_n(i) <= '0';
          rcv_request_write_data_n(i) <= '0';
          rcv_priority_n(i) <= (others=>'0');
          rcv_rnw_n(i) <= cu_rnw_d0(c_rcv_cu_indx(i));
          if rcv_go(i) = '1' then
            rcv_gmem_addr_n(i) <= unsigned(cu_rqst_addr_d0(c_rcv_cu_indx(i)));
            rcv_be_n(i) <= cu_we_d0(c_rcv_cu_indx(i));
            rcv_atomic_sgntr_n(i) <= cu_atomic_sgntr_d0(c_rcv_cu_indx(i));
            rcv_gmem_data_n(i) <= cu_wrData_d0(c_rcv_cu_indx(i));
            rcv_atomic_n(i) <= cu_atomic_d0(c_rcv_cu_indx(i));
            -- assert to_integer(unsigned(cu_rqst_addr_d0(c_rcv_cu_indx(i)))) = 792 or cu_rnw_d0(c_rcv_cu_indx(i)) = '1' severity failure;
            if cu_atomic_d0(c_rcv_cu_indx(i)) = '0' then
              st_rcv_n(i) <= get_read_tag_ticket;
              rcv_read_tag_n(i) <= '1';
            else
              st_rcv_n(i) <= requesting_atomic;
              if ATOMIC_IMPLEMENT /= 0 then
                rcv_atomic_rqst_n(i) <= '1';
              end if;
            end if;
            rcv_idle_n(i) <= '0';
          end if; -- }}}
        when requesting_atomic => -- {{{
          if ATOMIC_IMPLEMENT /= 0 then 
            rcv_priority_n(i) <= rcv_priority(i) + 1;
            if rcv_priority(i) = (rcv_priority(i)'reverse_range=>'1') then
              rcv_atomic_rqst_n(i) <= '1';
            end if;
            if rcv_atomic_ack(i) = '1' then
              rcv_atomic_rqst_n(i) <= '0';
            end if;
            if rcv_must_read(i) = '1' then  -- rcv_must_read & rcv_atomic_performed cann't be at 1 simultaneously
              rcv_atomic_rqst_n(i) <= '0';
              rcv_rnw_n(i) <= '1';
              st_rcv_n(i) <= get_read_tag_ticket;
              rcv_read_tag_n(i) <= '1';
            end if;
            if rcv_atomic_performed(i) = '1' then
              rcv_atomic_rqst_n(i) <= '0';
              st_rcv_n(i) <= get_addr;
            end if;
          end if; 
          -- }}}
        when get_read_tag_ticket => -- rdAddr of tag mem is being selected {{{
          if rcv_read_tag_ack(i) = '1' then
            st_rcv_n(i) <= wait_read_tag;
            rcv_read_tag_n(i) <= '0';
          end if; -- }}}
        when wait_read_tag => --address is fixed and tag mem is being read {{{
          rcv_wait_1st_cycle_n(i) <= '1';
          if rcv_tag_written(i) = '1' then 
            if rcv_rnw(i) = '1' then
              st_rcv_n(i) <= clean;
              rcv_alloc_tag_n(i) <= '1';
            else
              if rcv_rnw(i) = '1' then
                st_rcv_n(i) <= read_cache;
                rcv_perform_read_n(i) <= '1';
              else
                st_rcv_n(i) <= request_write_addr;
                rcv_request_write_addr_n(i) <= '1';
                rcv_request_write_data_n(i) <= '1';
              end if;
            end if;
          elsif rcv_tag_updated(i) = '1' then
            st_rcv_n(i) <= alloc_tag;
            rcv_alloc_tag_n(i) <= '1';
          else
            if rcv_wait_1st_cycle(i) = '1' then
              if rcv_rnw(i) = '1' then
                st_rcv_n(i) <= check_tag_rd;
              else
                st_rcv_n(i) <= check_tag_wr;
              end if;
            end if;
          end if; --}}}
        when check_tag_rd => -- rdData of tag mem are ready {{{
          if rcv_tag_updated(i) = '1' or (rcv_tag_written(i) = '0' and rcv_tag_compared(i) = '0') then
            st_rcv_n(i) <= alloc_tag;
            rcv_alloc_tag_n(i) <= '1';
          elsif rcv_tag_compared(i) = '1' and rdData_page_v_d0(c_rcv_bank_indx(i)) = '1' then
            st_rcv_n(i) <= read_cache;
            rcv_perform_read_n(i) <= '1';
          elsif rcv_page_validated(i) = '0' then --if rcv_rnw(i) = '1' and ( rcv_tag_written(i) = '1' or (rcv_tag_compared(i) = '1' and rdData_page_v_d0(c_rcv_bank_indx(i)) = '0' ) ) the
            st_rcv_n(i) <= clean;
            rcv_alloc_tag_n(i) <= '1';
          else
            st_rcv_n(i) <= read_cache;
            rcv_perform_read_n(i) <= '1';
          end if; -- }}}
        when check_tag_wr => -- rdData of tag mem are ready {{{
          if rcv_tag_updated(i) = '1' or (rcv_tag_written(i) = '0' and rcv_tag_compared(i) = '0') then
            st_rcv_n(i) <= alloc_tag;
            rcv_alloc_tag_n(i) <= '1';
          elsif rcv_tag_written(i) = '1' or rcv_tag_compared(i) = '1' then
            st_rcv_n(i) <= request_write_addr;
            rcv_request_write_addr_n(i) <= '1';
            rcv_request_write_data_n(i) <= '1';
          else 
            st_rcv_n(i) <= clean;
            rcv_alloc_tag_n(i) <= '1';
          end if; --}}}
        when alloc_tag => -- {{{
          if rcv_tag_written(i) = '1' then
            if rcv_rnw(i) = '1' then
              st_rcv_n(i) <= clean;
            else
              st_rcv_n(i) <= request_write_addr;
              rcv_request_write_addr_n(i) <= '1';
              rcv_request_write_data_n(i) <= '1';
              rcv_alloc_tag_n(i) <= '0';
            end if;
          end if; --}}}
        when clean =>  --{{{
          if rcv_tag_updated(i) = '1' then
            st_rcv_n(i) <= alloc_tag;
          elsif rcv_page_validated(i) = '1' then
            rcv_alloc_tag_n(i) <= '0';
            if rcv_rnw(i) = '1' then
              st_rcv_n(i) <= read_cache;
              rcv_perform_read_n(i) <= '1';
            else
              st_rcv_n(i) <= request_write_addr;
              rcv_request_write_addr_n(i) <= '1';
              rcv_request_write_data_n(i) <= '1';
            end if;
          end if; -- }}}
        when read_cache => -- {{{
          if rcv_tag_updated(i) = '1' then
            st_rcv_n(i) <= alloc_tag;
            rcv_alloc_tag_n(i) <= '1';
            rcv_perform_read_n(i) <= '0';
          elsif (cache_addra = rcv_gmem_addr(i)(L+M+N-1 downto N)) and cache_read_v = '1' then
            rcv_perform_read_n(i) <= '0';
            if ATOMIC_IMPLEMENT /= 0 and rcv_atomic(i) = '1' then
              rcv_atomic_rqst_n(i) <= '1';
              st_rcv_n(i) <= requesting_atomic;
            else
              st_rcv_n(i) <= get_addr;
              rcv_idle_n(i) <= '1';
              rcv_rd_done_n(i) <= '1';
            end if;
          end if;
          if rcv_priority(i) /= (rcv_priority(i)'reverse_range=>'1') then
            rcv_priority_n(i) <= rcv_priority(i) + 1;
          end if; -- }}}
        when request_write_addr => -- {{{
          if rcv_tag_updated(i) = '1' then
            st_rcv_n(i) <= alloc_tag;
            rcv_alloc_tag_n(i) <= '1';
            rcv_request_write_addr_n(i) <= '0';
            rcv_request_write_data_n(i) <= '0';
          elsif rcv_will_write(i) = '1' then
            rcv_request_write_addr_n(i) <= '0';
            rcv_request_write_data_n(i) <= '0';
            st_rcv_n(i) <= write_cache;
          elsif rcv_write_in_pipeline(i) = '1' then
            rcv_request_write_addr_n(i) <= '0';
            st_rcv_n(i) <= request_write_data;
          end if;
          if rcv_priority(i) /= (rcv_priority(i)'reverse_range=>'1') then
            rcv_priority_n(i) <= rcv_priority(i) + 1;
          end if; -- }}}
        when request_write_data => -- {{{
          if rcv_will_write(i) = '1' then
            st_rcv_n(i) <= write_cache;
            rcv_request_write_data_n(i) <= '0';
          end if; -- }}}
        when write_cache=> -- {{{
          --   assert std_logic_vector(rcv_gmem_addr(i)(15 downto 0)) = rcv_gmem_data(i)(15 downto 0);
          if cache_we = '1' and rcv_will_write_d0(i) = '0' then
            st_rcv_n(i) <= get_addr;
            rcv_idle_n(i) <= '1';
          end if; -- }}}
      end case;
    end process;
  end generate;
  ---------------------------------------------------------------------------------------------------------}}}
  -- interface to CUs ----------------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      cu_ready_i <= cu_ready_n;
      cuIndx_msb <= not cuIndx_msb;
      if ATOMIC_IMPLEMENT /= 0 then
        flush_ack <= flush_ack_n;
        flush_rcv_index <= flush_rcv_index_n;
        flush_done <= rcv_idle(flush_rcv_index);
      end if;
    end if;
  end process;
  process(cu_valid, cu_ready_i, rcv_idle, cuIndx_msb, rcv_idle_n, flush_v, flush_ack, flush_rcv_index)
    variable rcvIndx: unsigned(N_RECEIVERS_W-1 downto 0) := (others=>'0');
  begin
    rcv_go_n <= (others=>'0');
    -- setting ready signal for CU0
    cu_ready_n(0) <= '0';
    flush_ack_n <= '0';
    if ATOMIC_IMPLEMENT /= 0 then
      flush_rcv_index_n <= flush_rcv_index;
    end if;
    for j in N_RECEIVERS_CU/2-1 downto 0 loop
      rcvIndx(N_RECEIVERS_W-1 downto N_RECEIVERS_W-max(N_CU_W, 1)) := to_unsigned(0, max(1, N_CU_W));
      rcvIndx(N_RECEIVERS_CU_W-1) := not cuIndx_msb;
      rcvIndx(N_RECEIVERS_CU_W-2 downto 0) := to_unsigned(j, N_RECEIVERS_CU_W-1);
      if rcv_idle_n(to_integer(rcvIndx)) = '1' then
        if ATOMIC_IMPLEMENT /= 0 and flush_v = '1' and flush_ack = '0' then
          flush_ack_n <= '1';
          cu_ready_n(0) <= '0';
        else
          flush_ack_n <= '0';
          cu_ready_n(0) <= '1';
        end if;
      end if;
    end loop;
    -- starting receviers for CU0
    if (cu_valid(0) = '1' and cu_ready_i(0) = '1') or (ATOMIC_IMPLEMENT /= 0 and flush_v = '1' and flush_ack = '1' ) then
      for j in N_RECEIVERS_CU/2-1 downto 0 loop
        rcvIndx(N_RECEIVERS_W-1 downto N_RECEIVERS_W-max(1,N_CU_W)) := to_unsigned(0, max(1, N_CU_W));
        rcvIndx(N_RECEIVERS_CU_W-1) := cuIndx_msb;
        rcvIndx(N_RECEIVERS_CU_W-2 downto 0) := to_unsigned(j, N_RECEIVERS_CU_W-1);
        if rcv_idle(to_integer(rcvIndx)) = '1' then
          rcv_go_n(to_integer(rcvIndx)) <= '1';
          flush_rcv_index_n <= to_integer(rcvIndx);
          exit;
        end if;
      end loop;
    end if;
    
    -- other receivers
    if N_CU > 1 then
      for i in 1 to max(N_CU-1,1) loop
        -- starting receviers
        if cu_valid(i) = '1' and cu_ready_i(i) = '1' then
          for j in N_RECEIVERS_CU/2-1 downto 0 loop
            rcvIndx(N_RECEIVERS_W-1 downto N_RECEIVERS_W-max(1,N_CU_W)) := to_unsigned(i, max(1, N_CU_W));
            rcvIndx(N_RECEIVERS_CU_W-1) := cuIndx_msb;
            rcvIndx(N_RECEIVERS_CU_W-2 downto 0) := to_unsigned(j, N_RECEIVERS_CU_W-1);
            if rcv_idle(to_integer(rcvIndx)) = '1' then
              rcv_go_n(to_integer(rcvIndx)) <= '1';
              exit;
            end if;
          end loop;
        end if;
        -- setting ready signal
        cu_ready_n(i) <= '0';
        for j in N_RECEIVERS_CU/2-1 downto 0 loop
          rcvIndx(N_RECEIVERS_W-1 downto N_RECEIVERS_W-max(N_CU_W, 1)) := to_unsigned(i, max(1, N_CU_W));
          rcvIndx(N_RECEIVERS_CU_W-1) := not cuIndx_msb;
          rcvIndx(N_RECEIVERS_CU_W-2 downto 0) := to_unsigned(j, N_RECEIVERS_CU_W-1);
          if rcv_idle_n(to_integer(rcvIndx)) = '1' then
            cu_ready_n(c_rcv_cu_indx(to_integer(rcvIndx))) <= '1';
          end if;
        end loop;
      end loop;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
end Behavioral;
