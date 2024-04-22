library verilog;
use verilog.vl_types.all;
entity br_sfifo4x32 is
    generic(
        WIDTH           : integer := 32;
        DEPTH           : integer := 4;
        PTR             : integer := 2
    );
    port(
        aclr            : in     vl_logic;
        wrclk           : in     vl_logic;
        wrreq           : in     vl_logic;
        data            : in     vl_logic_vector;
        wrfull          : out    vl_logic;
        rdclk           : in     vl_logic;
        rdreq           : in     vl_logic;
        q               : out    vl_logic_vector;
        rdempty         : out    vl_logic;
        rdusedw         : out    vl_logic_vector
    );
end br_sfifo4x32;
