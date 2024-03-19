module CLK_MANAGE(
//--------------------------------input clk_ Manage Module-------------------------
input FPGA_GMII_REFCLK,//125M
input PCIE_REFCK,//100M
input CLK_FPGA_REFCK,//125M
//--------------------------------genarate clk_ Manage Module-------------------------
output app_clk,
output reconfig_clk,
output spi_refclk);

card1_pll card1_pll(//genarate clk for right side of port_ip core
.inclk0			(CLK_FPGA_REFCK),//156.25M
.c0				(app_clk),//125M
.c2				(reconfig_clk),
.c3				(spi_refclk),
.locked			()
);

endmodule 