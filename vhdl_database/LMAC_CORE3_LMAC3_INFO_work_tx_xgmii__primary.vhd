library verilog;
use verilog.vl_types.all;
entity tx_xgmii is
    generic(
        IDLE            : integer := 1;
        GET_WAIT1       : integer := 2;
        GET_WAIT2       : integer := 4;
        TX_DAT          : integer := 8;
        TX_CRC          : integer := 16
    );
    port(
        clk250          : in     vl_logic;
        clk156          : in     vl_logic;
        \rst_\          : in     vl_logic;
        mode_10G        : in     vl_logic;
        rts             : in     vl_logic;
        rdata           : in     vl_logic_vector(255 downto 0);
        rbytes          : in     vl_logic_vector(15 downto 0);
        cts             : out    vl_logic;
        xgmii_txd       : out    vl_logic_vector(63 downto 0);
        xgmii_txc       : out    vl_logic_vector(7 downto 0);
        FMAC_TX_PKT_CNT : out    vl_logic_vector(31 downto 0);
        FMAC_TX_BYTE_CNT: out    vl_logic_vector(31 downto 0);
        fmac_tx_clr_en  : in     vl_logic
    );
end tx_xgmii;
