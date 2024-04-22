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

entity xpm_fifo_axil is
  generic (
    AXI_ADDR_WIDTH            : integer  := 32;
    AXI_DATA_WIDTH            : integer  := 32;
    CLOCKING_MODE             : string   := "common";
    SIM_ASSERT_CHK            : integer := 0    ;
    CDC_SYNC_STAGES           : integer  := 2;
    EN_RESET_SYNCHRONIZER     : integer  := 0;
    CASCADE_HEIGHT            : integer  := 0;
    FIFO_MEMORY_TYPE_WACH     : string   := "auto";
    FIFO_MEMORY_TYPE_WDCH     : string   := "auto";
    FIFO_MEMORY_TYPE_WRCH     : string   := "auto";
    FIFO_MEMORY_TYPE_RACH     : string   := "auto";
    FIFO_MEMORY_TYPE_RDCH     : string   := "auto";
    FIFO_DEPTH_WACH           : integer  := 2048;
    FIFO_DEPTH_WDCH           : integer  := 2048;
    FIFO_DEPTH_WRCH           : integer  := 2048;
    FIFO_DEPTH_RACH           : integer  := 2048;
    FIFO_DEPTH_RDCH           : integer  := 2048;
    ECC_MODE_WDCH             : string   := "no_ecc";
    ECC_MODE_RDCH             : string   := "no_ecc";
    USE_ADV_FEATURES_WDCH     : string   := "1000";
    USE_ADV_FEATURES_RDCH     : string   := "1000";
    WR_DATA_COUNT_WIDTH_WDCH  : integer  := 1;
    WR_DATA_COUNT_WIDTH_RDCH  : integer  := 1;
    RD_DATA_COUNT_WIDTH_WDCH  : integer  := 1;
    RD_DATA_COUNT_WIDTH_RDCH  : integer  := 1;
    PROG_FULL_THRESH_WDCH     : integer  := 10;
    PROG_FULL_THRESH_RDCH     : integer  := 10;
    PROG_EMPTY_THRESH_WDCH    : integer  := 10;
    PROG_EMPTY_THRESH_RDCH    : integer  := 10
    );
   port (
    m_aclk                      : in  std_logic;
    s_aclk                      : in  std_logic;
    s_aresetn                   : in  std_logic;
    s_axi_awaddr                : in  std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    s_axi_awprot                : in  std_logic_vector(3-1 downto 0);
    s_axi_awvalid               : in  std_logic;
    s_axi_awready               : out std_logic;
    s_axi_wdata                 : in  std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    s_axi_wstrb                 : in  std_logic_vector(AXI_DATA_WIDTH/8-1 downto 0); 
    s_axi_wvalid                : in  std_logic;
    s_axi_wready                : out std_logic;
    s_axi_bresp                 : out std_logic_vector(2-1 downto 0);
    s_axi_bvalid                : out std_logic;
    s_axi_bready                : in  std_logic;
    m_axi_awaddr                : out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    m_axi_awprot                : out std_logic_vector(3-1 downto 0);
    m_axi_awvalid               : out std_logic;
    m_axi_awready               : in  std_logic;
    m_axi_wdata                 : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    m_axi_wstrb                 : out std_logic_vector(AXI_DATA_WIDTH/8-1 downto 0);
    m_axi_wvalid                : out std_logic;
    m_axi_wready                : in  std_logic;
    m_axi_bresp                 : in  std_logic_vector(2-1 downto 0);
    m_axi_bvalid                : in  std_logic;
    m_axi_bready                : out std_logic;
    s_axi_araddr                : in  std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    s_axi_arprot                : in  std_logic_vector(3-1 downto 0);
    s_axi_arvalid               : in  std_logic;
    s_axi_arready               : out std_logic;
    s_axi_rdata                 : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    s_axi_rresp                 : out std_logic_vector(2-1 downto 0);
    s_axi_rvalid                : out std_logic;
    s_axi_rready                : in  std_logic;        
    m_axi_araddr                : out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    m_axi_arprot                : out std_logic_vector(3-1 downto 0);
    m_axi_arvalid               : out std_logic;
    m_axi_arready               : in  std_logic;   
    m_axi_rdata                 : in  std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    m_axi_rresp                 : in  std_logic_vector(2-1 downto 0);
    m_axi_rvalid                : in  std_logic;
    m_axi_rready                : out std_logic;
    prog_full_wdch              : out std_logic;
    prog_empty_wdch             : out std_logic;
    wr_data_count_wdch          : out std_logic_vector(WR_DATA_COUNT_WIDTH_WDCH-1 downto 0);
    rd_data_count_wdch          : out std_logic_vector(RD_DATA_COUNT_WIDTH_WDCH-1 downto 0);
    prog_full_rdch              : out std_logic;
    prog_empty_rdch             : out std_logic;
    wr_data_count_rdch          : out std_logic_vector(WR_DATA_COUNT_WIDTH_RDCH-1 downto 0);
    rd_data_count_rdch          : out std_logic_vector(RD_DATA_COUNT_WIDTH_RDCH-1 downto 0);
    injectsbiterr_wdch          : in  std_logic;
    injectdbiterr_wdch          : in  std_logic;
    sbiterr_wdch                : out std_logic;
    dbiterr_wdch                : out std_logic;
    injectsbiterr_rdch          : in  std_logic;
    injectdbiterr_rdch          : in  std_logic;
    sbiterr_rdch                : out std_logic;
    dbiterr_rdch                : out std_logic
    );
end xpm_fifo_axil;

architecture rtl of xpm_fifo_axil is

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

--WDCH advanced features parameter conversion
  constant EN_ADV_FEATURE_WDCH : std_logic_vector(15 downto 0) := hstr2bin(USE_ADV_FEATURES_WDCH);
  constant EN_DATA_VALID_INT   : std_logic := '1';
  constant EN_ADV_FEATURE_WDCH_INT  : std_logic_vector(15 downto 0) := EN_ADV_FEATURE_WDCH(15 downto 13) & EN_DATA_VALID_INT & EN_ADV_FEATURE_WDCH(11 downto 0);
  constant USE_ADV_FEATURES_WDCH_INT : string := bin2hstr(EN_ADV_FEATURE_WDCH_INT);


--RDCH advanced features parameter conversion
  constant EN_ADV_FEATURE_RDCH       : std_logic_vector(15 downto 0) := hstr2bin(USE_ADV_FEATURES_RDCH);
  constant EN_ADV_FEATURE_RDCH_INT   : std_logic_vector(15 downto 0) := EN_ADV_FEATURE_RDCH(15 downto 13) & EN_DATA_VALID_INT& EN_ADV_FEATURE_RDCH(11 downto 0);
  constant USE_ADV_FEATURES_RDCH_INT : string := bin2hstr(EN_ADV_FEATURE_RDCH_INT);


    constant C_WACH_TYPE                    : integer := 0; -- 0 = FIFO, 1 = Register Slice, 2 = Pass Through Logic
    constant C_WDCH_TYPE                    : integer := 0; -- 0 = FIFO, 1 = Register Slice, 2 = Pass Through Logie
    constant C_WRCH_TYPE                    : integer := 0; -- 0 = FIFO, 1 = Register Slice, 2 = Pass Through Logie
    constant C_RACH_TYPE                    : integer := 0; -- 0 = FIFO, 1 = Register Slice, 2 = Pass Through Logie
    constant C_RDCH_TYPE                    : integer := 0; -- 0 = FIFO, 1 = Register Slice, 2 = Pass Through Logie

    -- Input Data Width
    -- Accumulation of all AXI input signal's width
    constant C_DIN_WIDTH_WACH               : integer := AXI_ADDR_WIDTH+3;
    constant C_DIN_WIDTH_WDCH               : integer := AXI_DATA_WIDTH/8+AXI_DATA_WIDTH;
    constant C_DIN_WIDTH_WRCH               : integer := 2;
    constant C_DIN_WIDTH_RACH               : integer := AXI_ADDR_WIDTH+3;
    constant C_DIN_WIDTH_RDCH               : integer := AXI_DATA_WIDTH+2;


  -- Define local parameters for mapping with base file
  function P_COMMON_CLOCK return integer is begin if(CLOCKING_MODE = "common_clock"      or CLOCKING_MODE = "COMMON_CLOCK"      or CLOCKING_MODE = "COMMON" or CLOCKING_MODE = "common") then return 1;
    elsif(CLOCKING_MODE = "independent_clock" or CLOCKING_MODE = "INDEPENDENT_CLOCK" or CLOCKING_MODE = "INDEPENDENT" or CLOCKING_MODE = "independent") then return 0; else return 2; end if; end function;

  function P_ECC_MODE_WDCH return integer is begin if(ECC_MODE_WDCH = "no_ecc" or ECC_MODE_WDCH = "NO_ECC" ) then return 0; else return 1; end if; end function;
  function P_ECC_MODE_RDCH return integer is begin if(ECC_MODE_RDCH = "no_ecc" or ECC_MODE_RDCH = "NO_ECC" ) then return 0; else return 1; end if; end function;
  function P_FIFO_MEMORY_TYPE_WACH return integer is begin if(FIFO_MEMORY_TYPE_WACH = "lutram"   or FIFO_MEMORY_TYPE_WACH = "LUTRAM"   or FIFO_MEMORY_TYPE_WACH = "distributed"   or FIFO_MEMORY_TYPE_WACH = "DISTRIBUTED") then return 1;
     elsif (FIFO_MEMORY_TYPE_WACH = "blockram" or FIFO_MEMORY_TYPE_WACH = "BLOCKRAM" or FIFO_MEMORY_TYPE_WACH = "bram" or FIFO_MEMORY_TYPE_WACH = "BRAM") then return 2;
     elsif (FIFO_MEMORY_TYPE_WACH = "ultraram" or FIFO_MEMORY_TYPE_WACH = "ULTRARAM" or FIFO_MEMORY_TYPE_WACH = "uram" or FIFO_MEMORY_TYPE_WACH = "URAM") then return 3;
     elsif (FIFO_MEMORY_TYPE_WACH = "builtin"  or FIFO_MEMORY_TYPE_WACH = "BUILTIN")then return 4; else return 0; end if; end function;
  function P_FIFO_MEMORY_TYPE_WDCH return integer is begin if (FIFO_MEMORY_TYPE_WDCH = "lutram"   or FIFO_MEMORY_TYPE_WDCH = "LUTRAM"   or FIFO_MEMORY_TYPE_WDCH = "distributed"   or FIFO_MEMORY_TYPE_WDCH = "DISTRIBUTED") then return 1;
     elsif (FIFO_MEMORY_TYPE_WDCH = "blockram" or FIFO_MEMORY_TYPE_WDCH = "BLOCKRAM" or FIFO_MEMORY_TYPE_WDCH = "bram" or FIFO_MEMORY_TYPE_WDCH = "BRAM") then return 2;
     elsif (FIFO_MEMORY_TYPE_WDCH = "ultraram" or FIFO_MEMORY_TYPE_WDCH = "ULTRARAM" or FIFO_MEMORY_TYPE_WDCH = "uram" or FIFO_MEMORY_TYPE_WDCH = "URAM") then return 3;
     elsif (FIFO_MEMORY_TYPE_WDCH = "builtin"  or FIFO_MEMORY_TYPE_WDCH = "BUILTIN")then return 4; else return 0; end if; end function;
  function P_FIFO_MEMORY_TYPE_WRCH return integer is begin if (FIFO_MEMORY_TYPE_WRCH = "lutram"   or FIFO_MEMORY_TYPE_WRCH = "LUTRAM"   or FIFO_MEMORY_TYPE_WRCH = "distributed"   or FIFO_MEMORY_TYPE_WRCH = "DISTRIBUTED") then return 1;
     elsif (FIFO_MEMORY_TYPE_WRCH = "blockram" or FIFO_MEMORY_TYPE_WRCH = "BLOCKRAM" or FIFO_MEMORY_TYPE_WRCH = "bram" or FIFO_MEMORY_TYPE_WRCH = "BRAM") then return 2;
     elsif (FIFO_MEMORY_TYPE_WRCH = "ultraram" or FIFO_MEMORY_TYPE_WRCH = "ULTRARAM" or FIFO_MEMORY_TYPE_WRCH = "uram" or FIFO_MEMORY_TYPE_WRCH = "URAM") then return 3;
     elsif (FIFO_MEMORY_TYPE_WRCH = "builtin"  or FIFO_MEMORY_TYPE_WRCH = "BUILTIN")then return 4; else return 0; end if; end function;
  function P_FIFO_MEMORY_TYPE_RACH return integer is begin if (FIFO_MEMORY_TYPE_RACH = "lutram"   or FIFO_MEMORY_TYPE_RACH = "LUTRAM"   or FIFO_MEMORY_TYPE_RACH = "distributed"   or FIFO_MEMORY_TYPE_RACH = "DISTRIBUTED") then return 1;
     elsif (FIFO_MEMORY_TYPE_RACH = "blockram" or FIFO_MEMORY_TYPE_RACH = "BLOCKRAM" or FIFO_MEMORY_TYPE_RACH = "bram" or FIFO_MEMORY_TYPE_RACH = "BRAM") then return 2;
     elsif (FIFO_MEMORY_TYPE_RACH = "ultraram" or FIFO_MEMORY_TYPE_RACH = "ULTRARAM" or FIFO_MEMORY_TYPE_RACH = "uram" or FIFO_MEMORY_TYPE_RACH = "URAM") then return 3;
     elsif (FIFO_MEMORY_TYPE_RACH = "builtin"  or FIFO_MEMORY_TYPE_RACH = "BUILTIN")then return 4; else return 0; end if; end function;
  function P_FIFO_MEMORY_TYPE_RDCH return integer is begin if (FIFO_MEMORY_TYPE_RDCH = "lutram"   or FIFO_MEMORY_TYPE_RDCH = "LUTRAM"   or FIFO_MEMORY_TYPE_RDCH = "distributed"   or FIFO_MEMORY_TYPE_RDCH = "DISTRIBUTED") then return 1;
     elsif (FIFO_MEMORY_TYPE_RDCH = "blockram" or FIFO_MEMORY_TYPE_RDCH = "BLOCKRAM" or FIFO_MEMORY_TYPE_RDCH = "bram" or FIFO_MEMORY_TYPE_RDCH = "BRAM") then return 2;
     elsif (FIFO_MEMORY_TYPE_RDCH = "ultraram" or FIFO_MEMORY_TYPE_RDCH = "ULTRARAM" or FIFO_MEMORY_TYPE_RDCH = "uram" or FIFO_MEMORY_TYPE_RDCH = "URAM") then return 3;
     elsif (FIFO_MEMORY_TYPE_RDCH = "builtin"  or FIFO_MEMORY_TYPE_RDCH = "BUILTIN")then return 4; else return 0; end if; end function;

    function C_DIN_WIDTH_WDCH_ECC return integer is begin if (P_ECC_MODE_WDCH = 0) then return C_DIN_WIDTH_WDCH; elsif (C_DIN_WIDTH_WDCH mod 64 = 0) then return C_DIN_WIDTH_WDCH; else return (64*(C_DIN_WIDTH_WDCH/64+1));end if; end function;
    function C_DIN_WIDTH_RDCH_ECC return integer is begin if (P_ECC_MODE_RDCH = 0) then return C_DIN_WIDTH_RDCH; elsif (C_DIN_WIDTH_RDCH mod 64 = 0) then return C_DIN_WIDTH_RDCH; else return (64*(C_DIN_WIDTH_RDCH/64+1));end if; end function;



    signal wr_rst_busy_wach : std_logic;
    signal wr_rst_busy_wdch : std_logic;
    signal wr_rst_busy_wrch : std_logic;
    signal wr_rst_busy_rach : std_logic;
    signal wr_rst_busy_rdch : std_logic;



    constant C_AXI_PROT_WIDTH   : integer := 3;
    constant C_AXI_BRESP_WIDTH  : integer := 2;
    constant C_AXI_RRESP_WIDTH  : integer := 2;
    
    
    signal     inverted_reset : std_logic;
    signal     rst_axil_sclk : std_logic;
    signal     rst_axil_mclk : std_logic;
    signal     m_aclk_int : std_logic;
    
    function IS_AXI_LITE_WACH return integer is begin if(C_WACH_TYPE = 0)then return 1; else return 0; end if; end function;
    function IS_AXI_LITE_WDCH return integer is begin if(C_WDCH_TYPE = 0)then return 1; else return 0; end if; end function;
    function IS_AXI_LITE_WRCH return integer is begin if(C_WRCH_TYPE = 0)then return 1; else return 0; end if; end function;
    function IS_AXI_LITE_RACH return integer is begin if(C_RACH_TYPE = 0)then return 1; else return 0; end if; end function;
    function IS_AXI_LITE_RDCH return integer is begin if(C_RDCH_TYPE = 0)then return 1; else return 0; end if; end function;
    
    function IS_WR_ADDR_CH  return integer is begin if (IS_AXI_LITE_WACH = 1) then return 1; else return 0; end if; end function;
    function IS_WR_DATA_CH  return integer is begin if (IS_AXI_LITE_WDCH = 1) then return 1; else return 0; end if; end function;
    function IS_WR_RESP_CH  return integer is begin if (IS_AXI_LITE_WRCH = 1) then return 1; else return 0; end if; end function;
    function IS_RD_ADDR_CH  return integer is begin if (IS_AXI_LITE_RACH = 1) then return 1; else return 0; end if; end function;
    function IS_RD_DATA_CH  return integer is begin if (IS_AXI_LITE_RDCH = 1) then return 1; else return 0; end if; end function;
    
    constant AWADDR_OFFSET     : integer := C_DIN_WIDTH_WACH - AXI_ADDR_WIDTH;
    constant AWPROT_OFFSET     : integer := AWADDR_OFFSET - C_AXI_PROT_WIDTH;
    
    constant WDATA_OFFSET      : integer := C_DIN_WIDTH_WDCH - AXI_DATA_WIDTH;
    constant WSTRB_OFFSET      : integer := WDATA_OFFSET - AXI_DATA_WIDTH/8;
    
    constant BRESP_OFFSET      : integer := C_DIN_WIDTH_WRCH - C_AXI_BRESP_WIDTH;
        signal wach_din           : std_logic_vector(C_DIN_WIDTH_WACH-1 downto 0);
    signal wach_dout          : std_logic_vector(C_DIN_WIDTH_WACH-1 downto 0);
    signal wach_dout_pkt      : std_logic_vector(C_DIN_WIDTH_WACH-1 downto 0);
    signal wach_full          : std_logic;
    signal wach_almost_full   : std_logic;
    signal wach_prog_full     : std_logic;
    signal wach_empty         : std_logic;
    signal wach_almost_empty  : std_logic;
    signal wach_prog_empty    : std_logic;
    signal wdch_din           : std_logic_vector(C_DIN_WIDTH_WDCH_ECC-1 downto 0);
    signal wdch_dout          : std_logic_vector(C_DIN_WIDTH_WDCH_ECC-1 downto 0);
    signal wdch_full          : std_logic;
    signal wdch_almost_full   : std_logic;
    signal wdch_prog_full     : std_logic;
    signal wdch_empty         : std_logic;
    signal wdch_almost_empty  : std_logic;
    signal wdch_prog_empty    : std_logic;
    signal wrch_din           : std_logic_vector(C_DIN_WIDTH_WRCH-1 downto 0);
    signal wrch_dout          : std_logic_vector(C_DIN_WIDTH_WRCH-1 downto 0);
    signal wrch_full          : std_logic;
    signal wrch_almost_full   : std_logic;
    signal wrch_prog_full     : std_logic;
    signal wrch_empty         : std_logic;
    signal wrch_almost_empty  : std_logic;
    signal wrch_prog_empty    : std_logic;
    signal axi_aw_underflow_i : std_logic;
    signal axi_w_underflow_i  : std_logic;
    signal axi_b_underflow_i  : std_logic;
    signal axi_aw_overflow_i  : std_logic;
    signal axi_w_overflow_i   : std_logic;
    signal axi_b_overflow_i   : std_logic;
    signal wach_s_axi_awready : std_logic;
    signal wach_m_axi_awvalid : std_logic;
    signal wach_rd_en         : std_logic;
    signal wdch_s_axi_wready  : std_logic;
    signal wdch_m_axi_wvalid  : std_logic;
    signal wdch_wr_en         : std_logic;
    signal wdch_rd_en         : std_logic;
    signal wrch_s_axi_bvalid  : std_logic;
    signal wrch_m_axi_bready  : std_logic;
    signal txn_count_up       : std_logic;
    signal txn_count_down     : std_logic;
    signal awvalid_en         : std_logic;
    signal awvalid_pkt        : std_logic;
    signal awready_pkt        : std_logic;
    signal wr_pkt_count       : integer;
    signal wach_re            : std_logic;
    signal wdch_we            : std_logic;
    signal wdch_re            : std_logic; 
        signal rach_din            : std_logic_vector(C_DIN_WIDTH_RACH-1 downto 0);
    signal rach_dout           : std_logic_vector(C_DIN_WIDTH_RACH-1 downto 0);
    signal rach_dout_pkt       : std_logic_vector(C_DIN_WIDTH_RACH-1 downto 0);
    signal rach_full           : std_logic;
    signal rach_almost_full    : std_logic;
    signal rach_prog_full      : std_logic;
    signal rach_empty          : std_logic;
    signal rach_almost_empty   : std_logic;
    signal rach_prog_empty     : std_logic;
    signal rdch_din            : std_logic_vector(C_DIN_WIDTH_RDCH_ECC-1 downto 0);
    signal rdch_dout           : std_logic_vector(C_DIN_WIDTH_RDCH_ECC-1 downto 0);
    signal rdch_full           : std_logic;
    signal rdch_almost_full    : std_logic;
    signal rdch_prog_full      : std_logic;
    signal rdch_empty          : std_logic;
    signal rdch_almost_empty   : std_logic;
    signal rdch_prog_empty     : std_logic;
    signal axi_ar_underflow_i  : std_logic;
    signal axi_r_underflow_i   : std_logic;
    signal axi_ar_overflow_i   : std_logic;
    signal axi_r_overflow_i    : std_logic;
    signal rach_s_axi_arready  : std_logic;
    signal rach_m_axi_arvalid  : std_logic;
    signal rach_rd_en          : std_logic;
    signal rdch_m_axi_rready   : std_logic;
    signal rdch_s_axi_rvalid   : std_logic;
    signal rdch_wr_en          : std_logic;
    signal rdch_rd_en          : std_logic;
    signal arvalid_pkt         : std_logic;
    signal arready_pkt         : std_logic;
    signal arvalid_en          : std_logic;
    signal rdch_rd_ok          : std_logic;
    signal accept_next_pkt     : std_logic;
    signal rdch_free_space     : integer;
    signal rdch_commited_space : integer;
    signal rach_re             : std_logic;
    signal rdch_we             : std_logic;
    signal rdch_re             : std_logic;
    
    constant ARADDR_OFFSET     : integer := C_DIN_WIDTH_RACH - AXI_ADDR_WIDTH;
    constant ARPROT_OFFSET     : integer := ARADDR_OFFSET - C_AXI_PROT_WIDTH;
    
    constant RDATA_OFFSET      : integer := C_DIN_WIDTH_RDCH - AXI_DATA_WIDTH;
    constant RRESP_OFFSET      : integer := RDATA_OFFSET - C_AXI_RRESP_WIDTH;
begin

  inverted_reset <= not s_aresetn;
  m_aclk_int <= s_aclk when P_COMMON_CLOCK = 1 else m_aclk;

  gen_sync_reset: if (EN_RESET_SYNCHRONIZER = 1) generate
    function DEST_SYNC_FF return integer is begin if P_COMMON_CLOCK = 1 then return 4; else return CDC_SYNC_STAGES; end if; end function;
  begin
--Reset Synchronizer
      xpm_cdc_sync_rst_sclk_inst: entity work.xpm_cdc_sync_rst 
      generic map(
        DEST_SYNC_FF   => DEST_SYNC_FF,
        INIT           => 0,
        INIT_SYNC_FF   => 1,
        SIM_ASSERT_CHK => 0
      )  
      port map(
        src_rst  => inverted_reset,
        dest_clk => s_aclk,
        dest_rst => rst_axil_sclk
      );
      
      xpm_cdc_sync_rst_mclk_inst: entity work.xpm_cdc_sync_rst 
      generic map(
        DEST_SYNC_FF   => DEST_SYNC_FF,
        INIT           => 0,
        INIT_SYNC_FF   => 1,
        SIM_ASSERT_CHK => 0
      )  
      port map(
        src_rst  => inverted_reset,
        dest_clk => m_aclk_int,
        dest_rst => rst_axil_mclk
      );
  end generate gen_sync_reset;
  gen_async_reset: if (EN_RESET_SYNCHRONIZER = 0) generate
   rst_axil_sclk <= inverted_reset;
   rst_axil_mclk <= inverted_reset;
  
  end generate gen_async_reset;
  

  --###########################################################################
  --  AXI FULL Write Channel (axi_write_channel)
  --###########################################################################





  axi_write_address_channel:  if (IS_WR_ADDR_CH = 1) generate
    -- Write protection when almost full or prog_full is high

    -- Read protection when almost empty or prog_empty is high
     wach_re    <= m_axi_awready;
     wach_rd_en <= wach_re;


    xpm_fifo_base_wach_dut: entity work.xpm_fifo_base 
    generic map(
        COMMON_CLOCK               => P_COMMON_CLOCK      ,
        RELATED_CLOCKS             => 0                   ,
        FIFO_MEMORY_TYPE           => P_FIFO_MEMORY_TYPE_WACH,
        ECC_MODE                   => 0,
        SIM_ASSERT_CHK             => SIM_ASSERT_CHK      ,
        CASCADE_HEIGHT             => CASCADE_HEIGHT      ,
        FIFO_WRITE_DEPTH           => FIFO_DEPTH_WACH     ,
        WRITE_DATA_WIDTH           => C_DIN_WIDTH_WACH    ,
        FULL_RESET_VALUE           => 1                   ,
        USE_ADV_FEATURES           => "0101",
        READ_MODE                  => 1                   ,
        FIFO_READ_LATENCY          => 0                   ,
        READ_DATA_WIDTH            => C_DIN_WIDTH_WACH    ,
        DOUT_RESET_VALUE           => ""                  ,
        CDC_DEST_SYNC_FF           => CDC_SYNC_STAGES     ,
        REMOVE_WR_RD_PROT_LOGIC    => 0                   ,
        WAKEUP_TIME                => 0                   
      ) 
      port map (
        sleep            => '0',
        rst              => rst_axil_sclk,
        wr_clk           => s_aclk,
        wr_en            => s_axi_awvalid,
        din              => wach_din,
        full             => wach_full,
        full_n           => open,
        prog_full        => open,
        wr_data_count    => open,
        overflow         => axi_aw_overflow_i,
        wr_rst_busy      => wr_rst_busy_wach,
        almost_full      => open,
        wr_ack           => open,
        rd_clk           => m_aclk_int,
        rd_en            => wach_rd_en,
        dout             => wach_dout_pkt,
        empty            => wach_empty,
        prog_empty       => open,
        rd_data_count    => open,
        underflow        => axi_aw_underflow_i,
        rd_rst_busy      => open,
        almost_empty     => open,
        data_valid       => open,
        injectsbiterr    => '0',
        injectdbiterr    => '0',
        sbiterr          => open,
        dbiterr          => open
      );

     wach_s_axi_awready   <= not (wach_full or wr_rst_busy_wach) when (FIFO_MEMORY_TYPE_WACH = "lutram") else not wach_full;
     wach_m_axi_awvalid   <= not wach_empty;
     s_axi_awready        <= wach_s_axi_awready;


  end generate axi_write_address_channel;

     awvalid_en    <= '1';    
     wach_dout     <= wach_dout_pkt;
     m_axi_awvalid <= wach_m_axi_awvalid;

  axi_write_data_channel: if (IS_WR_DATA_CH = 1) generate
    -- Write protection when almost full or prog_full is high
     wdch_we    <= wdch_s_axi_wready and s_axi_wvalid ;

    -- Read protection when almost empty or prog_empty is high
     wdch_re    <= wdch_m_axi_wvalid and m_axi_wready ;
     wdch_wr_en <= wdch_we;
     wdch_rd_en <= wdch_re;

    xpm_fifo_base_wdch_dut: entity work.xpm_fifo_base 
    generic map(
        COMMON_CLOCK               => P_COMMON_CLOCK ,
        RELATED_CLOCKS             => 0      ,
        FIFO_MEMORY_TYPE           => P_FIFO_MEMORY_TYPE_WDCH,
        ECC_MODE                   => P_ECC_MODE_WDCH,
        SIM_ASSERT_CHK             => SIM_ASSERT_CHK      ,
        CASCADE_HEIGHT             => CASCADE_HEIGHT      ,
        FIFO_WRITE_DEPTH           => FIFO_DEPTH_WDCH,
        WRITE_DATA_WIDTH           => C_DIN_WIDTH_WDCH_ECC,
        WR_DATA_COUNT_WIDTH        => WR_DATA_COUNT_WIDTH_WDCH,
        PROG_FULL_THRESH           => PROG_FULL_THRESH_WDCH,
        FULL_RESET_VALUE           => 1                   ,
        USE_ADV_FEATURES           => USE_ADV_FEATURES_WDCH_INT,
        READ_MODE                  => 1                   ,
        FIFO_READ_LATENCY          => 0                   ,
        READ_DATA_WIDTH            => C_DIN_WIDTH_WDCH_ECC,
        RD_DATA_COUNT_WIDTH        => RD_DATA_COUNT_WIDTH_WDCH,
        PROG_EMPTY_THRESH          => PROG_EMPTY_THRESH_WDCH,
        DOUT_RESET_VALUE           => "0"                  ,
        CDC_DEST_SYNC_FF           => CDC_SYNC_STAGES     ,
        REMOVE_WR_RD_PROT_LOGIC    => 0                   ,
        WAKEUP_TIME                => 0                   
      )  
      port map(
        sleep            => '0',
        rst              => rst_axil_sclk,
        wr_clk           => s_aclk,
        wr_en            => wdch_wr_en,
        din              => wdch_din,
        full             => wdch_full,
        full_n           => open,
        prog_full        => prog_full_wdch,
        wr_data_count    => wr_data_count_wdch,
        overflow         => axi_w_overflow_i,
        wr_rst_busy      => wr_rst_busy_wdch,
        almost_full      => open,
        wr_ack           => open,
        rd_clk           => m_aclk_int,
        rd_en            => wdch_rd_en,
        dout             => wdch_dout,
        empty            => wdch_empty,
        prog_empty       => prog_empty_wdch,
        rd_data_count    => rd_data_count_wdch,
        underflow        => axi_w_underflow_i,
        rd_rst_busy      => open,
        almost_empty     => open,
        data_valid       => open,
        injectsbiterr    => injectsbiterr_wdch,
        injectdbiterr    => injectdbiterr_wdch,
        sbiterr          => sbiterr_wdch,
        dbiterr          => dbiterr_wdch
      );


     wdch_s_axi_wready     <= not (wdch_full or wr_rst_busy_wdch) when (FIFO_MEMORY_TYPE_WDCH = "lutram") else not wdch_full;
     wdch_m_axi_wvalid <= not wdch_empty;
     s_axi_wready      <= wdch_s_axi_wready;
     m_axi_wvalid      <= wdch_m_axi_wvalid;

  end generate axi_write_data_channel;


  axi_write_resp_channel: if (IS_WR_RESP_CH = 1) generate

    xpm_fifo_base_wrch_dut: entity work.xpm_fifo_base 
    generic map(
        COMMON_CLOCK               => P_COMMON_CLOCK      ,
        RELATED_CLOCKS             => 0                   ,
        FIFO_MEMORY_TYPE           => P_FIFO_MEMORY_TYPE_WRCH,
        ECC_MODE                   => 0,
        SIM_ASSERT_CHK             => SIM_ASSERT_CHK      ,
        CASCADE_HEIGHT             => CASCADE_HEIGHT      ,
        FIFO_WRITE_DEPTH           => FIFO_DEPTH_WRCH     ,
        WRITE_DATA_WIDTH           => C_DIN_WIDTH_WRCH,
        FULL_RESET_VALUE           => 1                   ,
        USE_ADV_FEATURES           => "0101",
        READ_MODE                  => 1                   ,
        FIFO_READ_LATENCY          => 0                   ,
        READ_DATA_WIDTH            => C_DIN_WIDTH_WRCH,
        DOUT_RESET_VALUE           => ""                  ,
        CDC_DEST_SYNC_FF           => CDC_SYNC_STAGES     ,
        REMOVE_WR_RD_PROT_LOGIC    => 0                   ,
        WAKEUP_TIME                => 0                   
      )  
      port map(
        sleep            => '0',
        rst              => rst_axil_mclk,
        wr_clk           => m_aclk_int,
        wr_en            => m_axi_bvalid,
        din              => wrch_din,
        full             => wrch_full,
        full_n           => open,
        prog_full        => open,
        wr_data_count    => open,
        overflow         => axi_b_overflow_i,
        wr_rst_busy      => wr_rst_busy_wrch,
        almost_full      => open,
        wr_ack           => open,
        rd_clk           => s_aclk,
        rd_en            => s_axi_bready,
        dout             => wrch_dout,
        empty            => wrch_empty,
        prog_empty       => open,
        rd_data_count    => open,
        underflow        => axi_b_underflow_i,
        rd_rst_busy      => open,
        almost_empty     => open,
        data_valid       => open,
        injectsbiterr    => '0',
        injectdbiterr    => '0',
        sbiterr          => open,
        dbiterr          => open
      );

     wrch_s_axi_bvalid <= not wrch_empty;
     wrch_m_axi_bready     <= not (wrch_full or wr_rst_busy_wrch) when (FIFO_MEMORY_TYPE_WRCH = "lutram") else not wrch_full;
     s_axi_bvalid      <= wrch_s_axi_bvalid;
     m_axi_bready      <= wrch_m_axi_bready;

  end generate axi_write_resp_channel;



  axi_wach_output1: if (IS_AXI_LITE_WACH = 1 or (C_WACH_TYPE = 1)) generate
     wach_din        <= s_axi_awaddr & s_axi_awprot;
     m_axi_awaddr    <= wach_dout(C_DIN_WIDTH_WACH-1 downto AWADDR_OFFSET);    
     m_axi_awprot    <= wach_dout(AWADDR_OFFSET-1 downto AWPROT_OFFSET);    
  end generate axi_wach_output1;

  axi_wdch_output1: if (IS_AXI_LITE_WDCH = 1 or (C_WDCH_TYPE = 1)) generate
     wdch_din        <= s_axi_wdata & s_axi_wstrb;
     m_axi_wdata     <= wdch_dout(C_DIN_WIDTH_WDCH-1 downto WDATA_OFFSET);
     m_axi_wstrb     <= wdch_dout(WDATA_OFFSET-1 downto WSTRB_OFFSET);
  end generate axi_wdch_output1;

  axi_wrch_output1: if (IS_AXI_LITE_WRCH = 1 or (C_WRCH_TYPE = 1)) generate
     wrch_din        <= m_axi_bresp;
     s_axi_bresp     <= wrch_dout(C_DIN_WIDTH_WRCH-1 downto BRESP_OFFSET); 
  end generate axi_wrch_output1;


  --end of  axi_write_channel

  --###########################################################################
  --  AXI FULL Read Channel (axi_read_channel)
  --###########################################################################
  

  axi_read_addr_channel: if (IS_RD_ADDR_CH = 1) generate
    -- Write protection when almost full or prog_full is high

    -- Read protection when almost empty or prog_empty is high
     rach_re    <= m_axi_arready;
     rach_rd_en <= rach_re;


      xpm_fifo_base_rach_dut: entity work.xpm_fifo_base 
      generic map (
        COMMON_CLOCK               => P_COMMON_CLOCK      ,
        RELATED_CLOCKS             => 0                   ,
        FIFO_MEMORY_TYPE           => P_FIFO_MEMORY_TYPE_RACH,
        ECC_MODE                   => 0,
        SIM_ASSERT_CHK             => SIM_ASSERT_CHK      ,
        CASCADE_HEIGHT             => CASCADE_HEIGHT      ,
        FIFO_WRITE_DEPTH           => FIFO_DEPTH_RACH     ,
        WRITE_DATA_WIDTH           => C_DIN_WIDTH_RACH,
        FULL_RESET_VALUE           => 1                   ,
        USE_ADV_FEATURES           => "0101",
        READ_MODE                  => 1                   ,
        FIFO_READ_LATENCY          => 0                   ,
        READ_DATA_WIDTH            => C_DIN_WIDTH_RACH,
        DOUT_RESET_VALUE           => ""                  ,
        CDC_DEST_SYNC_FF           => CDC_SYNC_STAGES     ,
        REMOVE_WR_RD_PROT_LOGIC    => 0                   ,
        WAKEUP_TIME                => 0                   
      ) 
      port map(
        sleep            => '0',
        rst              => rst_axil_sclk,
        wr_clk           => s_aclk,
        wr_en            => s_axi_arvalid,
        din              => rach_din,
        full             => rach_full,
        full_n           => open,
        prog_full        => open,
        wr_data_count    => open,
        overflow         => axi_ar_overflow_i,
        wr_rst_busy      => wr_rst_busy_rach,
        almost_full      => open,
        wr_ack           => open,
        rd_clk           => m_aclk_int,
        rd_en            => rach_rd_en,
        dout             => rach_dout_pkt,
        empty            => rach_empty,
        prog_empty       => open,
        rd_data_count    => open,
        underflow        => axi_ar_underflow_i,
        rd_rst_busy      => open,
        almost_empty     => open,
        data_valid       => open,
        injectsbiterr    => '0',
        injectdbiterr    => '0',
        sbiterr          => open,
        dbiterr          => open
      );

     rach_s_axi_arready    <= not (rach_full or wr_rst_busy_rach) when (FIFO_MEMORY_TYPE_RACH = "lutram") else not rach_full;
     rach_m_axi_arvalid <= not rach_empty;
     s_axi_arready      <= rach_s_axi_arready;

  end generate axi_read_addr_channel;


  grach_m_axi_arvalid: if (C_RACH_TYPE = 0) generate
     m_axi_arvalid      <= rach_m_axi_arvalid;
     rach_dout          <= rach_dout_pkt;
  end generate grach_m_axi_arvalid;
  
   arvalid_en <= '1';    

  axi_read_data_channel: if (IS_RD_DATA_CH = 1) generate

    -- Write protection when almost full or prog_full is high
     rdch_we    <= rdch_m_axi_rready  and m_axi_rvalid ;

    -- Read protection when almost empty or prog_empty is high
     rdch_re    <= rdch_s_axi_rvalid  and s_axi_rready;
     rdch_wr_en <= rdch_we;
     rdch_rd_en <= rdch_re;


     xpm_fifo_base_rdch_dut: entity work.xpm_fifo_base 
     generic map (
        COMMON_CLOCK               => P_COMMON_CLOCK      ,
        RELATED_CLOCKS             => 0                   ,
        FIFO_MEMORY_TYPE           => P_FIFO_MEMORY_TYPE_RDCH,
        ECC_MODE                   => P_ECC_MODE_RDCH     ,
        SIM_ASSERT_CHK             => SIM_ASSERT_CHK      ,
        CASCADE_HEIGHT             => CASCADE_HEIGHT      ,
        FIFO_WRITE_DEPTH           => FIFO_DEPTH_RDCH     ,
        WRITE_DATA_WIDTH           => C_DIN_WIDTH_RDCH_ECC,
        WR_DATA_COUNT_WIDTH        => WR_DATA_COUNT_WIDTH_RDCH,
        PROG_FULL_THRESH           => PROG_FULL_THRESH_RDCH ,
        FULL_RESET_VALUE           => 1                   ,
        USE_ADV_FEATURES           => USE_ADV_FEATURES_RDCH_INT,
        READ_MODE                  => 1                   ,
        FIFO_READ_LATENCY          => 0                   ,
        READ_DATA_WIDTH            => C_DIN_WIDTH_RDCH_ECC,
        RD_DATA_COUNT_WIDTH        => RD_DATA_COUNT_WIDTH_RDCH,
        PROG_EMPTY_THRESH          => PROG_EMPTY_THRESH_RDCH,
        DOUT_RESET_VALUE           => "0"                  ,
        CDC_DEST_SYNC_FF           => CDC_SYNC_STAGES     ,
        REMOVE_WR_RD_PROT_LOGIC    => 0                   ,
        WAKEUP_TIME                => 0                   
      ) 
      port map (
        sleep            => '0',
        rst              => rst_axil_mclk,
        wr_clk           => m_aclk_int,
        wr_en            => rdch_wr_en,
        din              => rdch_din,
        full             => rdch_full,
        full_n           => open,
        prog_full        => prog_full_rdch,
        wr_data_count    => wr_data_count_rdch,
        overflow         => axi_r_overflow_i,
        wr_rst_busy      => wr_rst_busy_rdch,
        almost_full      => open,
        wr_ack           => open,
        rd_clk           => s_aclk,
        rd_en            => rdch_rd_en,
        dout             => rdch_dout,
        empty            => rdch_empty,
        prog_empty       => prog_empty_rdch,
        rd_data_count    => rd_data_count_rdch,
        underflow        => axi_r_underflow_i,
        rd_rst_busy      => open,
        almost_empty     => open,
        data_valid       => open,
        injectsbiterr    => injectsbiterr_rdch,
        injectdbiterr    => injectdbiterr_rdch,
        sbiterr          => sbiterr_rdch,
        dbiterr          => dbiterr_rdch
      );

     rdch_s_axi_rvalid <= not rdch_empty;
     rdch_m_axi_rready <= not (rdch_full or wr_rst_busy_rdch) when (FIFO_MEMORY_TYPE_RDCH = "lutram") else not rdch_full;
     s_axi_rvalid      <= rdch_s_axi_rvalid;
     m_axi_rready      <= rdch_m_axi_rready;


  end generate axi_read_data_channel;




  axi_lite_rach_output1: if (IS_AXI_LITE_RACH = 1 or (C_RACH_TYPE = 1)) generate
     rach_din      <= s_axi_araddr & s_axi_arprot;
     m_axi_araddr  <= rach_dout(C_DIN_WIDTH_RACH-1 downto ARADDR_OFFSET);
     m_axi_arprot  <= rach_dout(ARADDR_OFFSET-1 downto ARPROT_OFFSET);
  end generate axi_lite_rach_output1;

  axi_lite_rdch_output1: if (IS_AXI_LITE_RDCH = 1 or (C_RDCH_TYPE = 1)) generate
     rdch_din      <= m_axi_rdata & m_axi_rresp;
     s_axi_rdata   <= rdch_dout(C_DIN_WIDTH_RDCH-1 downto RDATA_OFFSET);
     s_axi_rresp   <= rdch_dout(RDATA_OFFSET-1 downto RRESP_OFFSET);
  end generate axi_lite_rdch_output1;


  --end of axi_read_channel

  
  ---------------------------------------------------------------------------
  ---------------------------------------------------------------------------
  ---------------------------------------------------------------------------
  -- Pass Through Logic or Wiring Logic
  ---------------------------------------------------------------------------
  ---------------------------------------------------------------------------
  ---------------------------------------------------------------------------
  
  ---------------------------------------------------------------------------
  -- Pass Through Logic for Read Channel
  ---------------------------------------------------------------------------

  -- Wiring logic for Write Address Channel
  gwach_pass_through:  if (C_WACH_TYPE = 2) generate
     m_axi_awaddr    <= s_axi_awaddr;
     m_axi_awprot    <= s_axi_awprot;
     s_axi_awready   <= m_axi_awready;
     m_axi_awvalid   <= s_axi_awvalid;
  end generate gwach_pass_through;

  -- Wiring logic for Write Data Channel
  gwdch_pass_through:  if (C_WDCH_TYPE = 2) generate
     m_axi_wdata     <= s_axi_wdata;
     m_axi_wstrb     <= s_axi_wstrb;
     s_axi_wready    <= m_axi_wready;
     m_axi_wvalid    <= s_axi_wvalid;
  end generate gwdch_pass_through;

  -- Wiring logic for Write Response Channel
  gwrch_pass_through:  if (C_WRCH_TYPE = 2) generate 
     s_axi_bresp     <= m_axi_bresp;
     m_axi_bready    <= s_axi_bready;
     s_axi_bvalid    <= m_axi_bvalid;
  end generate gwrch_pass_through;

  ---------------------------------------------------------------------------
  -- Pass Through Logic for Read Channel
  ---------------------------------------------------------------------------

  -- Wiring logic for Read Address Channel
  grach_pass_through: if (C_RACH_TYPE = 2) generate
     m_axi_araddr    <= s_axi_araddr;
     m_axi_arprot    <= s_axi_arprot;
     s_axi_arready   <= m_axi_arready;
     m_axi_arvalid   <= s_axi_arvalid;
  end generate grach_pass_through;

  -- Wiring logic for Read Data Channel 
  grdch_pass_through: if (C_RDCH_TYPE = 2) generate
     s_axi_rdata    <= m_axi_rdata;
     s_axi_rresp    <= m_axi_rresp;
     s_axi_rvalid   <= m_axi_rvalid;
     m_axi_rready   <= s_axi_rready;
  end generate grdch_pass_through;


end rtl; --xpm_fifo_axil
