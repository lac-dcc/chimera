library verilog;
use verilog.vl_types.all;
entity AXIS_LMAC_TOP is
    generic(
        ADDR_WIDTH      : integer := 32;
        DATA_WIDTH      : integer := 256;
        CTRL_WIDTH      : integer := 32;
        DATA_PTR        : integer := 8;
        BCNT_WIDTH      : integer := 64;
        BCNT_PTR        : integer := 2
    );
    port(
        clk             : in     vl_logic;
        \reset_\        : in     vl_logic;
        gen_en_wr       : in     vl_logic;
        fmac_speed      : in     vl_logic_vector(2 downto 0);
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
        xA_clk          : in     vl_logic;
        cgmii_txd       : out    vl_logic_vector;
        cgmii_txc       : out    vl_logic_vector;
        cgmii_rxd       : in     vl_logic_vector;
        cgmii_rxc       : in     vl_logic_vector;
        host_addr_reg   : in     vl_logic_vector(15 downto 0);
        fail_over       : in     vl_logic;
        fmac_ctrl       : in     vl_logic_vector(31 downto 0);
        fmac_ctrl1      : in     vl_logic_vector(31 downto 0);
        fmac_rxd_en     : in     vl_logic;
        mac_pause_value : in     vl_logic_vector(31 downto 0);
        mac_addr0       : in     vl_logic_vector(47 downto 0);
        SYS_ADDR        : in     vl_logic_vector(3 downto 0);
        TCORE_MODE      : in     vl_logic;
        reg_rd_start    : in     vl_logic;
        reg_rd_done_out : out    vl_logic;
        FMAC_REGDOUT    : out    vl_logic_vector(31 downto 0);
        test            : out    vl_logic
    );
end AXIS_LMAC_TOP;
