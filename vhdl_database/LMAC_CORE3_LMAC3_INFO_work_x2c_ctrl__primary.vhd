library verilog;
use verilog.vl_types.all;
entity x2c_ctrl is
    generic(
        X2C_IDLE        : integer := 1;
        X2C_BCNT        : integer := 2;
        X2C_WDCNT       : integer := 4;
        X2C_RDDATA      : integer := 8;
        X2C_DONE        : integer := 16
    );
    port(
        clk             : in     vl_logic;
        \reset_\        : in     vl_logic;
        mode_10G        : in     vl_logic;
        mode_25G        : in     vl_logic;
        mode_40G        : in     vl_logic;
        mode_50G        : in     vl_logic;
        mode_100G       : in     vl_logic;
        data_in         : in     vl_logic_vector(255 downto 0);
        ctrl_in         : in     vl_logic_vector(31 downto 0);
        x_byte_cnt      : in     vl_logic_vector(31 downto 0);
        x_bcnt_we       : in     vl_logic;
        x_we            : in     vl_logic;
        data_out        : out    vl_logic_vector(255 downto 0);
        ctrl_out        : out    vl_logic_vector(31 downto 0);
        rd_en           : out    vl_logic
    );
end x2c_ctrl;
