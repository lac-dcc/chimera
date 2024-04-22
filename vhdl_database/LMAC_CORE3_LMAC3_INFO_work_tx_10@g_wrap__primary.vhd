library verilog;
use verilog.vl_types.all;
entity tx_10G_wrap is
    port(
        usr_clk         : in     vl_logic;
        x_clk           : in     vl_logic;
        \usr_rst_\      : in     vl_logic;
        mode_10G        : in     vl_logic;
        mac_addr0       : in     vl_logic_vector(47 downto 0);
        mac_pause_value : in     vl_logic_vector(31 downto 0);
        tx_b2b_dly      : in     vl_logic_vector(1 downto 0);
        txfifo_dout     : in     vl_logic_vector(255 downto 0);
        txfifo_empty    : in     vl_logic;
        pre_txfifo_rd_en_10G: out    vl_logic;
        rx_pause        : in     vl_logic;
        rx_pvalue       : in     vl_logic_vector(15 downto 0);
        pre_rx_pack_10G : out    vl_logic;
        xreq            : in     vl_logic;
        xon             : in     vl_logic;
        pre_xdone_10G   : out    vl_logic;
        xaui_mode       : in     vl_logic;
        pre_xgmii_txd   : out    vl_logic_vector(63 downto 0);
        pre_xgmii_txc   : out    vl_logic_vector(7 downto 0);
        PRE_FMAC_TX_PKT_CNT_10G: out    vl_logic_vector(31 downto 0);
        PRE_FMAC_TX_BYTE_CNT_10G: out    vl_logic_vector(31 downto 0);
        fmac_tx_clr_en  : in     vl_logic
    );
end tx_10G_wrap;
