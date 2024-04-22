library verilog;
use verilog.vl_types.all;
entity rif_if_bridge is
    port(
        fmac_clk        : in     vl_logic;
        axis_clk        : in     vl_logic;
        \reset_\        : in     vl_logic;
        host_addr_in    : in     vl_logic_vector(15 downto 0);
        mac_regdout_in  : in     vl_logic_vector(31 downto 0);
        reg_rd_start_in : in     vl_logic;
        reg_rd_done_in  : in     vl_logic;
        host_addr_out   : out    vl_logic_vector(15 downto 0);
        mac_regdout_out : out    vl_logic_vector(31 downto 0);
        reg_rd_start_out: out    vl_logic;
        reg_rd_done_out : out    vl_logic
    );
end rif_if_bridge;
