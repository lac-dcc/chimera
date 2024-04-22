library verilog;
use verilog.vl_types.all;
entity br_pre_ctrl_fifo1024x40 is
    generic(
        WIDTH           : integer := 40;
        DEPTH           : integer := 1024;
        PTR             : integer := 10
    );
    port(
        aclr            : in     vl_logic;
        wrclk           : in     vl_logic;
        wrreq           : in     vl_logic;
        data            : in     vl_logic_vector;
        full            : out    vl_logic;
        rdclk           : in     vl_logic;
        rdreq           : in     vl_logic;
        q               : out    vl_logic_vector;
        empty           : out    vl_logic;
        usedw           : out    vl_logic_vector
    );
end br_pre_ctrl_fifo1024x40;
