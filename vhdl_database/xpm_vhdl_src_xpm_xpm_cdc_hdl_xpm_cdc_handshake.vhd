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

entity xpm_cdc_handshake is
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

    src_clk  : in  std_logic;
    src_in   : in  std_logic_vector(WIDTH-1 downto 0);
    src_send : in  std_logic;
    src_rcv  : out std_logic;
    dest_clk : in  std_logic;
    dest_req : out std_logic;
    dest_ack : in  std_logic;
    dest_out : out std_logic_vector(WIDTH-1 downto 0)
  );
end xpm_cdc_handshake;

architecture rtl of xpm_cdc_handshake is

  signal dest_hsdata_ff : std_logic_vector(WIDTH-1 downto 0) := (others => '0');

  attribute ASYNC_REG : string;
  attribute ASYNC_REG of dest_hsdata_ff : signal is "TRUE";

  
  -- We can do set max delay between source and dest.
  -- For option with no input register, we have to create a smart constraint
  -- for set max delay.
  signal  src_hsdata_ff : std_logic_vector(WIDTH-1 downto 0);
  signal  dest_req_nxt : std_logic;
  signal  dest_req_ff  : std_logic;
  signal  dest_hsdata_en : std_logic;
  
  attribute DIRECT_ENABLE : string;
  attribute DIRECT_ENABLE of dest_hsdata_en : signal is "yes";
  
  signal dest_req_ext_nxt : std_logic;
  signal dest_req_ext_ff : std_logic;
  signal src_hsdata_nxt  : std_logic_vector(WIDTH-1 downto 0);
  signal dest_hsdata_nxt : std_logic_vector(WIDTH-1 downto 0);
  signal src_data_src    : std_logic_vector(WIDTH-1 downto 0);
  signal dest_req_sync : std_logic;
  signal dest_ack_sync_in : std_logic;
  signal src_sendd_ff : std_logic;
  signal src_sendd_nxt : std_logic;


begin

  -- -------------------------------------------------------------------------------------------------------------------
  -- Configuration DRCs
  -- -------------------------------------------------------------------------------------------------------------------
  config_drc_single: process
    variable drc_err_flag: integer := 0;
  begin
  
    if ((DEST_EXT_HSK/=0) and (DEST_EXT_HSK/=1)) then
       report("[XPM_CDC 3-5] DEST_EXT_HSK ("&integer'image(DEST_EXT_HSK)&") is outside of valid range.") severity error;
       drc_err_flag := 1;
    end if;

    if ((DEST_SYNC_FF < 2) or (DEST_SYNC_FF > 10)) then
       report("[XPM_CDC 3-2] DEST_SYNC_FF ("&integer'image(DEST_SYNC_FF)&") is outside of valid range of 2-10.") severity error;
       drc_err_flag := 1;
    end if;

    if ((INIT_SYNC_FF/=0) and (INIT_SYNC_FF/=1)) then
       report("[XPM_CDC 3-7] INIT_SYNC_FF ("&integer'image(INIT_SYNC_FF)&") is outside of valid range.") severity error;
       drc_err_flag := 1;
    end if;

    if ((SIM_ASSERT_CHK/=0) and (SIM_ASSERT_CHK/=1)) then
       report("[XPM_CDC 3-6] SIM_ASSERT_CHK ("&integer'image(SIM_ASSERT_CHK)&") is outside of valid range.") severity error;
       drc_err_flag := 1;
    end if;

    if ((SRC_SYNC_FF < 2) or (SRC_SYNC_FF > 10)) then
       report("[XPM_CDC 3-3] SRC_SYNC_FF ("&integer'image(SRC_SYNC_FF)&") is outside of valid range of 2-10.") severity error;
       drc_err_flag := 1;
    end if;


    if ((WIDTH < 1) or (WIDTH > 1024)) then
       report("[XPM_CDC 3-4] WIDTH ("&integer'image(WIDTH)&") is outside of valid range of 1-1024.") severity error;
       drc_err_flag := 1;
    end if;

    if (drc_err_flag = 1) then
       std.env.finish(1);
    end if;
    wait;
  end process config_drc_single;

  ---------------------------------------------------------------------------------------------------------------------
  -- xpm_cdc_single instantiation
  ---------------------------------------------------------------------------------------------------------------------
  xpm_cdc_single_src2dest_inst: entity work.xpm_cdc_single 
  generic map  (
    DEST_SYNC_FF   => DEST_SYNC_FF,
    INIT_SYNC_FF   => INIT_SYNC_FF,
    SRC_INPUT_REG  => 0           
  )  
  port map(

    src_clk        => src_clk      ,
    dest_clk       => dest_clk     ,
    src_in         => src_sendd_ff ,
    dest_out       => dest_req_sync
  );

  --src_data is always registered once
  src_data_src <= src_hsdata_ff;
  with src_sendd_ff select src_hsdata_nxt <= src_in when '0', src_hsdata_ff when others;
  dest_hsdata_nxt <= src_data_src;
  dest_out        <= dest_hsdata_ff;
  dest_req_nxt    <= dest_req_sync;
  dest_hsdata_en  <= (not dest_req_ff) and dest_req_sync;
  src_sendd_nxt   <= src_send;

  -- -------------------------------------------------------------------------------------------------------------------
  -- xpm_cdc_single instantiation
  -- -------------------------------------------------------------------------------------------------------------------
  xpm_cdc_single_dest2src_inst : entity work.xpm_cdc_single 
  generic map  (
    DEST_SYNC_FF   => SRC_SYNC_FF  ,
    INIT_SYNC_FF   => INIT_SYNC_FF ,
    SRC_INPUT_REG  => 0            
  )  
  port map(
    src_clk        => dest_clk        ,
    dest_clk       => src_clk         ,
    src_in         => dest_ack_sync_in,
    dest_out       => src_rcv         
  );

  ext_desthsk: if(DEST_EXT_HSK = 1) generate
    dest_ack_sync_in <= dest_ack;
    dest_req_ext_nxt <= dest_req_sync ;
  end generate;
  internal_desthsk: if(DEST_EXT_HSK /= 1) generate
    dest_ack_sync_in <= dest_req_ff;
    dest_req_ext_nxt <= dest_req_sync and (not dest_req_ff);
  end generate;
  
  dest_req <= dest_req_ext_ff;

  process(src_clk)
  begin
    if rising_edge(src_clk) then
      src_sendd_ff <= src_sendd_nxt;
      src_hsdata_ff <= src_hsdata_nxt;
    end if;
  end process;

  process(dest_clk)
  begin
    if rising_edge(dest_clk) then
      if dest_hsdata_en = '1' then
        dest_hsdata_ff <= dest_hsdata_nxt;
      end if;
      dest_req_ff <= dest_req_nxt;
      dest_req_ext_ff <= dest_req_ext_nxt;
    end if;
  end process;


end architecture rtl;
