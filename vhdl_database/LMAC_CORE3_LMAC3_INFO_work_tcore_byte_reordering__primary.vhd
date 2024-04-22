library verilog;
use verilog.vl_types.all;
entity tcore_byte_reordering is
    generic(
        WIDTH           : integer := 256;
        CTRL_WIDTH      : integer := 32;
        LINK_FAIL       : integer := 1;
        LINK_RCVR       : integer := 2;
        LINK_GOOD       : integer := 4
    );
    port(
        clk250          : in     vl_logic;
        x_clk           : in     vl_logic;
        \reset_\        : in     vl_logic;
        fmac_rxd_en     : in     vl_logic;
        xaui_mode       : in     vl_logic;
        data_in         : in     vl_logic_vector;
        ctrl_in         : in     vl_logic_vector;
        data_out        : out    vl_logic_vector;
        ctrl_out        : out    vl_logic_vector;
        br_sof0         : out    vl_logic;
        br_sof4         : out    vl_logic;
        br_sof8         : out    vl_logic;
        br_sof12        : out    vl_logic;
        br_sof16        : out    vl_logic;
        br_sof20        : out    vl_logic;
        br_sof24        : out    vl_logic;
        br_sof28        : out    vl_logic;
        RAW_FRAME_CNT   : out    vl_logic_vector(31 downto 0);
        rx_auto_clr_en  : in     vl_logic;
        init_done       : in     vl_logic;
        linkup          : out    vl_logic;
        br_rd_en        : out    vl_logic;
        br_rd_empty     : in     vl_logic;
        rdusedw_data    : in     vl_logic_vector(10 downto 0);
        rdusedw_ctrl    : in     vl_logic_vector(10 downto 0)
    );
end tcore_byte_reordering;
