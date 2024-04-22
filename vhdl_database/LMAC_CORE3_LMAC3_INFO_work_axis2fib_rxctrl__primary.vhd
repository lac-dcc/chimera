library verilog;
use verilog.vl_types.all;
entity axis2fib_rxctrl is
    generic(
        DATA_WIDTH      : integer := 256;
        BCNT_WIDTH      : integer := 64;
        STRB_WIDTH      : integer := 32;
        AR_IDLE         : integer := 1;
        AR_WAIT         : integer := 2;
        AR_READCNT      : integer := 4;
        AR_RDDATA       : integer := 8;
        AR_DONE         : integer := 22
    );
    port(
        rx_mac_aclk     : in     vl_logic;
        \reset_\        : in     vl_logic;
        rden_rf         : out    vl_logic;
        rden_rcf        : out    vl_logic;
        rdempty_rf      : in     vl_logic;
        rdempty_rcf     : in     vl_logic;
        dataout_rf      : in     vl_logic_vector;
        dataout_rcf     : in     vl_logic_vector;
        rx_axis_mac_tdata: out    vl_logic_vector;
        rx_axis_mac_tvalid: out    vl_logic;
        rx_axis_mac_tlast: out    vl_logic;
        rx_axis_mac_tuser: out    vl_logic;
        rx_axis_filter_tuser: out    vl_logic;
        rx_axis_mac_tstrb: out    vl_logic_vector;
        rx_statistics_vector: out    vl_logic_vector(27 downto 0);
        rx_statistics_valid: out    vl_logic;
        rx_axis_mac_tready: in     vl_logic;
        rx_axis_compatible_mode: in     vl_logic;
        test            : out    vl_logic
    );
end axis2fib_rxctrl;
