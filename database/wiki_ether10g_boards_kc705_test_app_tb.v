`default_nettype none
`timescale 1ps/1ps

module app_tb;
	// 156.25 MHz clock for Ethernet PHY
	reg clk_156;
	initial begin
		clk_156 = 0;
	end

	always #8
		clk_156 = ~clk_156;

	// reset
	reg sys_rst;
	initial begin
		sys_rst = 1;
		#100
		sys_rst = 0;
	end

	// top
	wire [63:0] xgmii_txd;
	wire [7:0] xgmii_txc;
	reg [3:0] dipsw;
	wire [7:0] led;
	app app_inst (
		.sys_rst(sys_rst),
		.xgmii_clk(clk_156),
		.xgmii_txd(xgmii_txd),
		.xgmii_txc(xgmii_txc),
		.xgmii_rxd(xgmii_txd),
		.xgmii_rxc(xgmii_txc),
		.dipsw(dipsw),
		.led(led)
	);
	
	initial begin
		$dumpfile("./app_tb.vcd");
		$dumpvars(0, app_tb);
		#10 dipsw = 4'h0;
		#300
		#10 dipsw = 4'h1;
		#10 dipsw = 4'h2;
		#10 dipsw = 4'h3;
		#10 dipsw = 4'h4;
		#10 dipsw = 4'h5;
		#10 dipsw = 4'h6;
		#10 dipsw = 4'h7;
		#10 dipsw = 4'h8;
		#10 dipsw = 4'h9;
		#10 dipsw = 4'ha;
		#10 dipsw = 4'hb;
		#10 dipsw = 4'hc;
		#10 dipsw = 4'hd;
		#10 dipsw = 4'he;
		#10 dipsw = 4'hf;
		#10 dipsw = 4'h0;
		#1000
		$finish;
	end
endmodule
`default_nettype wire

