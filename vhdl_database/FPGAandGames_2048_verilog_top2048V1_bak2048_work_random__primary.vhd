library verilog;
use verilog.vl_types.all;
entity random is
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        ran2            : out    vl_logic_vector(15 downto 0);
        ran3            : out    vl_logic_vector(23 downto 0);
        ran4            : out    vl_logic_vector(31 downto 0)
    );
end random;
