library verilog;
use verilog.vl_types.all;
entity rx_pkt_gen_100G is
    generic(
        DAT_I           : integer := 1;
        DAT_0           : integer := 2;
        DAT_1           : integer := 4;
        DAT_2           : integer := 8;
        DAT_3           : integer := 128
    );
    port(
        x_clk           : in     vl_logic;
        \reset_\        : in     vl_logic;
        fmac_speed      : in     vl_logic_vector(2 downto 0);
        data_out        : out    vl_logic_vector(255 downto 0);
        ctrl_out        : out    vl_logic_vector(31 downto 0);
        tb_rx_pkt_gen_en: in     vl_logic;
        tb_rx_pkt_gen_addr_offset: in     vl_logic_vector(63 downto 0);
        tb_rx_pkt_gen_read_cnt: in     vl_logic_vector(10 downto 0);
        addr_incr       : out    vl_logic;
        test            : out    vl_logic
    );
end rx_pkt_gen_100G;
