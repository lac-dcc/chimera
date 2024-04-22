library verilog;
use verilog.vl_types.all;
entity LMAC_CORE_TOP is
    generic(
        DATA_WIDTH      : integer := 256;
        CTRL_WIDTH      : integer := 32;
        FMAC_ID         : integer := 10
    );
    port(
        clk             : in     vl_logic;
        xA_clk          : in     vl_logic;
        \reset_\        : in     vl_logic;
        mode_10G        : in     vl_logic;
        mode_25G        : in     vl_logic;
        mode_40G        : in     vl_logic;
        mode_50G        : in     vl_logic;
        mode_100G       : in     vl_logic;
        TCORE_MODE      : in     vl_logic;
        tx_mac_wr       : in     vl_logic;
        tx_mac_data     : in     vl_logic_vector;
        tx_mac_full     : out    vl_logic;
        tx_mac_usedw    : out    vl_logic_vector(12 downto 0);
        rx_mac_data     : out    vl_logic_vector;
        rx_mac_ctrl     : out    vl_logic_vector;
        rx_mac_empty    : out    vl_logic;
        rx_mac_rd       : in     vl_logic;
        rx_mac_full_dbg : out    vl_logic;
        rx_mac_usedw_dbg: out    vl_logic_vector(11 downto 0);
        cs_fifo_rd_en   : in     vl_logic;
        cs_fifo_empty   : out    vl_logic;
        ipcs_fifo_dout  : out    vl_logic_vector(63 downto 0);
        \cgmii_reset_\  : in     vl_logic;
        cgmii_txd       : out    vl_logic_vector;
        cgmii_txc       : out    vl_logic_vector;
        cgmii_rxd       : in     vl_logic_vector;
        cgmii_rxc       : in     vl_logic_vector;
        \cgmii_led_\    : in     vl_logic_vector(1 downto 0);
        xauiA_linkup    : out    vl_logic;
        host_addr_reg   : in     vl_logic_vector(15 downto 0);
        SYS_ADDR        : in     vl_logic_vector(3 downto 0);
        fail_over       : in     vl_logic;
        fmac_ctrl       : in     vl_logic_vector(31 downto 0);
        fmac_ctrl1      : in     vl_logic_vector(31 downto 0);
        fmac_rxd_en     : in     vl_logic;
        mac_pause_value : in     vl_logic_vector(31 downto 0);
        mac_addr0       : in     vl_logic_vector(47 downto 0);
        reg_rd_start    : in     vl_logic;
        reg_rd_done_out : out    vl_logic;
        FMAC_REGDOUT    : out    vl_logic_vector(31 downto 0);
        FIFO_OV_IPEND   : out    vl_logic
    );
end LMAC_CORE_TOP;
