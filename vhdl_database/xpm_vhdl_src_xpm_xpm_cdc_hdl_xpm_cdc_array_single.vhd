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

entity xpm_cdc_array_single is
  generic (

    -- Common module generics
    DEST_SYNC_FF   : integer := 4;
    INIT_SYNC_FF   : integer := 0;
    SIM_ASSERT_CHK : integer := 0;
    SRC_INPUT_REG  : integer := 1;
    WIDTH          : integer := 2
  );
  port (

    src_clk  : in std_logic;
    src_in   : in std_logic_vector(WIDTH-1 downto 0);
    dest_clk : in std_logic;
    dest_out : out std_logic_vector(WIDTH-1 downto 0)
  );
end xpm_cdc_array_single;

architecture rtl of xpm_cdc_array_single is
    type reg_type is array(DEST_SYNC_FF-1 downto 0) of std_logic_vector(WIDTH-1 downto 0);
    signal syncstages_ff : reg_type;
    attribute ASYNC_REG : string;
    attribute ASYNC_REG of syncstages_ff : signal is "TRUE";
    signal src_ff         : std_logic_vector(WIDTH-1 downto 0);
    signal src_inqual     : std_logic_vector(WIDTH-1 downto 0);
    signal async_path_bit : std_logic_vector(WIDTH-1 downto 0);

begin

  -- -------------------------------------------------------------------------------------------------------------------
  -- Configuration DRCs
  -- -------------------------------------------------------------------------------------------------------------------
  config_drc_single: process
    variable drc_err_flag: integer := 0;
  begin
    
    if ((DEST_SYNC_FF < 2) or (DEST_SYNC_FF > 10)) then
       report("[XPM_CDC 5-2] DEST_SYNC_FF ("&integer'image(DEST_SYNC_FF)&") value is outside of valid range of 2-10.") severity error;
       drc_err_flag := 1;
    end if;

    if ((INIT_SYNC_FF/=0) and (INIT_SYNC_FF/=1)) then
       report("[XPM_CDC 5-6] INIT_SYNC_FF ("&integer'image(INIT_SYNC_FF)&") is outside of valid range." ) severity error;
       drc_err_flag := 1;
    end if;

    if ((SIM_ASSERT_CHK/=0) and (SIM_ASSERT_CHK/=1)) then
       report("[XPM_CDC 5-5] SIM_ASSERT_CHK ("&integer'image(SIM_ASSERT_CHK)&") value is outside of valid range. %m") severity error;
       drc_err_flag := 1;
    end if;
    
    if ((SRC_INPUT_REG /= 0) and (SRC_INPUT_REG /= 1)) then
       report("[XPM_CDC 5-3] SRC_INPUT_REG ("&integer'image(SRC_INPUT_REG)&") value is outside of valid range. %m") severity error;
       drc_err_flag := 1;
    end if;
    
    if ((WIDTH < 1) or (WIDTH > 1024)) then
       report("[XPM_CDC 5-4] WIDTH ("&integer'image(WIDTH)&") is outside of valid range of 1-1024.") severity error;
       drc_err_flag := 1;
    end if;
    
    if (drc_err_flag = 1) then
      std.env.finish(1);
    end if;
    wait;
  end process config_drc_single;


  

  dest_out <= syncstages_ff(DEST_SYNC_FF-1);


  process(dest_clk) 
  begin
    if rising_edge(dest_clk) then
      syncstages_ff(0) <= async_path_bit;
      for syncstage in 1 to DEST_SYNC_FF-1 loop
        syncstages_ff(syncstage) <= syncstages_ff (syncstage-1);
      end loop;
    end if;
  end process;
  
  async_path_bit <= src_inqual;

  -- Virtual mux:  Register at input optional.
  extra_inreg: if (SRC_INPUT_REG = 1) generate
    src_inqual <= src_ff;
  end generate extra_inreg;
  no_extra_inreg: if (SRC_INPUT_REG /= 1) generate
    src_inqual <= src_in;
  end generate no_extra_inreg;
  
  process(src_clk)
  begin
    if rising_edge(src_clk) then
        src_ff <= src_in;
    end if;
  end process;
  
end architecture rtl;
