library verilog;
use verilog.vl_types.all;
entity eth_crc32_gen is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        data_vld        : in     vl_logic;
        data_eop        : in     vl_logic;
        data_sop        : in     vl_logic;
        data_in         : in     vl_logic_vector(255 downto 0);
        data_be         : in     vl_logic_vector(4 downto 0);
        crc_out         : out    vl_logic_vector(31 downto 0);
        crc_vld         : out    vl_logic
    );
end eth_crc32_gen;
