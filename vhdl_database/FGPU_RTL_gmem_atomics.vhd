-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.all;
use work.FGPU_definitions.all;
---------------------------------------------------------------------------------------------------------}}}
entity gmem_atomics is
port( -- {{{
  rcv_atomic_type     : in be_array(N_RECEIVERS-1 downto 0);
  rcv_atomic_rqst     : in std_logic_vector(N_RECEIVERS-1 downto 0);
  rcv_gmem_addr       : in gmem_word_addr_array(N_RECEIVERS-1 downto 0);
  rcv_gmem_data       : in SLV32_ARRAY(N_RECEIVERS-1 downto 0) := (others=>(others=>'0'));
  rcv_must_read       : out std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');
  rcv_atomic_ack      : out std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0');

  -- read data path (in)
  gmem_rdAddr_p0      : in unsigned(GMEM_WORD_ADDR_W-N-1 downto 0);
  gmem_rdData         : in std_logic_vector(DATA_W*CACHE_N_BANKS-1 downto 0);
  gmem_rdData_v_p0    : in std_logic := '0';

  -- atomic data path (out)
  atomic_rdData       : out std_logic_vector(DATA_W-1 downto 0) := (others=>'0');
  rcv_retire          : out std_logic_vector(N_RECEIVERS-1 downto 0) := (others=>'0'); -- this signals implies the validety of atomic_rdData
                                                                                       -- it is 2 clock cycles in advance     
  -- atomic flushing
  flush_v             : out std_logic := '0';
  flush_gmem_addr     : out unsigned(GMEM_WORD_ADDR_W-1 downto 0) := (others=>'0');
  flush_data          : out std_logic_vector(DATA_W-1 downto 0) := (others=>'0');
  flush_ack           : in std_logic;
  flush_done          : in std_logic;

  finish              : in std_logic;
  atomic_can_finish   : out std_logic := '0';
  WGsDispatched       : in std_logic;
  clk, nrst           : std_logic
); -- }}}
end entity;
architecture basic of gmem_atomics is
  -- general control signals {{{
  signal rcv_slctd_indx                   : integer range 0 to N_RECEIVERS := 0;
  attribute max_fanout of rcv_slctd_indx  : signal is 60;
  signal rcv_slctd_indx_d0                : integer range 0 to N_RECEIVERS := 0;
  attribute max_fanout of rcv_slctd_indx_d0 : signal is 40;
  signal check_rqst, check_rqst_d0        : std_logic := '0';
  signal rqst_type                        : std_logic_vector(2 downto 0) := (others=>'0');
  attribute max_fanout of rqst_type       : signal is 60;
  signal rqst_val                         : unsigned(DATA_W-1 downto 0) := (others=>'0');
  signal rqst_gmem_addr                   : unsigned(GMEM_WORD_ADDR_W-1 downto 0) := (others=>'0');
  type atomic_unit_state is (idle, listening, latch_gmem_data, select_word, functioning);
  signal rcv_half_select                  : std_logic := '0';
  signal rcv_is_reading                   : std_logic := '0';
  -- }}}
  -- atomic max signals -----------------------------------------------------------------------------------{{{
  signal st_amax, st_amax_n               : atomic_unit_state := idle;
  signal amax_gmem_addr, amax_gmem_addr_n : unsigned(GMEM_WORD_ADDR_W-1 downto 0) := (others=>'0');
  signal amax_data, amax_data_n           : unsigned(DATA_W-1 downto 0) := (others=>'0');
  signal amax_data_d0                     : unsigned(DATA_W-1 downto 0) := (others=>'0');
  signal amax_addr_v, amax_addr_v_n       : std_logic := '0';
  signal amax_addr_v_d0                   : std_logic := '0';
  signal amax_exec, amax_exec_d0          : std_logic := '0';
  signal amax_latch_gmem_rdData           : std_logic := '0';
  signal amax_latch_gmem_rdData_n         : std_logic := '0';
  ---------------------------------------------------------------------------------------------------------}}}
  -- atomic add signals -----------------------------------------------------------------------------------{{{
  signal st_aadd, st_aadd_n               : atomic_unit_state := idle;
  signal aadd_gmem_addr, aadd_gmem_addr_n : unsigned(GMEM_WORD_ADDR_W-1 downto 0) := (others=>'0');
  signal aadd_data, aadd_data_n           : unsigned(DATA_W-1 downto 0) := (others=>'0');
  signal aadd_data_d0                     : unsigned(DATA_W-1 downto 0) := (others=>'0');
  signal gmem_rdData_ltchd                : std_logic_vector(DATA_W*CACHE_N_BANKS-1 downto 0);
  signal aadd_latch_gmem_rdData           : std_logic := '0';
  signal aadd_latch_gmem_rdData_n         : std_logic := '0';
  signal aadd_addr_v, aadd_addr_v_n       : std_logic := '0';
  signal aadd_addr_v_d0                   : std_logic := '0';
  signal aadd_exec, aadd_exec_d0          : std_logic := '0';
  ---------------------------------------------------------------------------------------------------------}}}
  -- flushing aadd results --------------------------------------------------------------------------------{{{
  type flush_state_type is (idle, dirty, flushing, wait_flush_done);
  signal st_aadd_flush, st_aadd_flush_n   : flush_state_type := idle;
  constant FLUSH_TIMER_W                  : integer := 3;
  signal aadd_flush_timer                 : unsigned(FLUSH_TIMER_W-1 downto 0) := (others=>'0');
  signal aadd_flush_timer_n               : unsigned(FLUSH_TIMER_W-1 downto 0) := (others=>'0');
  signal aadd_flush_rqst                  : std_logic := '0';
  signal aadd_flush_rqst_n                : std_logic := '0';
  signal aadd_flush_started               : std_logic := '0';
  signal aadd_flush_done                  : std_logic := '0';
  signal flush_ack_d0                     : std_logic := '0';
  signal aadd_dirty_content               : std_logic := '0';
  signal aadd_dirty_content_n             : std_logic := '0';
  signal WGsDispatched_ltchd              : std_logic := '0';
  signal aadd_flush_active                : std_logic := '0';
  ---------------------------------------------------------------------------------------------------------}}}
  -- flushing amax results --------------------------------------------------------------------------------{{{
  signal st_amax_flush, st_amax_flush_n   : flush_state_type := idle;
  signal amax_flush_timer                 : unsigned(FLUSH_TIMER_W-1 downto 0) := (others=>'0');
  signal amax_flush_timer_n               : unsigned(FLUSH_TIMER_W-1 downto 0) := (others=>'0');
  signal amax_flush_rqst                  : std_logic := '0';
  signal amax_flush_rqst_n                : std_logic := '0';
  signal amax_flush_started               : std_logic := '0';
  signal amax_flush_done                  : std_logic := '0';
  signal amax_dirty_content               : std_logic := '0';
  signal amax_dirty_content_n             : std_logic := '0';
  signal amax_flush_active                : std_logic := '0';
  ---------------------------------------------------------------------------------------------------------}}}
begin
  -- TODO: implement atomic address changing. Now only one address can be used by an atomic unit
  -- TODO: consider the case when two atomic units work on the same global address 
  -- asserts & internals ----------------------------------------------------------------------------------{{{
  assert FLUSH_TIMER_W < 4 report "make FLUSH_TIMER_W less than 4 otherwise FGPU will finish while there is dirty data in the atomic units";
  ---------------------------------------------------------------------------------------------------------}}}
  -- receivers interface ----------------------------------------------------------------------------------{{{
  RCV_INTERFACE: if AADD_ATOMIC = 1 or AMAX_ATOMIC = 1 generate
    process(clk)  
      variable rcv_slctd_indx_unsigned : unsigned(N_RECEIVERS_W-1 downto 0) := (others=>'0');
    begin
      if rising_edge(clk) then
        rcv_half_select <= not rcv_half_select;
        -- stage 0:
        -- select requesting receiver
        check_rqst <= '0';
        rcv_atomic_ack <= (others=>'0');
        for i in N_RECEIVERS/2-1 downto 0 loop
          rcv_slctd_indx_unsigned(N_RECEIVERS_W-1 downto 1) := to_unsigned(i, N_RECEIVERS_W-1);
          rcv_slctd_indx_unsigned(0) := rcv_half_select;
          if rcv_atomic_rqst(to_integer(rcv_slctd_indx_unsigned)) = '1' then
            rcv_slctd_indx <= to_integer(rcv_slctd_indx_unsigned);
            rcv_atomic_ack(to_integer(rcv_slctd_indx_unsigned)) <= '1';
            -- assert(rcv_atomic_type(i) = CODE_AADD(2 downto 0));
            check_rqst <= '1';
            exit;
          end if;
        end loop;
    
        -- stage 1:
        -- latch request
        rqst_type <= rcv_atomic_type(rcv_slctd_indx)(2 downto 0);
        rqst_gmem_addr <= rcv_gmem_addr(rcv_slctd_indx);
        check_rqst_d0 <= check_rqst;
        rcv_slctd_indx_d0 <= rcv_slctd_indx;


        -- stage 2:
        -- check validety
        rcv_must_read <= (others=>'0');
        rcv_retire <= (others=>'0');
        aadd_exec <= '0';
        amax_exec <= '0';
        if check_rqst_d0 = '1' then
          case rqst_type is
            when CODE_AADD(2 downto 0) =>
              if aadd_addr_v = '0' or aadd_gmem_addr /= rqst_gmem_addr then
                if rcv_is_reading = '0' then
                  rcv_must_read(rcv_slctd_indx_d0) <= '1';
                  rcv_is_reading <= '1';
                end if;
              else
                rcv_retire(rcv_slctd_indx_d0) <= '1';
                aadd_exec <= '1';
              end if;
            when CODE_AMAX(2 downto 0) =>
              if amax_addr_v = '0' or amax_gmem_addr /= rqst_gmem_addr then
                if rcv_is_reading = '0' then
                  rcv_must_read(rcv_slctd_indx_d0) <= '1';
                  rcv_is_reading <= '1';
                end if;
              else
                rcv_retire(rcv_slctd_indx_d0) <= '1';
                amax_exec <= '1';
              end if;
            when others =>
              assert(false);
          end case;
        end if;
        rqst_val <= unsigned(rcv_gmem_data(rcv_slctd_indx_d0));

        -- stage3:
        -- wait for result
        aadd_exec_d0 <= aadd_exec;
        amax_exec_d0 <= amax_exec;

        --stage 4:
        -- forward result
        if aadd_exec_d0 = '1' then
          atomic_rdData <= std_logic_vector(aadd_data_d0); 
              -- if _d0 is removed then the atomic will giv back the new result instead of the old one
        else -- if amax_exec_d0 = '1'
          atomic_rdData <= std_logic_vector(amax_data_d0); 
        end if;
        -- atomic_rdAddr <= aadd_gmem_addr; -- no need for the performed atomic address; it is included in the signature
        -- atomic_rdData_type <= CODE_AADD(2 downto 0); -- no need to send the atomic type back; it is included in the signature



        -- other tasks
        if (aadd_addr_v = '1' and aadd_addr_v_d0 = '0') or (amax_addr_v = '1' and amax_addr_v_d0 = '0') then
          rcv_is_reading <= '0';
        end if;
        if aadd_latch_gmem_rdData = '1' or amax_latch_gmem_rdData = '1' then
          gmem_rdData_ltchd <= gmem_rdData;
        end if;

      end if;
    end process;
  end generate;
  ---------------------------------------------------------------------------------------------------------}}}
  -- flushing amax ----------------------------------------------------------------------------------------{{{
  AMAX_FLUSHING: if AMAX_ATOMIC = 1 generate
    process(clk)
    begin
      if rising_edge(clk) then
        if nrst = '0' then
          st_amax_flush <= idle;
          amax_flush_rqst <= '0';
          amax_dirty_content <= '0';
        else
          st_amax_flush <= st_amax_flush_n;
          amax_flush_rqst <= amax_flush_rqst_n;
          amax_dirty_content <= amax_dirty_content_n;
        end if;
        
        amax_flush_timer <= amax_flush_timer_n;

      end if;
    end process;
    process(st_amax_flush, amax_exec, amax_flush_timer, amax_flush_rqst, amax_flush_started, flush_done, amax_dirty_content, 
            WGsDispatched_ltchd)
    begin
      st_amax_flush_n <= st_amax_flush;
      amax_flush_timer_n <= amax_flush_timer;
      amax_flush_rqst_n <= amax_flush_rqst;
      amax_dirty_content_n <= amax_dirty_content;
      case st_amax_flush is
        when idle =>
          amax_flush_timer_n <= (others=>'0');
          if amax_exec = '1' or amax_dirty_content = '1' then
            st_amax_flush_n <= dirty;
          end if;
        when dirty =>
          if WGsDispatched_ltchd = '1' then
            amax_flush_timer_n <= amax_flush_timer + 1;
            if amax_exec = '1' then
              amax_flush_timer_n <= (others=>'0');
            elsif amax_flush_timer = (amax_flush_timer'reverse_range =>'1') then
              st_amax_flush_n <= flushing;
              amax_flush_rqst_n <= '1';
              amax_dirty_content_n <= '0';
            end if;
          end if;
        when flushing =>
          if amax_exec = '1' then
            amax_dirty_content_n <= '1';
          end if;
          if amax_flush_started = '1' then
            st_amax_flush_n <= wait_flush_done;
            amax_flush_rqst_n <= '0';
          end if;
        when wait_flush_done =>
          if flush_done = '1' then
            st_amax_flush_n <= idle;
          end if;
          if amax_exec = '1' then
            amax_dirty_content_n <= '1';
          end if;
      end case;
    end process;
  end generate;
  ---------------------------------------------------------------------------------------------------------}}}
  -- flushing aadd ----------------------------------------------------------------------------------------{{{
  AADD_FLUSH: if AADD_ATOMIC = 1 generate
    process(clk)
    begin
      if rising_edge(clk) then
        if nrst = '0' then
          st_aadd_flush <= idle;
          aadd_flush_rqst <= '0';
          aadd_dirty_content <= '0';
        else
          st_aadd_flush <= st_aadd_flush_n;
          aadd_flush_rqst <= aadd_flush_rqst_n;
          aadd_dirty_content <= aadd_dirty_content_n;
        end if;
        
        aadd_flush_timer <= aadd_flush_timer_n;
      end if;
    end process;
    process(st_aadd_flush, aadd_exec, aadd_flush_timer, aadd_flush_rqst, aadd_flush_started, flush_done, aadd_dirty_content, 
            WGsDispatched_ltchd)
    begin
      st_aadd_flush_n <= st_aadd_flush;
      aadd_flush_timer_n <= aadd_flush_timer;
      aadd_flush_rqst_n <= aadd_flush_rqst;
      aadd_dirty_content_n <= aadd_dirty_content;
      case st_aadd_flush is
        when idle =>
          aadd_flush_timer_n <= (others=>'0');
          if aadd_exec = '1' or aadd_dirty_content = '1' then
            st_aadd_flush_n <= dirty;
          end if;
        when dirty =>
          if WGsDispatched_ltchd = '1' then
            aadd_flush_timer_n <= aadd_flush_timer + 1;
            if aadd_exec = '1' then
              aadd_flush_timer_n <= (others=>'0');
            elsif aadd_flush_timer = (aadd_flush_timer'reverse_range =>'1') then
              st_aadd_flush_n <= flushing;
              aadd_flush_rqst_n <= '1';
              aadd_dirty_content_n <= '0';
            end if;
          end if;
        when flushing =>
          if aadd_exec = '1' then
            aadd_dirty_content_n <= '1';
          end if;
          if aadd_flush_started = '1' then
            st_aadd_flush_n <= wait_flush_done;
            aadd_flush_rqst_n <= '0';
          end if;
        when wait_flush_done =>
          if flush_done = '1' then
            st_aadd_flush_n <= idle;
          end if;
          if aadd_exec = '1' then
            aadd_dirty_content_n <= '1';
          end if;
      end case;
    end process;
  end generate;
  ---------------------------------------------------------------------------------------------------------}}}
  -- atomic max -------------------------------------------------------------------------------------------{{{
  AMAX_BODY: if AMAX_ATOMIC = 1 generate
    process(clk)
    begin
      if rising_edge(clk) then
        if nrst = '0' then
          amax_addr_v <= '0';
          st_amax <= idle;
        else
          st_amax <= st_amax_n;
          amax_addr_v <= amax_addr_v_n;
        end if;
        amax_addr_v_d0 <= amax_addr_v;
        amax_gmem_addr <= amax_gmem_addr_n;
        amax_data <= amax_data_n;
        amax_data_d0 <= amax_data;
        amax_latch_gmem_rdData <= amax_latch_gmem_rdData_n;
      end if;
    end process;
    process(st_amax, check_rqst_d0, rqst_type, amax_gmem_addr, rqst_gmem_addr, gmem_rdData_v_p0, gmem_rdAddr_p0, amax_data, gmem_rdData_ltchd,
            amax_addr_v, amax_exec, rqst_val, finish)
      variable word_indx  : integer range 0 to GMEM_N_BANK-1 := 0;
      -- variable n_amax_exec : integer := 0;
      -- variable written_vals : std_logic_vector(2047 downto 0) := (others=>'0');
      -- variable written_index : integer range 0 to 2047 := 0;
    begin
      st_amax_n <= st_amax;
      amax_gmem_addr_n <= amax_gmem_addr;
      amax_data_n <= amax_data;
      amax_addr_v_n <= amax_addr_v;
      amax_latch_gmem_rdData_n <= '0';
      case st_amax is
        when idle =>
          if check_rqst_d0 = '1' and rqst_type = CODE_AMAX(2 downto 0) then
            st_amax_n <= listening;
            amax_gmem_addr_n <= rqst_gmem_addr;
          end if;
        when listening =>
          if gmem_rdData_v_p0 = '1' and gmem_rdAddr_p0 = amax_gmem_addr(amax_gmem_addr'high downto N) then
            st_amax_n <= latch_gmem_data;
            amax_latch_gmem_rdData_n <= '1';
          end if;
        when latch_gmem_data =>
          st_amax_n <= select_word;
        when select_word =>
          word_indx := to_integer(amax_gmem_addr(N-1 downto 0));
          amax_data_n <= unsigned(gmem_rdData_ltchd(DATA_W*(word_indx+1)-1 downto DATA_W*word_indx));
          st_amax_n <= functioning;
          amax_addr_v_n <= '1';
        when functioning =>
          if amax_exec = '1' then
            -- n_amax_exec := n_amax_exec + 1;
            if signed(amax_data) < signed(rqst_val) then
              amax_data_n <= rqst_val;
            end if;
            -- written_index := ((to_integer(rqst_val)-6) / 16);
            -- assert written_index < 2048 severity failure;
            -- assert written_vals(written_index) = '0' severity failure;
            -- written_vals(written_index) := '1';
            -- assert ((to_integer(rqst_val)-6) mod 16) = 0 severity failure;
          end if;
          if finish = '1' then
            -- assert written_vals = (written_vals'reverse_range=>'1') severity failure;
            -- written_vals := (others=>'0');
            -- report "# of executed atmoic additions (counted inside the atomic unit) is " & integer'image(n_amax_exec);
            -- n_amax_exec := 0;
            st_amax_n <= idle;
            amax_addr_v_n <= '0';
          end if;
      end case;
    end process;
  end generate;
  ---------------------------------------------------------------------------------------------------------}}}
  -- atomic add -------------------------------------------------------------------------------------------{{{
  AADD_BODY: if AADD_ATOMIC = 1 generate
    process(clk)
    begin
      if rising_edge(clk) then
        if nrst = '0' then
          aadd_addr_v <= '0';
          st_aadd <= idle;
        else
          st_aadd <= st_aadd_n;
          aadd_addr_v <= aadd_addr_v_n;
        end if;
        aadd_addr_v_d0 <= aadd_addr_v;
        aadd_gmem_addr <= aadd_gmem_addr_n;
        aadd_data <= aadd_data_n;
        aadd_data_d0 <= aadd_data;
        aadd_latch_gmem_rdData <= aadd_latch_gmem_rdData_n;
      end if;
    end process;
    process(st_aadd, check_rqst_d0, rqst_type, aadd_gmem_addr, rqst_gmem_addr, gmem_rdData_v_p0, gmem_rdAddr_p0, aadd_data, gmem_rdData_ltchd,
            aadd_addr_v, aadd_exec, rqst_val, finish)
      variable word_indx  : integer range 0 to GMEM_N_BANK-1 := 0;
      -- variable n_aadd_exec : integer := 0;
      -- variable written_vals : std_logic_vector(2047 downto 0) := (others=>'0');
      -- variable written_index : integer range 0 to 2047 := 0;
    begin
      st_aadd_n <= st_aadd;
      aadd_gmem_addr_n <= aadd_gmem_addr;
      aadd_data_n <= aadd_data;
      aadd_addr_v_n <= aadd_addr_v;
      aadd_latch_gmem_rdData_n <= '0';
      case st_aadd is
        when idle =>
          if check_rqst_d0 = '1' and rqst_type = CODE_AADD(2 downto 0) then
            st_aadd_n <= listening;
            aadd_gmem_addr_n <= rqst_gmem_addr;
          end if;
        when listening =>
          if gmem_rdData_v_p0 = '1' and gmem_rdAddr_p0 = aadd_gmem_addr(aadd_gmem_addr'high downto N) then
            st_aadd_n <= latch_gmem_data;
            aadd_latch_gmem_rdData_n <= '1';
          end if;
        when latch_gmem_data =>
          st_aadd_n <= select_word;
        when select_word =>
          word_indx := to_integer(aadd_gmem_addr(N-1 downto 0));
          aadd_data_n <= unsigned(gmem_rdData_ltchd(DATA_W*(word_indx+1)-1 downto DATA_W*word_indx));
          st_aadd_n <= functioning;
          aadd_addr_v_n <= '1';
        when functioning =>
          if aadd_exec = '1' then
            -- n_aadd_exec := n_aadd_exec + 1;
            aadd_data_n <= aadd_data + rqst_val;
            -- written_index := ((to_integer(rqst_val)-6) / 16);
            -- assert written_index < 2048 severity failure;
            -- assert written_vals(written_index) = '0' severity failure;
            -- written_vals(written_index) := '1';
            -- assert ((to_integer(rqst_val)-6) mod 16) = 0 severity failure;
          end if;
          if finish = '1' then
            -- assert written_vals = (written_vals'reverse_range=>'1') severity failure;
            -- written_vals := (others=>'0');
            -- report "# of executed atmoic additions (counted inside the atomic unit) is " & integer'image(n_aadd_exec);
            -- n_aadd_exec := 0;
            st_aadd_n <= idle;
            aadd_addr_v_n <= '0';
          end if;
      end case;
    end process;
  end generate;
  ---------------------------------------------------------------------------------------------------------}}}
  -- flushing ---------------------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        WGsDispatched_ltchd <= '0';
      else
        if finish = '1' then
          WGsDispatched_ltchd <= '0';
        elsif WGsDispatched = '1' then
          WGsDispatched_ltchd <= '1';
        end if;
      end if;
      

      atomic_can_finish <= '0';
      if st_aadd_flush = idle and st_amax_flush = idle then
        atomic_can_finish <= '1';
      end if;
      
      flush_v <= (aadd_flush_rqst or amax_flush_rqst) and not (flush_ack or flush_ack_d0);
      flush_ack_d0 <= flush_ack;
      aadd_flush_started <= '0';
      amax_flush_started <= '0';
      aadd_flush_active <= '0';
      amax_flush_active <= '0';
      if flush_ack = '0' then
        if aadd_flush_rqst = '1' then
          flush_gmem_addr <= aadd_gmem_addr;
          flush_data <= std_logic_vector(aadd_data);
          aadd_flush_active <= '1';
        elsif amax_flush_rqst = '1' then
          flush_gmem_addr <= amax_gmem_addr;
          flush_data <= std_logic_vector(amax_data);
          amax_flush_active <= '1';
        end if;
      else
        if aadd_flush_active = '1' then
          aadd_flush_started <= '1';
        else -- amax_flush_active = '1'
          amax_flush_started <= '1';
        end if;
      end if;
      
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
end architecture;
