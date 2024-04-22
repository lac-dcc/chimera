library verilog;
use verilog.vl_types.all;
entity AXIS_BRIDGE_TOP is
    generic(
        ADDR_WIDTH      : integer := 32;
        DATA_WIDTH      : integer := 256;
        STRB_WIDTH      : integer := 32;
        DATA_PTR        : integer := 10;
        BCNT_WIDTH      : integer := 64;
        BCNT_PTR        : integer := 8
    );
    port(
        clk             : in     vl_logic;
        xA_clk          : in     vl_logic;
        \reset_\        : in     vl_logic;
        tx_mac_aclk     : in     vl_logic;
        tx_axis_mac_tdata: in     vl_logic_vector;
        tx_axis_mac_tvalid: in     vl_logic;
        tx_axis_mac_tlast: in     vl_logic;
        tx_axis_mac_tuser: in     vl_logic;
        tx_axis_mac_tstrb: in     vl_logic_vector;
        tx_axis_mac_tready: out    vl_logic;
        tx_ifg_delay    : in     vl_logic;
        tx_collision    : out    vl_logic;
        tx_retransmit   : out    vl_logic;
        tx_statistics_vector: out    vl_logic_vector(31 downto 0);
        tx_statistics_valid: out    vl_logic;
        rx_mac_aclk     : in     vl_logic;
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
        fib_tx_mac_usedw: in     vl_logic_vector(12 downto 0);
        fib_tx_mac_data : out    vl_logic_vector;
        fib_tx_mac_wr   : out    vl_logic;
        fib_rx_mac_data_empty: in     vl_logic;
        fib_rx_mac_pkt_data: in     vl_logic_vector;
        fib_rx_mac_ipcs_empty: in     vl_logic;
        fib_rx_mac_ipcs_data: in     vl_logic_vector;
        fib_rx_mac_rd   : out    vl_logic;
        fib_rx_mac_ipcs_rd: out    vl_logic;
        host_addr_in    : in     vl_logic_vector(15 downto 0);
        mac_regdout_in  : in     vl_logic_vector(31 downto 0);
        reg_rd_start_in : in     vl_logic;
        reg_rd_done_in  : in     vl_logic;
        host_addr_out   : out    vl_logic_vector(15 downto 0);
        mac_regdout_out : out    vl_logic_vector(31 downto 0);
        reg_rd_start_out: out    vl_logic;
        reg_rd_done_out : out    vl_logic;
        test            : out    vl_logic
    );
end AXIS_BRIDGE_TOP;
