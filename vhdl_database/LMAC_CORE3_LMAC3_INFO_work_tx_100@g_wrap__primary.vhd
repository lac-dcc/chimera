library verilog;
use verilog.vl_types.all;
entity tx_100G_wrap is
    generic(
        DATA_WIDTH      : integer := 256;
        CTRL_WIDTH      : integer := 32
    );
    port(
        usr_clk         : in     vl_logic;
        x_clk           : in     vl_logic;
        \usr_rst_\      : in     vl_logic;
        mode_100G       : in     vl_logic;
        mode_10G        : in     vl_logic;
        mode_50G        : in     vl_logic;
        mode_40G        : in     vl_logic;
        mode_25G        : in     vl_logic;
        mac_addr0       : in     vl_logic_vector(47 downto 0);
        mac_pause_value : in     vl_logic_vector(31 downto 0);
        tx_b2b_dly      : in     vl_logic_vector(1 downto 0);
        txfifo_dout     : in     vl_logic_vector;
        txfifo_empty    : in     vl_logic;
        pre_txfifo_rd_en_100G: out    vl_logic;
        rx_pause        : in     vl_logic;
        rx_pvalue       : in     vl_logic_vector(15 downto 0);
        pre_rx_pack_100G: out    vl_logic;
        xreq            : in     vl_logic;
        xon             : in     vl_logic;
        pre_xdone_100G  : out    vl_logic;
        xaui_mode       : in     vl_logic;
        pre_cgmii_txd   : out    vl_logic_vector;
        pre_cgmii_txc   : out    vl_logic_vector;
        PRE_FMAC_TX_PKT_CNT_100G: out    vl_logic_vector(31 downto 0);
        PRE_FMAC_TX_BYTE_CNT_100G: out    vl_logic_vector(31 downto 0);
        fmac_tx_clr_en  : in     vl_logic
    );
end tx_100G_wrap;
