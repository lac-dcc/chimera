library verilog;
use verilog.vl_types.all;
entity memory_wr_module is
    generic(
        ADDR_WIDTH      : integer := 32;
        DATA_WIDTH      : integer := 256
    );
    port(
        tx_mac_aclk     : in     vl_logic;
        \reset_\        : in     vl_logic;
        mem_axis_wctrl  : out    vl_logic_vector(15 downto 0);
        mem_axis_wdata  : out    vl_logic_vector;
        mem_wr_address  : in     vl_logic_vector(31 downto 0)
    );
end memory_wr_module;
