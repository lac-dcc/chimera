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
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;
library std;
use std.env.all;

entity xpm_fifo_base is
generic(

  -- Common module parameters
    COMMON_CLOCK            : integer := 1;
    RELATED_CLOCKS          : integer := 0;
    FIFO_MEMORY_TYPE        : integer := 0;
    ECC_MODE                : integer := 0;
    SIM_ASSERT_CHK          : integer := 0;
    CASCADE_HEIGHT          : integer := 0;
    
    FIFO_WRITE_DEPTH        : integer := 2048;
    WRITE_DATA_WIDTH        : integer := 32;
    WR_DATA_COUNT_WIDTH     : integer := 12;
    PROG_FULL_THRESH        : integer := 10;
    USE_ADV_FEATURES        : string  := "0707";
    
    READ_MODE               : integer := 0;
    FIFO_READ_LATENCY       : integer := 1;
    READ_DATA_WIDTH         : integer := 32;
    RD_DATA_COUNT_WIDTH     : integer := 12;
    PROG_EMPTY_THRESH       : integer := 10;
    DOUT_RESET_VALUE        : string := "0";
    CDC_DEST_SYNC_FF        : integer := 2;
    FULL_RESET_VALUE        : integer := 0;
    REMOVE_WR_RD_PROT_LOGIC : integer := 0;

    WAKEUP_TIME             : integer := 0
);
port (

  -- Common module ports
    sleep : in std_logic;
    rst   : in std_logic;

  -- Write Domain ports
    wr_clk          : in std_logic;
    wr_en           : in std_logic;
    din             : in  std_logic_vector(WRITE_DATA_WIDTH-1 downto 0);
    full            : out std_logic;
    full_n          : out std_logic;
    prog_full       : out std_logic;
    wr_data_count   : out std_logic_vector(WR_DATA_COUNT_WIDTH-1 downto 0);
    overflow        : out std_logic;
    wr_rst_busy     : out std_logic;
    almost_full     : out std_logic;
    wr_ack          : out std_logic;

  -- Read Domain ports
    rd_clk          : in  std_logic;
    rd_en           : in  std_logic;
    dout            : out std_logic_vector(READ_DATA_WIDTH-1 downto 0) := (others => '0');
    empty           : out std_logic;
    prog_empty      : out std_logic;
    rd_data_count   : out std_logic_vector(RD_DATA_COUNT_WIDTH-1 downto 0);
    underflow       : out std_logic;
    rd_rst_busy     : out std_logic;
    almost_empty    : out std_logic;
    data_valid      : out std_logic;

  -- ECC Related ports
    injectsbiterr   : in  std_logic;
    injectdbiterr   : in  std_logic;
    sbiterr         : out std_logic;
    dbiterr         : out std_logic
);
end xpm_fifo_base;

architecture rtl of xpm_fifo_base is

  function clog2(N : natural) return positive is
  begin
    if N <= 2 then
      return 1;
    elsif N mod 2 = 0 then
      return 1 + clog2(N/2);
    else
      return 1 + clog2((N+1)/2);
    end if;
  end function;
  
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


  constant invalid             : std_logic_vector(1 downto 0) := "00";
  constant stage1_valid        : std_logic_vector(1 downto 0) := "10";
  constant stage2_valid        : std_logic_vector(1 downto 0) := "01";
  constant both_stages_valid   : std_logic_vector(1 downto 0) := "11";

  signal curr_fwft_state : std_logic_vector(1 downto 0) := invalid;
  signal next_fwft_state : std_logic_vector(1 downto 0) := invalid;



  constant FIFO_MEM_TYPE   : integer := FIFO_MEMORY_TYPE;
  constant RD_MODE         : integer := READ_MODE;
  constant ENABLE_ECC      : integer := ECC_MODE * 3;
  constant FIFO_READ_DEPTH : integer := FIFO_WRITE_DEPTH*WRITE_DATA_WIDTH/READ_DATA_WIDTH;
  constant FIFO_SIZE       : integer := FIFO_WRITE_DEPTH*WRITE_DATA_WIDTH;
  constant WR_WIDTH_LOG    : integer := clog2(WRITE_DATA_WIDTH);
  constant WR_DEPTH_LOG    : integer := clog2(FIFO_WRITE_DEPTH);
  constant WR_PNTR_WIDTH   : integer := clog2(FIFO_WRITE_DEPTH);
  constant RD_PNTR_WIDTH   : integer := clog2(FIFO_READ_DEPTH);
  function to_sl(intval: integer) return std_logic is
  begin
    if intval = 0 then
      return '0';
    else
      return '1';
    end if;
  end function; 
  constant FULL_RST_VAL    : std_logic := to_sl(FULL_RESET_VALUE);
  
  function WR_RD_RATIO_DIFFERENCE (WR_PNTR_W: integer; RD_PNTR_W: integer) return integer is
  begin
    if (WR_PNTR_W > RD_PNTR_W) then
      return (WR_PNTR_W-RD_PNTR_W);
    else
      return 0;
    end if;
  end function;
  
  constant WR_RD_RATIO     : integer := WR_RD_RATIO_DIFFERENCE(WR_PNTR_WIDTH , RD_PNTR_WIDTH);
  
  function PF_THRESH_ADJ_CALC(RD_MOD: integer; PROG_FULL_TH: integer; WR_RD_R: integer) return integer is
  begin
    if (RD_MOD = 0) then
      return PROG_FULL_TH;
    else
      return PROG_FULL_TH - (2*(2**WR_RD_R));
    end if;
  end function;
  
  constant PF_THRESH_ADJ   : integer := PF_THRESH_ADJ_CALC(READ_MODE, PROG_FULL_THRESH, WR_RD_RATIO);
  
  function PE_THRESH_ADJ_CALC(RD_MOD: integer; PROG_EMPTY_TH: integer; MEM_TYPE: integer) return integer is
  begin
    if (RD_MOD = 1 and MEM_TYPE /= 4) then
      return PROG_EMPTY_TH - 2;
    else
      return PROG_EMPTY_TH ;
    end if;
  end function;
  constant PE_THRESH_ADJ   : integer := PE_THRESH_ADJ_CALC(READ_MODE, PROG_EMPTY_THRESH, FIFO_MEMORY_TYPE);

  constant PF_THRESH_MIN   : integer := 3+(READ_MODE*2*(((FIFO_WRITE_DEPTH-1)/FIFO_READ_DEPTH)+1))+(COMMON_CLOCK*CDC_DEST_SYNC_FF);
  constant PF_THRESH_MAX   : integer := (FIFO_WRITE_DEPTH-3)-(READ_MODE*2*(((FIFO_WRITE_DEPTH-1)/FIFO_READ_DEPTH)+1));
  constant PE_THRESH_MIN   : integer := 3+(READ_MODE*2);
  constant PE_THRESH_MAX   : integer := (FIFO_READ_DEPTH-3)-(READ_MODE*2);
  constant WR_DC_WIDTH_EXT : integer := clog2(FIFO_WRITE_DEPTH)+1;
  constant RD_DC_WIDTH_EXT : integer := clog2(FIFO_READ_DEPTH)+1;
  function RD_LATENCY_CALC(RD_MOD : integer; FIFO_RD_LAT : integer) return integer is
  begin
    if (RD_MOD = 2) then
        return 1;
    elsif (RD_MOD = 1) then
        return 2;
    else
        return FIFO_RD_LAT;
    end if;
  end function;
  constant RD_LATENCY      : integer := RD_LATENCY_CALC(READ_MODE, FIFO_READ_LATENCY);
  function WIDTH_RATIO_CALC(RD_DATA_WIDTH : integer; WR_DATA_WIDTH: integer) return integer is
  begin
    if (RD_DATA_WIDTH > WR_DATA_WIDTH) then
      return (RD_DATA_WIDTH/WR_DATA_WIDTH);
    else
      return (WR_DATA_WIDTH/RD_DATA_WIDTH);
    end if;
  end function;
  constant WIDTH_RATIO     : integer := WIDTH_RATIO_CALC(READ_DATA_WIDTH , WRITE_DATA_WIDTH);

  constant EN_ADV_FEATURE : std_logic_vector(15 downto 0) := hstr2bin(USE_ADV_FEATURES);

  constant EN_OF           : std_logic := EN_ADV_FEATURE(0);  --EN_ADV_FLAGS_WR(0) ? 1 : 0;
  constant EN_PF           : std_logic := EN_ADV_FEATURE(1);  --EN_ADV_FLAGS_WR(1) ? 1 : 0;
  constant EN_WDC          : std_logic := EN_ADV_FEATURE(2);  --EN_ADV_FLAGS_WR(2) ? 1 : 0;
  constant EN_AF           : std_logic := EN_ADV_FEATURE(3);  --EN_ADV_FLAGS_WR(3) ? 1 : 0;
  constant EN_WACK         : std_logic := EN_ADV_FEATURE(4);  --EN_ADV_FLAGS_WR(4) ? 1 : 0;
  constant FG_EQ_ASYM_DOUT : std_logic := EN_ADV_FEATURE(5);  --EN_ADV_FLAGS_WR(5) ? 1 : 0;
  constant EN_UF           : std_logic := EN_ADV_FEATURE(8);  --EN_ADV_FLAGS_RD(0) ? 1 : 0;
  constant EN_PE           : std_logic := EN_ADV_FEATURE(9);  --EN_ADV_FLAGS_RD(1) ? 1 : 0;
  constant EN_RDC          : std_logic := EN_ADV_FEATURE(10); --EN_ADV_FLAGS_RD(2) ? 1 : 0;
  constant EN_AE           : std_logic := EN_ADV_FEATURE(11); --EN_ADV_FLAGS_RD(3) ? 1 : 0;
  constant EN_DVLD         : std_logic := EN_ADV_FEATURE(12); --EN_ADV_FLAGS_RD(4) ? 1 : 0;

  signal  wrst_busy : std_logic := '0';
  signal     wr_pntr               : std_logic_vector(WR_PNTR_WIDTH-1 downto 0) := (others => '0');
  signal     wr_pntr_ext           : std_logic_vector(WR_PNTR_WIDTH downto 0) := (others => '0');
  signal     wr_pntr_rd_cdc        : std_logic_vector(WR_PNTR_WIDTH-1 downto 0) := (others => '0');
  signal     wr_pntr_rd_cdc_dc     : std_logic_vector(WR_PNTR_WIDTH downto 0) := (others => '0');
  signal     wr_pntr_rd            : std_logic_vector(WR_PNTR_WIDTH-1 downto 0) := (others => '0');
  signal     wr_pntr_rd_dc         : std_logic_vector(WR_PNTR_WIDTH downto 0) := (others => '0');
  signal     rd_pntr_wr_adj        : std_logic_vector(WR_PNTR_WIDTH-1 downto 0) := (others => '0');
  signal     rd_pntr_wr_adj_dc     : std_logic_vector(WR_PNTR_WIDTH downto 0) := (others => '0');
  signal     wr_pntr_plus1         : std_logic_vector(WR_PNTR_WIDTH-1 downto 0) := (others => '0');
  signal     wr_pntr_plus2         : std_logic_vector(WR_PNTR_WIDTH-1 downto 0) := (others => '0');
  signal     wr_pntr_plus3         : std_logic_vector(WR_PNTR_WIDTH-1 downto 0) := (others => '0');
  signal     wr_pntr_plus1_pf      : std_logic_vector(WR_PNTR_WIDTH downto 0) := (others => '0');
  signal     rd_pntr_wr_adj_inv_pf : std_logic_vector(WR_PNTR_WIDTH downto 0) := (others => '0');
  signal     diff_pntr_pf_q        : std_logic_vector(WR_PNTR_WIDTH downto 0)        := (others => '0');
  signal     diff_pntr_pf          : std_logic_vector(WR_PNTR_WIDTH-1 downto 0) := (others => '0');
  signal     rd_pntr               : std_logic_vector(RD_PNTR_WIDTH-1 downto 0) := (others => '0');
  signal     rd_pntr_ext           : std_logic_vector(RD_PNTR_WIDTH downto 0) := (others => '0');
  signal     rd_pntr_wr_cdc        : std_logic_vector(RD_PNTR_WIDTH-1 downto 0) := (others => '0');
  signal     rd_pntr_wr            : std_logic_vector(RD_PNTR_WIDTH-1 downto 0) := (others => '0');
  signal     rd_pntr_wr_cdc_dc     : std_logic_vector(RD_PNTR_WIDTH downto 0) := (others => '0');
  signal     rd_pntr_wr_dc         : std_logic_vector(RD_PNTR_WIDTH downto 0) := (others => '0');
  signal     wr_pntr_rd_adj        : std_logic_vector(RD_PNTR_WIDTH-1 downto 0) := (others => '0');
  signal     wr_pntr_rd_adj_dc     : std_logic_vector(RD_PNTR_WIDTH downto 0) := (others => '0');
  signal     rd_pntr_plus1         : std_logic_vector(RD_PNTR_WIDTH-1 downto 0) := (others => '0');
  signal     rd_pntr_plus2         : std_logic_vector(RD_PNTR_WIDTH-1 downto 0) := (others => '0');
  signal     invalid_state : std_logic := '0';
  signal     valid_fwft : std_logic := '0';
  signal     ram_valid_fwft : std_logic := '0';
  signal     going_empty : std_logic := '0';
  signal     leaving_empty : std_logic := '0';
  signal     going_aempty : std_logic := '0';
  signal     leaving_aempty : std_logic := '0';
  signal     ram_empty_i  : std_logic := '1';
  signal     ram_aempty_i : std_logic := '1';
  signal     empty_i : std_logic := '0';
  signal     going_full : std_logic := '0';
  signal     leaving_full : std_logic := '0';
  signal     going_afull : std_logic := '0';
  signal     leaving_afull : std_logic := '0';
  signal     prog_full_i : std_logic := FULL_RST_VAL;
  signal     ram_full_i  : std_logic := FULL_RST_VAL;
  signal     ram_afull_i : std_logic := FULL_RST_VAL;
  signal     ram_full_n  : std_logic := not FULL_RST_VAL;
  signal     ram_wr_en_i : std_logic := '0';
  signal     ram_rd_en_i : std_logic := '0';
  signal     wr_ack_i : std_logic := '0';
  signal     rd_en_i : std_logic := '0';
  signal     rd_en_fwft : std_logic := '0';
  signal     ram_regce : std_logic := '0';
  signal     ram_regce_pipe : std_logic := '0';
  signal     dout_i : std_logic_vector(READ_DATA_WIDTH-1 downto 0) := (others => '0');
  signal     empty_fwft_i     : std_logic := '1';
  signal     aempty_fwft_i    : std_logic := '1';
  signal     empty_fwft_fb    : std_logic := '1';
  signal     overflow_i       : std_logic := '0';
  signal     underflow_i      : std_logic := '0';
  signal     data_valid_fwft  : std_logic := '0';
  signal     data_valid_std   : std_logic := '0';
  signal     data_vld_std : std_logic := '0';
  signal     ram_wr_en_pf_q  : std_logic := '0';
  signal     ram_rd_en_pf_q  : std_logic := '0';
  signal     wr_pntr_plus1_pf_carry : std_logic := '0';
  signal     rd_pntr_wr_adj_pf_carry : std_logic := '0';
  --signal     diff_pntr_pe_reg1 : std_logic_vector(RD_PNTR_WIDTH-1 downto 0);
  --signal     diff_pntr_pe_reg2 : std_logic_vector(RD_PNTR_WIDTH-1 downto 0);
  signal     diff_pntr_pe      : std_logic_vector(RD_PNTR_WIDTH-1 downto 0) := (others => '0');
  signal     prog_empty_i : std_logic := '1';
  -- function to validate the write depth value
  function dpth_pwr_2(fifo_depth : integer) return integer is
    variable log2_of_depth : integer := clog2(fifo_depth);
  begin
    if (fifo_depth = 2 ** log2_of_depth) then
      return 1;
    else
      return 0;
    end if;
  end function;
  
  --signal wr_en_i : std_logic;
  signal wr_rst_i : std_logic := '0';
  signal rd_rst_i : std_logic := '0';
  signal rd_rst_d2 : std_logic := '0';
  signal rst_d1 : std_logic := '0';
  signal rst_d2 : std_logic := '0';
  signal clr_full : std_logic := '0';
  signal empty_fwft_d1 : std_logic := '0';
  signal extra_words_fwft : std_logic_vector(1 downto 0) := (others => '0');
  

begin --architecture rtl

  config_drc: process
    variable drc_err_flag : integer := 0;
  begin 
    
    
    if (COMMON_CLOCK = 0 and FIFO_MEM_TYPE = 3) then
      report("(XPM_FIFO 1-1) UltraRAM cannot be used as asynchronous FIFO because it has only one clock support ") severity error;
      drc_err_flag := 1;
    end if;

    if (COMMON_CLOCK = 1 and RELATED_CLOCKS = 1) then
      report("(XPM_FIFO 1-2) Related Clocks cannot be used in synchronous FIFO because it is applicable only for asynchronous FIFO ") severity error;
      drc_err_flag := 1;
    end if;

    if(not (FIFO_WRITE_DEPTH > 15 and FIFO_WRITE_DEPTH <= 4*1024*1024)) then
      report("(XPM_FIFO 1-3) FIFO_WRITE_DEPTH ("&integer'image(FIFO_WRITE_DEPTH)&") value specified is not within the supported ranges. Miniumum supported depth is 16, and the maximum supported depth is 4*1024*1024 locations.") severity error;
      drc_err_flag := 1;
    end if;

    if(dpth_pwr_2(FIFO_WRITE_DEPTH) = 0 and (FIFO_WRITE_DEPTH > 15 and FIFO_WRITE_DEPTH <= 4*1024*1024)) then
      report("(XPM_FIFO 1-4) FIFO_WRITE_DEPTH ("&integer'image(FIFO_WRITE_DEPTH)&") value specified is non-power of 2, but this release of XPM_FIFO supports configurations having the fifo write depth set to power of 2. ") severity error;
      drc_err_flag := 1;
    end if;

    if (CDC_DEST_SYNC_FF < 2 or CDC_DEST_SYNC_FF > 8) then
      report("(XPM_FIFO 1-5) CDC_DEST_SYNC_FF ("&integer'image(CDC_DEST_SYNC_FF)&") value is specified for this configuration, but this beta release of XPM_FIFO supports CDC_DEST_SYNC_FF values in between 2 and 8. " ) severity error;
      drc_err_flag := 1;
    end if;
    if (CDC_DEST_SYNC_FF /= 2 and RELATED_CLOCKS = 1) then
      report("(XPM_FIFO 1-6) CDC_DEST_SYNC_FF ("&integer'image(CDC_DEST_SYNC_FF)&") value is specified for this configuration, but CDC_DEST_SYNC_FF value can not be modified from default value when RELATED_CLOCKS parameter is set to 1. " ) severity error;
      drc_err_flag := 1;
    end if;
    if (FIFO_WRITE_DEPTH = 16 and CDC_DEST_SYNC_FF > 4) then
      report("(XPM_FIFO 1-7) CDC_DEST_SYNC_FF = "&integer'image(CDC_DEST_SYNC_FF)&" and FIFO_WRITE_DEPTH = "&integer'image(FIFO_WRITE_DEPTH)&". This is invalid combination. Either FIFO_WRITE_DEPTH should be increased or CDC_DEST_SYNC_FF should be reduced. ") severity error;
      drc_err_flag := 1;
    end if;
    if (EN_ADV_FEATURE(7 downto 5) /= "000") then
      report("(XPM_FIFO 1-8) USE_ADV_FEATURES(7:5) = "&to_hstring(EN_ADV_FEATURE(7 downto 5))&". This is a reserved field and must be set to 0s. " ) severity error;
      drc_err_flag := 1;
    end if;
    if (EN_ADV_FEATURE(15 downto 14) /= "000") then
      report("(XPM_FIFO 1-9) USE_ADV_FEATURES(15:13) = "&to_hstring(EN_ADV_FEATURE(15 downto 13))&". This is a reserved field and must be set to 0s. ") severity error;
      drc_err_flag := 1;
    end if;
--    if(WIDTH_RATIO > 32) then
--      report("(XPM_FIFO 1-) The ratio between WRITE_DATA_WIDTH ("&integer'image(WRITE_DATA_WIDTH)&") and READ_DATA_WIDTH ("&integer'image(READ_DATA_WIDTH)&") is greater than 32, but this release of XPM_FIFO supports configurations having the ratio between data widths must be less than 32. ") severity error;
--      drc_err_flag := 1;
--    end if;
    if (WR_WIDTH_LOG+WR_DEPTH_LOG > 30) then
      report("(XPM_FIFO 1-10) The specified Width("&integer'image(WRITE_DATA_WIDTH)&") and Depth("&integer'image(FIFO_WRITE_DEPTH)&") exceeds the maximum supported FIFO SIZE. Please reduce either FIFO Width or Depth. ") severity error;
      drc_err_flag := 1;
    end if;
    if(FIFO_READ_DEPTH < 16) then
      report("(XPM_FIFO 1-11) Write Width is "&integer'image(WRITE_DATA_WIDTH)&" Read Width is "&integer'image(READ_DATA_WIDTH)&" and Write Depth is "&integer'image(FIFO_WRITE_DEPTH)&", this results in the Read Depth("&integer'image(FIFO_READ_DEPTH)&") less than 16. This is an invalid combination, Ensure the depth on both sides is minimum 16. ") severity error;
      drc_err_flag := 1;
    end if;

    -- Range Checks
    if (COMMON_CLOCK > 1) then
      report("(XPM_FIFO 10-1) COMMON_CLOCK ("&to_string(COMMON_CLOCK)&") value is outside of legal range. ") severity error;
      drc_err_flag := 1;
    end if;
    if (FIFO_MEMORY_TYPE > 3) then
      report("(XPM_FIFO 10-2) FIFO_MEMORY_TYPE ("&to_string(FIFO_MEMORY_TYPE)&") value is outside of legal range. " ) severity error;
      drc_err_flag := 1;
    end if;
    if (READ_MODE > 1) then
      report("(XPM_FIFO 10-3) READ_MODE ("&to_string(READ_MODE)&") value is outside of legal range. " ) severity error;
      drc_err_flag := 1;
    end if;

    if (ECC_MODE > 1) then
      report("(XPM_FIFO 10-4) ECC_MODE ("&to_string(ECC_MODE)&") value is outside of legal range. "  ) severity error;
      drc_err_flag := 1;
    end if;
    if (not (WAKEUP_TIME = 0 or WAKEUP_TIME = 2)) then
      report("(XPM_FIFO 10-5) WAKEUP_TIME ("&integer'image(WAKEUP_TIME)&") value is outside of legal range. WAKEUP_TIME should be either 0 or 2. "  ) severity error;
      drc_err_flag := 1;
    end if;
    if (not (WRITE_DATA_WIDTH > 0)) then
      report("(XPM_FIFO 15-2) WRITE_DATA_WIDTH ("&integer'image(WRITE_DATA_WIDTH)&") value is outside of legal range. "  ) severity error;
      drc_err_flag := 1;
    end if;
    if (not (READ_DATA_WIDTH > 0)) then
      report("(XPM_FIFO 15-3) READ_DATA_WIDTH ("&integer'image(READ_DATA_WIDTH)&") value is outside of legal range. "  ) severity error;
      drc_err_flag := 1;
    end if;

    if (EN_PF = '1' and ((PROG_FULL_THRESH < PF_THRESH_MIN) or (PROG_FULL_THRESH > PF_THRESH_MAX))) then
      report("(XPM_FIFO 15-4) Programmable Full flag is enabled, but PROG_FULL_THRESH ("&integer'image(PROG_FULL_THRESH)&") value is outside of legal range. PROG_FULL_THRESH value must be between "&integer'image(PF_THRESH_MIN)&" and "&integer'image(PF_THRESH_MAX)&". ") severity error;
      drc_err_flag := 1;
    end if;

    if (EN_PE = '1' and (WIDTH_RATIO <= 32) and ((PROG_EMPTY_THRESH < PE_THRESH_MIN) or (PROG_EMPTY_THRESH > PE_THRESH_MAX))) then
      report("(XPM_FIFO 15-5) Programmable Empty flag is enabled, but PROG_EMPTY_THRESH ("&integer'image(PROG_EMPTY_THRESH)&") value is outside of legal range. PROG_EMPTY_THRESH value must be between "&integer'image(PE_THRESH_MIN)&" and "&integer'image(PE_THRESH_MAX)&". " ) severity error;
      drc_err_flag := 1;
    end if;

    if (EN_WDC = '1' and ((WR_DATA_COUNT_WIDTH < 0) or (WR_DATA_COUNT_WIDTH > WR_DC_WIDTH_EXT))) then
      report("(XPM_FIFO 15-6) Write Data Count is enabled, but WR_DATA_COUNT_WIDTH ("&integer'image(WR_DATA_COUNT_WIDTH)&") value is outside of legal range. WR_DATA_COUNT_WIDTH value must be between 0 and "&integer'image(WR_DC_WIDTH_EXT)&". ") severity error;
      drc_err_flag := 1;
    end if;


    if (EN_RDC = '1' and ((RD_DATA_COUNT_WIDTH < 0) or (RD_DATA_COUNT_WIDTH > RD_DC_WIDTH_EXT))) then
      report("(XPM_FIFO 15-7) Read Data Count is enabled, but RD_DATA_COUNT_WIDTH ("&integer'image(RD_DATA_COUNT_WIDTH)&") value is outside of legal range. RD_DATA_COUNT_WIDTH value must be between 0 and "&integer'image(RD_DC_WIDTH_EXT)&". ") severity error;
      drc_err_flag := 1;
    end if;

    if (drc_err_flag = 1) then
      std.env.finish(1);
    end if;
    wait;
  end process;

  
  xpm_fifo_rst_inst: entity work.xpm_fifo_rst 
    generic map (COMMON_CLOCK, CDC_DEST_SYNC_FF, SIM_ASSERT_CHK)
    port map(rst, wr_clk, rd_clk, wr_rst_i, rd_rst_i, wrst_busy, rd_rst_busy);
  wr_rst_busy <= wrst_busy or rst_d1;

  rst_d1_inst: entity work.xpm_fifo_reg_bit 
    generic map('0')
    port map('0', wr_clk, wrst_busy, rst_d1);
  rst_d2_inst: entity work.xpm_fifo_reg_bit 
    generic map('0')
    port map('0', wr_clk, rst_d1, rst_d2);

   clr_full <= not wrst_busy and rst_d1 and not rst;
   rd_en_i <= rd_en when (RD_MODE = 0) else rd_en_fwft;

  ngen_wr_rd_prot : if (REMOVE_WR_RD_PROT_LOGIC = 1) generate
     ram_wr_en_i <= wr_en;
     ram_rd_en_i <= rd_en_i;
  end generate ngen_wr_rd_prot;
  gen_wr_rd_prot: if (REMOVE_WR_RD_PROT_LOGIC /= 1) generate
     ram_wr_en_i <= wr_en and  not ram_full_i and not(wrst_busy or rst_d1);
     ram_rd_en_i <= rd_en_i and not ram_empty_i;
  end generate gen_wr_rd_prot;

  -- Write pointer generation
  wrp_inst: entity work.xpm_counter_updn 
    generic map(WR_PNTR_WIDTH+1, 0)
    port map(wrst_busy, wr_clk, ram_wr_en_i, ram_wr_en_i, '0', wr_pntr_ext);
  wr_pntr <= wr_pntr_ext(WR_PNTR_WIDTH-1 downto 0);

  wrpp1_inst: entity work.xpm_counter_updn 
    generic map(WR_PNTR_WIDTH, 1)
    port map (wrst_busy, wr_clk, ram_wr_en_i, ram_wr_en_i, '0', wr_pntr_plus1);

  wrpp2_inst: entity work.xpm_counter_updn 
    generic map(WR_PNTR_WIDTH, 2)
    port map (wrst_busy, wr_clk, ram_wr_en_i, ram_wr_en_i, '0', wr_pntr_plus2);

  gaf_wptr_p3: if (EN_AF = '1') generate
    wrpp3_inst: entity work.xpm_counter_updn 
    generic map(WR_PNTR_WIDTH, 3)
    port map(wrst_busy, wr_clk, ram_wr_en_i, ram_wr_en_i, '0', wr_pntr_plus3);
  else generate
    wr_pntr_plus3 <= (others => '0');
  end generate gaf_wptr_p3;

  -- Read pointer generation
  rdp_inst: entity work.xpm_counter_updn 
    generic map (RD_PNTR_WIDTH+1, 0)
    port map (rd_rst_i, rd_clk, ram_rd_en_i, ram_rd_en_i, '0', rd_pntr_ext);
   rd_pntr <= rd_pntr_ext(RD_PNTR_WIDTH-1 downto 0);

  rdpp1_inst: entity work.xpm_counter_updn 
    generic map(RD_PNTR_WIDTH, 1)
    port map(rd_rst_i, rd_clk, ram_rd_en_i, ram_rd_en_i, '0', rd_pntr_plus1);

  gae_rptr_p2: if (EN_AE = '1') generate
    rdpp2_inst: entity work.xpm_counter_updn 
      generic map(RD_PNTR_WIDTH, 2)
      port map(rd_rst_i, rd_clk, ram_rd_en_i, ram_rd_en_i, '0', rd_pntr_plus2);
  else generate
    rd_pntr_plus2 <= (others => '0');
  end generate gae_rptr_p2;

   full        <= ram_full_i;
   full_n      <= ram_full_n;
   almost_full <= ram_afull_i when EN_AF = '1' else '0';
   wr_ack      <= wr_ack_i when EN_WACK = '1' else '0';
  gwack: if (EN_WACK = '1') generate
    process(wr_clk)
    begin
      if rising_edge(wr_clk) then
        if (rst or wr_rst_i or wrst_busy) then
          wr_ack_i  <= '0';
        else
          wr_ack_i  <= ram_wr_en_i;
        end if;
      end if;
    end process;
  end generate gwack;

   prog_full  <=  prog_full_i when EN_PF = '1' and ((PROG_FULL_THRESH) > 0)  else '0';
   prog_empty <=  prog_empty_i when EN_PE = '1'and ((PROG_EMPTY_THRESH) > 0) else '0';
  
   empty_i <= ram_empty_i when (RD_MODE = 0) else empty_fwft_i;
   empty   <= empty_i;
   process(ram_aempty_i, aempty_fwft_i)
   begin
     if EN_AE = '1' then
        if RD_MODE = 0 then
            almost_empty <= ram_aempty_i;
        else
            almost_empty <= aempty_fwft_i;
        end if;
    else
        almost_empty <= '0';
    end if;
   end process;
   process(data_valid_std, data_valid_fwft)
   begin
     if(EN_DVLD) then
        if RD_MODE = 0 then
            data_valid <= data_valid_std;
        else
            data_valid <= data_valid_fwft;
        end if;
     else
        data_valid <= '0';
     end if;
   end process;
   
  gdvld: if (EN_DVLD = '1') generate
    process(ram_rd_en_i, ram_regce_pipe, ram_regce)
    begin
        if RD_MODE = 0 then
            if FIFO_READ_LATENCY = 1 then
                data_vld_std <= ram_rd_en_i;
            else
                data_vld_std <= ram_regce_pipe;
            end if;
        else
            data_vld_std <= ram_regce;
        end if;
    end process;
    process(rd_clk)
    begin
      if rising_edge(rd_clk) then
        if (rd_rst_i) then
          data_valid_std  <= '0';
        else
          data_valid_std  <= data_vld_std;
        end if;
      end if;
    end process;
  else generate
    data_vld_std <= '0';
    data_valid_std  <= '0';
  end generate gdvld;

  -- Simple dual port RAM instantiation for non-Built-in FIFO
  gen_sdpram: if (FIFO_MEMORY_TYPE < 4) generate
  -- Reset is not supported when ECC is enabled by the BRAM/URAM primitives
    signal rst_int: std_logic := '0';
    function USE_DRAM_CONSTRAINT_CALC(COMMON_CLK: integer; FIFO_MEMORY_T: integer) return integer is
    begin
      if COMMON_CLK = 0 and FIFO_MEMORY_T = 1 then
        return  1;
      else
        return 0;
      end if;
    end function;
    constant USE_DRAM_CONSTRAINT : integer := USE_DRAM_CONSTRAINT_CALC(COMMON_CLOCK, FIFO_MEMORY_TYPE);
    function WR_MODE_B_CALC(FIFO_MEMORY_T: integer) return integer is
    begin
        if (FIFO_MEMORY_T = 1 or FIFO_MEMORY_T = 3) then
            return 1;
        else
            return 2;
        end if;
    end function;
    constant WR_MODE_B           : integer := WR_MODE_B_CALC(FIFO_MEMORY_TYPE);
    signal regceb_i : std_logic := '0';
    function CLOCKING_MODE_CALC(CC: integer) return integer is
    begin
        if CC = 1 then
            return 0;
        else
            return 1;
        end if;
    end function;
    constant CLOCKING_MODE : integer := CLOCKING_MODE_CALC(COMMON_CLOCK);
    signal wea: std_logic_vector(0 downto 0);
  begin
    gnd_rst: if(ECC_MODE /= 0) generate
       rst_int <= '0';
    end generate gnd_rst;
    rst_gen: if(ECC_MODE = 0) generate
       rst_int <= rd_rst_i;
    end generate rst_gen;
  -- ----------------------------------------------------------------------
  -- Base module instantiation with simple dual port RAM configuration
  -- ----------------------------------------------------------------------
  regceb_i <=ram_regce_pipe when (READ_MODE = 0) else ram_regce;
  
  wea <= (others => ram_wr_en_i);
  
  xpm_memory_base_inst : entity work.xpm_memory_base 
  generic map (

    -- Common module parameters
    MEMORY_TYPE              => 1                    ,
    MEMORY_SIZE              => FIFO_SIZE            ,
    MEMORY_PRIMITIVE         => FIFO_MEMORY_TYPE     ,
    CLOCKING_MODE            => CLOCKING_MODE,
    ECC_MODE                 => ENABLE_ECC           ,
    USE_MEM_INIT             => 0                    ,
    MEMORY_INIT_FILE         => "none"               ,
    MEMORY_INIT_PARAM        => ""                   ,
    WAKEUP_TIME              => WAKEUP_TIME          ,
    MESSAGE_CONTROL          => 0                    ,
    MEMORY_OPTIMIZATION      => 0               ,
    AUTO_SLEEP_TIME          => 0                    ,
    USE_EMBEDDED_CONSTRAINT  => USE_DRAM_CONSTRAINT  ,
    CASCADE_HEIGHT           => CASCADE_HEIGHT       ,

    -- Port A module parameters
    WRITE_DATA_WIDTH_A       => WRITE_DATA_WIDTH,
    READ_DATA_WIDTH_A        => WRITE_DATA_WIDTH,
    BYTE_WRITE_WIDTH_A       => WRITE_DATA_WIDTH,
    ADDR_WIDTH_A             => WR_PNTR_WIDTH   ,
    READ_RESET_VALUE_A       => "0"             ,
    READ_LATENCY_A           => 2               ,
    WRITE_MODE_A             => 2               ,

    -- Port B module parameters
    WRITE_DATA_WIDTH_B       => READ_DATA_WIDTH ,
    READ_DATA_WIDTH_B        => READ_DATA_WIDTH ,
    BYTE_WRITE_WIDTH_B       => READ_DATA_WIDTH ,
    ADDR_WIDTH_B             => RD_PNTR_WIDTH   ,
    READ_RESET_VALUE_B       => DOUT_RESET_VALUE,
    READ_LATENCY_B           => RD_LATENCY      ,
    WRITE_MODE_B             => WR_MODE_B       
  )
  port map(

    -- Common module ports
    sleep          =>sleep,

    -- Port A module ports
    clka           => wr_clk,
    rsta           => '0',
    ena            => ram_wr_en_i,
    regcea         => '0',
    wea            => wea,
    addra          => wr_pntr,
    dina           => din,
    injectsbiterra => injectsbiterr,
    injectdbiterra => injectdbiterr,
    douta          => open,
    sbiterra       => open,
    dbiterra       => open,

    -- Port B module ports
    clkb           => rd_clk,
    rstb           => rst_int,
    enb            => ram_rd_en_i,
    regceb         => regceb_i,
    web            => (others => '0'),
    addrb          => rd_pntr,
    dinb           => (others => '0'),
    injectsbiterrb => '0',
    injectdbiterrb => '0',
    doutb          => dout_i,
    sbiterrb       => sbiterr,
    dbiterrb       => dbiterr
  );
  end generate gen_sdpram;

  gwrp_eq_rdp: if (WR_PNTR_WIDTH = RD_PNTR_WIDTH) generate
     wr_pntr_rd_adj    <= wr_pntr_rd(WR_PNTR_WIDTH-1 downto WR_PNTR_WIDTH-RD_PNTR_WIDTH);
     wr_pntr_rd_adj_dc <= wr_pntr_rd_dc(WR_PNTR_WIDTH downto WR_PNTR_WIDTH-RD_PNTR_WIDTH);
     rd_pntr_wr_adj    <= rd_pntr_wr(RD_PNTR_WIDTH-1 downto RD_PNTR_WIDTH-WR_PNTR_WIDTH);
     rd_pntr_wr_adj_dc <= rd_pntr_wr_dc(RD_PNTR_WIDTH downto RD_PNTR_WIDTH-WR_PNTR_WIDTH);
  end generate gwrp_eq_rdp;

  gwrp_gt_rdp: if (WR_PNTR_WIDTH > RD_PNTR_WIDTH) generate
     wr_pntr_rd_adj <= wr_pntr_rd(WR_PNTR_WIDTH-1 downto WR_PNTR_WIDTH-RD_PNTR_WIDTH);
     wr_pntr_rd_adj_dc <= wr_pntr_rd_dc(WR_PNTR_WIDTH downto WR_PNTR_WIDTH-RD_PNTR_WIDTH);
     rd_pntr_wr_adj(WR_PNTR_WIDTH-1 downto WR_PNTR_WIDTH-RD_PNTR_WIDTH) <= rd_pntr_wr;
     rd_pntr_wr_adj(WR_PNTR_WIDTH-RD_PNTR_WIDTH-1 downto 0) <= (others => '0');
     rd_pntr_wr_adj_dc(WR_PNTR_WIDTH downto WR_PNTR_WIDTH-RD_PNTR_WIDTH) <= rd_pntr_wr_dc;
     rd_pntr_wr_adj_dc(WR_PNTR_WIDTH-RD_PNTR_WIDTH-1 downto 0) <= (others => '0');
  end generate gwrp_gt_rdp;

  gwrp_lt_rdp: if (WR_PNTR_WIDTH < RD_PNTR_WIDTH) generate
     wr_pntr_rd_adj(RD_PNTR_WIDTH-1 downto RD_PNTR_WIDTH-WR_PNTR_WIDTH) <= wr_pntr_rd;
     wr_pntr_rd_adj(RD_PNTR_WIDTH-WR_PNTR_WIDTH-1 downto 0) <= (others => '0');
     wr_pntr_rd_adj_dc(RD_PNTR_WIDTH downto RD_PNTR_WIDTH-WR_PNTR_WIDTH) <= wr_pntr_rd_dc;
     wr_pntr_rd_adj_dc(RD_PNTR_WIDTH-WR_PNTR_WIDTH-1 downto 0) <= (others => '0');
     rd_pntr_wr_adj <= rd_pntr_wr(RD_PNTR_WIDTH-1 downto RD_PNTR_WIDTH-WR_PNTR_WIDTH);
     rd_pntr_wr_adj_dc <= rd_pntr_wr_dc(RD_PNTR_WIDTH downto RD_PNTR_WIDTH-WR_PNTR_WIDTH);
  end generate gwrp_lt_rdp;

  gen_cdc_pntr: if (COMMON_CLOCK = 0 and RELATED_CLOCKS = 0) generate
    signal src_in_bin: std_logic_vector(RD_PNTR_WIDTH downto 0) := (others => '0');
  begin
    -- Synchronize the write pointer in rd_clk domain
    wr_pntr_cdc_inst: entity work.xpm_cdc_gray 
    generic map(
      DEST_SYNC_FF          => CDC_DEST_SYNC_FF,
      INIT_SYNC_FF          => 1,
      WIDTH                 => WR_PNTR_WIDTH
    )
    port map(
      src_clk            => wr_clk,
      src_in_bin         => wr_pntr,
      dest_clk           => rd_clk,
      dest_out_bin       => wr_pntr_rd_cdc
    );

    -- Register the output of XPM_CDC_GRAY on read side
    wpr_gray_reg: entity work.xpm_fifo_reg_vec 
        generic map(WR_PNTR_WIDTH)
        port map(rd_rst_i, rd_clk, wr_pntr_rd_cdc, wr_pntr_rd);

    -- Synchronize the extended write pointer in rd_clk domain
    wr_pntr_cdc_dc_inst: entity work.xpm_cdc_gray 
    generic map(
      DEST_SYNC_FF => CDC_DEST_SYNC_FF +2*READ_MODE,
      INIT_SYNC_FF => 1,
      WIDTH        => WR_PNTR_WIDTH+1
    )
    port map(
      src_clk      => wr_clk,
      src_in_bin   => wr_pntr_ext,
      dest_clk     => rd_clk,
      dest_out_bin => wr_pntr_rd_cdc_dc
    );

    -- Register the output of XPM_CDC_GRAY on read side
    wpr_gray_reg_dc: entity work.xpm_fifo_reg_vec 
      generic map(WR_PNTR_WIDTH+1)
      port map (rd_rst_i, rd_clk, wr_pntr_rd_cdc_dc, wr_pntr_rd_dc);

    -- Synchronize the read pointer in wr_clk domain
    rd_pntr_cdc_inst: entity work.xpm_cdc_gray 
    generic map(
      DEST_SYNC_FF => CDC_DEST_SYNC_FF,
      INIT_SYNC_FF => 1,
      WIDTH        => RD_PNTR_WIDTH
    )
    port map(
        src_clk      => rd_clk,
        src_in_bin   => rd_pntr,
        dest_clk     => wr_clk,
        dest_out_bin => rd_pntr_wr_cdc
    );

    -- Register the output of XPM_CDC_GRAY on write side
    rpw_gray_reg: entity work.xpm_fifo_reg_vec 
    generic map(RD_PNTR_WIDTH)
    port map(wrst_busy, wr_clk, rd_pntr_wr_cdc, rd_pntr_wr);
    
    src_in_bin <= std_logic_vector(unsigned(rd_pntr_ext)-unsigned(extra_words_fwft));
    
    -- Synchronize the read pointer, subtracted by the extra word read for FWFT, in wr_clk domain
    rd_pntr_cdc_dc_inst: entity work.xpm_cdc_gray 
    generic map(
      DEST_SYNC_FF  => CDC_DEST_SYNC_FF,
      INIT_SYNC_FF  => 1,
      WIDTH         => RD_PNTR_WIDTH+1
    )
    port map(
      src_clk       => rd_clk,
      src_in_bin    => src_in_bin,
      dest_clk      => wr_clk,
      dest_out_bin  => rd_pntr_wr_cdc_dc
    );

    -- Register the output of XPM_CDC_GRAY on write side
    rpw_gray_reg_dc: entity work.xpm_fifo_reg_vec 
    generic map(RD_PNTR_WIDTH+1)
    port map(wrst_busy, wr_clk, rd_pntr_wr_cdc_dc, rd_pntr_wr_dc);

  end generate gen_cdc_pntr;

  gen_pntr_pf_rc: if (RELATED_CLOCKS = 1) generate
    signal rd_pntr_wr_dc_in: std_logic_vector(RD_PNTR_WIDTH downto 0);
  begin
    rpw_rc_reg: entity work.xpm_fifo_reg_vec 
      generic map(RD_PNTR_WIDTH)
      port map(wrst_busy, wr_clk, rd_pntr, rd_pntr_wr);

    wpr_rc_reg: entity work.xpm_fifo_reg_vec 
      generic map(WR_PNTR_WIDTH)
      port map(rd_rst_i, rd_clk, wr_pntr, wr_pntr_rd);

    wpr_rc_reg_dc: entity work.xpm_fifo_reg_vec 
      generic map(WR_PNTR_WIDTH+1)
      port map(rd_rst_i, rd_clk, wr_pntr_ext, wr_pntr_rd_dc);



    rd_pntr_wr_dc_in <= (rd_pntr_ext-extra_words_fwft);
    rpw_rc_reg_dc: entity work.xpm_fifo_reg_vec 
      generic map(RD_PNTR_WIDTH+1)
      port map(wrst_busy, wr_clk, rd_pntr_wr_dc_in, rd_pntr_wr_dc);
  end generate gen_pntr_pf_rc;

  gen_pf_ic_rc: if (COMMON_CLOCK = 0 or RELATED_CLOCKS = 1) generate
  
     going_empty     <= '1' when ((wr_pntr_rd_adj = rd_pntr_plus1) and ram_rd_en_i = '1') else '0';
     leaving_empty   <= '1' when ((wr_pntr_rd_adj = rd_pntr)) else '0';
     going_aempty    <= '1' when ((wr_pntr_rd_adj = rd_pntr_plus2) and ram_rd_en_i = '1') else '0';
     leaving_aempty  <= '1' when ((wr_pntr_rd_adj = rd_pntr_plus1)) else '0';
  
     going_full      <= '1' when ((rd_pntr_wr_adj = wr_pntr_plus2) and ram_wr_en_i = '1') else '0';
     leaving_full    <= '1' when ((rd_pntr_wr_adj = wr_pntr_plus1)) else '0';
     going_afull     <= '1' when ((rd_pntr_wr_adj = wr_pntr_plus3) and ram_wr_en_i = '1') else '0';
     leaving_afull   <= '1' when ((rd_pntr_wr_adj = wr_pntr_plus2)) else '0';
  
    -- Empty flag generation
    process(rd_clk, rd_rst_i)
    begin
      if (rd_rst_i = '1') then
         ram_empty_i  <= '1';
      elsif rising_edge(rd_clk) then
         ram_empty_i  <= going_empty or leaving_empty;
      end if;
    end process;

    gae_ic_std: if (EN_AE = '1') generate
      process(rd_clk, rd_rst_i)
      begin
        if (rd_rst_i = '1') then
          ram_aempty_i <= '1';
        elsif rising_edge(rd_clk) then
          if (ram_empty_i = '0') then
            ram_aempty_i <= going_aempty or leaving_aempty;
          end if;
        end if;
      end process;
    end generate gae_ic_std;
  
    -- Full flag generation
    gen_full_rst_val: if (FULL_RST_VAL = '1') generate
      process(wrst_busy, wr_clk)
      begin
        if (wrst_busy = '1') then
          ram_full_i      <= FULL_RST_VAL;
          ram_full_n      <= not FULL_RST_VAL;
        elsif rising_edge(wr_clk) then
          if (clr_full = '1') then
            ram_full_i    <= '0';
            ram_full_n    <= '1';
          else
            ram_full_i    <= going_full or leaving_full;
            ram_full_n    <= not (going_full or leaving_full);
          end if;
        end if;
      end process;
    end generate gen_full_rst_val;
    ngen_full_rst_val: if (FULL_RST_VAL /= '1') generate
      process(wrst_busy, wr_clk)
      begin
        if wrst_busy = '1' then
          ram_full_i   <= '0';
          ram_full_n   <= '1';
        elsif rising_edge(wr_clk) then
          ram_full_i   <= going_full or leaving_full;
          ram_full_n   <= not (going_full or leaving_full);
        end if;
      end process;
    end generate ngen_full_rst_val;

    gaf_ic: if (EN_AF = '1') generate
      process(wrst_busy, wr_clk)
      begin
        if (wrst_busy) then
          ram_afull_i  <= FULL_RST_VAL;
        elsif rising_edge(wr_clk) then
          if(rst = '0') then
            if (clr_full = '1') then
              ram_afull_i  <= '0';
            elsif (ram_full_i = '0') then
              ram_afull_i  <= going_afull or leaving_afull;
            end if;
          end if;
        end if;
      end process;
    end generate gaf_ic;

  -- synthesis translate_off
    assert_wr_rd_en: if (SIM_ASSERT_CHK = 1) generate
      process(rd_clk)
      begin
        if rising_edge(rd_clk) then
          assert (rd_en = '1' or rd_en = '0') report "Input port 'rd_en' has unknown value 'X' or 'Z' at "&time'image(now)&". This may cause full/empty to be 'X' or 'Z' in simulation. Ensure 'rd_en' has a valid value ('0' or '1')" severity warning;
        end if;
      end process;

      process(wr_clk)
      begin
        if rising_edge(wr_clk) then
          assert (wr_en = '1' or wr_en = '0') report ("Input port 'wr_en' has unknown value 'X' or 'Z' at "&time'image(now)&". This may cause full/empty to be 'X' or 'Z' in simulation. Ensure 'wr_en' has a valid value ('0' or '1')") severity warning;
        end if;
      end process;

    end generate assert_wr_rd_en;
  -- synthesis translate_on

    -- Programmable Full flag generation
    gpf_ic: if (EN_PF = '1') generate
       wr_pntr_plus1_pf <= wr_pntr_plus1 & wr_pntr_plus1_pf_carry;
       rd_pntr_wr_adj_inv_pf <= (not rd_pntr_wr_adj) & rd_pntr_wr_adj_pf_carry;
  
      -- PF carry generation
       wr_pntr_plus1_pf_carry  <= ram_wr_en_i;
       rd_pntr_wr_adj_pf_carry <= ram_wr_en_i;
  
      -- PF diff pointer generation
      process(wrst_busy, wr_clk) 
      begin
        if (wrst_busy) then
           diff_pntr_pf_q  <= (others => '0');
        elsif rising_edge(wr_clk) then
           diff_pntr_pf_q  <= wr_pntr_plus1_pf + rd_pntr_wr_adj_inv_pf;
        end if;
      end process;
      
       diff_pntr_pf <= diff_pntr_pf_q(WR_PNTR_WIDTH downto 1);
  
      process(wrst_busy, wr_clk)
      begin
        if (wrst_busy) then
           prog_full_i  <= FULL_RST_VAL;
        elsif rising_edge(wr_clk) then
          if (clr_full = '1') then
            prog_full_i  <= '0';
          elsif (ram_full_i = '0') then
            if (diff_pntr_pf >= PF_THRESH_ADJ) then
              prog_full_i  <= '1';
            else
              prog_full_i  <= '0';
            end if;
          else
            prog_full_i  <= prog_full_i;
          end if;
        end if;
      end process;
    end generate gpf_ic;

    --*********************************************************
    --* Programmable EMPTY flags
    --*********************************************************/
    --Determine the Assert and Negate thresholds for Programmable Empty
    gpe_ic: if (EN_PE = '1') generate
 
      process(rd_rst_i, rd_clk)
      begin
        if (rd_rst_i = '1') then
          diff_pntr_pe      <= (others => '0');
          prog_empty_i       <= '1';
        elsif rising_edge(rd_clk) then
          if (ram_rd_en_i = '1') then
            diff_pntr_pe       <=  (wr_pntr_rd_adj - rd_pntr) - 1;
          else
            diff_pntr_pe       <=  (wr_pntr_rd_adj - rd_pntr);
          end if;
     
          if (empty_i = '0') then
            if (diff_pntr_pe <= PE_THRESH_ADJ) then
              prog_empty_i <= '1';
            else
              prog_empty_i <= '0';
            end if;
          else
            prog_empty_i   <= prog_empty_i;
          end if;
        end if;
      end process;
    end generate gpe_ic;
  end generate gen_pf_ic_rc;

  gen_pntr_flags_cc: if (COMMON_CLOCK = 1 and RELATED_CLOCKS = 0) generate
      signal     ram_wr_en_pf : std_logic := '0';
      signal     ram_rd_en_pf : std_logic := '0';
      signal     write_allow : std_logic := '0';
      signal     read_allow : std_logic := '0';
      signal     read_only : std_logic := '0';
      signal     write_only : std_logic := '0';
      signal     write_only_q : std_logic := '0';
      signal     read_only_q : std_logic := '0';

  begin
     wr_pntr_rd <= wr_pntr;
     rd_pntr_wr <= rd_pntr;
     wr_pntr_rd_dc <= wr_pntr_ext;
     rd_pntr_wr_dc <= rd_pntr_ext-extra_words_fwft;
     write_allow  <= ram_wr_en_i and not ram_full_i;
     read_allow   <= ram_rd_en_i and not empty_i;

    wrp_eq_rdp: if (WR_PNTR_WIDTH = RD_PNTR_WIDTH) generate
       ram_wr_en_pf  <= ram_wr_en_i;
       ram_rd_en_pf  <= ram_rd_en_i;
  
       going_empty    <= '1' when ((wr_pntr_rd_adj = rd_pntr_plus1) and (ram_wr_en_i = '0' and ram_rd_en_i = '1')) else '0';
       leaving_empty  <= '1' when ((wr_pntr_rd_adj = rd_pntr) and ram_wr_en_i = '1') else '0';
       going_aempty   <= '1' when ((wr_pntr_rd_adj = rd_pntr_plus2) and (ram_wr_en_i = '0' and ram_rd_en_i = '1')) else '0';
       leaving_aempty <= '1' when ((wr_pntr_rd_adj = rd_pntr_plus1) and (ram_wr_en_i = '1' and ram_rd_en_i = '0')) else '0';
  
       going_full     <= '1' when ((rd_pntr_wr_adj = wr_pntr_plus1) and (ram_wr_en_i = '1' and ram_rd_en_i = '0')) else '0';
       leaving_full   <= '1' when ((rd_pntr_wr_adj = wr_pntr) and ram_rd_en_i = '1') else '0';
       going_afull    <= '1' when ((rd_pntr_wr_adj = wr_pntr_plus2) and (ram_wr_en_i = '1' and ram_rd_en_i = '0')) else '0';
       leaving_afull  <= '1' when ((rd_pntr_wr_adj = wr_pntr_plus1) and (ram_rd_en_i = '1' and ram_wr_en_i = '0')) else '0';

       write_only    <= write_allow and not read_allow;
       read_only     <= read_allow and not write_allow;

    end generate wrp_eq_rdp;
  
    wrp_gt_rdp: if (WR_PNTR_WIDTH > RD_PNTR_WIDTH) generate
      signal     wrp_gt_rdp_and_red : std_logic := '0';
    begin
       wrp_gt_rdp_and_red <= and wr_pntr_rd(WR_PNTR_WIDTH-RD_PNTR_WIDTH-1 downto 0);
  
       going_empty    <= '1' when ((wr_pntr_rd_adj = rd_pntr_plus1) and ((ram_wr_en_i and wrp_gt_rdp_and_red) = '0') and ram_rd_en_i = '1') else '0';
       leaving_empty  <= '1' when ((wr_pntr_rd_adj = rd_pntr) and (ram_wr_en_i and wrp_gt_rdp_and_red) = '1') else '0';
       going_aempty   <= '1' when ((wr_pntr_rd_adj = rd_pntr_plus2) and (ram_wr_en_i and wrp_gt_rdp_and_red)= '0' and ram_rd_en_i = '1') else '0';
       leaving_aempty <= '1' when ((wr_pntr_rd_adj = rd_pntr_plus1) and (ram_wr_en_i and wrp_gt_rdp_and_red)= '1' and ram_rd_en_i = '0') else '0';
  
       going_full     <= '1' when ((rd_pntr_wr_adj = wr_pntr_plus1) and ram_wr_en_i = '1' and ram_rd_en_i = '0') else '0';
       leaving_full   <= '1' when ((rd_pntr_wr_adj = wr_pntr) and ram_rd_en_i = '1') else '0';
       going_afull    <= '1' when ((rd_pntr_wr_adj = wr_pntr_plus2) and ram_wr_en_i = '1' and ram_rd_en_i = '0') else '0';
       leaving_afull  <= '1' when (((rd_pntr_wr_adj = wr_pntr) or (rd_pntr_wr_adj = wr_pntr_plus1) or (rd_pntr_wr_adj = wr_pntr_plus2)) and ram_rd_en_i = '1') else '0';
  
       ram_wr_en_pf  <= ram_wr_en_i and wrp_gt_rdp_and_red;
       ram_rd_en_pf  <= ram_rd_en_i;

       read_only     <= read_allow and (not (write_allow  and (and wr_pntr(WR_PNTR_WIDTH-RD_PNTR_WIDTH-1 downto 0))));
       write_only    <= write_allow and (and wr_pntr(WR_PNTR_WIDTH-RD_PNTR_WIDTH-1 downto 0)) and read_allow;


    end generate wrp_gt_rdp;
  
    wrp_lt_rdp: if (WR_PNTR_WIDTH < RD_PNTR_WIDTH) generate
       signal     wrp_lt_rdp_and_red : std_logic := '0';
    begin
       wrp_lt_rdp_and_red <= and rd_pntr_wr(RD_PNTR_WIDTH-WR_PNTR_WIDTH-1 downto 0);
  
       going_empty     <= '1' when ((wr_pntr_rd_adj = rd_pntr_plus1) and ((ram_wr_en_i = '0') and ram_rd_en_i = '1')) else '0';
       leaving_empty   <= '1' when ((wr_pntr_rd_adj = rd_pntr) and ram_wr_en_i = '1') else '0';
       going_aempty    <= '1' when ((wr_pntr_rd_adj = rd_pntr_plus2) and ram_wr_en_i = '0' and ram_rd_en_i = '1') else '0';
       leaving_aempty  <= '1' when (((wr_pntr_rd_adj = rd_pntr) or (wr_pntr_rd_adj = rd_pntr_plus1) or (wr_pntr_rd_adj = rd_pntr_plus2)) and ram_wr_en_i = '1') else '0';
  
       going_full      <= '1' when ((rd_pntr_wr_adj = wr_pntr_plus1) and (ram_rd_en_i and wrp_lt_rdp_and_red) = '0' and ram_wr_en_i = '1') else '0';
       leaving_full    <= '1' when ((rd_pntr_wr_adj = wr_pntr) and (ram_rd_en_i = '1' and wrp_lt_rdp_and_red = '1')) else '0';
       going_afull     <= '1' when ((rd_pntr_wr_adj = wr_pntr_plus2) and (ram_rd_en_i and wrp_lt_rdp_and_red) = '0' and ram_wr_en_i = '1') else '0';
       leaving_afull   <= '1' when ((rd_pntr_wr_adj = wr_pntr_plus1) and ram_wr_en_i = '0' and (ram_rd_en_i and wrp_lt_rdp_and_red) = '1') else '0';
  
       ram_wr_en_pf <= ram_wr_en_i;
       ram_rd_en_pf <= ram_rd_en_i and wrp_lt_rdp_and_red;

       read_only   <= read_allow and (and rd_pntr(RD_PNTR_WIDTH-WR_PNTR_WIDTH-1 downto 0)) and not write_allow;
       write_only    <= write_allow    and (not(read_allow and (and rd_pntr(RD_PNTR_WIDTH-WR_PNTR_WIDTH-1 downto 0))));
    end generate wrp_lt_rdp;
  
    -- Empty flag generation
    process(rd_rst_i, rd_clk)
    begin
      if (rd_rst_i = '1') then
         ram_empty_i  <= '1';
      elsif rising_edge(rd_clk) then
         ram_empty_i  <= going_empty or (not leaving_empty and ram_empty_i);
      end if;
    end process;

    gae_cc_std: if (EN_AE = '1') generate
      process(rd_rst_i, rd_clk)
      begin
        if (rd_rst_i= '1') then
          ram_aempty_i <= '1';
        elsif rising_edge(rd_clk) then
          ram_aempty_i <= going_aempty or (not leaving_aempty and ram_aempty_i);
        end if;
      end process;
    end generate gae_cc_std;

    -- Full flag generation
    gen_full_rst_val: if (FULL_RST_VAL = '1') generate
      process(wrst_busy, wr_clk)
      begin
        if (wrst_busy = '1') then
          ram_full_i   <= FULL_RST_VAL;
          ram_full_n   <= not FULL_RST_VAL;
        elsif rising_edge(wr_clk) then
          if (clr_full = '1') then
            ram_full_i   <= '0';
            ram_full_n   <= '1';
          else
            ram_full_i   <= going_full or (not leaving_full and ram_full_i);
            ram_full_n   <= not(going_full or (not leaving_full and ram_full_i));
          end if;
        end if;
      end process;
    end generate gen_full_rst_val;
    ngen_full_rst_val: if (FULL_RST_VAL /= '1') generate
      process(wrst_busy, wr_clk)
      begin
        if (wrst_busy = '1') then
          ram_full_i   <= '0';
          ram_full_n   <= '1';
        elsif rising_edge(wr_clk) then
          ram_full_i   <= going_full or (not leaving_full and ram_full_i);
          ram_full_n   <= not(going_full or (not leaving_full and ram_full_i));
        end if;
      end process;
    end generate ngen_full_rst_val;

    gaf_cc: if (EN_AF = '1') generate
      process(wrst_busy, wr_clk)
      begin
        if (wrst_busy = '1') then
          ram_afull_i  <= FULL_RST_VAL;
        elsif rising_edge(wr_clk) then
          if (rst = '0') then
            if (clr_full = '1') then
              ram_afull_i  <= '0';
            else
              ram_afull_i  <= going_afull or (not leaving_afull and ram_afull_i);
            end if;
          end if;
        end if;
      end process;
    end generate gaf_cc;
    -- Programmable Full flag generation
    wrp_eq_rdp_pf_cc: if ((WR_PNTR_WIDTH = RD_PNTR_WIDTH) and (RELATED_CLOCKS = 0)) generate
      gpf_cc_sym: if (EN_PF = '1') generate

         wr_pntr_plus1_pf <= wr_pntr_plus1 & wr_pntr_plus1_pf_carry;
         rd_pntr_wr_adj_inv_pf <= (not rd_pntr_wr_adj) & rd_pntr_wr_adj_pf_carry;
  
        -- Delayed write/read enable for PF generation
        process(wrst_busy, wr_clk)
        begin
          if (wrst_busy = '1') then
             ram_wr_en_pf_q   <= '0';
             ram_rd_en_pf_q   <= '0';
          elsif rising_edge(wr_clk) then
             ram_wr_en_pf_q   <= ram_wr_en_pf;
             ram_rd_en_pf_q   <= ram_rd_en_pf;
          end if;
        end process;
  
        -- PF carry generation
        wr_pntr_plus1_pf_carry  <= ram_wr_en_i and not ram_rd_en_pf;
        rd_pntr_wr_adj_pf_carry <= ram_wr_en_i and not ram_rd_en_pf;
  
        -- PF diff pointer generation
        process(wrst_busy, wr_clk)
        begin
          if (wrst_busy = '1') then
             diff_pntr_pf_q  <= (others => '0');
          elsif rising_edge(wr_clk) then
             diff_pntr_pf_q  <= wr_pntr_plus1_pf + rd_pntr_wr_adj_inv_pf;
          end if;
        end process;
         diff_pntr_pf <= diff_pntr_pf_q(WR_PNTR_WIDTH downto 1);
  
        process(wrst_busy, wr_clk)
        begin
          if (wrst_busy = '1') then
             prog_full_i  <= FULL_RST_VAL;
          elsif rising_edge(wr_clk) then
            if (clr_full = '1') then
              prog_full_i  <= '0';
            elsif ((diff_pntr_pf = PF_THRESH_ADJ) and ram_wr_en_pf_q = '1' and ram_rd_en_pf_q = '0') then
              prog_full_i  <= '1';
            elsif ((diff_pntr_pf = PF_THRESH_ADJ) and ram_wr_en_pf_q = '0' and ram_rd_en_pf_q = '1') then
              prog_full_i  <= '0';
            else
              prog_full_i  <= prog_full_i;
            end if;
          end if;
        end process;
      end generate gpf_cc_sym;

      gpe_cc_sym: if (EN_PE = '1') generate
        process(rd_rst_i, rd_clk)
        begin
          if (rd_rst_i = '1') then
            read_only_q    <= '0';
            write_only_q   <= '0';
            diff_pntr_pe   <= (others => '0');
          elsif rising_edge(rd_clk) then
            read_only_q  <= read_only;
            write_only_q <= write_only;
            -- Add 1 to the difference pointer value when write or both write & read or no write & read happen.
            if (read_only = '1') then
              diff_pntr_pe <= wr_pntr_rd_adj - rd_pntr - 1;
            else
              diff_pntr_pe <= wr_pntr_rd_adj - rd_pntr;
            end if;
          end if;
        end process;
  
        process(rd_rst_i, rd_clk)
        begin
          if (rd_rst_i = '1') then
            prog_empty_i  <= '1';
          elsif rising_edge(rd_clk) then
            if (diff_pntr_pe = PE_THRESH_ADJ and read_only_q = '1') then
              prog_empty_i <= '1';
            elsif (diff_pntr_pe = PE_THRESH_ADJ and write_only_q = '1') then
              prog_empty_i <= '0';
            else
              prog_empty_i <= prog_empty_i;
            end if;
          end if;
        end process;
      end generate gpe_cc_sym;
    end generate wrp_eq_rdp_pf_cc;

    wrp_neq_rdp_pf_cc: if ((WR_PNTR_WIDTH /= RD_PNTR_WIDTH) and (RELATED_CLOCKS = 0)) generate
      gpf_cc_asym: if (EN_PF = '1') generate
        -- PF diff pointer generation
        process(wrst_busy, wr_clk)
        begin
          if (wrst_busy = '1') then
             diff_pntr_pf_q  <= (others => '0');
          elsif rising_edge(wr_clk) then
            if (ram_full_i = '0') then
              diff_pntr_pf_q(WR_PNTR_WIDTH downto 1)  <= wr_pntr + not rd_pntr_wr_adj + 1;
            end if;
          end if;
        end process;
        
        diff_pntr_pf <= diff_pntr_pf_q(WR_PNTR_WIDTH downto 1);
        
        process(wrst_busy, wr_clk)
        begin
          if (wrst_busy = '1') then
             prog_full_i  <= FULL_RST_VAL;
          elsif rising_edge(wr_clk) then
            if (clr_full = '1') then
              prog_full_i  <= '0';
            elsif (ram_full_i = '0') then
              if (diff_pntr_pf >= PF_THRESH_ADJ) then
                prog_full_i  <= '1';
              elsif (diff_pntr_pf < PF_THRESH_ADJ) then
                prog_full_i  <= '0';
              else
                prog_full_i  <= prog_full_i;
              end if;
            end if;
          end if;
        end process;
      end generate gpf_cc_asym;
      gpe_cc_asym: if (EN_PE = '1') generate
        -- Programmanble Empty flag Generation
        -- Diff pointer Generation
        constant DIFF_MAX_RD : std_logic_vector(RD_PNTR_WIDTH-1 downto 0) := (others => '1');
        signal  diff_pntr_pe_max: std_logic_vector(RD_PNTR_WIDTH-1 downto 0) := (others => '0');
        signal  carry : std_logic := '0';
        signal  diff_pntr_pe_asym   : std_logic_vector(RD_PNTR_WIDTH downto 0) := (others => '0');
        signal  wr_pntr_rd_adj_asym : std_logic_vector(RD_PNTR_WIDTH downto 0) := (others => '0');
        signal  rd_pntr_asym        : std_logic_vector(RD_PNTR_WIDTH downto 0) := (others => '0');
        signal  full_reg : std_logic := '0';
        signal  rst_full_ff_reg1 : std_logic := '0';
        signal  rst_full_ff_reg2 : std_logic := '0';
        signal  diff_pntr_pe_i : std_logic_vector (RD_PNTR_WIDTH-1 downto 0) := (others => '0');
      begin
         diff_pntr_pe_max <= DIFF_MAX_RD;
         wr_pntr_rd_adj_asym(RD_PNTR_WIDTH downto 0) <= wr_pntr_rd_adj & '1';
         rd_pntr_asym(RD_PNTR_WIDTH downto 0) <= (not rd_pntr) & '1';
  
        process(rd_rst_i, rd_clk)
        begin
          if (rd_rst_i = '1') then
            diff_pntr_pe_asym    <= (others => '0');
            full_reg             <= '0';
            rst_full_ff_reg1     <= '1';
            rst_full_ff_reg2     <= '1';
            --diff_pntr_pe_reg1    <= (others => '0');
          elsif rising_edge(rd_clk) then
            diff_pntr_pe_asym <= wr_pntr_rd_adj_asym + rd_pntr_asym;
            full_reg          <= ram_full_i;
            rst_full_ff_reg1  <= FULL_RST_VAL;
            rst_full_ff_reg2  <= rst_full_ff_reg1;
          end if;
        end process;
        
         carry <= (not(or(diff_pntr_pe_asym (RD_PNTR_WIDTH downto 1))));
         diff_pntr_pe_i <=  diff_pntr_pe_max when ((full_reg and not rst_d2 and carry ) = '1') else diff_pntr_pe_asym(RD_PNTR_WIDTH downto 1);
    
        process(rd_rst_i, rd_clk)
        begin
          if (rd_rst_i = '1') then
            prog_empty_i  <= '1';
          elsif rising_edge(rd_clk) then
            if (diff_pntr_pe_i <= PE_THRESH_ADJ) then
              prog_empty_i <= '1';
            elsif (diff_pntr_pe_i > PE_THRESH_ADJ) then
              prog_empty_i <= '0';
            else
              prog_empty_i <= prog_empty_i;
            end if;
          end if;
        end process;
      end generate gpe_cc_asym;
    end generate wrp_neq_rdp_pf_cc;

  end generate gen_pntr_flags_cc;

  gen_regce_std: if (READ_MODE = 0 and FIFO_READ_LATENCY > 1) generate
    regce_pipe_inst: entity work.xpm_reg_pipe_bit 
    generic map(FIFO_READ_LATENCY-1, '0')
    port map(rd_rst_i, rd_clk, ram_rd_en_i, ram_regce_pipe);
  end generate gen_regce_std;
  gnen_regce_std: if (not (READ_MODE = 0 and FIFO_READ_LATENCY > 1)) generate
     ram_regce_pipe <= '0';
  end generate gnen_regce_std;

  gn_fwft: if (not (READ_MODE = 1 and FIFO_MEMORY_TYPE /= 4)) generate
    invalid_state <= '0';
  end generate gn_fwft;
  gen_fwft: if (READ_MODE = 1 and FIFO_MEMORY_TYPE /= 4) generate
  -- First word fall through logic

   --constant invalid             = 0;
   --constant stage1_valid        = 2;
   --constant stage2_valid        = 1;
   --constant both_stages_valid   = 3;

   --reg  (1:0) curr_fwft_state = invalid;
   --reg  (1:0) next_fwft_state;-- = invalid;
   signal next_fwft_state_d1 : std_logic := '0';
   signal ram_regout_en : std_logic := '0';
   signal going_empty_fwft : std_logic := '0';
   signal leaving_empty_fwft : std_logic := '0';
   signal ge_fwft_d1: std_logic := '0';
   signal count_up  : std_logic := '0';
   signal count_down: std_logic := '0';
   signal count_en  : std_logic := '0';
   signal count_rst : std_logic := '0';
    

  begin
    invalid_state <= not (or curr_fwft_state);
    valid_fwft <= next_fwft_state_d1;
    ram_valid_fwft <= curr_fwft_state(1);

    next_state_d1_inst: entity work.xpm_fifo_reg_bit 
    generic map('0')
    port map('0', rd_clk, next_fwft_state(0), next_fwft_state_d1);
   --FSM : To generate the enable, clock enable for xpm_memory and to generate
   --empty signal
   --FSM : Next state ment
     process(curr_fwft_state, ram_empty_i, rd_en) 
     begin
       case (curr_fwft_state) is
         when invalid =>
           if (ram_empty_i = '0') then
              next_fwft_state     <= stage1_valid;
           else
              next_fwft_state     <= invalid;
           end if;
         when stage1_valid => 
           if (ram_empty_i = '1') then
              next_fwft_state     <= stage2_valid;
           else
              next_fwft_state     <= both_stages_valid;
           end if;
         when stage2_valid =>
           if (ram_empty_i = '1' and rd_en = '1') then
              next_fwft_state     <= invalid;
           elsif (ram_empty_i = '0' and rd_en = '1') then
              next_fwft_state     <= stage1_valid;
           elsif (ram_empty_i = '0' and rd_en = '0') then
              next_fwft_state     <= both_stages_valid;
           else
              next_fwft_state     <= stage2_valid;
           end if;
         when both_stages_valid =>
           if (ram_empty_i = '1' and rd_en = '1') then
              next_fwft_state     <= stage2_valid;
           elsif (ram_empty_i = '0' and rd_en = '1') then
              next_fwft_state     <= both_stages_valid;
           else
              next_fwft_state     <= both_stages_valid;
           end if;
         when others => next_fwft_state    <= invalid;
       end case;
     end process;
     -- FSM : current state ment
     process(rd_rst_i, rd_clk)
     begin
       if (rd_rst_i = '1') then
          curr_fwft_state  <= invalid;
       elsif rising_edge(rd_clk) then
          curr_fwft_state  <= next_fwft_state;
        end if;
     end process;
 
     

     -- FSM(output ments) : clock enable generation for xpm_memory
     process(curr_fwft_state, rd_en)
     begin
       case (curr_fwft_state) is
         when invalid           => ram_regout_en <= '0';
         when stage1_valid      => ram_regout_en <= '1';
         when stage2_valid      => ram_regout_en <= '0';
         when both_stages_valid => ram_regout_en <= rd_en;
         when others            => ram_regout_en <= '0';
       end case;
     end process;

     -- FSM(output ments) : rd_en (enable) signal generation for xpm_memory
     process (curr_fwft_state, ram_empty_i, rd_en)
     begin
       case (curr_fwft_state) is
         when invalid =>
           if (ram_empty_i = '0') then
             rd_en_fwft <= '1';
           else
             rd_en_fwft <= '0';
           end if;
         when stage1_valid =>
           if (ram_empty_i = '0') then
             rd_en_fwft <= '1';
           else
             rd_en_fwft <= '0';
           end if;
         when stage2_valid =>
           if (ram_empty_i = '0') then
             rd_en_fwft <= '1';
           else
             rd_en_fwft <= '0';
           end if;
         when both_stages_valid =>
           if (ram_empty_i = '0' and rd_en = '1') then
             rd_en_fwft <= '1';
           else
             rd_en_fwft <= '0';
           end if;
         when others =>
           rd_en_fwft <= '0';
       end case;
     end process;
     -- assingment to control regce xpm_memory
      ram_regce <= ram_regout_en;

     
     process(curr_fwft_state, rd_en) 
     begin
       case (curr_fwft_state) is
         when stage2_valid => going_empty_fwft <= rd_en;
         when others       => going_empty_fwft <= '0';
       end case;
     end process;

     process(curr_fwft_state, rd_en) 
     begin
       case (curr_fwft_state) is
         when stage1_valid => leaving_empty_fwft <= '1';
         when others       => leaving_empty_fwft <= '0';
       end case;
     end process;
     -- fwft empty signal generation 
     process(rd_rst_i, rd_clk)
     begin
       if (rd_rst_i = '1') then
         empty_fwft_i     <= '1';
         empty_fwft_fb    <= '1';
       elsif rising_edge(rd_clk) then
         empty_fwft_i     <= going_empty_fwft or (not leaving_empty_fwft and empty_fwft_fb);
         empty_fwft_fb    <= going_empty_fwft or (not leaving_empty_fwft and empty_fwft_fb);
       end if;
     end process;

     gae_fwft: if (EN_AE = '1') generate
       signal going_aempty_fwft : std_logic := '0';
       signal leaving_aempty_fwft: std_logic := '0';
     begin

       process (curr_fwft_state, rd_en, ram_empty_i) 
       begin
         case (curr_fwft_state) is
           when both_stages_valid => going_aempty_fwft <= rd_en and ram_empty_i;
           when others            => going_aempty_fwft <= '0';
         end case;
       end process;

       process(curr_fwft_state, rd_en, ram_empty_i) 
       begin
         case (curr_fwft_state) is
           when stage1_valid => leaving_aempty_fwft <= not ram_empty_i;
           when stage2_valid => leaving_aempty_fwft <= not (rd_en or ram_empty_i);
           when others       => leaving_aempty_fwft <= '0';
         end case;
       end process;

       process(rd_rst_i, rd_clk) 
       begin
         if (rd_rst_i = '1') then
           aempty_fwft_i    <= '1';
         elsif rising_edge(rd_clk) then
           aempty_fwft_i    <= going_aempty_fwft or (not leaving_aempty_fwft and aempty_fwft_i);
         end if;
       end process;
     end generate gae_fwft;

     gdvld_fwft: if (EN_DVLD = '1') generate
       process(rd_rst_i, rd_clk)
       begin
         if (rd_rst_i = '1') then
           data_valid_fwft  <= '0';
         elsif rising_edge(rd_clk) then
           data_valid_fwft  <= not (going_empty_fwft or (not leaving_empty_fwft and empty_fwft_fb));
         end if;
       end process;
     end generate gdvld_fwft;

    empty_fwft_d1_inst: entity work.xpm_fifo_reg_bit 
    generic map('0')
    port map('0', rd_clk, leaving_empty_fwft, empty_fwft_d1);

    ge_fwft_d1_inst: entity work.xpm_fifo_reg_bit 
    generic map('0')
    port map('0', rd_clk, going_empty_fwft, ge_fwft_d1);

    process(next_fwft_state, curr_fwft_state, count_up, count_down, rd_rst_i)
    begin
     if (next_fwft_state = "10" and (or curr_fwft_state) = '0') or 
        (curr_fwft_state = "10" and (and next_fwft_state)= '1') or
        (curr_fwft_state = "01" and (and next_fwft_state) = '1') then
        count_up   <= '1';
     else
        count_up <= '0';
     end if;
     if (next_fwft_state = "01" and (and curr_fwft_state) = '1') or
        (curr_fwft_state = "01" and (or next_fwft_state) = '0') then
        count_down <= '1';
     else
        count_down <= '0';
     end if;
     count_en   <= count_up or count_down;
     count_rst  <= (rd_rst_i or (not (or curr_fwft_state) and not (and next_fwft_state)));
    end process;
    rdpp1_inst0: entity work.xpm_counter_updn 
    generic map(2, 0)
    port map(count_rst, rd_clk, count_en, count_up, count_down, extra_words_fwft);
  end generate gen_fwft;

  ngen_fwft: if (READ_MODE = 0) generate
     extra_words_fwft <= "00";
  end generate ngen_fwft;

  -- output data bus ment
  nfg_eq_asym_dout: if (FG_EQ_ASYM_DOUT = '0') generate
     dout  <= dout_i;
  end generate nfg_eq_asym_dout;

  -- Overflow and Underflow flag generation
  guf: if (EN_UF = '1') generate
    process(rd_clk) 
    begin
      if rising_edge(rd_clk) then
        underflow_i <=  (rd_rst_i or empty_i) and rd_en;
      end if;
    end process;
     underflow   <= underflow_i;
  end generate guf;
  gnuf : if (EN_UF = '0') generate
     underflow   <= '0';
  end generate gnuf;

  gof: if (EN_OF = '1') generate
    process (wr_clk) 
    begin
      if rising_edge(wr_clk) then
        overflow_i  <=  (wrst_busy or rst_d1 or ram_full_i) and wr_en;
      end if;
    end process;
     overflow    <= overflow_i;
  end generate gof;
  gnof: if (EN_OF = '0') generate
     overflow    <= '0';
  end generate gnof;

  -- -------------------------------------------------------------------------------------------------------------------
  -- Write Data Count for Independent Clocks FIFO
  -- -------------------------------------------------------------------------------------------------------------------
  gwdc: if (EN_WDC = '1') generate
    signal  wr_data_count_i : std_logic_vector(WR_DC_WIDTH_EXT-1 downto 0) := (others => '0');
    signal  diff_wr_rd_pntr : std_logic_vector(WR_DC_WIDTH_EXT-1 downto 0) := (others => '0');
  begin
    diff_wr_rd_pntr <= wr_pntr_ext-rd_pntr_wr_adj_dc;
    
    process (wrst_busy, wr_clk) 
    begin
      if (wrst_busy = '1') then
         wr_data_count_i   <= (others => '0');
      elsif rising_edge(wr_clk) then
         wr_data_count_i  <= diff_wr_rd_pntr;
      end if;
    end process;
     wr_data_count <= wr_data_count_i(WR_DC_WIDTH_EXT-1 downto WR_DC_WIDTH_EXT-WR_DATA_COUNT_WIDTH);
  end generate gwdc;
  gnwdc: if (EN_WDC = '0') generate
     wr_data_count <= (others => '0');
  end generate gnwdc;

  -- -------------------------------------------------------------------------------------------------------------------
  -- Read Data Count for Independent Clocks FIFO
  -- -------------------------------------------------------------------------------------------------------------------
  grdc: if (EN_RDC = '1') generate
    signal rd_data_count_i     : std_logic_vector(RD_DC_WIDTH_EXT-1 downto 0) := (others => '0');
    signal diff_wr_rd_pntr_rdc : std_logic_vector(RD_DC_WIDTH_EXT-1 downto 0) := (others => '0');
  begin
    diff_wr_rd_pntr_rdc <= wr_pntr_rd_adj_dc-rd_pntr_ext+extra_words_fwft;
    
    process(rd_rst_i, invalid_state, rd_clk)
    begin
      if (rd_rst_i = '1' or invalid_state = '1') then
         rd_data_count_i   <= (others => '0');
      else
         rd_data_count_i  <= diff_wr_rd_pntr_rdc;
      end if;
    end process;
    rd_data_count <= rd_data_count_i(RD_DC_WIDTH_EXT-1 downto RD_DC_WIDTH_EXT-RD_DATA_COUNT_WIDTH);
  end generate grdc;
  gnrdc: if (EN_RDC = '0') generate
     rd_data_count <= (others => '0');
  end generate gnrdc;

  
  
end rtl;
