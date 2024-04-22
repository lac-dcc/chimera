-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.all;
use work.FGPU_definitions.all;
---------------------------------------------------------------------------------------------------------}}}
entity CU_mem_cntrl is --{{{
port(
  clk                     : in std_logic;
  -- from the CV
  cv_wrData               : in SLV32_ARRAY(CV_SIZE-1 downto 0); -- level 17.
  cv_addr                 : in GMEM_ADDR_ARRAY; -- level 17.
  cv_gmem_we              : in std_logic;
  cv_gmem_re              : in std_logic;
  cv_gmem_atomic          : in std_logic;
  cv_lmem_rqst            : in std_logic; --  level 17.
  cv_lmem_we              : in std_logic;
  cv_op_type              : in std_logic_vector(2 downto 0); -- level 17.
  cv_alu_en               : in std_logic_vector(CV_SIZE-1 downto 0);
  cv_alu_en_pri_enc       : in integer range 0 to CV_SIZE-1 := 0;
  cv_rd_addr              : in unsigned(REG_FILE_W-1 downto 0);
  -- to the CV
  regFile_wrAddr          : out unsigned(REG_FILE_W-1 downto 0) := (others=>'0'); -- stage -1 (stable for 3 clock cycles)
  regFile_we              : out std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0'); -- stage 0 (stable for 2 clock cycles) (level 20. for loads from lmem)
  regFile_wrData          : out SLV32_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0')); -- stage 0 (stable for 2 clock cycles)
  regFile_we_lmem_p0      : out std_logic := '0'; -- level 19.
  
  -- interface to the global memory controller
  cache_rdAck             : in std_logic := '0';
  cache_rdAddr            : in unsigned(GMEM_WORD_ADDR_W-CACHE_N_BANKS_W-1 downto 0);
  cache_rdData            : in std_logic_vector(DATA_W*CACHE_N_BANKS-1 downto 0);
  atomic_rdData           : in std_logic_vector(DATA_W-1 downto 0) := (others=>'0');
  atomic_rdData_v         : in std_logic := '0';
  atomic_sgntr            : in std_logic_vector(N_CU_STATIONS_W-1 downto 0) := (others=>'0');
  gmem_wrData             : out std_logic_vector(DATA_W-1 downto 0) := (others=>'0');
  gmem_valid              : out std_logic := '0';  
  gmem_we                 : out std_logic_vector(DATA_W/8-1 downto 0) := (others=>'0');
  gmem_rnw                : out std_logic := '0';
  gmem_atomic             : out std_logic := '0';
  gmem_atomic_sgntr       : out std_logic_vector(N_CU_STATIONS_W-1 downto 0) := (others=>'0');
  gmem_ready              : in std_logic;
  gmem_rqst_addr          : out unsigned(GMEM_WORD_ADDR_W-1 downto 0) := (others=>'0');

  -- to CU scheduler
  wf_finish               : out std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  
  finish_exec             : in std_logic := '0';
  cntrl_idle              : out std_logic := '0';

  nrst                    : in std_logic
);
end entity; --}}}
architecture Behavioral of CU_mem_cntrl is 
  -- signals definitions ---------------------------------------------------------------------{{{
  -- internal signals definitions {{{
  signal gmem_valid_i                     : std_logic := '0';  
  signal regFile_wrAddr_i                 : unsigned(REG_FILE_W-1 downto 0) := (others=>'0');  
  signal cntrl_idle_i                     : std_logic := '0';
  -- }}}
  -- constants & functions {{{
  constant N_STATIONS                  : natural := CV_SIZE*N_STATIONS_ALU;
  type stations_for_alu_array is array(CV_SIZE-1 downto 0) of nat_array(N_STATIONS_ALU-1 downto 0);
  --  functions ------------------------------------------------------------------ {{{

  function distribute_stations_on_ALUs(n_stations: integer; n_alus: integer) return nat_array is
    variable res: nat_array(n_stations-1 downto 0) := (others=>0);
  begin
    
    for i in 0 to n_stations-1 loop
      for k in 0 to n_alus-1 loop
        if i < (k+1)*(n_stations/n_alus) and i >= k*(n_stations/n_alus) then
          res(i) := k;
          exit;
        end if;
      end loop;
    end loop;
    return res;
  end function;
  
  function order_stations_by_priority(n_stations: integer; n_alus: integer) return nat_array is
    -- variable res: nat_array(n_stations-1 downto 0) := (0=>13, 1=>15, 2=>0, 3=>2, 4=>4, 5=>6, 6=>8, 7=>10, 8=>12, 9=>14, 10=>1, 11=>3, 12=>5, 13=>7, 14=>9, 15=>11);
    -- variable res: nat_array(n_stations-1 downto 0) := (0=>9, 1=>11, 2=>13, 3=>15, 4=>0, 5=>2, 6=>4, 7=>6, 8=>8, 9=>10, 10=>12, 11=>14, 12=>1, 13=>3, 14=>5, 15=>7);
    variable res: nat_array(n_stations-1 downto 0) := (others=>0);
  begin
    -- if n_stations /= 16 or n_alus /= 8 then
      for i in 0 to n_alus-1 loop
        for j in 0 to n_stations/n_alus -1 loop
            res(i + j*n_alus) := i*n_stations/n_alus + j;
        end loop;
      end loop;
    -- end if;
    return res;
  end function;

  function distribute_alus_on_stations(n_stations: natural; n_alus: natural) return stations_for_alu_array is
    variable res: stations_for_alu_array := (others=>(others=>0));
  begin
    for k in 0 to n_alus-1 loop
      for j in 0 to (n_stations/n_alus)-1 loop
        res(k)(j) := k*n_stations/n_alus + j;
      end loop;
    end loop;
    return res;
  end function;

  -------------------------------------------------------------------------------------}}}

  --station signals
  constant c_alu_for_stations             : nat_array(N_STATIONS-1 downto 0) := distribute_stations_on_ALUs(N_STATIONS, CV_SIZE);
  constant c_stations_for_alus            : stations_for_alu_array := distribute_alus_on_stations(N_STATIONS, CV_SIZE);
  constant c_stations_ordered_for_priority: nat_array(N_STATIONS-1 downto 0) := order_stations_by_priority(N_STATIONS, CV_SIZE);
  --- }}}
  -- finish signals {{{
  type st_finish_type is (idle, serving, finished);
  type st_finish_array_type is array (natural range<>) of st_finish_type;
  signal st_finish, st_finish_n           : st_finish_array_type(N_WF_CU-1 downto 0) := (others=>idle);
  signal check_finish                     : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal check_finish_n                   : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal wf_finish_n                      : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal wfs_being_served                 : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  -- }}}
  -- stations signals {{{
  type st_station_type is (idle, get_ticket, wait_read_done, write_back, wait_atomic);
  type st_station_array is array(natural range <>) of st_station_type;
  signal st_stations, st_stations_n       : st_station_array(N_STATIONS-1 downto 0) := (others=>idle);
  signal station_gmem_addr                : gmem_addr_array(N_STATIONS-1 downto 0) := (others=>(others=>'0'));
  signal station_gmem_addr_n              : gmem_addr_array(N_STATIONS-1 downto 0) := (others=>(others=>'0'));
  signal station_rd_addr                  : reg_addr_array(N_STATIONS-1 downto 0) := (others=>(others=>'0'));
  signal station_rd_addr_n                : reg_addr_array(N_STATIONS-1 downto 0) := (others=>(others=>'0'));
  signal station_free, station_free_n     : std_logic_vector(N_STATIONS-1 downto 0) := (others=>'0');
  signal station_wait_atomic              : std_logic_vector(N_STATIONS-1 downto 0) := (others=>'0');
  signal station_wait_atomic_n            : std_logic_vector(N_STATIONS-1 downto 0) := (others=>'0');
  signal station_go, station_go_n         : std_logic_vector(N_STATIONS-1 downto 0) := (others=>'0');
  signal station_rnw, station_rnw_n       : std_logic_vector(N_STATIONS-1 downto 0) := (others=>'0');
  signal station_atomic, station_atomic_n : std_logic_vector(N_STATIONS-1 downto 0) := (others=>'0');
  signal station_perfomed                 : std_logic_vector(N_STATIONS-1  downto 0) := (others=>'0');
  signal station_perfomed_n               : std_logic_vector(N_STATIONS-1  downto 0) := (others=>'0');
  signal station_rdData_n, station_rdData : SLV32_ARRAY(N_STATIONS-1 downto 0) := (others=>(others=>'0'));
  signal station_wrData_n, station_wrData : SLV32_ARRAY(N_STATIONS-1 downto 0) := (others=>(others=>'0'));
  type op_type_array is array (natural range <>) of std_logic_vector(2 downto 0);
  signal station_op_type                  : op_type_array(N_STATIONS-1 downto 0) := (others=>(others=>'0'));
  signal station_op_type_n                : op_type_array(N_STATIONS-1 downto 0) := (others=>(others=>'0'));
  signal station_written_back             : std_logic_vector(N_STATIONS-1 downto 0) := (others=>'0');
  signal station_written_back_n           : std_logic_vector(N_STATIONS-1 downto 0) := (others=>'0');
  signal regFile_we_latch                 : std_logic := '0';
  signal regFile_we_latch_p0              : std_logic := '0';
  signal regFile_we_latch_p0_n            : std_logic := '0';
  signal ticket_granted                   : std_logic_vector(N_STATIONS-1 downto 0) := (others=>'0');
  signal stations_prefered                : integer range 0 to N_STATIONS_ALU-1 := 0;
  signal station_read_performed_n         : std_logic_vector(N_STATIONS-1 downto 0) := (others=>'0');
  signal station_atomic_perormed          : std_logic_vector(N_STATIONS-1 downto 0) := (others=>'0');
  signal atomic_rdData_v_d0               : std_logic := '0';
  signal atomic_rdData_v_d1               : std_logic := '0';
  signal atomic_rdData_d0                 : std_logic_vector(DATA_W-1 downto 0) := (others=>'0');
  signal atomic_rdData_d1                 : std_logic_vector(DATA_W-1 downto 0) := (others=>'0');
  attribute max_fanout of atomic_rdData_d1 : signal is 10;
  signal atomic_sgntr_d0                  : std_logic_vector(N_CU_STATIONS_W-1 downto 0) := (others=>'0');
  signal station_last_atomic_serve        : integer range 0 to N_STATIONS-1 := 0;
  signal station_wf_indx                  : wf_active_array(N_STATIONS-1 downto 0) := (others=>(others=>'0'));
  signal station_wf_indx_n                : wf_active_array(N_STATIONS-1 downto 0) := (others=>(others=>'0'));
  -- }}}
  -- memory requests buffer {{{
  -- 0..31: DATA, 32:63: ADDR, 64:re, 65:atomic, 66..68: op_type, 69:alu_en, 70..80: rd_addr
  constant MEM_RQST_W                     : integer := DATA_W+GMEM_ADDR_W+1+1+3+1+REG_FILE_W; 
  constant MEM_RQST_DATA_LOW              : integer := 0;
  constant MEM_RQST_DATA_HIGH             : integer := MEM_RQST_DATA_LOW+DATA_W-1; -- 31
  constant MEM_RQST_ADDR_LOW              : integer := MEM_RQST_DATA_HIGH+1; -- 32
  constant MEM_RQST_ADDR_HIGH             : integer := MEM_RQST_ADDR_LOW+GMEM_ADDR_W-1; -- 63
  constant MEM_RQST_RE_POS                : integer := MEM_RQST_ADDR_HIGH+1; -- 64
  constant MEM_RQST_ATOMIC_POS            : integer := MEM_RQST_RE_POS+1; -- 65
  constant MEM_RQST_OP_TYPE_LOW           : integer := MEM_RQST_ATOMIC_POS+1; -- 66
  constant MEM_RQST_OP_TYPE_HIGH          : integer := MEM_RQST_OP_TYPE_LOW+2; -- 68
  constant MEM_RQST_ALU_EN_POS            : integer := MEM_RQST_OP_TYPE_HIGH+1; -- 69
  constant MEM_RQST_RD_ADDR_LOW           : integer := MEM_RQST_ALU_EN_POS+1; -- 70
  constant MEM_RQST_RD_ADDR_HIGH          : integer := MEM_RQST_RD_ADDR_LOW+REG_FILE_W-1; -- 80

  type mem_rqsts_buffer_type is array(natural range <>) of std_logic_vector(CV_SIZE*MEM_RQST_W-1 downto 0);
  signal mem_rqsts                        : mem_rqsts_buffer_type(N_WF_CU*2**(PHASE_W)-1 downto 0) := (others=>(others=>'0'));
  signal mem_rqsts_data                   : SLV32_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0')); -- alias
  signal mem_rqsts_addr                   : gmem_addr_array(CV_SIZE-1 downto 0) := (others=>(others=>'0')); -- alias
  signal mem_rqsts_re                     : std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0'); --alias
  signal mem_rqsts_atomic                 : std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0'); --alias
  signal mem_rqsts_op_type                : op_type_array(CV_SIZE-1 downto 0) := (others=>(others=>'0')); -- alias
  signal mem_rqsts_rd_addr                : reg_addr_array(CV_SIZE-1 downto 0) := (others=>(others=>'0')); -- alias
  signal mem_rqsts_alu_en                 : std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0'); --alias
  signal mem_rqsts_rdAddr                 : unsigned(N_WF_CU_W+PHASE_W-1 downto 0) := (others=>'0');
  signal mem_rqsts_rdAddr_inc_n           : std_logic := '0';
  signal mem_rqsts_wrAddr                 : unsigned(N_WF_CU_W+PHASE_W-1 downto 0) := (others=>'0');
  type mem_rqsts_array is array(natural range <>) of std_logic_vector(MEM_RQST_W-1 downto 0);
  signal mem_rqsts_rdData_n               : std_logic_vector(CV_SIZE*MEM_RQST_W-1 downto 0) := (others=>'0');
  signal mem_rqsts_rdData                 : std_logic_vector(CV_SIZE*MEM_RQST_W-1 downto 0) := (others=>'0');
  signal mem_rqsts_rdData_ltchd_n         : mem_rqsts_array(CV_SIZE-1 downto 0) := (others=>(others=>'0'));
  signal mem_rqsts_rdData_ltchd           : mem_rqsts_array(CV_SIZE-1 downto 0) := (others=>(others=>'0'));
  attribute max_fanout of mem_rqsts_rdData_ltchd : signal is 300;
  signal mem_rqsts_phase_ltchd            : std_logic_vector(PHASE_W-1 downto 0) := (others=>'0');
  signal mem_rqsts_phase_ltchd_n          : std_logic_vector(PHASE_W-1 downto 0) := (others=>'0');
  signal mem_rqsts_wf_indx_ltchd          : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal mem_rqsts_wf_indx_ltchd_n        : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal mem_rqsts_wrData                 : std_logic_vector(CV_SIZE*MEM_RQST_W-1 downto 0) := (others=>'0');
  signal mem_rqsts_we                     : std_logic := '0';
  signal mem_rqst_waiting                 : std_logic := '0';
  signal mem_rqst_waiting_p0              : std_logic := '0';
  signal mem_rqsts_nserved                : std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0');
  signal mem_rqsts_nserved_n              : std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0');
  -- }}}
  -- CV side signals {{{
  type st_cv_side_type is (get_rqst, fill_stations, wait_update);
  signal st_cv_side, st_cv_side_n         : st_cv_side_type := get_rqst;
  signal latch_rdData, latch_rdData_n     : std_logic_vector(N_STATIONS-1 downto 0) := (others=>'0');
  -- }}}
  -- regFile signals {{{
  type regFile_interface_type is (choose_rd_addr, update, wait_1_cycle, wait_scratchpad);
  signal st_regFile_int, st_regFile_int_n : regFile_interface_type := choose_rd_addr;
  signal regFile_wrAddr_p0_n              : unsigned(REG_FILE_W-1 downto 0) := (others=>'0');  
  signal regFile_wrAddr_p0                : unsigned(REG_FILE_W-1 downto 0) := (others=>'0');  
  signal regFile_we_p0_n, regFile_we_p0   : std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0');
  -- }}}
  -- signals of the request waiting to be processed {{{
  type st_waiting_type is (free, one_serve_zero_wait, one_serve_one_wait, zero_serve_one_wait);
  type cv_wrData_waiting_type is array(natural range <>) of SLV32_ARRAY(CV_SIZE-1 downto 0);
  type cv_addr_waiting_type is array(natural range <>) of GMEM_ADDR_ARRAY(CV_SIZE-1 downto 0);
  -- }}}
  -- mem interface {{{
  signal station_get_ticket               : std_logic_vector(N_STATIONS-1 downto 0) := (others=>'0');
  signal station_get_ticket_n             : std_logic_vector(N_STATIONS-1 downto 0) := (others=>'0');
  -- fifo line
  -- addr                 station_sgntr     atomic  data        rnw     we
  -- GMEM_WORD_ADDR_W     N_CU_STATIONS_W   1       DATA_W      1       DATA_W/8
  type fifo_type is array (natural range <>) of std_logic_vector(DATA_W+1+DATA_W/8+N_CU_STATIONS_W downto 0);
  type fifo_addr_type is array (natural range <>) of std_logic_vector(GMEM_ADDR_W-1 downto 0);
  signal fifo                             : fifo_type(2**FIFO_ADDR_W-1 downto 0) := (others=>(others=>'0'));
  signal fifo_addr                        : fifo_addr_type(2**FIFO_ADDR_W-1 downto 0) := (others=>(others=>'0'));
  signal fifo_wrAddr, fifo_rdAddr         : unsigned(FIFO_ADDR_W-1 downto 0) := (others=>'0');
  signal fifo_wrAddr_n, fifo_rdAddr_n     : unsigned(FIFO_ADDR_W-1 downto 0) := (others=>'0');
  signal push, push_d0                    : std_logic := '0';
  signal push_rqst_fifo_n                 : std_logic := '0';
  signal fifo_full                        : std_logic := '0';
  signal pop                              : std_logic := '0';
  signal din_rqst_fifo, din_rqst_fifo_d0  : std_logic_vector(DATA_W+1+DATA_W/8+N_CU_STATIONS_W downto 0) := (others=>'0');
  signal din_rqst_fifo_addr               : std_logic_vector(GMEM_ADDR_W-1 downto 0) := (others=>'0');
  signal din_rqst_fifo_addr_d0            : std_logic_vector(GMEM_ADDR_W-1 downto 0) := (others=>'0');
  signal station_slctd_indx, station_slctd_indx_n    : natural range 0 to N_STATIONS-1 := 0;
  attribute max_fanout of station_slctd_indx : signal is 60; --extra
  constant c_rqst_fifo_addr_valid_len     : natural := 3;
  signal din_rqst_fifo_addr_d0_v          : unsigned(c_rqst_fifo_addr_valid_len-1 downto 0) := (others=>'0');
  signal fifo_dout                        : fifo_type(CV_TO_CACHE_SLICE-1 downto 0) := (others=>(others=>'0'));
  signal fifo_addr_dout                   : fifo_addr_type(CV_TO_CACHE_SLICE-1 downto 0) := (others=>(others=>'0'));
  signal gmem_valid_vec                   : std_logic_vector(CV_TO_CACHE_SLICE-1 downto 0) := (others=>'0');
  signal pop_vec                          : std_logic_vector(CV_TO_CACHE_SLICE-1 downto 0) := (others=>'0');
  signal lmem_rdData                      : SLV32_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0'));
  signal lmem_rdData_d0                   : SLV32_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0'));
  signal lmem_rdData_v                    : std_logic := '0';
  signal lmem_rdData_alu_en               : std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0');
  signal lmem_rdData_rd_addr              : unsigned(REG_FILE_W-1 downto 0) := (others=>'0');
  signal sp                               : unsigned(LMEM_ADDR_W-N_WF_CU_W-PHASE_W-1 downto 0) := (others=>'0');
  -- }}}
  -- read cache buffer signals ----------------------------------------------------------------------------{{{
  signal rd_fifo_data, rd_fifo_data_d0    : std_logic_vector(DATA_W*RD_CACHE_N_WORDS-1 downto 0) := (others=>'0');
  attribute max_fanout of rd_fifo_data_d0 : signal is 8; --extra
  signal rd_fifo_addr                     : unsigned(GMEM_WORD_ADDR_W-RD_CACHE_N_WORDS_W-1 downto 0) := (others=>'0');
  signal rd_fifo_v                        : std_logic := '0';
  ---------------------------------------------------------------------------------------------------------}}}
  ------------------------------------------------------------------------------------------------}}}
begin
  -- internal signals assignments -------------------------------------------------------------------------{{{
  regFile_wrAddr <= regFile_wrAddr_i;
  assert CV_TO_CACHE_SLICE > 0 severity failure;
  cntrl_idle <= cntrl_idle_i;
  ---------------------------------------------------------------------------------------------------------}}}
  -- CV interface (get requests) -------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      mem_rqsts_rdData_n <= mem_rqsts(to_integer(mem_rqsts_rdAddr));
      if mem_rqsts_we = '1' then
        mem_rqsts(to_integer(mem_rqsts_wrAddr)) <= mem_rqsts_wrData;
      end if;
      mem_rqsts_rdData <= mem_rqsts_rdData_n;

      mem_rqsts_we <= '0';
      if cv_gmem_re = '1' or cv_gmem_we = '1' or (ATOMIC_IMPLEMENT /= 0 and cv_gmem_atomic = '1') then
        mem_rqsts_we <= '1';
      end if;
      for i in 0 to CV_SIZE-1 loop
        mem_rqsts_wrData(i*MEM_RQST_W+MEM_RQST_DATA_HIGH downto i*MEM_RQST_W+MEM_RQST_DATA_LOW) <= cv_wrData(i);
        mem_rqsts_wrData(i*MEM_RQST_W+MEM_RQST_ADDR_HIGH downto i*MEM_RQST_W+MEM_RQST_ADDR_LOW) <= std_logic_vector(cv_addr(i));
        mem_rqsts_wrData(i*MEM_RQST_W+MEM_RQST_RE_POS) <= cv_gmem_re;
        if ATOMIC_IMPLEMENT /= 0 then 
          mem_rqsts_wrData(i*MEM_RQST_W+MEM_RQST_ATOMIC_POS) <= cv_gmem_atomic;
        end if;
        mem_rqsts_wrData(i*MEM_RQST_W+MEM_RQST_OP_TYPE_HIGH downto i*MEM_RQST_W+MEM_RQST_OP_TYPE_LOW) <= cv_op_type;
        mem_rqsts_wrData(i*MEM_RQST_W+MEM_RQST_ALU_EN_POS) <= cv_alu_en(i);
        mem_rqsts_wrData(i*MEM_RQST_W+MEM_RQST_RD_ADDR_HIGH downto i*MEM_RQST_W+MEM_RQST_RD_ADDR_LOW) <= std_logic_vector(cv_rd_addr);
      end loop;
      mem_rqst_waiting_p0 <= '0';
      if mem_rqsts_wrAddr /= mem_rqsts_rdAddr then
        mem_rqst_waiting_p0 <= '1';
      end if;
      mem_rqst_waiting <= mem_rqst_waiting_p0;

      if nrst = '0' then
        mem_rqsts_wrAddr <= (others=>'0');
        mem_rqsts_rdAddr <= (others=>'0');
      else
        if mem_rqsts_we = '1' then
          mem_rqsts_wrAddr <= mem_rqsts_wrAddr + 1;
        end if;
        if mem_rqsts_rdAddr_inc_n = '1' then
          mem_rqsts_rdAddr <= mem_rqsts_rdAddr + 1;
        end if;
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- CV interface (schedule requests) -------------------------------------------------------------------{{{
  cv_side_trans: process(clk)
  begin
    if rising_edge(clk) then 
      station_go <= station_go_n;
      mem_rqsts_rdData_ltchd <= mem_rqsts_rdData_ltchd_n;
      mem_rqsts_phase_ltchd <= mem_rqsts_phase_ltchd_n;
      mem_rqsts_wf_indx_ltchd <= mem_rqsts_wf_indx_ltchd_n;
      mem_rqsts_nserved <= mem_rqsts_nserved_n;
      check_finish <= check_finish_n;
      if nrst = '0' then
        st_cv_side <= get_rqst;
      else
        st_cv_side <= st_cv_side_n;
      end if;
    end if;
  end process;

  cv_side_comb: process(st_cv_side, mem_rqst_waiting, station_free, mem_rqsts_rdData, mem_rqsts_nserved, mem_rqsts_phase_ltchd,
                        mem_rqsts_rdData_ltchd, mem_rqsts_wf_indx_ltchd)
  begin

    st_cv_side_n <= st_cv_side;
    station_go_n <= (others=>'0');
    mem_rqsts_rdAddr_inc_n <= '0';
    mem_rqsts_nserved_n <= mem_rqsts_nserved;
    check_finish_n <= (others=>'0');
    mem_rqsts_rdData_ltchd_n <= mem_rqsts_rdData_ltchd;
    mem_rqsts_wf_indx_ltchd_n <= mem_rqsts_wf_indx_ltchd;
    mem_rqsts_phase_ltchd_n <= mem_rqsts_phase_ltchd;
    case st_cv_side is
      when get_rqst => 
        for i in 0 to CV_SIZE-1 loop
          mem_rqsts_rdData_ltchd_n(i) <= mem_rqsts_rdData((i+1)*MEM_RQST_W-1 downto i*MEM_RQST_W);
        end loop;
        -- latch wf_indx and phase from first ALU
        mem_rqsts_wf_indx_ltchd_n <= (others=>'0');
        mem_rqsts_wf_indx_ltchd_n(to_integer(unsigned(
                          mem_rqsts_rdData(MEM_RQST_RD_ADDR_LOW+WI_REG_ADDR_W+N_WF_CU_W-1 downto MEM_RQST_RD_ADDR_LOW+WI_REG_ADDR_W)))) <= '1';
        mem_rqsts_phase_ltchd_n(1 downto 0) <= mem_rqsts_rdData(MEM_RQST_RD_ADDR_HIGH downto MEM_RQST_RD_ADDR_HIGH-1);
        mem_rqsts_phase_ltchd_n(2) <= mem_rqsts_rdData(MEM_RQST_RD_ADDR_HIGH-2);
        for i in 0 to CV_SIZE-1 loop
          mem_rqsts_nserved_n(i) <= mem_rqsts_rdData(i*MEM_RQST_W + MEM_RQST_ALU_EN_POS);
        end loop;
        if mem_rqst_waiting = '1' then
          st_cv_side_n <= fill_stations;
          mem_rqsts_rdAddr_inc_n <= '1';
        end if;
      when fill_stations =>
        for i in 0 to cv_size-1 loop
          for j in 0 to n_stations_alu-1 loop
            if station_free(c_stations_for_alus(i)(j)) = '1' and mem_rqsts_nserved(i) = '1' then
              station_go_n(c_stations_for_alus(i)(j)) <= '1';
              mem_rqsts_nserved_n(i) <= '0';
              exit;
            end if;
          end loop;
        end loop;
        if mem_rqsts_nserved = (mem_rqsts_nserved'reverse_range => '0') then
          st_cv_side_n <= wait_update;
        end if;
        
      when wait_update => -- necessary to wait for mem_rqsts_rdData to be ready in case no alu was enabled
          st_cv_side_n <= get_rqst;
          if mem_rqsts_phase_ltchd = (mem_rqsts_phase_ltchd'reverse_range=>'1') then
            check_finish_n <= mem_rqsts_wf_indx_ltchd;
          end if;
    end case;
  end process;
  ----------------------------------------------------------------------------------------- }}}
  -- gmem controller interface -------------------------------------------------------------------------------------------{{{
  -- fifo {{{
  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        gmem_valid_vec <= (others=>'0');
      else
        if pop = '1' or gmem_valid_vec /= (gmem_valid_vec'reverse_range=>'1') then
          gmem_valid_vec(gmem_valid_vec'high) <= gmem_valid_i;
        end if;
        for i in CV_TO_CACHE_SLICE-1 downto 1 loop
          if pop = '1' or gmem_valid_vec(i-1 downto 0) /= (i-1 downto 0=>'1') then
            gmem_valid_vec(i-1) <= gmem_valid_vec(i);
          end if;
        end loop;
      end if;

      if push_d0 = '1' then
        fifo(to_integer(fifo_wrAddr)) <= din_rqst_fifo_d0;
        fifo_addr(to_integer(fifo_wrAddr)) <= din_rqst_fifo_addr_d0;
      end if;
      if pop = '1' or gmem_valid_vec /= (gmem_valid_vec'reverse_range=>'1') then
        fifo_addr_dout(fifo_addr_dout'high) <= fifo_addr(to_integer(fifo_rdAddr));
        fifo_dout(fifo_dout'high) <= fifo(to_integer(fifo_rdAddr));
      end if;
      for i in CV_TO_CACHE_SLICE-1 downto 1 loop
        if pop = '1' or gmem_valid_vec(i-1 downto 0) /= (i-1 downto 0=>'1') then
          fifo_addr_dout(i-1) <= fifo_addr_dout(i);
          fifo_dout(i-1) <= fifo_dout(i);
        end if;
      end loop;
      
      if pop = '1' or gmem_valid_vec(CV_TO_CACHE_SLICE-2 downto 0) /= (0 to CV_TO_CACHE_SLICE-2 =>'1') then
        if SUB_INTEGER_IMPLEMENT /= 0 then
          case fifo_dout(CV_TO_CACHE_SLICE-1)(DATA_W+1+DATA_W/8)&fifo_dout(CV_TO_CACHE_SLICE-1)(2 downto 0) is -- DATA_W+1+DATA_W/8 for atomic bit
            when "0001" => -- byte
              case fifo_addr_dout(CV_TO_CACHE_SLICE-1)(1 downto 0) is
                when "00" => -- 1st byte
                  fifo_dout(CV_TO_CACHE_SLICE-2)(3 downto 0) <= "0001";
                when "01" => -- 2nd byte
                  fifo_dout(CV_TO_CACHE_SLICE-2)(3 downto 0) <= "0010";
                  fifo_dout(CV_TO_CACHE_SLICE-2)(2*8+5-1 downto 5+8) <= fifo_dout(CV_TO_CACHE_SLICE-1)(7+5 downto 5);
                when "10" => -- 3rd byte
                  fifo_dout(CV_TO_CACHE_SLICE-2)(3 downto 0) <= "0100";
                  fifo_dout(CV_TO_CACHE_SLICE-2)(3*8+5-1 downto 5+2*8) <= fifo_dout(CV_TO_CACHE_SLICE-1)(7+5 downto 5);
                when others => -- 4th byte
                  fifo_dout(CV_TO_CACHE_SLICE-2)(3 downto 0) <= "1000";
                  fifo_dout(CV_TO_CACHE_SLICE-2)(4*8+5-1 downto 5+3*8) <= fifo_dout(CV_TO_CACHE_SLICE-1)(7+5 downto 5);
              end case;
            when "0010" => -- half
              case fifo_addr_dout(CV_TO_CACHE_SLICE-1)(1) is
                when '0' => -- 1st half
                  fifo_dout(CV_TO_CACHE_SLICE-2)(3 downto 0) <= "0011";
                when others => -- 2nd half
                  fifo_dout(CV_TO_CACHE_SLICE-2)(3 downto 0) <= "1100";
                  fifo_dout(CV_TO_CACHE_SLICE-2)(4*8+5-1 downto 5+2*8) <= fifo_dout(CV_TO_CACHE_SLICE-1)(2*8+5-1 downto 5);
              end case;
            when "0100" => -- word
              fifo_dout(CV_TO_CACHE_SLICE-2)(3 downto 0) <= (others=>'1');
            when others=>
              fifo_dout(CV_TO_CACHE_SLICE-2)(3 downto 0) <= '0'&fifo_dout(CV_TO_CACHE_SLICE-1)(2 downto 0);
          end case;
        else
          case fifo_dout(CV_TO_CACHE_SLICE-1)(DATA_W+1+DATA_W/8)&fifo_dout(CV_TO_CACHE_SLICE-1)(2 downto 0) is -- DATA_W+1+DATA_W/8 for atomic bit
            when "0100" => -- word
              fifo_dout(CV_TO_CACHE_SLICE-2)(3 downto 0) <= (others=>'1');
            when others=>
              fifo_dout(CV_TO_CACHE_SLICE-2)(3 downto 0) <= '0'&fifo_dout(CV_TO_CACHE_SLICE-1)(2 downto 0);
          end case;
        end if;
      end if;
    end if;
  end process;
  -- fifo read port
  gmem_rqst_addr <= unsigned(fifo_addr_dout(0)(GMEM_ADDR_W-1 downto 2));
  gmem_wrData <= fifo_dout(0)(DATA_W+DATA_W/8+1-1 downto DATA_W/8+1);
  gmem_rnw <= fifo_dout(0)(DATA_W/8);
  gmem_we <= fifo_dout(0)(DATA_W/8-1 downto 0);
  -- assert gmem_rqst_addr(GMEM_WORD_ADDR_W-1 downto GMEM_WORD_ADDR_W-4) = X"01" or gmem_we /= X"F" severity failure;
  atomic_signals: if ATOMIC_IMPLEMENT /= 0 generate
    gmem_atomic <= fifo_dout(0)(DATA_W+DATA_W/8+1);
    gmem_atomic_sgntr <= fifo_dout(0)(din_rqst_fifo'high downto din_rqst_fifo'high - N_CU_STATIONS_W+1);
  end generate;
  gmem_valid <= gmem_valid_vec(0);
  pop <= gmem_valid_vec(0) and gmem_ready;

  -- prepare write data into the fifo
  din_rqst_fifo_addr <= std_logic_vector(station_gmem_addr(station_slctd_indx));
  din_rqst_fifo(din_rqst_fifo'high downto din_rqst_fifo'high-N_CU_STATIONS_W+1) <= std_logic_vector(to_unsigned(station_slctd_indx, N_CU_STATIONS_W));
  atomic_din: if ATOMIC_IMPLEMENT /= 0 generate
    din_rqst_fifo(DATA_W+1+DATA_W/8) <= station_atomic(station_slctd_indx);
  end generate;
  din_rqst_fifo(DATA_W+1+DATA_W/8-1 downto 1+DATA_W/8) <= station_wrData(station_slctd_indx);
  din_rqst_fifo(DATA_W/8) <= station_rnw(station_slctd_indx);
  din_rqst_fifo(2 downto 0) <= station_op_type(station_slctd_indx);
  
  rqst_fifo: process(clk)
  begin
    if rising_edge(clk) then
      push_d0 <= push;
      if    din_rqst_fifo_addr_d0_v /= (din_rqst_fifo_addr_d0_v'reverse_range=>'0') and
          din_rqst_fifo_addr_d0(GMEM_ADDR_W-1 downto CACHE_N_BANKS_W+2) = din_rqst_fifo_addr(GMEM_ADDR_W-1 downto CACHE_N_BANKS_W+2) and
          din_rqst_fifo_d0(DATA_W/8) = '1' and din_rqst_fifo(DATA_W/8) = '1' then
        push_d0 <= '0';
      end if;

      din_rqst_fifo_addr_d0_v(din_rqst_fifo_addr_d0_v'high) <= '0';
      din_rqst_fifo_addr_d0_v(din_rqst_fifo_addr_d0_v'high-1 downto 0) <= din_rqst_fifo_addr_d0_v(din_rqst_fifo_addr_d0_v'high downto 1);
      if push = '1' then
        din_rqst_fifo_d0 <= din_rqst_fifo;
        din_rqst_fifo_addr_d0 <= din_rqst_fifo_addr;
        din_rqst_fifo_addr_d0_v(din_rqst_fifo_addr_d0_v'high) <= '1';
      end if;
      if din_rqst_fifo_addr_d0(GMEM_ADDR_W-1 downto CACHE_N_BANKS_W+2) = std_logic_vector(cache_rdAddr) and cache_rdAck = '1' then
        din_rqst_fifo_addr_d0_v <= (others=>'0');
        -- report "clean happened";
      end if;
        
      if nrst = '0' then
        fifo_wrAddr <= (others=>'0');
        fifo_rdAddr <= (others=>'0');
        fifo_full <= '0';
        gmem_valid_i <= '0';
      else
        if push_d0 = '1' then
          fifo_wrAddr <= fifo_wrAddr +1;
        end if;
        if (pop = '1' or gmem_valid_vec(gmem_valid_vec'high downto 0) /= (0 to gmem_valid_vec'high =>'1')) and gmem_valid_i = '1' then
          fifo_rdAddr <= fifo_rdAddr + 1;
        end if;
        if push_d0 = '0' and (pop = '1' or gmem_valid_vec(gmem_valid_vec'high downto 0) /= (0 to gmem_valid_vec'high =>'1')) then
          if fifo_rdAddr = fifo_wrAddr+2 then
            fifo_full <= '0';
          end if;
          if fifo_rdAddr+1 = fifo_wrAddr then
            gmem_valid_i <= '0';
          end if;
        end if;
        if push_d0 = '1' then
          gmem_valid_i <= '1';
          if fifo_rdAddr = fifo_wrAddr+3 and (pop = '0' and gmem_valid_vec(gmem_valid_vec'high downto 0) = (0 to gmem_valid_vec'high =>'1')) then -- 2 because of extra clock delay (push -> push_d0)
            fifo_full <= '1';
          end if;
        end if;
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  process(clk)
  begin
    if rising_edge(clk) then
      push <= push_rqst_fifo_n;
      station_slctd_indx <= station_slctd_indx_n;
    end if;
  end process;

  process(station_get_ticket, fifo_full)
      variable station      : natural range 0 to N_STATIONS-1 := 0;
  begin
    ticket_granted <= (others=>'0');
    push_rqst_fifo_n <= '0';
    station_slctd_indx_n <= 0;
    -- grant ticket 
    if fifo_full = '0' then
      for i in 0 to N_STATIONS-1 loop
        station := c_stations_ordered_for_priority(i);
        -- station := i;
        if station_get_ticket(station) = '1' then
          push_rqst_fifo_n <= '1';
          station_slctd_indx_n <= station;
          ticket_granted(station) <= '1';
          exit;
        end if;
      end loop;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- stations FSMs -------------------------------------------------------------------------------------------{{{
  tras_stations: process(clk) -- {{{
  begin
    if rising_edge(clk) then
      station_free <= station_free_n;
      rd_fifo_data_d0 <= rd_fifo_data;
      station_gmem_addr <= station_gmem_addr_n;
      station_rd_addr <= station_rd_addr_n;
      station_wf_indx <= station_wf_indx_n;
      station_rnw <= station_rnw_n;
      if ATOMIC_IMPLEMENT /= 0 then
        station_atomic <= station_atomic_n;
      end if;
      station_rdData <= station_rdData_n;
      station_wrData <= station_wrData_n;
      station_op_type <= station_op_type_n;
      if nrst = '0' then
        st_stations <= (others=>idle);
        station_get_ticket <= (others=>'0');
        station_perfomed <= (others=>'0');
        if ATOMIC_IMPLEMENT /= 0 then
          station_wait_atomic <= (others=>'0');
        end if;
      else
        st_stations <= st_stations_n;
        station_get_ticket <= station_get_ticket_n;
        station_perfomed <= station_perfomed_n;
        if ATOMIC_IMPLEMENT /= 0 then
          station_wait_atomic <= station_wait_atomic_n;
        end if;
      end if;
    end if;
  end process; -- }}}
  stations_read_performed: process(station_gmem_addr, rd_fifo_addr, rd_fifo_v) -- {{{
  begin
    station_read_performed_n <= (others=>'0');
    for i in 0 to N_STATIONS-1 loop
      if  station_gmem_addr(i)(GMEM_ADDR_W-1 downto 2+RD_CACHE_N_WORDS_W) = rd_fifo_addr and rd_fifo_v = '1' then
        station_read_performed_n(i) <= '1';
      end if;
    end loop;
  end process; -- }}}
  process(clk)
  begin
    if rising_edge(clk) then
      if ATOMIC_IMPLEMENT /= 0 then
        atomic_rdData_v_d0 <= atomic_rdData_v;
        atomic_rdData_v_d1 <= atomic_rdData_v_d0;
        atomic_sgntr_d0 <= atomic_sgntr;
        atomic_rdData_d0 <= atomic_rdData;
        atomic_rdData_d1 <= atomic_rdData_d0;
        station_atomic_perormed <= (others=>'0');
        for i in 0 to N_STATIONS-1 loop
          -- if  station_gmem_addr(i)(GMEM_ADDR_W-1 downto 2) = atomic_rdAddr_d0 and atomic_rdData_v_d0 = '1' and 
          --     station_op_type(i) = atomic_rdData_type_d0 and station_wait_atomic(i) = '1' and 
          --     (station_last_atomic_serve /= i or atomic_rdData_v_d1 = '0')then
            -- station_last_atomic_serve <= i;

          if unsigned(atomic_sgntr_d0) = to_unsigned(i, N_CU_STATIONS_W) and atomic_rdData_v_d0 = '1' and station_wait_atomic(i) = '1' then
            station_atomic_perormed(i) <= '1';
          end if;
        end loop;
      end if;
    end if;
  end process;
  process(st_stations, station_free, station_go, station_gmem_addr, station_rd_addr, station_rnw, mem_rqsts_wf_indx_ltchd,
          station_get_ticket, station_op_type, ticket_granted, station_perfomed, station_written_back, station_wrData,
          station_rdData, rd_fifo_data_d0, station_read_performed_n, latch_rdData, station_atomic, station_wait_atomic,
          station_atomic_perormed, atomic_rdData_d1, mem_rqsts_rdData_ltchd, station_wf_indx)
      variable rdIndx : integer range 0 to CACHE_N_BANKS-1 := 0;
  begin
    for i in 0 to N_STATIONS-1 loop
      station_rnw_n(i) <= station_rnw(i);
      if ATOMIC_IMPLEMENT /= 0 then
        station_atomic_n(i) <= station_atomic(i);
        station_wait_atomic_n(i) <= station_wait_atomic(i);
      end if;
      station_rd_addr_n(i) <= station_rd_addr(i);
      station_gmem_addr_n(i) <= station_gmem_addr(i);
      station_free_n(i) <= station_free(i);
      st_stations_n(i) <= st_stations(i);
      station_get_ticket_n(i) <= station_get_ticket(i);
      station_rdData_n(i) <= station_rdData(i);
      station_perfomed_n(i) <= station_perfomed(i);
      station_wrData_n(i) <= station_wrData(i);
      station_op_type_n(i) <= station_op_type(i);
      latch_rdData_n(i) <= '0';
      station_wf_indx_n(i) <= station_wf_indx(i);
      case st_stations(i) is
        when idle => -- {{{
          station_free_n(i) <= '1';
          station_wf_indx_n(i) <= mem_rqsts_wf_indx_ltchd;
          if station_go(i) = '1' then
            st_stations_n(i) <= get_ticket;
            station_get_ticket_n(i) <= '1';
            station_free_n(i) <= '0';
            station_gmem_addr_n(i) <= unsigned(mem_rqsts_rdData_ltchd(c_alu_for_stations(i))(MEM_RQST_ADDR_HIGH downto MEM_RQST_ADDR_LOW));
            station_rd_addr_n(i) <= unsigned(mem_rqsts_rdData_ltchd(c_alu_for_stations(i))(MEM_RQST_RD_ADDR_HIGH downto MEM_RQST_RD_ADDR_LOW));
            station_rnw_n(i) <= mem_rqsts_rdData_ltchd(c_alu_for_stations(i))(MEM_RQST_RE_POS);
            if ATOMIC_IMPLEMENT /= 0 then
              station_atomic_n(i) <= mem_rqsts_rdData_ltchd(c_alu_for_stations(i))(MEM_RQST_ATOMIC_POS);
            end if;
            station_wrData_n(i) <= mem_rqsts_rdData_ltchd(c_alu_for_stations(i))(MEM_RQST_DATA_HIGH downto MEM_RQST_DATA_LOW);
            station_op_type_n(i) <= mem_rqsts_rdData_ltchd(c_alu_for_stations(i))(MEM_RQST_OP_TYPE_HIGH downto MEM_RQST_OP_TYPE_LOW);
          end if; -- }}}
        when get_ticket => -- {{{
          -- assert (station_gmem_addr(i)(17 downto 2) = unsigned(station_wrData(i)(15 downto 0))) or station_rnw(i) = '1' 
          --         report integer'image(to_integer(station_gmem_addr(i)(GMEM_ADDR_W-1 downto 2))) & ", data = " &
          --         integer'image(to_integer(unsigned(station_wrData(i)))) severity failure;
          if station_rnw(i) = '1' and station_read_performed_n(i) = '1' then
            station_get_ticket_n(i) <= '0';
            station_perfomed_n(i) <= '1';
            st_stations_n(i) <= write_back;
            latch_rdData_n(i) <= '1';
            station_get_ticket_n(i) <= '0';
          elsif ticket_granted(i) = '1' then
            if station_rnw(i) = '1' then
              st_stations_n(i) <= wait_read_done;
            elsif ATOMIC_IMPLEMENT /= 0 and station_atomic(i) = '1' then
              st_stations_n(i) <= wait_atomic;
              station_wait_atomic_n(i) <= '1';
            else
              st_stations_n(i) <= idle;
              station_free_n(i) <= '1';
            end if;
            station_get_ticket_n(i) <= '0';
          end if; -- }}}
        when wait_atomic => -- {{{
          if ATOMIC_IMPLEMENT /= 0 then
            station_rdData_n(i) <= atomic_rdData_d1;
            if station_atomic_perormed(i) = '1' then
              st_stations_n(i) <= write_back;
              station_perfomed_n(i) <= '1';
              station_wait_atomic_n(i) <= '0';
            end if;
          end if;
        -- }}}
        when wait_read_done => -- {{{
          if  station_read_performed_n(i) = '1' then
            latch_rdData_n(i) <= '1';
            st_stations_n(i) <= write_back;
            station_perfomed_n(i) <= '1';
          end if; -- }}}
        when write_back => -- {{{
          if latch_rdData(i) = '1' then
            if RD_CACHE_N_WORDS_W /= 0 then
              rdIndx := to_integer(station_gmem_addr(i)(max(RD_CACHE_N_WORDS_W,1)+2-1 downto 2));
            else
              rdIndx := 0;
            end if;
            station_rdData_n(i) <= rd_fifo_data_d0((rdIndx+1)*DATA_W-1 downto rdIndx*DATA_W);
          end if;
          if station_written_back(i) = '1' then
            st_stations_n(i) <= idle;
            station_free_n(i) <= '1';
            station_perfomed_n(i) <= '0';
          end if; -- }}}
      end case;
    end loop;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- regFile interface ---------------------------------------------------------------------------------------{{{
  -- regFile comb process ---------------------------------------------------------------------------------{{{
  process(st_regFile_int, station_perfomed, regFile_wrAddr_p0, station_rd_addr, station_written_back, cv_lmem_rqst)
  begin
    st_regFile_int_n <= st_regFile_int;
    regFile_wrAddr_p0_n <= regFile_wrAddr_p0;
    regFile_we_p0_n <= (others=>'0');
    station_written_back_n <= (others=>'0');
    regFile_we_latch_p0_n <= '0';
    case st_regFile_int is
      when choose_rd_addr =>
        for i in N_STATIONS-1 downto 0 loop
          if station_perfomed(i) = '1' and station_written_back(i) = '0' then
            regFile_wrAddr_p0_n <= station_rd_addr(i);
            st_regFile_int_n <= update;
          end if;
        end loop;
        if LMEM_IMPLEMENT /= 0 and cv_lmem_rqst = '1' then
          st_regFile_int_n <= wait_scratchpad;
        end if;
      when update =>
        st_regFile_int_n <= wait_1_cycle;
        if LMEM_IMPLEMENT /= 0 and cv_lmem_rqst = '1' then
          st_regFile_int_n <= wait_scratchpad;
        else
          for i in 0 to CV_SIZE-1 loop
            for j in N_STATIONS_ALU-1 downto 0 loop
              if station_perfomed(i*N_STATIONS_ALU+j) = '1' and station_rd_addr(i*N_STATIONS_ALU+j) = regFile_wrAddr_p0 then
                regFile_we_p0_n(i) <= '1';
                station_written_back_n(i*N_STATIONS_ALU+j) <= '1';
                regFile_we_latch_p0_n <= '1';
              end if;
            end loop;
          end loop;
        end if;
      when wait_1_cycle =>
        st_regFile_int_n <= choose_rd_addr;
      when wait_scratchpad =>
        if LMEM_IMPLEMENT /= 0 and cv_lmem_rqst = '0' then
          st_regFile_int_n <= choose_rd_addr;
        end if;
    end case;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- regFile trans process --------------------------------------------------------------------------------{{{
  regFile_we_lmem_p0 <= lmem_rdData_v; -- @ level 19.
  regFile_side_trans: process(clk)
  begin
    if rising_edge(clk) then
      regFile_we_p0 <= regFile_we_p0_n;
      latch_rdData <= latch_rdData_n;
      station_written_back <= station_written_back_n;
      regFile_we_latch_p0 <= regFile_we_latch_p0_n;
      regFile_we_latch <= regFile_we_latch_p0;
      regFile_wrAddr_i <= regFile_wrAddr_p0;
      if regFile_we_latch = '0' then
        regFile_we <= regFile_we_p0;
      end if;
      regFile_wrAddr_p0 <= regFile_wrAddr_p0_n;
      lmem_rdData_d0 <= lmem_rdData; -- @ 20.
      if LMEM_IMPLEMENT /= 0 and lmem_rdData_v = '1' then -- level 19.
        regFile_we <= lmem_rdData_alu_en; -- @ 20.
        regFile_wrAddr_i <= lmem_rdData_rd_addr; -- @ 20.
      end if;
      if LMEM_IMPLEMENT /= 0 and regFile_we_latch = '0' then
        regFile_wrData <= lmem_rdData; -- @ 20.
      end if;
      for i in 0 to CV_SIZE-1 loop
        for j in N_STATIONS_ALU-1 downto 0 loop
          if station_written_back(i*N_STATIONS_ALU+j) = '1' then
            regFile_wrData(i) <= station_rdData(i*N_STATIONS_ALU+j);
          end if;
        end loop;
      end loop;
      if nrst = '0' then
        st_regFile_int <= choose_rd_addr;
      else
        st_regFile_int <= st_regFile_int_n;
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -----------------------------------------------------------------------------------}}}
  -- gmem finished -------------------------------------------------------{{{
  process(clk)
    variable wf_busy_indices  : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  begin
    if rising_edge(clk) then
      wf_finish <= wf_finish_n;
      if nrst = '0' then
        st_finish <= (others=>idle);
      else
        st_finish <= st_finish_n;
      end if;

      wf_busy_indices := (others=>'0');
      for i in 0 to N_STATIONS-1 loop
        if station_free(i) = '0' then
          wf_busy_indices := wf_busy_indices or station_wf_indx(i);
        end if;
      end loop;
      wfs_being_served <= wf_busy_indices;
    end if;
  end process;

  st_finish_array: for i in 0 to N_WF_CU-1 generate
  begin
    process(st_finish(i), check_finish(i), wfs_being_served(i))
    begin
      st_finish_n(i) <= st_finish(i);
      wf_finish_n(i) <= '0';
      case st_finish(i) is
        when idle =>
          if check_finish(i) = '1' then
            st_finish_n(i) <= serving;
          end if;
        when serving =>
          if wfs_being_served(i) = '0' then
            st_finish_n(i) <= finished;
          end if;
        when finished =>
          wf_finish_n(i) <= '1';
          st_finish_n(i) <= idle;
      end case;
    end process;
  end generate;
  ---------------------------------------------------------------------------------------------------------}}}
  -- controller idle -------------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      cntrl_idle_i <= '0';
      if station_free = (station_free'reverse_range=>'1') and gmem_valid_i = '0' and st_cv_side = get_rqst then
        cntrl_idle_i <= '1';
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- cache read fifo -------------------------------------------------------------------------------------------{{{
    -- cu_mem_cntrl <- port A (myram) port B -> cache
  cache_rd_buffer_inst: entity rd_cache_fifo
  generic map (
    SIZEA       => 2**(RD_CACHE_FIFO_PORTB_ADDR_W+CACHE_N_BANKS_W-RD_CACHE_N_WORDS_W),
    ADDRWIDTHA  => RD_CACHE_FIFO_PORTB_ADDR_W+CACHE_N_BANKS_W-RD_CACHE_N_WORDS_W,
    SIZEB       => 2**RD_CACHE_FIFO_PORTB_ADDR_W,
    ADDRWIDTHB  => RD_CACHE_FIFO_PORTB_ADDR_W
  )
  port map(
    clk           => clk,
    push          => cache_rdAck,
    cache_rdData  => cache_rdData,
    cache_rdAddr  => cache_rdAddr,
    rdData        => rd_fifo_data,
    rdAddr        => rd_fifo_addr,
    nempty        => rd_fifo_v,
    nrst          => nrst
  );
  ---------------------------------------------------------------------------------------------------------}}}
  -- lmem -------------------------------------------------------------------------------------------------{{{
  local_memory_inst: if LMEM_IMPLEMENT /= 0 generate
  begin
    sp <= cv_addr(cv_alu_en_pri_enc)(LMEM_ADDR_W-N_WF_CU_W-PHASE_W-1 downto 0);
    local_memory: entity lmem
    port map(
      clk               => clk,
      rqst              => cv_lmem_rqst, -- level 17.
      we                => cv_lmem_we,
      alu_en            => cv_alu_en,
      wrData            => cv_wrData,
      rdData            => lmem_rdData, -- level 19.
      rdData_rd_addr    => lmem_rdData_rd_addr, -- level 19.
      rdData_v          => lmem_rdData_v, -- level 19.
      rdData_alu_en     => lmem_rdData_alu_en, -- level 19.
      -- connect all of cv_addr; you have 8 SPs!!
      sp                => sp,
      rd_addr           => cv_rd_addr,
      nrst              => nrst
    );
  end generate;
  ---------------------------------------------------------------------------------------------------------}}}
end architecture;
