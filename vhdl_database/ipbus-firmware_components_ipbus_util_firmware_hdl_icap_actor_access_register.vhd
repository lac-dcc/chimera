--======================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.icap_decl.all;
use work.icap_util.all;

entity icap_actor_access_register is
  port (
    clk : in std_logic;
    rst : in std_logic;

    -- NOTE: Only the lower five address bits are actually used.
    register_address : in std_logic_vector(31 downto 0);
    -- Access mode: 0 = read, 1 = write.
    access_mode : in std_logic;
    -- The strobe triggers the ICAP transaction.
    strobe : in std_logic;
    -- Data in for register writes.
    data_in : in std_logic_vector(31 downto 0);
    -- Data out and a corresponding data-valid flag for register
    -- reads.
    data_out : out std_logic_vector(31 downto 0);
    data_out_valid : out std_logic;

    -- ICAP interface.
    icap_ready  : in std_logic;
    icap_cs     : out std_logic;
    icap_rw     : out std_logic;
    icap_data_w : out std_logic_vector(31 downto 0);
    icap_data_r : in std_logic_vector(31 downto 0)
  );
end icap_actor_access_register;

architecture behavioral of icap_actor_access_register is

  constant C_ACCESS_MODE_READ : std_logic := '0';
  constant C_ACCESS_MODE_WRITE : std_logic := '1';

  type STATE is (STATE_IDLE, STATE_SYNC, STATE_READ, STATE_WRITE, STATE_DESYNC);
  signal fsm_state : STATE;

  signal step : integer range 0 to 16;
  signal icap_ready_d : std_logic;
  signal icap_cs_i : std_logic;
  signal icap_rw_i : std_logic;
  signal icap_data_w_i : std_logic_vector(31 downto 0);
  signal icap_data_r_i : std_logic_vector(31 downto 0);
  signal reg_val : std_logic_vector(31 downto 0);
  signal data_valid_i : std_logic;

begin

  icap_driver : process(clk) is
  begin
    if rising_edge(clk) then
      if rst = '1' then
        fsm_state <= STATE_IDLE;
      else
        fsm_state <= fsm_state;
        reg_val <= reg_val;
        data_valid_i <= data_valid_i;

        case fsm_state is
          when STATE_IDLE =>
            icap_cs_i <= C_ICAP_CS_DISABLE;
            icap_rw_i <= C_ICAP_RW_READ;
            step <= 0;
            icap_data_w_i <= (others => '0');

          when STATE_SYNC =>
            icap_cs_i <= icap_cs_i;
            icap_rw_i <= icap_rw_i;
            icap_data_w_i <= icap_data_w_i;
            step <= step + 1;

            if icap_ready = '1' then
              case step is
                when 0 =>
                  -- Initialise.
                  reg_val <= (others => '0');
                  data_valid_i <= '0';
                when 1 =>
                  -- Switch to ICAP write mode.
                  icap_rw_i <= C_ICAP_RW_WRITE;
                when 2 =>
                  -- ICAP enable.
                  icap_cs_i <= C_ICAP_CS_ENABLE;
                when 3 =>
                  -- Write dummy word.
                  icap_data_w_i <= C_ICAP_WORD_DUMMY;
                when 4 =>
                  -- Write bus width sync word.
                  icap_data_w_i <= C_ICAP_WORD_BUS_WIDTH_SYNC;
                when 5 =>
                  -- Write bus width detect word.
                  icap_data_w_i <= C_ICAP_WORD_BUS_WIDTH_DETECT;
                when 6 =>
                  -- Write dummy word.
                  icap_data_w_i <= C_ICAP_WORD_DUMMY;
                when 7 =>
                  -- Write sync word.
                  icap_data_w_i <= C_ICAP_WORD_SYNC;
                when 8 | 9 =>
                  -- Write two no-ops.
                  -- NOTE: Two no-ops are required, contrary to what the
                  -- documentation says.
                  icap_data_w_i <= C_ICAP_WORD_NOOP;
                when 10 =>
                  fsm_state <= STATE_READ;
                  if access_mode = C_ACCESS_MODE_WRITE then
                    fsm_state <= STATE_WRITE;
                  end if;
                  step <= 0;
                when others =>
                  -- Just in case.
                  fsm_state <= STATE_IDLE;
              end case;
            end if;

          when STATE_READ =>
            icap_cs_i <= icap_cs_i;
            icap_rw_i <= icap_rw_i;
            icap_data_w_i <= icap_data_w_i;
            step <= step + 1;

            if icap_ready = '1' then
              case step is
                when 0 =>
                  -- Write type-1 packet header to read the requested register.
                  icap_data_w_i <= build_icap_type1_packet(C_ICAP_TYPE1_OPCODE_READ,
                                                           register_address(4 downto 0));
                when 1 | 2 =>
                  -- Write two no-ops to flush the packet buffer.
                  icap_data_w_i <= C_ICAP_WORD_NOOP;
                when 3 =>
                  -- ICAP disable.
                  icap_cs_i <= C_ICAP_CS_DISABLE;
                when 4 =>
                  -- Switch to ICAP read mode.
                  icap_rw_i <= C_ICAP_RW_READ;
                when 5 =>
                  -- ICAP enable.
                  icap_cs_i <= C_ICAP_CS_ENABLE;
                when 6 | 7 | 8 =>
                  -- Wait three ticks for the data to become valid.
                when 9 =>
                  -- Read the requested register value.
                  reg_val <= icap_data_r_i;
                  data_valid_i <= '1';
                when 10 =>
                  fsm_state <= STATE_DESYNC;
                  step <= 0;
                when others =>
                  -- Just in case.
                  fsm_state <= STATE_IDLE;
              end case;
            end if;

          when STATE_WRITE =>
            icap_cs_i <= icap_cs_i;
            icap_rw_i <= icap_rw_i;
            icap_data_w_i <= icap_data_w_i;
            step <= step + 1;

            if icap_ready = '1' then
              case step is
                when 0 =>
                  -- Write type-1 packet header to write the requested register.
                  icap_data_w_i <= "001"
                                   & C_ICAP_TYPE1_OPCODE_WRITE
                                   & "000000000"
                                   & register_address(4 downto 0)
                                   & "00"
                                   & "00000000001";
                when 1 =>
                  -- Write the actual data.
                  icap_data_w_i <= data_in;
                when 2 =>
                  fsm_state <= STATE_DESYNC;
                  step <= 0;
                when others =>
                  -- Just in case.
                  fsm_state <= STATE_IDLE;
              end case;
            end if;

          when STATE_DESYNC =>
            icap_cs_i <= icap_cs_i;
            icap_rw_i <= icap_rw_i;
            icap_data_w_i <= icap_data_w_i;
            step <= step + 1;

            if icap_ready = '1' then
              case step is
                when 0 =>
                  -- ICAP disable.
                  icap_cs_i <= C_ICAP_CS_DISABLE;
                when 1 =>
                  -- Switch to ICAP write mode.
                  icap_rw_i <= C_ICAP_RW_WRITE;
                when 2 =>
                  -- ICAP enable.
                  icap_cs_i <= C_ICAP_CS_ENABLE;
                when 3 =>
                  -- Write type-1 packet header to write to the CMD
                  -- register.
                  icap_data_w_i <= build_icap_type1_packet(C_ICAP_TYPE1_OPCODE_WRITE,
                                                           C_ICAP_ADDRESS_CMD);
                when 4 =>
                  -- Write the DESYNC command.
                  icap_data_w_i <= C_ICAP_WORD_DESYNC;
                when 5 | 6 =>
                  -- Write two no-ops to flush the packet buffer.
                  icap_data_w_i <= C_ICAP_WORD_NOOP;
                when 7 =>
                  -- Done.
                  fsm_state <= STATE_IDLE;
                  step <= step;
                when others =>
                  -- Just in case.
                  fsm_state <= STATE_IDLE;
              end case;

            end if;
        end case;

        if strobe = '1' then
          fsm_state <= STATE_SYNC;
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
  icap_data_w <= bit_swap(icap_data_w_i);
  icap_data_r_i <= bit_swap(icap_data_r);

  data_out <= reg_val;
  data_out_valid <= data_valid_i;

end behavioral;

--======================================================================
