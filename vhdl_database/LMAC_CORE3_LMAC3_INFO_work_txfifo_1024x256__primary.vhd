library verilog;
use verilog.vl_types.all;
entity txfifo_1024x256 is
    generic(
        WIDTH           : integer := 256;
        DEPTH           : integer := 1024;
        PTR             : integer := 10
    );
    port(
        aclr            : in     vl_logic;
        wrclk           : in     vl_logic;
        wrreq           : in     vl_logic;
        data            : in     vl_logic_vector;
        wrfull          : out    vl_logic;
        wrusedw         : out    vl_logic_vector;
        rdclk           : in     vl_logic;
        rdreq           : in     vl_logic;
        q               : out    vl_logic_vector;
        rdempty         : out    vl_logic
    );
end txfifo_1024x256;
