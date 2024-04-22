library verilog;
use verilog.vl_types.all;
entity rxrregif_fifo4x32 is
    generic(
        WIDTH           : integer := 32;
        DEPTH           : integer := 4;
        PTR             : integer := 2
    );
    port(
        \reset_\        : in     vl_logic;
        wrclk           : in     vl_logic;
        wren            : in     vl_logic;
        datain          : in     vl_logic_vector;
        wrfull          : out    vl_logic;
        wrempty         : out    vl_logic;
        wrusedw         : out    vl_logic_vector;
        rdclk           : in     vl_logic;
        rden            : in     vl_logic;
        dataout         : out    vl_logic_vector;
        rdfull          : out    vl_logic;
        rdempty         : out    vl_logic;
        rdusedw         : out    vl_logic_vector;
        dbg             : out    vl_logic
    );
end rxrregif_fifo4x32;
