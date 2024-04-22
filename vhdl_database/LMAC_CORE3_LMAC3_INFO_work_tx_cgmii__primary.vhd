library verilog;
use verilog.vl_types.all;
entity tx_cgmii is
    generic(
        DATA_WIDTH      : integer := 256;
        CTRL_WIDTH      : integer := 32
    );
    port(
        clk250          : in     vl_logic;
        clk156          : in     vl_logic;
        \rst_\          : in     vl_logic;
        mode_100G       : in     vl_logic;
        mode_50G        : in     vl_logic;
        mode_40G        : in     vl_logic;
        mode_25G        : in     vl_logic;
        mode_10G        : in     vl_logic;
        xaui_mode       : in     vl_logic;
        rts             : in     vl_logic;
        rdata           : in     vl_logic_vector;
        txfifo_dout     : in     vl_logic_vector;
        rbytes          : in     vl_logic_vector(15 downto 0);
        cts             : out    vl_logic;
        txd             : out    vl_logic_vector;
        txc             : out    vl_logic_vector;
        FMAC_TX_PKT_CNT : out    vl_logic_vector(31 downto 0);
        FMAC_TX_BYTE_CNT: out    vl_logic_vector(31 downto 0);
        fmac_tx_clr_en  : in     vl_logic;
        tx_dvld         : in     vl_logic
    );
end tx_cgmii;
