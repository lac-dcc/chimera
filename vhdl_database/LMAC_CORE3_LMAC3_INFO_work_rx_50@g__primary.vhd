library verilog;
use verilog.vl_types.all;
entity rx_50G is
    generic(
        DATA_WIDTH      : integer := 256;
        CTRL_WIDTH      : integer := 32;
        LINK_FAIL       : integer := 1;
        LINK_RCVR       : integer := 2;
        LINK_GOOD       : integer := 4
    );
    port(
        clk             : in     vl_logic;
        \reset_\        : in     vl_logic;
        mode_10G        : in     vl_logic;
        mode_25G        : in     vl_logic;
        mode_40G        : in     vl_logic;
        mode_50G        : in     vl_logic;
        mode_100G       : in     vl_logic;
        init_done       : in     vl_logic;
        data_in         : in     vl_logic_vector;
        ctrl_in         : in     vl_logic_vector;
        data_out        : out    vl_logic_vector;
        ctrl_out        : out    vl_logic_vector;
        x_we            : out    vl_logic;
        x_byte_cnt      : out    vl_logic_vector(31 downto 0);
        x_bcnt_we       : out    vl_logic;
        linkup          : out    vl_logic
    );
end rx_50G;
