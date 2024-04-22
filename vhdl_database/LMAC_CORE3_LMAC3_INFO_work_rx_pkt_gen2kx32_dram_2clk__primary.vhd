library verilog;
use verilog.vl_types.all;
entity rx_pkt_gen2kx32_dram_2clk is
    generic(
        ADDR_DEPTH      : integer := 2048;
        DATA_WIDTH      : integer := 32;
        ADDR_WIDTH      : integer := 11
    );
    port(
        clk_a           : in     vl_logic;
        addr_a          : in     vl_logic_vector;
        din_a           : in     vl_logic_vector;
        en_a            : in     vl_logic;
        we_a            : in     vl_logic;
        dout_a          : out    vl_logic_vector;
        clk_b           : in     vl_logic;
        addr_b          : in     vl_logic_vector;
        din_b           : in     vl_logic_vector;
        en_b            : in     vl_logic;
        we_b            : in     vl_logic;
        dout_b          : out    vl_logic_vector
    );
end rx_pkt_gen2kx32_dram_2clk;
