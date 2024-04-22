--! Copyright [2020] [Frans Schreuder]
--!
--!   Licensed under the Apache License, Version 2.0 (the "License");
--!   you may not use this file except in compliance with the License.
--!   You may obtain a copy of the License at
--!
--!       http://www.apache.org/licenses/LICENSE-2.0
--!
--!   Unless required by applicable law or agreed to in writing, software
--!   distributed under the License is distributed on an "AS IS" BASIS,
--!   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--!   See the License for the specific language governing permissions and
--!   limitations under the License.
library ieee;
use ieee.std_logic_1164.all;
library std;
use std.env.all;

entity xpm_fifo_axi_reg_slice is
  generic (
    C_DATA_WIDTH : integer := 32;
    C_REG_CONFIG : integer := 0
  );
  port(
   -- System Signals
   ACLK        : in std_logic;                      
   ARESET      : in std_logic;                      
   
   -- Slave side
   S_PAYLOAD_DATA : in std_logic_vector(C_DATA_WIDTH-1 downto 0);
   S_VALID        : in std_logic;
   S_READY        : out std_logic;
   
   -- Master side
   M_PAYLOAD_DATA : out std_logic_vector(C_DATA_WIDTH-1 downto 0);
   M_VALID        : out std_logic;
   M_READY        : in std_logic
   );
end xpm_fifo_axi_reg_slice;

architecture rtl of xpm_fifo_axi_reg_slice is


  constant RST_SYNC_STAGES : integer := 5;
  constant RST_BUSY_LEN    : integer := 6;
  signal arst_sync_wr : std_logic_vector(1 downto 0) := "11";
  signal sckt_wr_rst_cc : std_logic_vector(RST_BUSY_LEN-1 downto 0) := (others => '0');
  signal sync_reset : std_logic;
  signal extnd_reset : std_logic;

begin

  process(ARESET, ACLK)
  begin
    if ARESET = '1' then
        arst_sync_wr <= "11";
    elsif rising_edge(ACLK) then
      arst_sync_wr <= arst_sync_wr(0) &'0';
    end if;
  end process;

  process(ACLK)
  begin
    if rising_edge(ACLK) then
        sckt_wr_rst_cc   <= sckt_wr_rst_cc(RST_BUSY_LEN-2 downto 0) & arst_sync_wr(1);
    end if;
  end process;

   sync_reset     <= (or sckt_wr_rst_cc(RST_BUSY_LEN-5 downto 0)) or arst_sync_wr(1);
   extnd_reset    <= (or sckt_wr_rst_cc) or arst_sync_wr(1);
  --------------------------------------------------------------------
  --
  -- Both FWD and REV mode
  --
  --------------------------------------------------------------------
    g_zero: if (C_REG_CONFIG = 0) generate
      signal state: std_logic_vector(1 downto 0);
      constant ZERO : std_logic_vector(1 downto 0) := "10";
      constant ONE  : std_logic_vector(1 downto 0) := "11";
      constant TWO  : std_logic_vector(1 downto 0) := "01";
      signal storage_data1 : std_logic_vector(C_DATA_WIDTH-1 downto 0) := (others => '0');
      signal storage_data2 : std_logic_vector(C_DATA_WIDTH-1 downto 0) := (others => '0');
      signal load_s1 : std_logic;
      signal load_s2 : std_logic;
      signal load_s1_from_s2 : std_logic;
      signal s_ready_i : std_logic; --local signal of output
      signal m_valid_i : std_logic; --local signal of output
      signal areset_d1 : std_logic; -- Reset delay register
      
    begin
      
      
      --  local signal to its output signal
       S_READY <= s_ready_i;
       M_VALID <= m_valid_i;

      process(ACLK)
      begin
        if rising_edge(ACLK) then
          areset_d1 <= extnd_reset;
        end if;
      end process;
      
      -- Load storage1 with either slave side data or from storage2
      process(ACLK)
      begin
        if rising_edge(ACLK) then
          if (load_s1 = '1') then
            if (load_s1_from_s2 = '1') then
              storage_data1 <= storage_data2;
            else
              storage_data1 <= S_PAYLOAD_DATA;        
            end if;
          end if;
        end if;
      end process;

      -- Load storage2 with slave side data
      process(ACLK)
      begin
        if rising_edge(ACLK) then
          if (load_s2 = '1') then
            storage_data2 <= S_PAYLOAD_DATA;
          end if;
        end if;
      end process;

      M_PAYLOAD_DATA <= storage_data1;

      -- Always load s2 on a valid transaction even if it's unnecessary
      load_s2 <= S_VALID and s_ready_i;

      -- Loading s1
      process(state, S_VALID, M_READY)
      begin
        if ( ((state = ZERO) and (S_VALID = '1')) or -- Load when empty on slave transaction
             -- Load when ONE if we both have read and write at the same time
             ((state = ONE) and (S_VALID = '1') and (M_READY = '1')) or
             -- Load when TWO and we have a transaction on Master side
             ((state = TWO) and (M_READY = '1'))) then
          load_s1 <= '1';
        else
          load_s1 <= '0';
        end if;
      end process;
      
      process(state)
      begin
        if state = TWO then
          load_s1_from_s2 <= '1';
        else
          load_s1_from_s2 <= '0';
        end if;
      end process;
                       
      -- State Machine for handling output signals
      process(ACLK)
      begin
        if rising_edge(ACLK) then
          if (sync_reset = '1' or extnd_reset = '1') then
            s_ready_i <= '0';
            state <= ZERO;
          elsif (areset_d1 = '1' and extnd_reset = '0') then
            s_ready_i <= '1';
          else
            case (state) is
              -- No transaction stored locally
              when ZERO =>
                if (S_VALID = '1') then
                  state <= ONE; -- Got one so move to ONE
                end if;
              -- One transaction stored locally
              when ONE =>
                if (M_READY = '1' and S_VALID = '0') then
                  state <= ZERO; -- Read out one so move to ZERO
                elsif (M_READY = '0' and S_VALID = '1') then
                  state <= TWO;  -- Got another one so move to TWO
                  s_ready_i <= '0';
                end if;
              -- TWO transaction stored locally
              when TWO =>
                if (M_READY = '1') then
                  state <= ONE; -- Read out one so move to ONE
                  s_ready_i <= '1';
                end if;
              when others => 
                state <= ZERO;
            end case;
          end if;
        end if; --rising_edge(ACLK)
      end process;
      
      m_valid_i <= state(0);
    end generate g_zero;

  --------------------------------------------------------------------
  --
  -- 1-stage pipeline register with bubble cycle, both FWD and REV pipelining
  -- Operates same as 1-deep FIFO
  --
  --------------------------------------------------------------------
    g_one: if (C_REG_CONFIG = 1) generate
      signal storage_data1 : std_logic_vector(C_DATA_WIDTH-1 downto 0) := (others => '0');
      signal s_ready_i: std_logic; --local signal of output
      signal m_valid_i: std_logic; --local signal of output
      signal areset_d1: std_logic; -- Reset delay register
    begin
      
      --  local signal to its output signal
      S_READY <= s_ready_i;
      M_VALID <= m_valid_i;

      process(ACLK)
      begin
        if rising_edge(ACLK) then
          areset_d1 <= extnd_reset;
        end if;
      end process;
      
      -- Load storage1 with slave side data
      process(ACLK)
      begin
        if rising_edge(ACLK) then
          if (sync_reset = '1' or extnd_reset = '1') then
            s_ready_i <= '0';
            m_valid_i <= '0';
          elsif (areset_d1 = '1' and extnd_reset = '0') then
            s_ready_i <= '1';
          elsif (m_valid_i = '1' and M_READY = '1') then
            s_ready_i <= '1';
            m_valid_i <= '0';
          elsif (S_VALID = '1' and s_ready_i = '1') then
            s_ready_i <= '0';
            m_valid_i <= '1';
          end if;
          if (m_valid_i = '0') then
            storage_data1 <= S_PAYLOAD_DATA;        
          end if;
        end if;
      end process;
      M_PAYLOAD_DATA <= storage_data1;
    end generate g_one;
    
    g_default: if (C_REG_CONFIG /= 0 and C_REG_CONFIG /= 1) generate
      -- Passthrough
       M_PAYLOAD_DATA <= S_PAYLOAD_DATA;
       M_VALID        <= S_VALID;
       S_READY        <= M_READY;      
    end generate;

end rtl;
