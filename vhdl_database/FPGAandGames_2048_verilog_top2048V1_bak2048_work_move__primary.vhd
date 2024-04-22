library verilog;
use verilog.vl_types.all;
entity move is
    port(
        i3              : in     vl_logic_vector(7 downto 0);
        i2              : in     vl_logic_vector(7 downto 0);
        i1              : in     vl_logic_vector(7 downto 0);
        i0              : in     vl_logic_vector(7 downto 0);
        o3              : out    vl_logic_vector(7 downto 0);
        o2              : out    vl_logic_vector(7 downto 0);
        o1              : out    vl_logic_vector(7 downto 0);
        o0              : out    vl_logic_vector(7 downto 0)
    );
end move;
