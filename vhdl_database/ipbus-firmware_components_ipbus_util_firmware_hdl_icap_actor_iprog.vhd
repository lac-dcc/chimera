--======================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.icap_decl.all;
use work.icap_util.all;

entity icap_actor_iprog is
  port (
    clk : in std_logic;
    rst : in std_logic;
    -- The base address to start FPGA reconiguration from.
    base_address : in std_logic_vector(31 downto 0);
    -- A strobe to initiate FPGA reconfiguration.
    reconfigure  : in std_logic;

    -- ICAP interface.
    icap_ready : in std_logic;
    icap_cs    : out std_logic;
    icap_rw    : out std_logic;
    icap_data  : out std_logic_vector(31 downto 0)
  );
end icap_actor_iprog;

architecture behavioral of icap_actor_iprog is

  type STATE is (STATE_IDLE, STATE_RECONFIGURE);
  signal fsm_state : STATE;

  signal step : integer range 0 to 16;
  signal icap_ready_d : std_logic;
  signal icap_cs_i : std_logic;
  signal icap_rw_i : std_logic;
  signal icap_data_i : std_logic_vector(31 downto 0);

begin

  icap_driver : process(clk) is
  begin
    if rising_edge(clk) then
      if rst = '1' then
        fsm_state <= STATE_IDLE;
      else
        fsm_state <= fsm_state;

        case fsm_state is
          when STATE_IDLE =>
            icap_cs_i <= C_ICAP_CS_DISABLE;
            icap_rw_i <= C_ICAP_RW_READ;
            step <= 0;
            icap_data_i <= (others => '0');

          when STATE_RECONFIGURE =>
            icap_cs_i <= icap_cs_i;
            icap_rw_i <= icap_rw_i;
            icap_data_i <= icap_data_i;
            step <= step + 1;

            if icap_ready = '1' then
              case step is
                when 0 =>
                  -- Switch to ICAP write mode.
                  icap_rw_i <= C_ICAP_RW_WRITE;
                when 1 =>
                  -- ICAP enable.
                  icap_cs_i <= C_ICAP_CS_ENABLE;
                when 2 =>
                  -- Write dummy word.
                  icap_data_i <= C_ICAP_WORD_DUMMY;
                when 3 =>
                  -- Write sync word.
                  icap_data_i <= C_ICAP_WORD_SYNC;
                when 4 =>
                  -- Write type 1 'NOOP'.
                  icap_data_i <= C_ICAP_WORD_NOOP;
                when 5 =>
                  -- Write type-1 packet header to write to the WBSTAR
                  -- register.
                  icap_data_i <= build_icap_type1_packet(C_ICAP_TYPE1_OPCODE_WRITE,
                                                         C_ICAP_ADDRESS_WBSTAR);
                when 6 =>
                  -- Write the warm-boot start address.
                  icap_data_i <= base_address;
                when 7 =>
                  -- Write type 1 'NOOP'.
                  icap_data_i <= C_ICAP_WORD_NOOP;
                when 8 =>
                   -- Write type-1 packet header to write to the CMD
                  -- register.
                  icap_data_i <= build_icap_type1_packet(C_ICAP_TYPE1_OPCODE_WRITE,
                                                         C_ICAP_ADDRESS_CMD);
                when 9 =>
                  -- Send the actual IPROG command.
                  icap_data_i <= x"000000" & "000" & C_ICAP_CMD_IPROG;
                when others =>
                  -- Just in case.
                  fsm_state <= STATE_IDLE;
              end case;

            end if;
        end case;

        if reconfigure = '1' then
          fsm_state <= STATE_RECONFIGURE;
        end if;

        -- If the ICAP ready signal drops low, something else is going
        -- on (most likely JTAG or MCAP access). In that case we back
        -- off.
        if icap_ready = '0' and icap_ready_d = '1' then
          fsm_state <= STATE_IDLE;
        end if;

      end if;
    end if;
  end process;

  icap_ready_d <= icap_ready;
  icap_cs <= icap_cs_i;
  icap_rw <= icap_rw_i;
  icap_data <= bit_swap(icap_data_i);

end behavioral;

--======================================================================
