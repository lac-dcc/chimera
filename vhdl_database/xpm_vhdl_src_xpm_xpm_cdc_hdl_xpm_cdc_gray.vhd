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

entity xpm_cdc_gray is
  generic (

    -- Common module generics
    DEST_SYNC_FF          : integer := 4;
    INIT_SYNC_FF          : integer := 0;
    REG_OUTPUT            : integer := 0;
    SIM_ASSERT_CHK        : integer := 0;
    SIM_LOSSLESS_GRAY_CHK : integer := 0;
    WIDTH                 : integer := 2
  );
  port (

    src_clk      : in std_logic;
    src_in_bin   : in std_logic_vector(WIDTH-1 downto 0);
    dest_clk     : in std_logic;
    dest_out_bin : out std_logic_vector(WIDTH-1 downto 0)
  );
end xpm_cdc_gray;

architecture rtl of xpm_cdc_gray is

  -- Set Asynchronous Register property on synchronizers
  type reg_type is array(DEST_SYNC_FF-1 downto 0) of std_logic_vector(WIDTH-1 downto 0);
  signal dest_graysync_ff : reg_type := (others => (others => '0'));
  attribute ASYNC_REG : string;
  attribute ASYNC_REG of dest_graysync_ff : signal is "TRUE";

  signal  gray_enc        : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
  signal  binval          : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
  signal  src_gray_ff     : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
  signal  synco_gray      : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
  signal  async_path      : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
  signal  dest_out_bin_ff : std_logic_vector(WIDTH-1 downto 0) := (others => '0');


begin

  -- -------------------------------------------------------------------------------------------------------------------
  -- Configuration DRCs
  -- -------------------------------------------------------------------------------------------------------------------
  config_drc_single: process
    variable drc_err_flag: integer := 0;
  begin
    
    if ((DEST_SYNC_FF < 2) or (DEST_SYNC_FF > 10)) then
       report("[XPM_CDC 1-2] DEST_SYNC_FF ("&integer'image(DEST_SYNC_FF)&") value is outside of valid range of 2-10.") severity error;
       drc_err_flag := 1;
    end if;

    if ((INIT_SYNC_FF/=0) and (INIT_SYNC_FF/=1)) then
       report("[XPM_CDC 1-5] INIT_SYNC_FF ("&integer'image(INIT_SYNC_FF)&") is outside of valid range." ) severity error;
       drc_err_flag := 1;
    end if;
    
    if ((REG_OUTPUT/=0) and (REG_OUTPUT/=1)) then
       report("[XPM_CDC 2-6] REG_OUTPUT ("&integer'image(REG_OUTPUT)&") is outside of valid range.") severity error;
       drc_err_flag := 1;
    end if;

    if ((SIM_ASSERT_CHK/=0) and (SIM_ASSERT_CHK/=1)) then
       report("[XPM_CDC 1-4] SIM_ASSERT_CHK ("&integer'image(SIM_ASSERT_CHK)&") value is outside of valid range.") severity error;
       drc_err_flag := 1;
    end if;
    
    if (SIM_LOSSLESS_GRAY_CHK>1) then
       report("[XPM_CDC 2-5] SIM_LOSSLESS_GRAY_CHK ("&integer'image(SIM_LOSSLESS_GRAY_CHK)&") is outside of valid range.") severity error;
       drc_err_flag := 1;
    end if;

    if ((WIDTH < 2) or (WIDTH > 32)) then
       report("[XPM_CDC 2-3] WIDTH ("&integer'image(WIDTH)&") is outside of valid range of 2-32.") severity error;
       drc_err_flag := 1;
    end if;


    if (drc_err_flag = 1) then
      std.env.finish(1);
    end if;
    wait;
  end process config_drc_single;

  process(dest_clk)
  begin
    if rising_edge(dest_clk) then
      dest_graysync_ff(0) <= async_path;
      for syncstage in 1 to DEST_SYNC_FF-1 loop
        dest_graysync_ff(syncstage) <= dest_graysync_ff (syncstage-1);
      end loop;
    end if;
  end process;
  
  async_path <= src_gray_ff;

  synco_gray <= dest_graysync_ff(DEST_SYNC_FF-1);
  gray_enc <= src_in_bin xor ("0" & src_in_bin(WIDTH-1 downto 1));

  -- Convert gray code back to binary
  process(synco_gray, binval)
  begin
    binval(WIDTH-1) <= synco_gray(WIDTH-1);
    for j in WIDTH-2 downto 0 loop
      binval(j) <= binval(j+1) xor synco_gray(j);
    end loop;
  end process;
  
  reg_out: if(REG_OUTPUT = 1) generate
    dest_out_bin     <= dest_out_bin_ff;
  end generate;
  comb_out: if(REG_OUTPUT /= 1) generate
    dest_out_bin     <= binval;
  end generate;
  

  process(src_clk)
  begin
    if rising_edge(src_clk) then
        src_gray_ff <= gray_enc;
    end if;
  end process;
  
  process(dest_clk)
  begin
    if rising_edge(dest_clk) then
        dest_out_bin_ff <= binval;
    end if;
  end process;

end architecture rtl;
