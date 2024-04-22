library verilog;
use verilog.vl_types.all;
entity phy_emulator_100G is
    port(
        x_clk           : in     vl_logic;
        \reset_\        : in     vl_logic;
        fmac_speed      : in     vl_logic_vector(2 downto 0);
        rx_pkt_gen_sel  : in     vl_logic;
        cgmii_txd       : in     vl_logic_vector(255 downto 0);
        cgmii_txc       : in     vl_logic_vector(31 downto 0);
        cgmii_rxd       : out    vl_logic_vector(255 downto 0);
        cgmii_rxc       : out    vl_logic_vector(31 downto 0);
        test            : out    vl_logic
    );
end phy_emulator_100G;
