library verilog;
use verilog.vl_types.all;
entity top2048 is
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        keyin           : in     vl_logic_vector(3 downto 0);
        step            : out    vl_logic_vector(7 downto 0);
        score           : out    vl_logic_vector(7 downto 0);
        s15             : out    vl_logic_vector(7 downto 0);
        s14             : out    vl_logic_vector(7 downto 0);
        s13             : out    vl_logic_vector(7 downto 0);
        s12             : out    vl_logic_vector(7 downto 0);
        s11             : out    vl_logic_vector(7 downto 0);
        s10             : out    vl_logic_vector(7 downto 0);
        s9              : out    vl_logic_vector(7 downto 0);
        s8              : out    vl_logic_vector(7 downto 0);
        s7              : out    vl_logic_vector(7 downto 0);
        s6              : out    vl_logic_vector(7 downto 0);
        s5              : out    vl_logic_vector(7 downto 0);
        s4              : out    vl_logic_vector(7 downto 0);
        s3              : out    vl_logic_vector(7 downto 0);
        s2              : out    vl_logic_vector(7 downto 0);
        s1              : out    vl_logic_vector(7 downto 0);
        s0              : out    vl_logic_vector(7 downto 0);
        state           : out    vl_logic_vector(1 downto 0)
    );
end top2048;
