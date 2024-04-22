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

entity xpm_cdc_async_rst is
  generic (

    -- Common module parameters
    DEST_SYNC_FF    : integer := 4;
    INIT_SYNC_FF    : integer := 0;
    RST_ACTIVE_HIGH : integer := 0
  );
  port (

    src_arst  : in std_logic;
    dest_clk  : in std_logic;
    dest_arst : out std_logic
  );
end xpm_cdc_async_rst;

architecture rtl of xpm_cdc_async_rst is
  ---------------------------------------------------------------------------------------------------------------------
  -- Local parameter definitions
  ---------------------------------------------------------------------------------------------------------------------
  constant DEF_VALS : std_logic_vector(1 downto 0) := "01";
  constant DEF_VAL : std_logic := DEF_VALS(RST_ACTIVE_HIGH);
  constant INV_DEF_VALS : std_logic_vector(1 downto 0) := "10";
  constant INV_DEF_VAL : std_logic := INV_DEF_VALS(RST_ACTIVE_HIGH);
  
  -- Set asynchronous register property on synchronizers and initialize register with default value
  signal arststages_ff : std_logic_vector(DEST_SYNC_FF-1 downto 0) := (others => DEF_VAL);
  attribute ASYNC_REG : string;
  attribute ASYNC_REG of arststages_ff : signal is "TRUE";
  
  constant async_path_bit : std_logic := DEF_VALS(RST_ACTIVE_HIGH);
  signal reset_pol : std_logic;
  signal reset_polo : std_logic;
  

begin

  -- -------------------------------------------------------------------------------------------------------------------
  -- Configuration DRCs
  -- -------------------------------------------------------------------------------------------------------------------
  config_drc_single: process
    variable drc_err_flag: integer := 0;
  begin
  
    if ((DEST_SYNC_FF<2) or (DEST_SYNC_FF>10)) then
       report("[XPM_CDC 7-2] DEST_SYNC_FF ("&integer'image(DEST_SYNC_FF)&") is outside of valid range.") severity error;
       drc_err_flag := 1;
    end if;

    if ((INIT_SYNC_FF/=0) and (INIT_SYNC_FF/=1)) then
       report("[XPM_CDC 7-4] INIT_SYNC_FF ("&integer'image(INIT_SYNC_FF)&") is outside of valid range.") severity error;
       drc_err_flag := 1;
    end if;

    if ((RST_ACTIVE_HIGH /= 0) and (RST_ACTIVE_HIGH /= 1)) then
       report("[XPM_CDC 7-3] RST_ACTIVE_HIGH ("&integer'image(RST_ACTIVE_HIGH)&") value is outside of valid range.") severity error;
       drc_err_flag := 1;
    end if;
    
    if (drc_err_flag = 1) then
       std.env.finish(1);
    end if;
    wait;
  end process config_drc_single;



  reset_polo <= arststages_ff(DEST_SYNC_FF-1);
  reset_pol <= src_arst xor DEF_VAL;
  dest_arst <= reset_polo;

  -- Instantiate Xilinx Asynchronous Clear Registerprocess(dest_clk)
  process(dest_clk, reset_pol)
  begin
    if reset_pol = '1' then
        arststages_ff <= (others => INV_DEF_VAL);
    elsif rising_edge(dest_clk) then
        arststages_ff <= arststages_ff(DEST_SYNC_FF-2 downto 0) & async_path_bit;
    end if;
  end process;
  
end architecture rtl;
