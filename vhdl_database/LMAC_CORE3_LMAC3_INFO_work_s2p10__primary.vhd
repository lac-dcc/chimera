library verilog;
use verilog.vl_types.all;
entity s2p10 is
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
        data_in         : in     vl_logic_vector(63 downto 0);
        ctrl_in         : in     vl_logic_vector(7 downto 0);
        data_out        : out    vl_logic_vector(255 downto 0);
        ctrl_out        : out    vl_logic_vector(31 downto 0);
        linkup          : out    vl_logic;
        x_we            : out    vl_logic;
        x_bcnt_we       : out    vl_logic;
        x_byte_cnt      : out    vl_logic_vector(31 downto 0)
    );
end s2p10;
