library verilog;
use verilog.vl_types.all;
entity fmac_fifo4Kx32 is
    generic(
        WIDTH           : integer := 32;
        DEPTH           : integer := 4096;
        PTR             : integer := 12
    );
    port(
        aclr            : in     vl_logic;
        wrclk           : in     vl_logic;
        wrreq           : in     vl_logic;
        data            : in     vl_logic_vector;
        wrfull          : out    vl_logic;
        wrempty         : out    vl_logic;
        wrusedw         : out    vl_logic_vector;
        rdclk           : in     vl_logic;
        rdreq           : in     vl_logic;
        q               : out    vl_logic_vector;
        rdempty         : out    vl_logic;
        rdusedw         : out    vl_logic_vector;
        rdfull          : out    vl_logic
    );
end fmac_fifo4Kx32;
