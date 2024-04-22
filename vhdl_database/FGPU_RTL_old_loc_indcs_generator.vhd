-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.all;
use work.FGPU_definitions.all;
---------------------------------------------------------------------------------------------------------}}}
entity loc_indcs_generator is
  -- ports {{{
port(
  start               : in std_logic;
  finish              : out std_logic := '0';                         --state signal
  clear_finish        : in std_logic;
  n_wf_wg_m1          : in unsigned(N_WF_CU_W-1 downto 0);
  wg_size_d0          : in integer range 0 to WG_MAX_SIZE := 0;
  wg_size_d1          : in integer range 0 to WG_MAX_SIZE := 0;
  wg_size_d2          : in integer range 0 to WG_MAX_SIZE := 0;
  wrAddr              : out unsigned(RTM_ADDR_W-2 downto 0) := (others => '0');  --additional -1 is to exclude the MSB about local_indcs or wg_offset
  we                  : out std_logic := '0';
  wrData              : out unsigned(RTM_DATA_W-1 downto 0) := (others => '0');
  
  clk, nrst           : in std_logic
);
-- }}}
end loc_indcs_generator;
architecture Behavioral of loc_indcs_generator is
  -- internal signals {{{{
  signal finish_i              : std_logic := '0';
  -- }}}
  -- signal definitions {{{
  type state_type is (idle, start_d0_gen, start_d1_gen, start_d2_gen, store_inc_d0, store_inc_d1, store_inc_d2, check);
  signal state, nstate: state_type := idle;
  type state_dx_type is (idle, inc, empty_wg_size);
  signal state_d0, nstate_d0              : state_dx_type := idle;
  signal state_d1, nstate_d1              : state_dx_type := idle;
  signal state_d2, nstate_d2              : state_dx_type := idle;
  
  -- signal we_d0, we_d1, we_d2              : std_logic_vector(CV_SIZE/2-1 downto 0) := (others => '0');
  signal we_d0, we_d1, we_d2              : std_logic_vector(3 downto 0) := (others => '0');
  signal count, count_n                   : unsigned(RTM_ADDR_W-2-1 downto 0) := (others => '0');  -- the (-2) is to exclude the 2 bits about the dimension 
  signal d0, d1, d2, d0_n, d1_n, d2_n     : unsigned(RTM_DATA_W-1 downto 0) := (others=>'0');
  signal d0_count_1, d0_count_1_n         : unsigned(WG_SIZE_W-1 downto 0) := (others => '0');
  signal d1_count_1, d1_count_1_n         : unsigned(WG_SIZE_W-1 downto 0) := (others => '0');
  signal d2_count_1, d2_count_1_n         : unsigned(WG_SIZE_W-1 downto 0) := (others => '0');
  signal d0_count_2, d0_count_2_n         : unsigned(WG_SIZE_W-1 downto 0) := (others => '0');
  signal d1_count_2, d1_count_2_n         : unsigned(WG_SIZE_W-1 downto 0) := (others => '0');
  signal d2_count_2, d2_count_2_n         : unsigned(WG_SIZE_W-1 downto 0) := (others => '0');
  signal d0_count_1_ov, d1_count_1_ov_n   : std_logic := '0';
  signal d0_count_2_ov, d1_count_2_ov_n   : std_logic := '0';
  signal d1_count_1_ov, d0_count_1_ov_n   : std_logic := '0';
  signal d1_count_2_ov, d0_count_2_ov_n   : std_logic := '0';
  
  signal start_d0, start_d1, start_d2     : std_logic := '0';
  signal stop_d0, stop_d1, stop_d2        : std_logic := '0';
  signal wrAddr_sel_dim                   : unsigned(1 downto 0) := (others => '0');
  
  signal wg_size_m1_d0                    : unsigned(WG_SIZE_W downto 0) := (others=>'0');
  signal wg_size_m1_d1                    : unsigned(WG_SIZE_W downto 0) := (others=>'0');
  signal wg_size_m1_d2                    : unsigned(WG_SIZE_W downto 0) := (others=>'0');

  -- next signals
  -- signal we_d0_n, we_d1_n, we_d2_n        : std_logic_vector(CV_SIZE/2-1 downto 0) := (others => '0');
  signal we_d0_n, we_d1_n, we_d2_n        : std_logic_vector(3 downto 0) := (others => '0');
  signal finish_n                         : std_logic := '0';
  -- }}}
begin
  -- fixed assignments & internal signals ------------------------------------------------------------------{{{
  wrAddr(wrAddr'high downto wrAddr'high-1) <= wrAddr_sel_dim;  --alias
  wrAddr(wrAddr'high-2 downto 0) <= count(wrAddr'high-2 downto 0);  --alias
  wg_size_m1_d0 <= to_unsigned(wg_size_d0, WG_SIZE_W+1) - 1;
  wg_size_m1_d1 <= to_unsigned(wg_size_d1, WG_SIZE_W+1) - 1;
  wg_size_m1_d2 <= to_unsigned(wg_size_d2, WG_SIZE_W+1) - 1;
  finish <= finish_i;
  ---------------------------------------------------------------------------------------------------------}}}
  ------ d2 FSM -------------------------------------------------------------------------------------- {{{
  process(state_d2, start_d2, d1_count_1_ov, d1_count_2_ov, d2_count_1, d2_count_2, d2_count_1_n, we_d2, stop_d2, d2, wg_size_m1_d2)
  begin
    nstate_d2 <= state_d2;
    d2_count_1_n <= d2_count_1;
    d2_count_2_n <= d2_count_2;
    we_d2_n <= we_d2;
    d2_n <= d2;
    case state_d2 is
      when idle =>
        if start_d2 = '1' then
          nstate_d2 <= inc;
          we_d2_n <= (0 => '1', others => '0');
          d2_count_1_n <= (others => '0');
          d2_count_2_n <= (others => '0');
        end if;
      when inc =>
        if d1_count_1_ov = '1' then
          if d2_count_2 = wg_size_m1_d2(WG_SIZE_W-1 downto 0) then
            d2_count_1_n <= (others => '0');
          else
            d2_count_1_n <= d2_count_2 + 1;
          end if;
        else
          d2_count_1_n <= d2_count_2;
        end if;
        if d1_count_2_ov = '1' then
          if d2_count_1_n = wg_size_m1_d2(WG_SIZE_W-1 downto 0) then
            d2_count_2_n <= (others => '0');
          else
            d2_count_2_n <= d2_count_1_n + 1;
          end if;
        else
          d2_count_2_n <= d2_count_1_n;
        end if;
        d2_we: for i in 0 to CV_SIZE/2-1 loop
          if we_d2(i) = '1' then
            d2_n((2+i*2)*WG_SIZE_W-1 downto 2*i*WG_SIZE_W) <= d2_count_2 & d2_count_1;
          end if;
        end loop;
        
        we_d2_n <= we_d2(we_d2'high-1 downto 0) & we_d2(we_d2'high);
        if stop_d2 = '1' then
          nstate_d2 <= idle;
        end if;
      when empty_wg_size =>
        
    end case;
  end process;
  ---------------------------------------------------------------------------------------------------}}}
  ------ d1 FSM -------------------------------------------------------------------------------------- {{{
  process(state_d1, start_d1, d0_count_1_ov, d0_count_2_ov, d1_count_1, d1_count_2, d1_count_1_n, we_d1, stop_d1, d1, wg_size_m1_d1,
      wg_size_m1_d0)
  begin
    nstate_d1 <= state_d1;
    d1_count_1_n <= d1_count_1;
    d1_count_1_ov_n <= '0';
    we_d1_n <= we_d1;
    d1_n <= d1;
    if CV_SIZE = 8 then
      d1_count_2_ov_n <= '0';
      d1_count_2_n <= d1_count_2;
    end if;
    case state_d1 is
      when idle =>
        if start_d1 = '1' then
          nstate_d1 <= inc;
          we_d1_n <= (0 => '1', others => '0');
          d1_count_1_n <= (others => '0');
          if CV_SIZE = 8 then
            if wg_size_m1_d0 = (wg_size_m1_d0'reverse_range=>'0') then
              d1_count_2_n <= (0 => '1', others => '0');
            else
              d1_count_2_n <= (others => '0');
            end if;
          end if;
        end if;
      when inc =>
        if d0_count_1_ov = '1' then
          if CV_SIZE = 8 then
            if d1_count_2 = wg_size_m1_d1(WG_SIZE_W-1 downto 0) then
              d1_count_1_n <= (others => '0');
              d1_count_1_ov_n <= '1';
            else
              d1_count_1_n <= d1_count_2 + 1;
            end if;
          else -- CV_SIZE = 4
            if d1_count_1 = wg_size_m1_d1(WG_SIZE_W-1 downto 0) then
              d1_count_1_n <= (others => '0');
              d1_count_1_ov_n <= '1';
            else
              d1_count_1_n <= d1_count_1 + 1;
            end if;
          end if;
        else
          if CV_SIZE = 8 then
            d1_count_1_n <= d1_count_2;
          else -- CV_SIZE=4
            d1_count_1_n <= d1_count_1;
          end if;
        end if;
        if CV_SIZE = 8 then
          if d0_count_2_ov = '1' then
            if d1_count_1_n = wg_size_m1_d1(WG_SIZE_W-1 downto 0) then
              d1_count_2_n <= (others => '0');
              d1_count_2_ov_n <= '1';
            else
              d1_count_2_n <= d1_count_1_n + 1;
            end if;
          else
            d1_count_2_n <= d1_count_1_n;
          end if;
        end if;
        if CV_SIZE = 8 then
          for i in 0 to 3 loop
            if we_d1(i) = '1' then
              d1_n((2+i*2)*WG_SIZE_W-1 downto 2*i*WG_SIZE_W) <= d1_count_2 & d1_count_1;
            end if;
          end loop;
        elsif CV_SIZE = 4 then
          for i in 0 to 3 loop
            if we_d1(i) = '1' then
              d1_n((1+i)*WG_SIZE_W-1 downto i*WG_SIZE_W) <= d1_count_1;
            end if;
          end loop;
        end if;
        
        we_d1_n <= we_d1(we_d1'high-1 downto 0) & we_d1(we_d1'high);
        if stop_d1 = '1' then
          nstate_d1 <= idle;
        end if;
      when empty_wg_size =>
        
    end case;
  end process;
  ----------------------------------------------------------------------------------------------------}}}
  ------ d0 FSM -------------------------------------------------------------------------------------- {{{
  process(state_d0, d0, we_d0, start_d0, stop_d0, d0_count_1, d0_count_2, d0_count_1_n, wg_size_m1_d0)
  begin
    nstate_d0 <= state_d0;
    we_d0_n <= we_d0;
    d0_n <= d0;
    d0_count_1_n <= d0_count_1;
    d0_count_1_ov_n <= '0';
    if CV_SIZE = 8 then
      d0_count_2_n <= d0_count_2;
      d0_count_2_ov_n <= '0';
    end if;
    case state_d0 is
      when idle => 
        if start_d0 = '1' and wg_size_m1_d0 /= (wg_size_m1_d0'reverse_range=>'0')then
          nstate_d0 <= inc;
          we_d0_n <= (0 => '1', others => '0');
          d0_count_1_n <= (others => '0');
          if CV_SIZE = 8 then
            d0_count_2_n <= (0 => '1', others => '0');
          end if;
        end if;
        if start_d0 = '1' and wg_size_m1_d0 = (wg_size_m1_d0'reverse_range=>'0')then
          nstate_d0 <= empty_wg_size;
          d0_count_1_ov_n <= '1';
          if CV_SIZE = 8 then
            d0_count_2_ov_n <= '1';
          end if;
        end if;
      when inc =>
        if CV_SIZE = 8 then
          d0_count_1_n <= d0_count_2 + 1;
          if d0_count_2 = wg_size_m1_d0(WG_SIZE_W-1 downto 0) then
            d0_count_1_n <= (others => '0');
            d0_count_1_ov_n <= '1';
          end if;
          d0_count_2_n <= d0_count_1_n + 1;
          if d0_count_1_n = wg_size_m1_d0(WG_SIZE_W-1 downto 0) then
            d0_count_2_n <= (others => '0');
            d0_count_2_ov_n <= '1';
          end if;
          for i in 0 to CV_SIZE/2-1 loop
            if we_d0(i) = '1' then
              d0_n((2+i*2)*WG_SIZE_W-1 downto 2*i*WG_SIZE_W) <= d0_count_2 & d0_count_1;
            end if;
          end loop;
        elsif CV_SIZE = 4 then
          d0_count_1_n <= d0_count_1 + 1;
          if d0_count_1 = wg_size_m1_d0(WG_SIZE_W-1 downto 0) then
            d0_count_1_n <= (others => '0');
            d0_count_1_ov_n <= '1';
          end if;
          for i in 0 to 3 loop
            if we_d0(i) = '1' then
              d0_n((1+i)*WG_SIZE_W-1 downto i*WG_SIZE_W) <= d0_count_1;
            end if;
          end loop;
        end if;
        
        we_d0_n <= we_d0(we_d0'high-1 downto 0) & we_d0(we_d0'high);
        if stop_d0 = '1' then
          nstate_d0 <= idle;
        end if;
      when empty_wg_size =>
        d0_count_1_ov_n <= '1';
        if CV_SIZE = 8 then
          d0_count_2_ov_n <= '1';
        end if;
        if stop_d0 = '1' then
          nstate_d0 <= idle;
        end if;
    end case;
  end process;
  -------------------------------------------------------------------------------------------- }}}
  ------ overall state machine --------------------------------------------------------------------{{{
  process(state, start, d0, d1, d2, count, count_n, n_wf_wg_m1, finish_i)
  begin
    nstate <= state;
    count_n <= count;
    start_d0 <= '0';
    start_d1 <= '0';
    start_d2 <= '0';
    stop_d0 <= '0';
    stop_d1 <= '0';
    stop_d2 <= '0';
    we <= '0';
    wrData <= d0;
    wrAddr_sel_dim <= "00";
    finish_n <= finish_i;
    case state is
      when idle =>
        if start = '1' then
          count_n <= (others => '1');
          nstate <= start_d0_gen;
          start_d0 <= '1';
          finish_n <= '0';
        end if;
      when start_d0_gen =>
        start_d1 <= '1';
        nstate <= start_d1_gen;
      when start_d1_gen =>
        start_d2 <= '1';
        nstate <= start_d2_gen;
      when start_d2_gen =>
        nstate <= check;
      when store_inc_d0 =>
        nstate <= store_inc_d1;
        wrData <= d0;
        we <= '1';
        wrAddr_sel_dim <= "00";
      when store_inc_d1 =>
        nstate <= store_inc_d2;
        wrData <= d1;
        we <= '1';
        wrAddr_sel_dim <= "01";
      when store_inc_d2 =>
        nstate <= check;
        wrData <= d2;
        we <= '1';
        wrAddr_sel_dim <= "10";
      when check =>
        count_n <= count + 1;
        if count_n(WF_SIZE_W-CV_W+N_WF_CU_W downto WF_SIZE_W-CV_W) > n_wf_wg_m1 then
          nstate <= idle;
          stop_d0 <= '1';
          stop_d1 <= '1';
          stop_d2 <= '1';
          finish_n <= '1';
        else
          nstate <= store_inc_d0;
        end if;
        
    end case;
  end process;
  -------------------------------------------------------------------------------------------------}}}
  ------ registers ---------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      count <= count_n;
      we_d0 <= we_d0_n;
      we_d1 <= we_d1_n;
      we_d2 <= we_d2_n;
      d0_count_1 <= d0_count_1_n;
      if CV_SIZE = 8 then
        d0_count_2 <= d0_count_2_n;
        d1_count_2 <= d1_count_2_n;
        d2_count_2 <= d2_count_2_n;
        d0_count_2_ov <= d0_count_2_ov_n;
        d1_count_2_ov <= d1_count_2_ov_n;
      end if;
      d1_count_1 <= d1_count_1_n;
      d2_count_1 <= d2_count_1_n;
      d0_count_1_ov <= d0_count_1_ov_n;
      d0 <= d0_n;
      d1 <= d1_n;
      d2 <= d2_n;
      d1_count_1_ov <= d1_count_1_ov_n;
      if nrst = '0' then
        state_d0 <= idle;
        state_d1 <= idle;
        state_d2 <= idle;
        finish_i <= '0';
        state <= idle;
      else
        state <= nstate;
        state_d0 <= nstate_d0;
        state_d1 <= nstate_d1;
        state_d2 <= nstate_d2;
        finish_i <= finish_n;
        if clear_finish = '1' then
          finish_i <= '0';
        end if;
      end if;
    end if;
  end process;
  -------------------------------------------------------------------------------------------------}}}
end Behavioral;

