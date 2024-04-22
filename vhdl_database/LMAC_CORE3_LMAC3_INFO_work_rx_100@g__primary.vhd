library verilog;
use verilog.vl_types.all;
entity rx_100G is
    generic(
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
        data_in         : in     vl_logic_vector(255 downto 0);
        ctrl_in         : in     vl_logic_vector(31 downto 0);
        data_out        : out    vl_logic_vector(255 downto 0);
        ctrl_out        : out    vl_logic_vector(39 downto 0);
        x_we            : out    vl_logic;
        linkup          : out    vl_logic
    );
end rx_100G;
