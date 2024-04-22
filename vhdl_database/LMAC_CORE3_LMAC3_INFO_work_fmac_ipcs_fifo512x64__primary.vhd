library verilog;
use verilog.vl_types.all;
entity fmac_ipcs_fifo512x64 is
    generic(
        WIDTH           : integer := 64;
        DEPTH           : integer := 512;
        PTR             : integer := 9
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
        rdfull          : out    vl_logic;
        rdempty         : out    vl_logic;
        rdusedw         : out    vl_logic_vector
    );
end fmac_ipcs_fifo512x64;
