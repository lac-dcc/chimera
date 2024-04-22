library verilog;
use verilog.vl_types.all;
entity memory_rd_module is
    generic(
        ADDR_WIDTH      : integer := 32;
        DATA_WIDTH      : integer := 256;
        BCNT_WIDTH      : integer := 32
    );
    port(
        rx_mac_aclk     : in     vl_logic;
        \reset_\        : in     vl_logic;
        mem_axis_rdata  : in     vl_logic_vector;
        mem_rd_address  : in     vl_logic_vector;
        mem_axis_rstrb  : in     vl_logic_vector;
        rd_done         : in     vl_logic;
        rx_axis_mac_tvalid: in     vl_logic;
        rx_axis_mac_tlen: in     vl_logic_vector(31 downto 0);
        rx_pkt_gen_sel  : in     vl_logic;
        mem_rd_start_address: out    vl_logic_vector;
        pkt_cnt         : out    vl_logic_vector
    );
end memory_rd_module;
