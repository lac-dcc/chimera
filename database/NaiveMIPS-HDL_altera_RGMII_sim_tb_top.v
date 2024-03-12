`timescale 1ns/1ps
`default_nettype none

module tb_top();

wire enet_rx_clk_mac,enet_tx_clk_mac,enet_tx_clk_phy,ENET_GTX_CLK;
reg ENET_RX_CLK = 0;
wire ENET_TX_EN;
wire[3:0]ENET_TX_DATA;

always #(40/2) ENET_RX_CLK = ~ENET_RX_CLK; 


wire eth_pll_locked;
// Ethernet RX PLL
enet_rx_clk_pll enet_rx_clk_pll
(
		.inclk0(ENET_RX_CLK),
		.c0(enet_rx_clk_mac),
		.c1(enet_tx_clk_mac),
		.c2(enet_tx_clk_phy),
//		.c3(eth_sample_clk),
		.locked(eth_pll_locked)
);
ddr_o phy_ckgen
(
		.datain_h(1'b1),
		.datain_l(1'b0),
		.outclock(enet_tx_clk_phy),
		.dataout(ENET_GTX_CLK)
);

reg mac_txen=0;
reg[3:0] mac_txd=0;
altera_tse_rgmii_out1 out1(
    .aclr(0),
    .datain_h(mac_txen),
    .datain_l(mac_txen),
    .outclock(enet_tx_clk_mac),
    .dataout(ENET_TX_EN)
	 
);

altera_tse_rgmii_out4 out4(
    .aclr(0),
    .datain_h(mac_txd),
    .datain_l(mac_txd),
    .outclock(enet_tx_clk_mac),
    .dataout(ENET_TX_DATA)
	 
);

initial begin
	wait(eth_pll_locked==1);
	repeat(10) @(posedge enet_tx_clk_mac);
	mac_txen = 1;
	mac_txd = 4'h5;
	repeat(14)@(posedge enet_tx_clk_mac);
	mac_txd = 4'h5;
	@(posedge enet_tx_clk_mac);
	mac_txd = 4'hD;
	@(posedge enet_tx_clk_mac);
	mac_txen = 0;
	mac_txd = 0;
end

endmodule
