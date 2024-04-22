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

-- -------------------------------------------------------------------------------------------------------------------
-- Single-bit Synchronizer
-- -------------------------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library std;
use std.env.all;

entity xpm_cdc_low_latency_handshake is
  generic (

    -- Common module generics
    DEST_EXT_HSK   : integer := 1;
    DEST_SYNC_FF   : integer := 4;
    INIT_SYNC_FF   : integer := 0;
    SIM_ASSERT_CHK : integer := 0;
    SRC_SYNC_FF    : integer := 4;
    WIDTH          : integer := 1
  );
  port (

    src_clk   : in  std_logic;
    src_in    : in  std_logic_vector(WIDTH-1 downto 0);
    src_valid : in  std_logic;
    src_ready : out std_logic;
    dest_clk   : in  std_logic;
    dest_valid : out std_logic;
    dest_ready : in  std_logic;
    dest_out : out std_logic_vector(WIDTH-1 downto 0)
  );
end xpm_cdc_low_latency_handshake;

architecture rtl of xpm_cdc_low_latency_handshake is


  -- Set Asynchronous Register property on synchronizers
  signal dest_hsdata_ff : std_logic_vector(WIDTH-1 downto 0);
  attribute ASYNC_REG : string;
  attribute ASYNC_REG of dest_hsdata_ff : signal is "TRUE";
  
  signal src_hsdata_ff  : std_logic_vector(WIDTH-1 downto 0);
  signal src_valid_nxt : std_logic;
  signal src_count_nxt : std_logic;
  signal src_count_ff : std_logic := '0';
  signal src_count_sync_ff : std_logic;
  
  signal dest_hsdata_ff_en : std_logic;
  attribute DIRECT_ENABLE : string;
  attribute DIRECT_ENABLE of dest_hsdata_ff_en : signal is "yes";
  
  signal dest_valid_ext_ff : std_logic;
  signal dest_valid_nxt : std_logic;
  signal dest_ready_in : std_logic;
  signal dest_ready_nxt : std_logic;
  signal dest_count_nxt : std_logic;
  signal dest_count_eq : std_logic;
  signal dest_count_ff : std_logic := '0';
  signal dest_count_sync_ff : std_logic;
  signal src_count_eq : std_logic;
  signal src_ready_nxt : std_logic;
  signal src_ready_ext_ff : std_logic;
  signal src_ready_s : std_logic;

begin

  -- -------------------------------------------------------------------------------------------------------------------
  -- Configuration DRCs
  -- -------------------------------------------------------------------------------------------------------------------
  config_drc_single: process
    variable drc_err_flag: integer := 0;
  begin
    
    if ((DEST_EXT_HSK/=0) and (DEST_EXT_HSK/=1)) then
       report("[XPM_CDC 8-5] DEST_EXT_HSK ("&integer'image(DEST_EXT_HSK)&") is outside of valid range.") severity error;
       drc_err_flag := 1;
    end if;

    if ((DEST_SYNC_FF < 2) or (DEST_SYNC_FF > 10)) then
       report("[XPM_CDC 8-2] DEST_SYNC_FF ("&integer'image(DEST_SYNC_FF)&") is outside of valid range of 2-10.") severity error;
       drc_err_flag := 1;
    end if;

    if ((INIT_SYNC_FF/=0) and (INIT_SYNC_FF/=1)) then
       report("[XPM_CDC 8-7] INIT_SYNC_FF ("&integer'image(INIT_SYNC_FF)&") is outside of valid range.") severity error;
       drc_err_flag := 1;
    end if;

    if ((SIM_ASSERT_CHK/=0) and (SIM_ASSERT_CHK/=1)) then
       report("[XPM_CDC 8-6] SIM_ASSERT_CHK ("&integer'image(SIM_ASSERT_CHK)&") is outside of valid range.") severity error;
       drc_err_flag := 1;
    end if;

    if ((SRC_SYNC_FF < 2) or (SRC_SYNC_FF > 10)) then
       report("[XPM_CDC 8-3] SRC_SYNC_FF ("&integer'image(SRC_SYNC_FF)&") is outside of valid range of 2-10.") severity error;
       drc_err_flag := 1;
    end if;

    if ((WIDTH < 1) or (WIDTH > 2048)) then
       report("[XPM_CDC 8-4] WIDTH ("&integer'image(WIDTH)&") is outside of valid range of 1-2048.") severity error;
       drc_err_flag := 1;
    end if;

    if (drc_err_flag = 1) then
       std.env.finish(1);
    end if;
    wait;
  end process config_drc_single;

  src_valid_nxt <= src_valid and src_ready_s;
  with src_valid_nxt select src_count_nxt <= (not src_count_ff) when '1', src_count_ff when others;
  
  dest_ready_nxt <= dest_valid_ext_ff and dest_ready_in;
  with dest_ready_nxt select dest_count_nxt <= not dest_count_ff when '1', dest_count_ff when others;
  
  process(src_count_sync_ff, dest_count_ff)
  begin
    if src_count_sync_ff = dest_count_ff then
      dest_count_eq <= '1';
    else
      dest_count_eq <= '0';
    end if;
  end process;
  
  dest_hsdata_ff_en <= not dest_count_eq and not dest_valid_ext_ff;
  dest_valid_nxt <= not dest_count_eq and not dest_ready_nxt;
  dest_valid     <= dest_valid_ext_ff;
  
  process(src_count_ff, dest_count_sync_ff)
  begin
    if src_count_ff = dest_count_sync_ff then
      src_count_eq <= '1';
    else
      src_count_eq <= '0';
    end if;
  end process;
  
  src_ready_nxt  <= src_count_eq and not src_valid_nxt;
  src_ready_s      <= src_ready_ext_ff;
  src_ready <= src_ready_s;

  dest_out <= dest_hsdata_ff;

  ext_desthsk : if(DEST_EXT_HSK = 1) generate
    dest_ready_in <= dest_ready;
  end generate ext_desthsk;
  internal_desthsk : if(DEST_EXT_HSK /= 1) generate
    dest_ready_in <= '1';
  end generate internal_desthsk;

  process(src_clk)
  begin
    if rising_edge(src_clk) then
      if src_valid_nxt = '1' then
        src_hsdata_ff <= src_in;
      end if;
      src_count_ff <= src_count_nxt;
      src_ready_ext_ff <= src_ready_nxt;
    end if;
  end process;


  process(dest_clk)
  begin
    if rising_edge(dest_clk) then
      if dest_hsdata_ff_en = '1' then
        dest_hsdata_ff <= src_hsdata_ff;
      end if;
      dest_count_ff <= dest_count_nxt;
      dest_valid_ext_ff <= dest_valid_nxt;
    end if;
  end process;

  -- -------------------------------------------------------------------------------------------------------------------
  -- xpm_cdc_single instantiation
  -- -------------------------------------------------------------------------------------------------------------------
  xpm_cdc_single_src2dest_inst: entity work.xpm_cdc_single 
  generic map  (
    DEST_SYNC_FF   => DEST_SYNC_FF,
    INIT_SYNC_FF   => INIT_SYNC_FF,
    SRC_INPUT_REG  => 0,
    SIM_ASSERT_CHK => SIM_ASSERT_CHK
  )  
  port map(

    src_clk        => src_clk,
    dest_clk       => dest_clk,
    src_in         => src_count_ff,
    dest_out       => src_count_sync_ff
  );

  -- -------------------------------------------------------------------------------------------------------------------
  -- xpm_cdc_single instantiation
  -- -------------------------------------------------------------------------------------------------------------------
  xpm_cdc_single_dest2src_inst: entity work.xpm_cdc_single 
  generic map  (
    DEST_SYNC_FF   => SRC_SYNC_FF,
    INIT_SYNC_FF   => INIT_SYNC_FF,
    SRC_INPUT_REG  => 0,
    SIM_ASSERT_CHK => SIM_ASSERT_CHK
  )  
  port map(
    src_clk        => dest_clk,
    dest_clk       => src_clk,
    src_in         => dest_count_ff,
    dest_out       => dest_count_sync_ff
  );
  

end architecture rtl;
