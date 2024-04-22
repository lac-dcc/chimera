library verilog;
use verilog.vl_types.all;
entity tx_mac10g_crc32x64 is
    generic(
        IDLE            : integer := 1;
        CALC            : integer := 2;
        WAIT1           : integer := 4
    );
    port(
        clk             : in     vl_logic;
        \rst_\          : in     vl_logic;
        \clr_\          : in     vl_logic;
        bytes           : in     vl_logic_vector(2 downto 0);
        \we_\           : in     vl_logic;
        \last_\         : in     vl_logic;
        cdin            : in     vl_logic_vector(63 downto 0);
        pdin            : in     vl_logic_vector(63 downto 0);
        crc32           : out    vl_logic_vector(31 downto 0);
        \crc32_vld_\    : out    vl_logic
    );
end tx_mac10g_crc32x64;
