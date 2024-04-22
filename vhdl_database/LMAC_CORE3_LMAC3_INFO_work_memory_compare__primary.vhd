library verilog;
use verilog.vl_types.all;
entity memory_compare is
    generic(
        DATA_WIDTH      : integer := 256;
        BCNT_WIDTH      : integer := 32
    );
    port(
        rx_mac_aclk     : in     vl_logic;
        \reset_\        : in     vl_logic;
        axis_rd_done_st : in     vl_logic;
        pkt_cnt         : in     vl_logic_vector(31 downto 0);
        rx_axis_mac_tvalid: in     vl_logic;
        rx_axis_mac_tbcnt: in     vl_logic_vector;
        rx_axis_mac_tstrb_reg: in     vl_logic_vector
    );
end memory_compare;
