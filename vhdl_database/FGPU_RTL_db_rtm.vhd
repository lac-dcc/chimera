-- The RTM memory contains data useful for the execution of WI built-in functions.
-- This memory is written by the WG dispatcher or by the WF scheduler when a WG or a WF get scheduled on the CV, respectively.

-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library fgpu;
use fgpu.definitions.all;
use fgpu.components.all;
---------------------------------------------------------------------------------------------------------}}}
entity rtm is
  -- ports {{{
port(
  clk                 : in  std_logic;

  rtm_rdAddr          : in  unsigned(RTM_ADDR_W-1 downto 0); -- level 13.
    -- RTM read address
  rtm_rdData          : out  unsigned(RTM_DATA_W-1 downto 0); -- level 15.
    -- RTM read data
  rtm_wrData_cv       : in  unsigned(DATA_W-1 downto 0); -- from cu_scheduler
    -- RTM cv write data
  rtm_wrAddr_cv       : in  unsigned(N_WF_CU_W+2-1 downto 0); -- from cu_scheduler
    -- RTM cv write address
  rtm_we_cv           : in  std_logic; -- from cu_scheduler
    -- RTM cv write enable
  rtm_wrAddr_wg       : in  unsigned(RTM_ADDR_W-1 downto 0); -- from cu_scheduler
    -- RTM wg write address
  rtm_wrData_wg       : in  unsigned(RTM_DATA_W-1 downto 0); -- from cu_scheduler
    -- RTM wg write data
  rtm_we_wg           : in  std_logic; -- from cu_scheduler
    -- RTM wg write enable
  WGsDispatched       : in  std_logic;
    -- signal high when WG Dispatcher has scheduled all WGs
  start_CUs           : in  std_logic;
    -- signal set to '1' when the scheduling of WGs begins (after the initializion phase)

  nrst                : in  std_logic
  );
-- }}}
end rtm;

architecture Behavioral of rtm is

  -- signals definitions {{{
  signal rtm                      : rtm_ram_type(0 to RTM_SIZE-1) := (others => (others => '0'));
    -- RTM memory
  signal rtm_wrData, rtm_wrData_n : unsigned(RTM_DATA_W-1 downto 0);
    -- RTM write data
  signal rtm_rdData_n             : unsigned(RTM_DATA_W-1 downto 0);
    -- RTM read data
  signal rtm_wrAddr, rtm_wrAddr_n : unsigned(RTM_ADDR_W-1 downto 0);
    -- RTM write address
  signal rtm_we, rtm_we_n         : std_logic;
    -- RTM write enable

  type st_rtm_write_type  is (wg_dispatcher, cv_Dispatcher);
  signal st_rtm_write          : st_rtm_write_type;
    -- RTM FSM state
  signal st_rtm_write_n        : st_rtm_write_type;
    -- RTM FSM next state
  -- }}}

begin
  -- Local Memory -------------------------------------------------------------------------------------------{{{
  ---------------------------------------------------------------------------------------------------------}}}

  -- RTM ram ------------------------------------------------------------------------------------ {{{
  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        rtm_rdData_n <= (others => '0'); -- NOT NEEDED
        rtm_rdData   <= (others => '0'); -- NOT NEEDED
      else
        rtm_rdData_n <= rtm(to_integer(rtm_rdAddr)); -- @ 14.
        rtm_rdData   <= rtm_rdData_n; -- @ 15.
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if rtm_we = '1' then
        rtm(to_integer(rtm_wrAddr)) <= rtm_wrData;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        st_rtm_write <= wg_dispatcher;
        rtm_we <= '0';

        rtm_wrData <= (others => '0'); -- NOT NEEDED
        rtm_wrAddr <= (others => '0'); -- NOT NEEDED
      else
        st_rtm_write <= st_rtm_write_n;
        rtm_we <= rtm_we_n;

        rtm_wrData <= rtm_wrData_n;
        rtm_wrAddr <= rtm_wrAddr_n;
      end if;
    end if;
  end process;

  process(st_rtm_write, start_CUs, WGsDispatched, rtm_wrAddr_cv, rtm_wrAddr_wg, rtm_wrData_cv, rtm_wrData_wg, rtm_we_cv, rtm_we_wg, rtm_wrData, rtm_wrAddr, rtm_we)
  begin
      st_rtm_write_n <= st_rtm_write;
      rtm_wrAddr_n <= rtm_wrAddr;
      rtm_wrData_n <= rtm_wrData;
      rtm_we_n <= rtm_we;

      case st_rtm_write is
        when wg_dispatcher =>
          if start_CUs = '1' then
            st_rtm_write_n <= cv_Dispatcher;
          end if;
          rtm_wrAddr_n <= rtm_wrAddr_wg;
          rtm_wrData_n <= rtm_wrData_wg;
          rtm_we_n <= rtm_we_wg;

        when cv_Dispatcher =>
          if WGsDispatched = '1' then
            st_rtm_write_n <= wg_dispatcher;
          end if;
          rtm_wrAddr_n(RTM_ADDR_W-1) <= '1';
          rtm_wrAddr_n(RTM_ADDR_W-2 downto PHASE_W) <= rtm_wrAddr_cv;
          rtm_wrAddr_n(PHASE_W-1 downto 0) <= (others => '0');
          rtm_wrData_n(DATA_W-1 downto 0) <= rtm_wrData_cv;
          rtm_we_n <= rtm_we_cv;
      end case;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}

end Behavioral;
