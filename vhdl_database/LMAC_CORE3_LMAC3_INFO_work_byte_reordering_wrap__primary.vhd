library verilog;
use verilog.vl_types.all;
entity byte_reordering_wrap is
    generic(
        DATA_WIDTH      : integer := 256;
        CTRL_WIDTH      : integer := 32
    );
    port(
        clk250          : in     vl_logic;
        x_clk           : in     vl_logic;
        \reset_\        : in     vl_logic;
        fmac_rxd_en     : in     vl_logic;
        xaui_mode       : in     vl_logic;
        x_we            : in     vl_logic;
        data_in         : in     vl_logic_vector;
        ctrl_in         : in     vl_logic_vector(39 downto 0);
        data_out        : out    vl_logic_vector;
        ctrl_out        : out    vl_logic_vector;
        init_done       : in     vl_logic;
        br_sof          : out    vl_logic_vector(7 downto 0);
        RAW_FRAME_CNT   : out    vl_logic_vector(31 downto 0);
        rx_auto_clr_en  : in     vl_logic;
        linkup          : out    vl_logic
    );
end byte_reordering_wrap;
