library verilog;
use verilog.vl_types.all;
entity register_interface is
    generic(
        RIF_RD_IDLE     : integer := 1;
        RIF_RD_ADDRESS  : integer := 2;
        RIF_RD_WAIT     : integer := 4;
        RIF_RD_DATA     : integer := 8;
        RIF_RD_DONE     : integer := 16
    );
    port(
        reg_clk         : in     vl_logic;
        \reset_\        : in     vl_logic;
        host_addr       : out    vl_logic_vector(15 downto 0);
        reg_rd_start    : out    vl_logic;
        reg_rd_done_out : in     vl_logic;
        mac_regdout     : in     vl_logic_vector(31 downto 0);
        start           : in     vl_logic;
        address         : in     vl_logic_vector(15 downto 0)
    );
end register_interface;
