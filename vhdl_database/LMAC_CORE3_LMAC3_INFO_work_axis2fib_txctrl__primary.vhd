library verilog;
use verilog.vl_types.all;
entity axis2fib_txctrl is
    generic(
        ADDR_WIDTH      : integer := 32;
        DATA_WIDTH      : integer := 256;
        DATA_PTR        : integer := 10;
        BCNT_WIDTH      : integer := 64;
        BCNT_PTR        : integer := 8;
        AXIS_WR_IDLE    : integer := 1;
        AXIS_WR_DATA    : integer := 2;
        AXIS_WR_BCNT    : integer := 4
    );
    port(
        clk             : in     vl_logic;
        \reset_\        : in     vl_logic;
        tx_mac_aclk     : in     vl_logic;
        tx_axis_mac_tdata: in     vl_logic_vector;
        tx_axis_mac_tvalid: in     vl_logic;
        tx_axis_mac_tlast: in     vl_logic;
        tx_axis_mac_tuser: in     vl_logic;
        tx_axis_mac_tstrb: in     vl_logic_vector(31 downto 0);
        tx_axis_mac_tready: out    vl_logic;
        tx_ifg_delay    : in     vl_logic;
        tx_collision    : out    vl_logic;
        tx_retransmit   : out    vl_logic;
        tx_statistics_vector: out    vl_logic_vector(31 downto 0);
        tx_statistics_valid: out    vl_logic;
        wr2_txwbcnt_fifo: out    vl_logic_vector;
        txwbcnt_wrreq   : out    vl_logic;
        txwbcnt_wrempty : in     vl_logic;
        txwbcnt_wrfull  : in     vl_logic;
        txwbcnt_wrusedw : in     vl_logic_vector;
        wr2_txdata_fifo : out    vl_logic_vector;
        txdata_wrreq    : out    vl_logic;
        txdata_wrempty  : in     vl_logic;
        txdata_wrfull   : in     vl_logic;
        txdata_wrusedw  : in     vl_logic_vector;
        test            : out    vl_logic
    );
end axis2fib_txctrl;
