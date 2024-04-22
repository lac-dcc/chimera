library verilog;
use verilog.vl_types.all;
entity tx_encap_100G is
    generic(
        WIDTH           : integer := 256;
        IDLE            : integer := 1;
        READSIZE        : integer := 2;
        READ1           : integer := 4;
        MAC_HDR         : integer := 8;
        MAC_DAT         : integer := 16;
        P_REQ           : integer := 32;
        P_PREAM         : integer := 64;
        P_PKT           : integer := 128
    );
    port(
        clk             : in     vl_logic;
        \rst_\          : in     vl_logic;
        mode_100G       : in     vl_logic;
        mode_10G        : in     vl_logic;
        mode_50G        : in     vl_logic;
        mode_40G        : in     vl_logic;
        mode_25G        : in     vl_logic;
        rts             : out    vl_logic;
        wdata           : out    vl_logic_vector;
        rbytes          : out    vl_logic_vector(15 downto 0);
        psaddr          : in     vl_logic_vector(47 downto 0);
        mac_pause_value : in     vl_logic_vector(31 downto 0);
        tx_b2b_dly      : in     vl_logic_vector(1 downto 0);
        rx_pause        : in     vl_logic;
        rx_pvalue       : in     vl_logic_vector(15 downto 0);
        rx_pack         : out    vl_logic;
        txfifo_empty    : in     vl_logic;
        txfifo_rd_en    : out    vl_logic;
        txfifo_dout     : in     vl_logic_vector;
        xreq            : in     vl_logic;
        xon             : in     vl_logic;
        xdone           : out    vl_logic;
        tx_dvld         : out    vl_logic
    );
end tx_encap_100G;
