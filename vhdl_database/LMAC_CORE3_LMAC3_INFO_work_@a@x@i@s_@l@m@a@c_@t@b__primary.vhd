library verilog;
use verilog.vl_types.all;
entity AXIS_LMAC_TB is
    generic(
        ADDR_WIDTH      : integer := 32;
        DATA_WIDTH      : integer := 256;
        CTRL_WIDTH      : integer := 32;
        DATA_PTR        : integer := 8;
        BCNT_WIDTH      : integer := 64;
        BCNT_PTR        : integer := 2
    );
end AXIS_LMAC_TB;
