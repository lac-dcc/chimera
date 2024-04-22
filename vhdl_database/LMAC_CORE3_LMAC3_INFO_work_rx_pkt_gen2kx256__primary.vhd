library verilog;
use verilog.vl_types.all;
entity rx_pkt_gen2kx256 is
    generic(
        DATAWIDTH       : integer := 256;
        ADDRWIDTH       : integer := 11;
        ADDRDEPTH       : integer := 2048
    );
    port(
        data            : in     vl_logic_vector;
        rdaddress       : in     vl_logic_vector;
        clock           : in     vl_logic;
        wraddress       : in     vl_logic_vector;
        wren            : in     vl_logic;
        q               : out    vl_logic_vector
    );
end rx_pkt_gen2kx256;
