--**************************************************************
--  Copyright (c) 2016 Xilinx, Inc.  All rights reserved.
--  File Name    : xpm_VCOMP.vhd
--  Library      : xpm
--  Release      : 2016.1
--  Entity Count : 17
--**************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.all;
package VCOMPONENTS is


-- START COMPONENT
----- component xpm_memory_spram  -----
component xpm_memory_spram
  generic (

    -- Common module generics
    MEMORY_SIZE         : integer := 2048            ;
    MEMORY_PRIMITIVE    : string  := "auto"          ;
    ECC_MODE            : string  := "no_ecc"        ;
    MEMORY_INIT_FILE    : string  := "none"          ;
    MEMORY_INIT_PARAM   : string  := ""              ;
    USE_MEM_INIT        : integer := 1               ;
    USE_MEM_INIT_MMI    : integer := 0               ;
    WAKEUP_TIME         : string  := "disable_sleep" ;
    AUTO_SLEEP_TIME     : integer := 0               ;
    MESSAGE_CONTROL     : integer := 0               ;
    MEMORY_OPTIMIZATION : string  := "true" ;
    CASCADE_HEIGHT      : integer := 0               ;
    SIM_ASSERT_CHK      : integer := 0               ;
    WRITE_PROTECT       : integer := 1               ;

    -- Port A module generics
    WRITE_DATA_WIDTH_A  : integer := 32           ;
    READ_DATA_WIDTH_A   : integer := 32           ;
    BYTE_WRITE_WIDTH_A  : integer := 32           ;
    ADDR_WIDTH_A        : integer := 6            ;
    READ_RESET_VALUE_A  : string  := "0"          ;
    READ_LATENCY_A      : integer := 2            ;
    WRITE_MODE_A        : string  := "read_first" ;
    RST_MODE_A          : string  := "SYNC"

  );
  port (

    -- Common module ports
    sleep          : in  std_logic;

    -- Port A module ports
    clka           : in  std_logic;
    rsta           : in  std_logic;
    ena            : in  std_logic;
    regcea         : in  std_logic;
    wea            : in  std_logic_vector((WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A)-1 downto 0);
    addra          : in  std_logic_vector(ADDR_WIDTH_A-1 downto 0);
    dina           : in  std_logic_vector(WRITE_DATA_WIDTH_A-1 downto 0);
    injectsbiterra : in  std_logic;
    injectdbiterra : in  std_logic;
    douta          : out std_logic_vector(READ_DATA_WIDTH_A-1 downto 0);
    sbiterra       : out std_logic;
    dbiterra       : out std_logic
  );
end component;

----- component xpm_memory_sdpram -----
component xpm_memory_sdpram
  generic (

    -- Common module generics
    MEMORY_SIZE             : integer := 2048           ;
    MEMORY_PRIMITIVE        : string  := "auto"         ;
    CLOCKING_MODE           : string  := "common_clock" ;
    ECC_MODE                : string  := "no_ecc"       ;
    MEMORY_INIT_FILE        : string  := "none"         ;
    MEMORY_INIT_PARAM       : string  := ""             ;
    USE_MEM_INIT            : integer := 1              ;
    USE_MEM_INIT_MMI        : integer := 0              ;
    WAKEUP_TIME             : string  := "disable_sleep";
    AUTO_SLEEP_TIME         : integer := 0              ;
    MESSAGE_CONTROL         : integer := 0              ;
    USE_EMBEDDED_CONSTRAINT : integer := 0              ;
    MEMORY_OPTIMIZATION     : string  := "true";
    CASCADE_HEIGHT          : integer := 0               ;
    SIM_ASSERT_CHK          : integer := 0               ;
    WRITE_PROTECT           : integer := 1               ;

    -- Port A module generics
    WRITE_DATA_WIDTH_A      : integer := 32 ;
    BYTE_WRITE_WIDTH_A      : integer := 32 ;
    ADDR_WIDTH_A            : integer := 6  ;
    RST_MODE_A              : string  := "SYNC";

    -- Port B module generics
    READ_DATA_WIDTH_B       : integer := 32          ;
    ADDR_WIDTH_B            : integer := 6           ;
    READ_RESET_VALUE_B      : string  := "0"         ;
    READ_LATENCY_B          : integer := 2           ;
    WRITE_MODE_B            : string  := "no_change" ;
    RST_MODE_B              : string  := "SYNC"


  );
  port (

    -- Common module ports
    sleep          : in  std_logic;

    -- Port A module ports
    clka           : in  std_logic;
    ena            : in  std_logic;
    wea            : in  std_logic_vector((WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A)-1 downto 0);
    addra          : in  std_logic_vector(ADDR_WIDTH_A-1 downto 0);
    dina           : in  std_logic_vector(WRITE_DATA_WIDTH_A-1 downto 0);
    injectsbiterra : in  std_logic;
    injectdbiterra : in  std_logic;

    -- Port B module ports
    clkb           : in  std_logic;
    rstb           : in  std_logic;
    enb            : in  std_logic;
    regceb         : in  std_logic;
    addrb          : in  std_logic_vector(ADDR_WIDTH_B-1 downto 0);
    doutb          : out std_logic_vector(READ_DATA_WIDTH_B-1 downto 0);
    sbiterrb       : out std_logic;
    dbiterrb       : out std_logic
  );
end component;

----- component xpm_memory_tdpram -----
component xpm_memory_tdpram
  generic (

    -- Common module generics
    MEMORY_SIZE             : integer := 2048           ;
    MEMORY_PRIMITIVE        : string  := "auto"         ;
    CLOCKING_MODE           : string  := "common_clock" ;
    ECC_MODE                : string  := "no_ecc"       ;
    MEMORY_INIT_FILE        : string  := "none"         ;
    MEMORY_INIT_PARAM       : string  := ""             ;
    USE_MEM_INIT            : integer := 1              ;
    USE_MEM_INIT_MMI        : integer := 0              ;
    WAKEUP_TIME             : string  := "disable_sleep";
    AUTO_SLEEP_TIME         : integer := 0              ;
    MESSAGE_CONTROL         : integer := 0              ;
    USE_EMBEDDED_CONSTRAINT : integer := 0              ;
    MEMORY_OPTIMIZATION     : string  := "true";
    CASCADE_HEIGHT          : integer := 0               ;
    SIM_ASSERT_CHK          : integer := 0               ;
    WRITE_PROTECT           : integer := 1               ;

    -- Port A module generics
    WRITE_DATA_WIDTH_A : integer := 32          ;
    READ_DATA_WIDTH_A  : integer := 32          ;
    BYTE_WRITE_WIDTH_A : integer := 32          ;
    ADDR_WIDTH_A       : integer := 6           ;
    READ_RESET_VALUE_A : string  := "0"         ;
    READ_LATENCY_A     : integer := 2           ;
    WRITE_MODE_A       : string  := "no_change" ;
    RST_MODE_A         : string  := "SYNC"      ;

    -- Port B module generics
    WRITE_DATA_WIDTH_B : integer := 32         ;
    READ_DATA_WIDTH_B  : integer := 32         ;
    BYTE_WRITE_WIDTH_B : integer := 32         ;
    ADDR_WIDTH_B       : integer := 6          ;
    READ_RESET_VALUE_B : string  := "0"        ;
    READ_LATENCY_B     : integer := 2          ;
    WRITE_MODE_B       : string  := "no_change";
    RST_MODE_B         : string  := "SYNC"

  );
  port (

    -- Common module ports
    sleep          : in  std_logic;

    -- Port A module ports
    clka           : in  std_logic;
    rsta           : in  std_logic;
    ena            : in  std_logic;
    regcea         : in  std_logic;
    wea            : in  std_logic_vector((WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A)-1 downto 0);
    addra          : in  std_logic_vector(ADDR_WIDTH_A-1 downto 0);
    dina           : in  std_logic_vector(WRITE_DATA_WIDTH_A-1 downto 0);
    injectsbiterra : in  std_logic;
    injectdbiterra : in  std_logic;
    douta          : out std_logic_vector(READ_DATA_WIDTH_A-1 downto 0);
    sbiterra       : out std_logic;
    dbiterra       : out std_logic;

    -- Port B module ports
    clkb           : in  std_logic;
    rstb           : in  std_logic;
    enb            : in  std_logic;
    regceb         : in  std_logic;
    web            : in  std_logic_vector((WRITE_DATA_WIDTH_B/BYTE_WRITE_WIDTH_B)-1 downto 0);
    addrb          : in  std_logic_vector(ADDR_WIDTH_B-1 downto 0);
    dinb           : in  std_logic_vector(WRITE_DATA_WIDTH_B-1 downto 0);
    injectsbiterrb : in  std_logic;
    injectdbiterrb : in  std_logic;
    doutb          : out std_logic_vector(READ_DATA_WIDTH_B-1 downto 0);
    sbiterrb       : out std_logic;
    dbiterrb       : out std_logic
  );
end component;

----- component xpm_memory_sprom -----
component xpm_memory_sprom
  generic (

    -- Common module generics
    MEMORY_SIZE             : integer := 2048           ;
    MEMORY_PRIMITIVE        : string  := "auto"         ;
    ECC_MODE                : string  := "no_ecc"       ;
    MEMORY_INIT_FILE        : string  := "none"         ;
    MEMORY_INIT_PARAM       : string  := ""             ;
    USE_MEM_INIT            : integer := 1              ;
    USE_MEM_INIT_MMI        : integer := 0              ;
    WAKEUP_TIME             : string  := "disable_sleep";
    AUTO_SLEEP_TIME         : integer := 0              ;
    MESSAGE_CONTROL         : integer := 0              ;
    MEMORY_OPTIMIZATION     : string  := "true";
    CASCADE_HEIGHT          : integer := 0               ;
    SIM_ASSERT_CHK          : integer := 0               ;

    -- Port A module generics
    READ_DATA_WIDTH_A       : integer := 32  ;
    ADDR_WIDTH_A            : integer := 6   ;
    READ_RESET_VALUE_A      : string  := "0" ;
    READ_LATENCY_A          : integer := 2   ;
    RST_MODE_A              : string  := "SYNC"

  );
  port (

    -- Common module ports
    sleep          : in  std_logic;

    -- Port A module ports
    clka           : in  std_logic;
    rsta           : in  std_logic;
    ena            : in  std_logic;
    regcea         : in  std_logic;
    addra          : in  std_logic_vector(ADDR_WIDTH_A-1 downto 0);
    injectsbiterra : in  std_logic;
    injectdbiterra : in  std_logic;
    douta          : out std_logic_vector(READ_DATA_WIDTH_A-1 downto 0);
    sbiterra       : out std_logic;
    dbiterra       : out std_logic
  );
end component;

----- component xpm_memory_dprom -----
component xpm_memory_dprom
  generic (

    -- Common module generics
    MEMORY_SIZE             : integer := 2048           ;
    MEMORY_PRIMITIVE        : string  := "auto"         ;
    CLOCKING_MODE           : string  := "common_clock" ;
    ECC_MODE                : string  := "no_ecc"       ;
    MEMORY_INIT_FILE        : string  := "none"         ;
    MEMORY_INIT_PARAM       : string  := ""             ;
    USE_MEM_INIT            : integer := 1              ;
    USE_MEM_INIT_MMI        : integer := 0              ;
    WAKEUP_TIME             : string  := "disable_sleep";
    AUTO_SLEEP_TIME         : integer := 0              ;
    MESSAGE_CONTROL         : integer := 0              ;
    MEMORY_OPTIMIZATION     : string  := "true";
    CASCADE_HEIGHT          : integer := 0               ;
    SIM_ASSERT_CHK          : integer := 0               ;

    -- Port A module generics
    READ_DATA_WIDTH_A       : integer := 32  ;
    ADDR_WIDTH_A            : integer := 6   ;
    READ_RESET_VALUE_A      : string  := "0" ;
    READ_LATENCY_A          : integer := 2   ;
    RST_MODE_A              : string  := "SYNC";

    -- Port B module generics
    READ_DATA_WIDTH_B       : integer := 32  ;
    ADDR_WIDTH_B            : integer := 6   ;
    READ_RESET_VALUE_B      : string  := "0" ;
    READ_LATENCY_B          : integer := 2   ;
    RST_MODE_B              : string  := "SYNC"

  );
  port (

    -- Common module ports
    sleep          : in  std_logic;

    -- Port A module ports
    clka           : in  std_logic;
    rsta           : in  std_logic;
    ena            : in  std_logic;
    regcea         : in  std_logic;
    addra          : in  std_logic_vector(ADDR_WIDTH_A-1 downto 0);
    injectsbiterra : in  std_logic;
    injectdbiterra : in  std_logic;
    douta          : out std_logic_vector(READ_DATA_WIDTH_A-1 downto 0);
    sbiterra       : out std_logic;
    dbiterra       : out std_logic;

    -- Port B module ports
    clkb           : in  std_logic;
    rstb           : in  std_logic;
    enb            : in  std_logic;
    regceb         : in  std_logic;
    addrb          : in  std_logic_vector(ADDR_WIDTH_B-1 downto 0);
    injectsbiterrb : in  std_logic;
    injectdbiterrb : in  std_logic;
    doutb          : out std_logic_vector(READ_DATA_WIDTH_B-1 downto 0);
    sbiterrb       : out std_logic;
    dbiterrb       : out std_logic
  );
end component;

----- component xpm_memory_dpdistram -----
component xpm_memory_dpdistram
  generic (

    -- Common module generics
    MEMORY_SIZE             : integer := 2048          ;
    CLOCKING_MODE           : string  := "common_clock";
    MEMORY_INIT_FILE        : string  := "none"        ;
    MEMORY_INIT_PARAM       : string  := ""            ;
    USE_MEM_INIT            : integer := 1             ;
    USE_MEM_INIT_MMI        : integer := 0             ;
    MESSAGE_CONTROL         : integer := 0             ;
    USE_EMBEDDED_CONSTRAINT : integer := 0              ;
    MEMORY_OPTIMIZATION     : string  := "true";
    SIM_ASSERT_CHK          : integer := 0               ;

    -- Port A module generics
    WRITE_DATA_WIDTH_A : integer := 32  ;
    READ_DATA_WIDTH_A  : integer := 32  ;
    BYTE_WRITE_WIDTH_A : integer := 32  ;
    ADDR_WIDTH_A       : integer := 6   ;
    READ_RESET_VALUE_A : string  := "0" ;
    READ_LATENCY_A     : integer := 2   ;
    RST_MODE_A         : string  := "SYNC";

    -- Port B module generics
    READ_DATA_WIDTH_B  : integer := 32  ;
    ADDR_WIDTH_B       : integer := 6   ;
    READ_RESET_VALUE_B : string  := "0" ;
    READ_LATENCY_B     : integer := 2   ;
    RST_MODE_B         : string  := "SYNC"

  );
  port (

    -- Port A module ports
    clka   : in  std_logic;
    rsta   : in  std_logic;
    ena    : in  std_logic;
    regcea : in  std_logic;
    wea    : in  std_logic_vector((WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A)-1 downto 0);
    addra  : in  std_logic_vector(ADDR_WIDTH_A-1 downto 0);
    dina   : in  std_logic_vector(WRITE_DATA_WIDTH_A-1 downto 0);
    douta  : out std_logic_vector(READ_DATA_WIDTH_A-1 downto 0);

    -- Port B module ports
    clkb   : in  std_logic;
    rstb   : in  std_logic;
    enb    : in  std_logic;
    regceb : in  std_logic;
    addrb  : in  std_logic_vector(ADDR_WIDTH_B-1 downto 0);
    doutb  : out std_logic_vector(READ_DATA_WIDTH_B-1 downto 0)
  );
end component;

----- component xpm_cdc_single -----
component xpm_cdc_single
  generic (

    -- Common module generics
    DEST_SYNC_FF   : integer := 4;
    INIT_SYNC_FF   : integer := 0;
    SIM_ASSERT_CHK : integer := 0;
    SRC_INPUT_REG  : integer := 1
  );
  port (
    src_clk  : in std_logic;
    src_in   : in std_logic;
    dest_clk : in std_logic;
    dest_out : out std_logic
  );
end component;

----- component xpm_cdc_gray -----
component xpm_cdc_gray
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
end component;

----- component xpm_cdc_handshake -----
component xpm_cdc_handshake
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
end component;

----- component xpm_cdc_pulse -----
component xpm_cdc_pulse
  generic (

    -- Common module generics
    DEST_SYNC_FF   : integer := 4;
    INIT_SYNC_FF   : integer := 0;
    REG_OUTPUT     : integer := 0;
    RST_USED       : integer := 1;
    SIM_ASSERT_CHK : integer := 0

  );
  port (

    src_clk    : in std_logic;
    src_rst    : in std_logic;
    src_pulse  : in std_logic;
    dest_clk   : in std_logic;
    dest_rst   : in std_logic;
    dest_pulse : out std_logic
  );
end component;

----- component xpm_cdc_array_single -----
component xpm_cdc_array_single
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
end component;

----- component xpm_cdc_sync_rst -----
component xpm_cdc_sync_rst
  generic (

    -- Common module generics
    DEST_SYNC_FF   : integer := 4;
    INIT           : integer := 1;
    INIT_SYNC_FF   : integer := 0;
    SIM_ASSERT_CHK : integer := 0

);
  port (

    src_rst  : in std_logic;
    dest_clk : in std_logic;
    dest_rst : out std_logic
);
end component;

----- component  xpm_cdc_async_rst -----
component xpm_cdc_async_rst
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
end component;

----- component xpm_cdc_low_latency_handshake -----
component xpm_cdc_low_latency_handshake
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
end component;

----- component  xpm_fifo_async -----

component xpm_fifo_async
  generic (

    -- Common module generics
    FIFO_MEMORY_TYPE         : string   := "auto";
    FIFO_WRITE_DEPTH         : integer  := 2048;
    CASCADE_HEIGHT           : integer  := 0;
    RELATED_CLOCKS           : integer  := 0;
    WRITE_DATA_WIDTH         : integer  := 32;
    READ_MODE                : string   :="std";
    FIFO_READ_LATENCY        : integer  := 1;
    FULL_RESET_VALUE         : integer  := 0;
    USE_ADV_FEATURES         : string   :="0707";
    READ_DATA_WIDTH          : integer  := 32;
    CDC_SYNC_STAGES          : integer  := 2;
    WR_DATA_COUNT_WIDTH      : integer  := 1;
    PROG_FULL_THRESH         : integer  := 10;
    RD_DATA_COUNT_WIDTH      : integer  := 1;
    PROG_EMPTY_THRESH        : integer  := 10;
    DOUT_RESET_VALUE         : string   := "0";
    ECC_MODE                 : string   :="no_ecc";
    SIM_ASSERT_CHK           : integer := 0    ;
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
    rd_clk         : in std_logic;
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
end component;

----- component  xpm_fifo_sync -----

component xpm_fifo_sync
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
    SIM_ASSERT_CHK           : integer := 0    ;
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
end component;

----- component  xpm_fifo_axis -----

component xpm_fifo_axis
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
end component;

-- END COMPONENT

----- component  xpm_fifo_axif -----

component xpm_fifo_axif
  generic (
    AXI_ID_WIDTH              : integer  := 1;
    AXI_ADDR_WIDTH            : integer  := 32;
    AXI_DATA_WIDTH            : integer  := 32;
    AXI_LEN_WIDTH             : integer  := 8;
    AXI_ARUSER_WIDTH          : integer  := 1;
    AXI_AWUSER_WIDTH          : integer  := 1;
    AXI_WUSER_WIDTH           : integer  := 1;
    AXI_BUSER_WIDTH           : integer  := 1;
    AXI_RUSER_WIDTH           : integer  := 1;
    CLOCKING_MODE             : string   := "common";
    SIM_ASSERT_CHK            : integer := 0    ;
    CDC_SYNC_STAGES           : integer  := 2;
    EN_RESET_SYNCHRONIZER     : integer  := 0;
    CASCADE_HEIGHT            : integer  := 0;
    PACKET_FIFO               : string   := "false";
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
    s_axi_awid                  : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0);
    s_axi_awaddr                : in  std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    s_axi_awlen                 : in  std_logic_vector(AXI_LEN_WIDTH-1 downto 0);
    s_axi_awsize                : in  std_logic_vector(3-1 downto 0);
    s_axi_awburst               : in  std_logic_vector(2-1 downto 0);
    s_axi_awlock                : in  std_logic_vector(2-1 downto 0);
    s_axi_awcache               : in  std_logic_vector(4-1 downto 0);
    s_axi_awprot                : in  std_logic_vector(3-1 downto 0);
    s_axi_awqos                 : in  std_logic_vector(4-1 downto 0); 
    s_axi_awregion              : in  std_logic_vector(4-1 downto 0);
    s_axi_awuser                : in  std_logic_vector(AXI_AWUSER_WIDTH-1 downto 0);
    s_axi_awvalid               : in  std_logic;
    s_axi_awready               : out std_logic;
    s_axi_wdata                 : in  std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    s_axi_wstrb                 : in  std_logic_vector(AXI_DATA_WIDTH/8-1 downto 0); 
    s_axi_wlast                 : in  std_logic;
    s_axi_wuser                 : in  std_logic_vector(AXI_WUSER_WIDTH-1 downto 0);
    s_axi_wvalid                : in  std_logic;
    s_axi_wready                : out std_logic;
    s_axi_bid                   : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
    s_axi_bresp                 : out std_logic_vector(2-1 downto 0);
    s_axi_buser                 : out std_logic_vector(AXI_BUSER_WIDTH-1 downto 0);
    s_axi_bvalid                : out std_logic;
    s_axi_bready                : in  std_logic;
    m_axi_awid                  : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
    m_axi_awaddr                : out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    m_axi_awlen                 : out std_logic_vector(AXI_LEN_WIDTH-1 downto 0);
    m_axi_awsize                : out std_logic_vector(3-1 downto 0);
    m_axi_awburst               : out std_logic_vector(2-1 downto 0);
    m_axi_awlock                : out std_logic_vector(2-1 downto 0);
    m_axi_awcache               : out std_logic_vector(4-1 downto 0);
    m_axi_awprot                : out std_logic_vector(3-1 downto 0);
    m_axi_awqos                 : out std_logic_vector(4-1 downto 0);
    m_axi_awregion              : out std_logic_vector(4-1 downto 0);
    m_axi_awuser                : out std_logic_vector(AXI_AWUSER_WIDTH-1 downto 0);
    m_axi_awvalid               : out std_logic;
    m_axi_awready               : in  std_logic;
    m_axi_wdata                 : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    m_axi_wstrb                 : out std_logic_vector(AXI_DATA_WIDTH/8-1 downto 0);
    m_axi_wlast                 : out std_logic;
    m_axi_wuser                 : out std_logic_vector(AXI_WUSER_WIDTH-1 downto 0);
    m_axi_wvalid                : out std_logic;
    m_axi_wready                : in  std_logic;
    m_axi_bid                   : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0);
    m_axi_bresp                 : in  std_logic_vector(2-1 downto 0);
    m_axi_buser                 : in  std_logic_vector(AXI_BUSER_WIDTH-1 downto 0);
    m_axi_bvalid                : in  std_logic;
    m_axi_bready                : out std_logic;
    s_axi_arid                  : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0);
    s_axi_araddr                : in  std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    s_axi_arlen                 : in  std_logic_vector(AXI_LEN_WIDTH-1 downto 0);
    s_axi_arsize                : in  std_logic_vector(3-1 downto 0);
    s_axi_arburst               : in  std_logic_vector(2-1 downto 0);
    s_axi_arlock                : in  std_logic_vector(2-1 downto 0);
    s_axi_arcache               : in  std_logic_vector(4-1 downto 0);
    s_axi_arprot                : in  std_logic_vector(3-1 downto 0);
    s_axi_arqos                 : in  std_logic_vector(4-1 downto 0);
    s_axi_arregion              : in  std_logic_vector(4-1 downto 0);
    s_axi_aruser                : in  std_logic_vector(AXI_ARUSER_WIDTH-1 downto 0);
    s_axi_arvalid               : in  std_logic;
    s_axi_arready               : out std_logic;
    s_axi_rid                   : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
    s_axi_rdata                 : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    s_axi_rresp                 : out std_logic_vector(2-1 downto 0);
    s_axi_rlast                 : out std_logic;
    s_axi_ruser                 : out std_logic_vector(AXI_RUSER_WIDTH-1 downto 0);
    s_axi_rvalid                : out std_logic;
    s_axi_rready                : in  std_logic;
    m_axi_arid                  : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);       
    m_axi_araddr                : out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    m_axi_arlen                 : out std_logic_vector(AXI_LEN_WIDTH-1 downto 0);
    m_axi_arsize                : out std_logic_vector(3-1 downto 0);
    m_axi_arburst               : out std_logic_vector(2-1 downto 0);
    m_axi_arlock                : out std_logic_vector(2-1 downto 0);
    m_axi_arcache               : out std_logic_vector(4-1 downto 0);
    m_axi_arprot                : out std_logic_vector(3-1 downto 0);
    m_axi_arqos                 : out std_logic_vector(4-1 downto 0);
    m_axi_arregion              : out std_logic_vector(4-1 downto 0);
    m_axi_aruser                : out std_logic_vector(AXI_ARUSER_WIDTH-1 downto 0);
    m_axi_arvalid               : out std_logic;
    m_axi_arready               : in  std_logic;
    m_axi_rid                   : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0);     
    m_axi_rdata                 : in  std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    m_axi_rresp                 : in  std_logic_vector(2-1 downto 0);
    m_axi_rlast                 : in  std_logic;
    m_axi_ruser                 : in  std_logic_vector(AXI_RUSER_WIDTH-1 downto 0);
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
end component;

----- component  xpm_fifo_axil -----

component xpm_fifo_axil
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
end component;


end VCOMPONENTS;


