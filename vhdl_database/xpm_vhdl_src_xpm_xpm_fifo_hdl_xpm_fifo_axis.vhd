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
use ieee.numeric_std_unsigned.all;
library std;
use std.env.all;

entity xpm_fifo_axis is
  generic (
    CLOCKING_MODE            : string   := "common_clock";
    FIFO_MEMORY_TYPE         : string   := "auto";
    CASCADE_HEIGHT           : integer  := 0;
    PACKET_FIFO              : string   := "false";
    FIFO_DEPTH               : integer  := 2048;
    TDATA_WIDTH              : integer  := 32;
    TID_WIDTH                : integer  := 1;
    TDEST_WIDTH              : integer  := 1;
    TUSER_WIDTH              : integer  := 1;
    ECC_MODE                 : string   :="no_ecc";
    RELATED_CLOCKS           : integer  := 0;
    USE_ADV_FEATURES         : string   :="1000";
    WR_DATA_COUNT_WIDTH      : integer  := 1;
    RD_DATA_COUNT_WIDTH      : integer  := 1;
    PROG_FULL_THRESH         : integer  := 10;
    PROG_EMPTY_THRESH        : integer  := 10;
    SIM_ASSERT_CHK           : integer := 0    ;
    CDC_SYNC_STAGES          : integer  := 2
  );
  port (
    s_aresetn                      : in  std_logic;
    m_aclk                         : in  std_logic;
    s_aclk                         : in  std_logic;
    s_axis_tvalid                  : in  std_logic;
    s_axis_tready                  : out std_logic;
    s_axis_tdata                   : in  std_logic_vector(TDATA_WIDTH-1 downto 0);
    s_axis_tstrb                   : in  std_logic_vector(TDATA_WIDTH/8-1 downto 0);
    s_axis_tkeep                   : in  std_logic_vector(TDATA_WIDTH/8-1 downto 0);
    s_axis_tlast                   : in  std_logic;
    s_axis_tid                     : in  std_logic_vector(TID_WIDTH-1 downto 0);
    s_axis_tdest                   : in  std_logic_vector(TDEST_WIDTH-1 downto 0);
    s_axis_tuser                   : in  std_logic_vector(TUSER_WIDTH-1 downto 0);
    m_axis_tvalid                  : out std_logic;
    m_axis_tready                  : in  std_logic;
    m_axis_tdata                   : out std_logic_vector(TDATA_WIDTH-1 downto 0);
    m_axis_tstrb                   : out std_logic_vector(TDATA_WIDTH/8-1 downto 0);
    m_axis_tkeep                   : out std_logic_vector(TDATA_WIDTH/8-1 downto 0);
    m_axis_tlast                   : out std_logic;
    m_axis_tid                     : out std_logic_vector(TID_WIDTH-1 downto 0);
    m_axis_tdest                   : out std_logic_vector(TDEST_WIDTH-1 downto 0);
    m_axis_tuser                   : out std_logic_vector(TUSER_WIDTH-1 downto 0);
    prog_full_axis                 : out std_logic;
    wr_data_count_axis             : out std_logic_vector(WR_DATA_COUNT_WIDTH-1 downto 0);
    almost_full_axis               : out std_logic;
    prog_empty_axis                : out std_logic;
    rd_data_count_axis             : out std_logic_vector(RD_DATA_COUNT_WIDTH-1 downto 0);
    almost_empty_axis              : out std_logic;
    injectsbiterr_axis             : in  std_logic;
    injectdbiterr_axis             : in  std_logic;
    sbiterr_axis                   : out std_logic;
    dbiterr_axis                   : out std_logic
  );
end xpm_fifo_axis;

architecture rtl of xpm_fifo_axis is



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

--Function to convert binary to ASCII value
  function bin2str (bin_val : std_logic_vector(3 downto 0)) return character is
  
  begin
    case bin_val is
        when x"0" => return '0';
        when x"1" => return '1';
        when x"2" => return '2';
        when x"3" => return '3';
        when x"4" => return '4';
        when x"5" => return '5';
        when x"6" => return '6';
        when x"7" => return '7';
        when x"8" => return '8';
        when x"9" => return '9';
        when x"A" => return 'A';
        when x"B" => return 'B';
        when x"C" => return 'C';
        when x"D" => return 'D';
        when x"E" => return 'E';
        when x"F" => return 'F';
        when others => return '0';
    end case;
  end function;

  -- Function that parses the complete binary value to string
  function bin2hstr(bin_val: std_logic_vector(15 downto 0)) return string is
    constant str_max_bits: integer := 16;
    variable hstr : string(1 to 4) := "0000";
  begin
    for str_pos in 1 to 4 loop
        hstr(str_pos) := bin2str(bin_val((4-str_pos)*4+3 downto (4-str_pos)*4));
    end loop;
    return hstr;
  end function;


  constant EN_ADV_FEATURE_AXIS : std_logic_vector(15 downto 0) := hstr2bin(USE_ADV_FEATURES);
  function EN_ALMUST_F_E(P: string; F: std_logic) return std_logic is
  begin
    if P = "true" or P = "TRUE" then
        return '1';
    else
        return F;
    end if;
  end function;
  constant EN_ALMOST_FULL_INT  : std_logic := EN_ALMUST_F_E(PACKET_FIFO, EN_ADV_FEATURE_AXIS(3)); 
  constant EN_ALMOST_EMPTY_INT : std_logic := EN_ALMUST_F_E(PACKET_FIFO, EN_ADV_FEATURE_AXIS(11)); 
  constant EN_DATA_VALID_INT   : std_logic := '1';
  constant EN_ADV_FEATURE_AXIS_INT : std_logic_vector(15 downto 0) := 
   EN_ADV_FEATURE_AXIS(15 downto 13) & EN_DATA_VALID_INT & EN_ALMOST_EMPTY_INT &
   EN_ADV_FEATURE_AXIS(10 downto 4) & EN_ALMOST_FULL_INT &  EN_ADV_FEATURE_AXIS(2 downto 0);
  constant USE_ADV_FEATURES_INT : string := bin2hstr(EN_ADV_FEATURE_AXIS_INT);

  constant PKT_SIZE_LT8      : std_logic := EN_ADV_FEATURE_AXIS(13);

  constant LOG_DEPTH_AXIS    : integer := clog2(FIFO_DEPTH);
  constant TDATA_OFFSET      : integer := TDATA_WIDTH;
  constant TSTRB_OFFSET      : integer := TDATA_OFFSET+(TDATA_WIDTH/8);
  constant TKEEP_OFFSET      : integer := TSTRB_OFFSET+(TDATA_WIDTH/8);
  function CALC_OFFSET(W: integer; O: integer) return integer is
  begin
    if W > 0 then
        return O+W;
    else
        return O;
    end if;
  end function;
  constant TID_OFFSET        : integer := CALC_OFFSET(TID_WIDTH, TKEEP_OFFSET);
  constant TDEST_OFFSET      : integer := CALC_OFFSET(TDEST_WIDTH, TID_OFFSET);
  constant TUSER_OFFSET      : integer := CALC_OFFSET(TUSER_WIDTH, TDEST_OFFSET);
  constant AXIS_DATA_WIDTH   : integer := TUSER_OFFSET+1;

  -- Define local parameters for mapping with base file
  function F_COMMON_CLOCK(M: string) return integer is
  begin
    if (M = "common_clock"      or 
        M = "COMMON_CLOCK"      or 
        M = "COMMON" or 
        M = "common") then
        return 1;
    elsif (M = "independent_clock" or 
        M = "INDEPENDENT_CLOCK" or 
        M = "INDEPENDENT" or 
        M = "independent") then 
        return 0;
    else
        return 1;
    end if;
  end function;
  constant P_COMMON_CLOCK : integer := F_COMMON_CLOCK(CLOCKING_MODE);
  function F_FIFO_MEMORY_TYPE(T: string) return integer is
  begin
    if (T = "lutram"   or T = "LUTRAM"   or T = "distributed"   or T = "DISTRIBUTED"  ) then
        return 1;
    elsif(T = "bram" or T = "BRAM" or T = "block" or T = "BLOCK") then
        return 2;
    elsif(T = "uram" or T = "URAM" or T = "ultra" or T = "ULTRA") then
        return 3;
    else
        return 0;
    end if;
  end function;
  constant  P_FIFO_MEMORY_TYPE      : integer := F_FIFO_MEMORY_TYPE(FIFO_MEMORY_TYPE);

  function F_ECC_MODE (M: string) return integer is
  begin
    if M = "no_ecc" or M = "NO_ECC" then
        return 0;
    else
        return 1;
    end if;
  end function;
  constant P_ECC_MODE : integer := F_ECC_MODE(ECC_MODE);
  function F_PKT_MODE (M: string) return integer is
  begin
    if M = "TRUE" or M = "true" then
        return 1;
    else
        return 0;
    end if;
  end function;
  constant P_PKT_MODE : integer := F_PKT_MODE(PACKET_FIFO);
  function F_AXIS_FINAL_DATA_WIDTH (M: integer; W: integer) return integer is
  begin
    if(P_ECC_MODE = 0) then
        return AXIS_DATA_WIDTH;
    elsif(AXIS_DATA_WIDTH mod 64 = 0) then
        return (AXIS_DATA_WIDTH/64)*64;
    else
        return ((AXIS_DATA_WIDTH/64)*64) + 64;
    end if;
  end function;
  constant AXIS_FINAL_DATA_WIDTH           : integer := F_AXIS_FINAL_DATA_WIDTH(P_ECC_MODE, AXIS_DATA_WIDTH);
  constant TUSER_MAX_WIDTH                 : integer := 4096 - (TDEST_OFFSET+1);

  signal rst_axis : std_logic;
  signal data_valid_axis : std_logic;
  signal rd_rst_busy_axis : std_logic;
  signal axis_din : std_logic_vector(AXIS_FINAL_DATA_WIDTH-1 downto 0);
  signal axis_dout: std_logic_vector(AXIS_FINAL_DATA_WIDTH-1 downto 0);
  signal rd_clk : std_logic;
  signal rd_en : std_logic;
  
  signal axis_pkt_read  : std_logic := '0';
  signal axis_wr_eop_d1 : std_logic := '0';
  signal axis_wr_eop : std_logic;
  signal axis_rd_eop : std_logic;
  signal axis_pkt_cnt : integer;
  
  signal m_axis_tvalid_s: std_logic;
  signal m_axis_tlast_s: std_logic;
  signal s_axis_tready_s: std_logic;
  signal almost_full_axis_s: std_logic;
  
begin
  m_axis_tvalid <= m_axis_tvalid_s;
  m_axis_tlast <= m_axis_tlast_s;
  s_axis_tready <= s_axis_tready_s;
  almost_full_axis <= almost_full_axis_s;

  config_drc_axis: process
    variable drc_err_flag_axis : integer := 0;
  begin
    
    if (AXIS_FINAL_DATA_WIDTH > 4096) then
      report("(XPM_FIFO_AXIS 20-2) Total width (sum of TDATA, TID, TDEST, TKEEP, TSTRB, TUSER and TLAST) of AXI Stream FIFO ("&to_string(AXIS_FINAL_DATA_WIDTH)&") exceeds the maximum supported width (%0d). Please reduce the width of TDATA or TID or TDEST or TUSER")severity error;
      drc_err_flag_axis := 1;
    end if;

    if ((TDATA_WIDTH mod 8 /= 0) or TDATA_WIDTH < 8 or TDATA_WIDTH > 2048) then
      report("(XPM_FIFO_AXIS 20-) TDATA_WIDTH ("&to_string(TDATA_WIDTH)&") value is outside of legal range. TDATA_WIDTH value must be between 8 and 2048, and it must be multiples of 8.")severity error;
      drc_err_flag_axis := 1;
    end if;

    if (TID_WIDTH < 1 or TID_WIDTH > 32) then
      report("(XPM_FIFO_AXIS 20-4) TID_WIDTH ("&to_string(TID_WIDTH)&") value is outside of legal range. TID_WIDTH value must be between 1 and 32, and it must be multiples of 8.")severity error;
      drc_err_flag_axis := 1;
    end if;

    if (TDEST_WIDTH < 1 or TDEST_WIDTH > 32) then
      report("(XPM_FIFO_AXIS 20-5) TDEST_WIDTH ("&to_string(TDEST_WIDTH)&") value is outside of legal range. TDEST_WIDTH value must be between 1 and 32, and it must be multiples of 8.")severity error;
      drc_err_flag_axis := 1;
    end if;

    if (TUSER_WIDTH < 1 or TUSER_WIDTH > TUSER_MAX_WIDTH) then
      report("(XPM_FIFO_AXIS 20-6) TUSER_WIDTH ("&to_string(TUSER_WIDTH)&") value is outside of legal range. TUSER_WIDTH value must be between 1 and "&to_string(TUSER_MAX_WIDTH)&" and it must be multiples of 8.")severity error;
      drc_err_flag_axis := 1;
    end if;

    if (RELATED_CLOCKS = 1 and P_PKT_MODE /= 0) then
      report("(XPM_FIFO_AXIS 20-7) RELATED_CLOCKS ("&to_string(RELATED_CLOCKS)&") value is outside of legal range. RELATED_CLOCKS value must be 0 when PACKET_FIFO is set to XPM_FIFO_AXIS.")severity error;
      drc_err_flag_axis := 1;
    end if;

    if (EN_ADV_FEATURE_AXIS(13) = '1' and (P_PKT_MODE /= 1 or P_COMMON_CLOCK /= 0)) then
      report("(XPM_FIFO_AXIS 20-8) USE_ADV_FEATURES(13) ("&to_string(EN_ADV_FEATURE_AXIS(13))&") value is outside of legal range. USE_ADV_FEATURES(13) can be set to 1 only for packet mode in asynchronous AXI-Stream FIFO.") severity error;
      drc_err_flag_axis := 1;
    end if;
 
    -- Infos
    if (P_PKT_MODE = 1 and EN_ADV_FEATURE_AXIS(3) /= '1') then
      report("(XPM_FIFO_AXIS 21-1) Almost full flag option is not enabled (USE_ADV_FEATURES(3) = "&to_string(EN_ADV_FEATURE_AXIS(3))&") but Packet FIFO mode requires almost_full to be enabled. XPM_FIFO_AXIS enables the Almost full flag automatically. You may ignore almost_full port if not required") severity note;
    end if;

    if (P_PKT_MODE = 1 and EN_ADV_FEATURE_AXIS(11) /= '1') then
      report("(XPM_FIFO_AXIS 21-1) Almost empty flag option is not enabled (USE_ADV_FEATURES(11) = "&to_string(EN_ADV_FEATURE_AXIS(11))&") but Packet FIFO mode requires almost_empty to be enabled. XPM_FIFO_AXIS enables the Almost empty flag automatically. You may ignore almost_empty port if not required") severity note;
    end if;
 
    if (drc_err_flag_axis = 1) then
      std.env.finish(1);
    end if;
    wait;
  end process config_drc_axis;

  axis_necc: if (P_ECC_MODE = 0) generate
       axis_din <= (s_axis_tlast & s_axis_tuser & s_axis_tdest & s_axis_tid & s_axis_tkeep & s_axis_tstrb & s_axis_tdata);
  end generate axis_necc;

  axis_ecc: if (P_ECC_MODE = 1) generate
    constant padding: std_logic_vector((AXIS_FINAL_DATA_WIDTH - AXIS_DATA_WIDTH)-1 downto 0) := (others => '0');
  begin
     axis_din <= padding & s_axis_tlast & s_axis_tuser & s_axis_tdest & s_axis_tid & s_axis_tkeep & s_axis_tstrb & s_axis_tdata;
  end generate axis_ecc;

    m_axis_tlast_s <= axis_dout(AXIS_DATA_WIDTH-1);
    m_axis_tuser <= axis_dout(TUSER_OFFSET-1 downto TDEST_OFFSET);
    m_axis_tdest <= axis_dout(TDEST_OFFSET-1 downto TID_OFFSET);
    m_axis_tid   <= axis_dout(TID_OFFSET-1 downto TKEEP_OFFSET);
    m_axis_tkeep <= axis_dout(TKEEP_OFFSET-1 downto TSTRB_OFFSET);
    m_axis_tstrb <= axis_dout(TSTRB_OFFSET-1 downto TDATA_OFFSET);
    m_axis_tdata <= axis_dout(TDATA_OFFSET-1 downto 0);
 
   -- -------------------------------------------------------------------------------------------------------------------
   -- Generate the instantiation of the appropriate XPM module
   -- -------------------------------------------------------------------------------------------------------------------
   gaxis_rst_sync: if (EN_ADV_FEATURE_AXIS(15) = '0') generate
    function CALC_SYNC_STAGES(CC: integer; SS: integer) return integer is
    begin
        if CC = 1 then
            return 4;
        else
            return SS;
        end if;
    end function;
    signal src_rst: std_logic;
   begin
      src_rst <= not s_aresetn;
      xpm_cdc_sync_rst_inst: entity work.xpm_cdc_sync_rst 
      generic map(
        DEST_SYNC_FF   => CALC_SYNC_STAGES(P_COMMON_CLOCK,CDC_SYNC_STAGES),
        INIT           => 0,
        INIT_SYNC_FF   => 1,
        SIM_ASSERT_CHK => 0
      )  
      port map(
        src_rst  => src_rst,
        dest_clk => s_aclk,
        dest_rst => rst_axis
      );
   end generate gaxis_rst_sync;
   gnaxis_rst_sync: if (EN_ADV_FEATURE_AXIS(15) = '1') generate
      rst_axis <= s_aresetn;
   end generate gnaxis_rst_sync;
   
   g_common_clock: if (P_COMMON_CLOCK = 1) generate
     rd_clk <= s_aclk;
   end generate;
   g_no_common_clock: if (P_COMMON_CLOCK /= 1) generate
     rd_clk <= m_aclk;
   end generate;
   
   rd_en <= m_axis_tvalid_s and m_axis_tready;
   
      xpm_fifo_base_inst: entity work.xpm_fifo_base 
      generic map(
        COMMON_CLOCK               => P_COMMON_CLOCK       ,
        RELATED_CLOCKS             => RELATED_CLOCKS       ,
        FIFO_MEMORY_TYPE           => P_FIFO_MEMORY_TYPE   ,
        ECC_MODE                   => P_ECC_MODE           ,
        SIM_ASSERT_CHK             => SIM_ASSERT_CHK       ,
        CASCADE_HEIGHT             => CASCADE_HEIGHT       ,
        FIFO_WRITE_DEPTH           => FIFO_DEPTH           ,
        WRITE_DATA_WIDTH           => AXIS_FINAL_DATA_WIDTH,
        WR_DATA_COUNT_WIDTH        => WR_DATA_COUNT_WIDTH  ,
        PROG_FULL_THRESH           => PROG_FULL_THRESH     ,
        FULL_RESET_VALUE           => 1                    ,
        USE_ADV_FEATURES           => USE_ADV_FEATURES_INT ,
        READ_MODE                  => 1                    ,
        FIFO_READ_LATENCY          => 0                    ,
        READ_DATA_WIDTH            => AXIS_FINAL_DATA_WIDTH,
        RD_DATA_COUNT_WIDTH        => RD_DATA_COUNT_WIDTH  ,
        PROG_EMPTY_THRESH          => PROG_EMPTY_THRESH    ,
        DOUT_RESET_VALUE           => "0"                  ,
        CDC_DEST_SYNC_FF           => CDC_SYNC_STAGES      ,
        REMOVE_WR_RD_PROT_LOGIC    => 0                    ,
        WAKEUP_TIME                => 0                    
      )  
      port map(
        sleep            => '0',
        rst              => rst_axis,
        wr_clk           => s_aclk,
        wr_en            => s_axis_tvalid,
        din              => axis_din,
        full             => open,
        full_n           => s_axis_tready_s,
        prog_full        => prog_full_axis,
        wr_data_count    => wr_data_count_axis,
        overflow         => open,
        wr_rst_busy      => open,
        almost_full      => almost_full_axis_s,
        wr_ack           => open,
        rd_clk           => rd_clk,
        rd_en            => rd_en,
        dout             => axis_dout,
        empty            => open,
        prog_empty       => prog_empty_axis,
        rd_data_count    => rd_data_count_axis,
        underflow        => open,
        rd_rst_busy      => rd_rst_busy_axis,
        almost_empty     => almost_empty_axis,
        data_valid       => data_valid_axis,
        injectsbiterr    => injectsbiterr_axis,
        injectdbiterr    => injectdbiterr_axis,
        sbiterr          => sbiterr_axis,
        dbiterr          => dbiterr_axis
      );
      


  gaxis_npkt_fifo: if (P_PKT_MODE = 0) generate
     m_axis_tvalid_s <= data_valid_axis;
  end generate gaxis_npkt_fifo;

  gaxis_pkt_fifo_cc: if (P_PKT_MODE = 1 and P_COMMON_CLOCK = 1) generate
     axis_wr_eop <= s_axis_tvalid and s_axis_tready_s and s_axis_tlast;
     axis_rd_eop <= m_axis_tvalid_s and m_axis_tready and m_axis_tlast_s and axis_pkt_read;
     m_axis_tvalid_s <= data_valid_axis and axis_pkt_read;

    process(rst_axis, s_aclk)
    begin
      if (rst_axis = '1') then
        axis_pkt_read    <= '0';
      elsif rising_edge(s_aclk) then
        if (axis_rd_eop = '1' and (axis_pkt_cnt = 1) and axis_wr_eop_d1 = '0') then
          axis_pkt_read    <= '0';
        elsif ((axis_pkt_cnt > 0) or (almost_full_axis_s = '1' and data_valid_axis = '1')) then
          axis_pkt_read    <= '1';
        end if;
      end if;
    end process;

    process(rst_axis, s_aclk)
    begin
      if (rst_axis = '1') then
        axis_wr_eop_d1    <= '0';
      elsif rising_edge(s_aclk) then
        axis_wr_eop_d1   <= axis_wr_eop;
      end if;
    end process;

    process(rst_axis, s_aclk) 
    begin
      if (rst_axis = '1') then
        axis_pkt_cnt    <= 0;
      elsif rising_edge(s_aclk) then
        if (axis_wr_eop_d1 = '1' and axis_rd_eop = '0') then
          axis_pkt_cnt    <= axis_pkt_cnt + 1;
        elsif (axis_rd_eop = '1' and axis_wr_eop_d1 = '0') then
          axis_pkt_cnt    <= axis_pkt_cnt - 1;
        end if;
      end if;
    end process;
  end generate gaxis_pkt_fifo_cc;

  gaxis_pkt_fifo_ic: if (P_PKT_MODE = 1 and P_COMMON_CLOCK = 0) generate
    signal axis_wpkt_cnt_rd_lt8_0 : std_logic_vector(LOG_DEPTH_AXIS-1 downto 0);
    signal axis_wpkt_cnt_rd_lt8_1 : std_logic_vector(LOG_DEPTH_AXIS-1 downto 0);
    signal axis_wpkt_cnt_rd_lt8_2 : std_logic_vector(LOG_DEPTH_AXIS-1 downto 0);
    signal axis_wpkt_cnt_rd       : std_logic_vector(LOG_DEPTH_AXIS-1 downto 0);
    signal axis_wpkt_cnt          : std_logic_vector(LOG_DEPTH_AXIS-1 downto 0) := (others => '0');
    signal axis_rpkt_cnt          : std_logic_vector(LOG_DEPTH_AXIS-1 downto 0) := (others => '0');
    signal adj_axis_wpkt_cnt_rd_pad : std_logic_vector(LOG_DEPTH_AXIS   downto 0);
    signal rpkt_inv_pad             : std_logic_vector(LOG_DEPTH_AXIS   downto 0);
    signal diff_pkt_cnt             : std_logic_vector(LOG_DEPTH_AXIS-1 downto 0);
    signal diff_pkt_cnt_pad         : std_logic_vector(LOG_DEPTH_AXIS   downto 0) := (others => '0');
    signal adj_axis_wpkt_cnt_rd_pad_0 : std_logic := '0';
    signal rpkt_inv_pad_0 : std_logic := '0';
    signal axis_af_rd  : std_logic;
  begin

     axis_wr_eop <= s_axis_tvalid and s_axis_tready_s and s_axis_tlast;
     axis_rd_eop <= m_axis_tvalid_s and m_axis_tready and m_axis_tlast_s and axis_pkt_read;
     m_axis_tvalid_s <= data_valid_axis and axis_pkt_read;

    process(rd_rst_busy_axis, m_aclk)
    begin
      if (rd_rst_busy_axis = '1') then
        axis_pkt_read    <= '0';
      elsif rising_edge(m_aclk) then
        if (axis_rd_eop = '1' and (diff_pkt_cnt = 1)) then
          axis_pkt_read    <= '0';
        elsif ((diff_pkt_cnt > 0) or (axis_af_rd = '1' and data_valid_axis = '1')) then
          axis_pkt_read    <= '1';
        end if;
      end if;
    end process;

    process(rst_axis, s_aclk) 
    begin
      if (rst_axis = '1') then
        axis_wpkt_cnt    <= (others => '0');
      elsif rising_edge(s_aclk) then
        if (axis_wr_eop = '1') then
          axis_wpkt_cnt    <= axis_wpkt_cnt + 1;
        end if;
      end if;
    end process;

    wpkt_cnt_cdc_inst: entity work.xpm_cdc_gray 
    generic map(
      DEST_SYNC_FF          => CDC_SYNC_STAGES,
      INIT_SYNC_FF          => 1,
      REG_OUTPUT            => 1,
      WIDTH                 => LOG_DEPTH_AXIS)
    port map
       (
        src_clk            => s_aclk,
        src_in_bin         => axis_wpkt_cnt,
        dest_clk           => m_aclk,
        dest_out_bin       => axis_wpkt_cnt_rd_lt8_0
    );

    pkt_lt8: if (PKT_SIZE_LT8 = '1') generate
      wpkt_cnt_rd_dly_inst1: entity work.xpm_fifo_reg_vec 
        generic map(LOG_DEPTH_AXIS)
        port map(rd_rst_busy_axis, m_aclk, axis_wpkt_cnt_rd_lt8_0, axis_wpkt_cnt_rd_lt8_1);
      wpkt_cnt_rd_dly_inst2: entity work.xpm_fifo_reg_vec 
        generic map(LOG_DEPTH_AXIS)
        port map(rd_rst_busy_axis, m_aclk, axis_wpkt_cnt_rd_lt8_1, axis_wpkt_cnt_rd_lt8_2);
      wpkt_cnt_rd_dly_inst3: entity work.xpm_fifo_reg_vec 
        generic map(LOG_DEPTH_AXIS)
        port map(rd_rst_busy_axis, m_aclk, axis_wpkt_cnt_rd_lt8_2, axis_wpkt_cnt_rd);
    end generate pkt_lt8;
    pkt_nlt8: if (PKT_SIZE_LT8 /= '1') generate
       axis_wpkt_cnt_rd <= axis_wpkt_cnt_rd_lt8_0;
    end generate pkt_nlt8;

    af_axis_cdc_inst: entity work.xpm_cdc_single 
    generic map(
      DEST_SYNC_FF          => CDC_SYNC_STAGES,
      SRC_INPUT_REG         => 0,
      INIT_SYNC_FF          => 1
    )
    port map(
        src_clk            => s_aclk,
        src_in             => almost_full_axis_s,
        dest_clk           => m_aclk,
        dest_out           => axis_af_rd
    );

    process(rd_rst_busy_axis, m_aclk)
    begin
      if (rd_rst_busy_axis = '1') then
        axis_rpkt_cnt    <= (others => '0');
      elsif rising_edge(m_aclk) then
        if (axis_rd_eop = '1') then
          axis_rpkt_cnt    <= axis_rpkt_cnt + 1;
        end if;
      end if;
    end process;

    -- Take the difference of write and read packet count using 1's complement
     adj_axis_wpkt_cnt_rd_pad(LOG_DEPTH_AXIS downto 1) <= axis_wpkt_cnt_rd;
     rpkt_inv_pad(LOG_DEPTH_AXIS downto 1)             <= not axis_rpkt_cnt;
     adj_axis_wpkt_cnt_rd_pad(0)                  <= adj_axis_wpkt_cnt_rd_pad_0;
     rpkt_inv_pad(0)                              <= rpkt_inv_pad_0;


    process( axis_rd_eop ) 
    begin
      if (not axis_rd_eop = '1') then
        adj_axis_wpkt_cnt_rd_pad_0    <= '1';
        rpkt_inv_pad_0                <= '1';
      else
        adj_axis_wpkt_cnt_rd_pad_0    <= '0';
        rpkt_inv_pad_0                <= '0';
      end if;   
    end process;
  
    process (rd_rst_busy_axis, m_aclk) 
    begin
      if (rd_rst_busy_axis = '1') then
        diff_pkt_cnt_pad    <= (others => '0');
      elsif rising_edge(m_aclk) then
        diff_pkt_cnt_pad    <= adj_axis_wpkt_cnt_rd_pad + rpkt_inv_pad ;
      end if;
    end process;

      diff_pkt_cnt <= diff_pkt_cnt_pad (LOG_DEPTH_AXIS downto 1) ;

  end generate gaxis_pkt_fifo_ic;
  

end rtl;
