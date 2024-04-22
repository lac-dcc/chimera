library verilog;
use verilog.vl_types.all;
entity axi_stream_master is
    generic(
        ADDR_WIDTH      : integer := 32;
        DATA_WIDTH      : integer := 256;
        BCNT_WIDTH      : integer := 32;
        AXIS_WR_IDLE    : integer := 1;
        AXIS_WR_DATA    : integer := 2;
        AXIS_WR_SIDE    : integer := 4;
        AXIS_RD_IDLE    : integer := 1;
        AXIS_RD_DATA    : integer := 2;
        AXIS_RD_SIDE    : integer := 4;
        AXIS_RD_DONE    : integer := 8
    );
    port(
        clk             : in     vl_logic;
        \reset_\        : in     vl_logic;
        gen_en_wr       : in     vl_logic;
        tx_mac_aclk     : in     vl_logic;
        tx_axis_mac_tdata: out    vl_logic_vector;
        tx_axis_mac_tvalid: out    vl_logic;
        tx_axis_mac_tlast: out    vl_logic;
        tx_axis_mac_tuser: out    vl_logic;
        tx_axis_mac_tstrb: out    vl_logic_vector;
        tx_axis_mac_tready: in     vl_logic;
        tx_ifg_delay    : out    vl_logic;
        tx_collision    : in     vl_logic;
        tx_retransmit   : in     vl_logic;
        tx_statistics_vector: in     vl_logic_vector(31 downto 0);
        tx_statistics_valid: in     vl_logic;
        rx_mac_aclk     : in     vl_logic;
        rx_axis_mac_tdata: in     vl_logic_vector;
        rx_axis_mac_tvalid: in     vl_logic;
        rx_axis_mac_tlast: in     vl_logic;
        rx_axis_mac_tuser: in     vl_logic;
        rx_axis_mac_tstrb: in     vl_logic_vector;
        rx_axis_mac_tready: out    vl_logic;
        rx_statistics_vector: out    vl_logic_vector(27 downto 0);
        rx_statistics_valid: out    vl_logic;
        rx_pkt_gen_sel  : in     vl_logic;
        host_addr       : out    vl_logic_vector(15 downto 0);
        reg_rd_start    : out    vl_logic;
        reg_rd_done_out : in     vl_logic;
        mac_regdout     : in     vl_logic_vector(31 downto 0);
        start           : in     vl_logic;
        address         : in     vl_logic_vector(15 downto 0);
        test            : out    vl_logic
    );
end axi_stream_master;
