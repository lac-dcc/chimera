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

entity xpm_fifo_sync is
  generic (

    -- Common module generics
    FIFO_MEMORY_TYPE         : string   := "auto";
    FIFO_WRITE_DEPTH         : integer  := 2048;
    CASCADE_HEIGHT           : integer  := 0;
    WRITE_DATA_WIDTH         : integer  := 32;
    READ_MODE                : string   :="std";
    FIFO_READ_LATENCY        : integer  := 1;
    FULL_RESET_VALUE         : integer  := 0;
    USE_ADV_FEATURES         : string   :="0707";
    READ_DATA_WIDTH          : integer  := 32;
    WR_DATA_COUNT_WIDTH      : integer  := 1;
    PROG_FULL_THRESH         : integer  := 10;
    RD_DATA_COUNT_WIDTH      : integer  := 1;
    PROG_EMPTY_THRESH        : integer  := 10;
    DOUT_RESET_VALUE         : string   := "0";
    ECC_MODE                 : string   :="no_ecc";
    SIM_ASSERT_CHK           : integer  := 0;
    WAKEUP_TIME              : integer  := 0
  );
  port (

    sleep          : in std_logic;
    rst            : in std_logic;
    wr_clk         : in std_logic;
    wr_en          : in std_logic;
    din            : in std_logic_vector(WRITE_DATA_WIDTH-1 downto 0);
    full           : out std_logic;
    prog_full      : out std_logic;
    wr_data_count  : out std_logic_vector(WR_DATA_COUNT_WIDTH-1 downto 0);
    overflow       : out std_logic;
    wr_rst_busy    : out std_logic;
    almost_full    : out std_logic;
    wr_ack         : out std_logic;
    rd_en          : in std_logic;
    dout           : out std_logic_vector(READ_DATA_WIDTH-1 downto 0);
    empty          : out std_logic;
    prog_empty     : out std_logic;
    rd_data_count  : out std_logic_vector(RD_DATA_COUNT_WIDTH-1 downto 0);
    underflow      : out std_logic;
    rd_rst_busy    : out std_logic;
    almost_empty   : out std_logic;
    data_valid     : out std_logic;
    injectsbiterr  : in std_logic;
    injectdbiterr  : in std_logic;
    sbiterr        : out std_logic;
    dbiterr        : out std_logic
  );
end xpm_fifo_sync;


architecture rtl of xpm_fifo_sync is
  
  -- Function to convert ASCII value to binary 
  function str2bin(str_val_ascii: character) return std_logic_vector is
  begin
    case(str_val_ascii) is
        when '0' => return x"0";
        when '1' => return x"1";
        when '2' => return x"2";
        when '3' => return x"3";
        when '4' => return x"4";
        when '5' => return x"5";
        when '6' => return x"6";
        when '7' => return x"7";
        when '8' => return x"8";
        when '9' => return x"9";
        when 'A'|'a' => return x"A";
        when 'B'|'b' => return x"B";
        when 'C'|'c' => return x"C";
        when 'D'|'d' => return x"D";
        when 'E'|'e' => return x"E";
        when 'F'|'f' => return x"F";
        when others =>
          report("Found Invalid character while parsing the string, please cross check the value specified for either READ_RESET_VALUE_A|B or MEMORY_INIT_PARAM (if initialization of memory through parameter is used). XPM_MEMORY supports strings (hex) that contains characters 0-9, A-F and a-f.") severity error;
          return "XXXX";
    end case;
  end function;
  
  -- Function that parses the complete reset value string
  function hstr2bin(hstr_val: string) return std_logic_vector is
    constant rsta_loop_iter  : integer := 16;
    variable rst_val_conv_a_i : std_logic_vector(rsta_loop_iter-1 downto 0);
  begin
    for rst_loop_a in 1 to 4 loop
      rst_val_conv_a_i((rst_loop_a*4)-1 downto (rst_loop_a*4)-4 ) := str2bin(hstr_val(5-rst_loop_a));
    end loop;
    return rst_val_conv_a_i(15 downto 0);
  end function;

  constant EN_ADV_FEATURE_SYNC : std_logic_vector(15 downto 0) := hstr2bin(USE_ADV_FEATURES);

  function F_FIFO_MEMORY_TYPE(T : string) return integer is
  begin
    
    if (T = "lutram"   or T = "LUTRAM"   or T = "distributed"   or T = "DISTRIBUTED"  ) then
      return 1;
    elsif (T = "bram" or T = "BRAM" or T = "block" or T = "BLOCK") then
      return 2;
    elsif (T = "uram" or T = "URAM" or T = "ultra" or T = "ULTRA") then 
      return 3;
    elsif (T = "builtin"  or T = "BUILTIN" ) then
      return 4;
    else 
      return 0;
    end if;
  end function;

  -- Define local parameters for mapping with base file
  constant P_FIFO_MEMORY_TYPE      : integer := F_FIFO_MEMORY_TYPE(FIFO_MEMORY_TYPE);
  
  constant P_COMMON_CLOCK : integer := 1;

  function F_ECC_MODE(M: string) return integer is
  begin
    if M = "no_ecc" or M = "NO_ECC" then
        return 0;
    else
        return 1;
    end if;
  end function;
  
  constant P_ECC_MODE : integer := F_ECC_MODE(ECC_MODE);
  
  function F_READ_MODE(M: string) return integer is
  begin
    if M = "std" or M = "STD" then
        return 0;
    elsif M = "fwft" or M = "FWFT" then
        return 1;
    else
        return 2;
    end if;
  end function;
  
  constant P_READ_MODE : integer := F_READ_MODE(READ_MODE);

  function F_WAKEUP_TIME(T: string) return integer is
  begin
    if T = "disable_sleep" or T = "DISABLE_SLEEP" then
        return 0;
    else
        return 2;
    end if;
  end function;
  
  constant P_WAKEUP_TIME : integer := WAKEUP_TIME;
  signal wr_rst_busy_s: std_logic := '0';
begin
  
  process
    variable drc_err_flag_sync : integer := 0;
  begin
    if (EN_ADV_FEATURE_SYNC(13) /= '0') then
      report("(XPM_FIFO_SYNC 1-1) USE_ADV_FEATURES(13) = "&to_string(EN_ADV_FEATURE_SYNC(13))&". This is a reserved field and must be set to 0.") severity error;
      drc_err_flag_sync := 1;
    end if;
  
    if (drc_err_flag_sync = 1) then
      std.env.finish(1);
    end if;
    wait;
  end process;

  -- -------------------------------------------------------------------------------------------------------------------
  -- Generate the instantiation of the appropriate XPM module
  -- -------------------------------------------------------------------------------------------------------------------
       rd_rst_busy <= wr_rst_busy_s;
       wr_rst_busy <= wr_rst_busy_s;
       
      xpm_fifo_base_inst: entity work.xpm_fifo_base 
      generic map (
        COMMON_CLOCK               => P_COMMON_CLOCK      ,
        FIFO_MEMORY_TYPE           => P_FIFO_MEMORY_TYPE  ,
        ECC_MODE                   => P_ECC_MODE          ,
        SIM_ASSERT_CHK             => SIM_ASSERT_CHK      ,
        CASCADE_HEIGHT             => CASCADE_HEIGHT      ,
        FIFO_WRITE_DEPTH           => FIFO_WRITE_DEPTH    ,
        WRITE_DATA_WIDTH           => WRITE_DATA_WIDTH    ,
        WR_DATA_COUNT_WIDTH        => WR_DATA_COUNT_WIDTH ,
        PROG_FULL_THRESH           => PROG_FULL_THRESH    ,
        FULL_RESET_VALUE           => FULL_RESET_VALUE    ,
        USE_ADV_FEATURES           => USE_ADV_FEATURES    ,
        READ_MODE                  => P_READ_MODE         ,
        FIFO_READ_LATENCY          => FIFO_READ_LATENCY   ,
        READ_DATA_WIDTH            => READ_DATA_WIDTH     ,
        RD_DATA_COUNT_WIDTH        => RD_DATA_COUNT_WIDTH ,
        PROG_EMPTY_THRESH          => PROG_EMPTY_THRESH   ,
        DOUT_RESET_VALUE           => DOUT_RESET_VALUE    ,
        CDC_DEST_SYNC_FF           => 2                   ,
        REMOVE_WR_RD_PROT_LOGIC    => 0                   ,
        WAKEUP_TIME                => WAKEUP_TIME               
      )  
      port map(
        sleep            => sleep,
        rst              => rst,
        wr_clk           => wr_clk,
        wr_en            => wr_en,
        din              => din,
        full             => full,
        full_n           => open,
        prog_full        => prog_full,
        wr_data_count    => wr_data_count,
        overflow         => overflow,
        wr_rst_busy      => wr_rst_busy_s,
        almost_full      => almost_full,
        wr_ack           => wr_ack,
        rd_clk           => wr_clk,
        rd_en            => rd_en,
        dout             => dout,
        empty            => empty,
        prog_empty       => prog_empty,
        rd_data_count    => rd_data_count,
        underflow        => underflow,
        rd_rst_busy      => open,
        almost_empty     => almost_empty,
        data_valid       => data_valid,
        injectsbiterr    => injectsbiterr,
        injectdbiterr    => injectdbiterr,
        sbiterr          => sbiterr,
        dbiterr          => dbiterr
      );

end rtl;
