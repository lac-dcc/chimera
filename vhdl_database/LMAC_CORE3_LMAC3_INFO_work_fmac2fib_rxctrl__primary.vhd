library verilog;
use verilog.vl_types.all;
entity fmac2fib_rxctrl is
    generic(
        DATA_WIDTH      : integer := 256;
        BCNT_WIDTH      : integer := 64;
        DATA_PTR        : integer := 10;
        IDLE            : integer := 0;
        STALL           : integer := 1;
        RD_BCNT         : integer := 2;
        RD_DATA         : integer := 3;
        END_DATA        : integer := 4
    );
    port(
        clk_fib         : in     vl_logic;
        \reset_\        : in     vl_logic;
        wren_rf         : out    vl_logic;
        wren_rcf        : out    vl_logic;
        datain_rf       : out    vl_logic_vector;
        datain_rcf      : out    vl_logic_vector;
        wrempty_rf      : in     vl_logic;
        wrempty_rcf     : in     vl_logic;
        wrusedw_rf      : in     vl_logic_vector;
        fib_rx_mac_data_empty: in     vl_logic;
        fib_rx_mac_pkt_data: in     vl_logic_vector;
        fib_rx_mac_ipcs_empty: in     vl_logic;
        fib_rx_mac_ipcs_data: in     vl_logic_vector;
        fib_rx_mac_rd   : out    vl_logic;
        fib_rx_mac_ipcs_rd: out    vl_logic;
        test            : out    vl_logic
    );
end fmac2fib_rxctrl;
