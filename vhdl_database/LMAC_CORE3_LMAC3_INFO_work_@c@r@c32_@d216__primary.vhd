library verilog;
use verilog.vl_types.all;
entity CRC32_D216 is
    port(
        data_in         : in     vl_logic_vector(215 downto 0);
        crc_in          : in     vl_logic_vector(31 downto 0);
        crc_en          : in     vl_logic;
        crc_out         : out    vl_logic_vector(31 downto 0);
        rst             : in     vl_logic;
        clk             : in     vl_logic
    );
end CRC32_D216;
