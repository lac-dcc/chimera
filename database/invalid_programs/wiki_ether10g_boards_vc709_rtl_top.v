`timescale 1ps / 1ps
`default_nettype none
`include "setup.v"

module top (
	// 200MHz reference clock input
	input wire clk_ref_p,
	input wire clk_ref_n,
	//-SI5324 I2C programming interface
	inout wire i2c_clk,
	inout wire i2c_data,
	output wire i2c_mux_rst_n,
	output wire si5324_rst_n,
	// 156.25 MHz clock in
	input wire xphy_refclk_clk_p,
	input wire xphy_refclk_clk_n,
	// 10G PHY ports
	output wire xphy0_txp,
	output wire xphy0_txn,
	input wire xphy0_rxp,
	input wire xphy0_rxn,
	output wire xphy1_txp,
	output wire xphy1_txn,
	input wire xphy1_rxp,
	input wire xphy1_rxn,
	output wire xphy2_txp,
	output wire xphy2_txn,
	input wire xphy2_rxp,
	input wire xphy2_rxn,
	output wire xphy3_txp,
	output wire xphy3_txn,
	input wire xphy3_rxp,
	input wire xphy3_rxn,
	output wire [3:0] sfp_tx_disable,   
	// SI570 user clock (input 156.25MHz)
	input wire si570_refclk_p,
	input wire si570_refclk_n,
	// USER SMA GPIO clock (output to USER SMA clock)
	output wire user_sma_clock_p,
	output wire user_sma_clock_n,
	// SMA MGT reference clock (input from USER SMA GPIO for SFP+ module)
	input wire sma_mgt_refclk_p,
	input wire sma_mgt_refclk_n,

	// BUTTON
	input wire button_n,
	input wire button_s,
	input wire button_w,
	input wire button_e,
	input wire button_c,
	// DIP SW
	input wire [3:0] dipsw,
	// Diagnostic LEDs
	output wire [7:0] led
 );

// Clock and Reset
wire clk_ref_200, clk_ref_200_i;
wire sys_rst;

reg [7:0] cold_counter = 8'h0;
reg cold_reset = 1'b0;

always @(posedge clk_ref_200) begin
	if (cold_counter != 8'hff) begin
		cold_reset <= 1'b1;
		cold_counter <= cold_counter + 8'd1;
	end else
		cold_reset <= 1'b0;
end

assign sys_rst = cold_reset; // | button_c;

// -------------------
// -- Local Signals --
// -------------------
  
// Ethernet related signal declarations
wire		xphyrefclk_i;
wire		xgemac_clk_156;
wire		dclk_i;
wire		clk156_25; 
wire		xphy_gt0_tx_resetdone;
wire		xphy_gt1_tx_resetdone;
wire		xphy_gt2_tx_resetdone;
wire		xphy_gt3_tx_resetdone;
wire		xphy_tx_fault;
   
wire [63:0]	xgmii_txd_0, xgmii_txd_1, xgmii_txd_2, xgmii_txd_3;
wire [7:0]	xgmii_txc_0, xgmii_txc_1, xgmii_txc_2, xgmii_txc_3;
wire [63:0]	xgmii_rxd_0, xgmii_rxd_1, xgmii_rxd_2, xgmii_rxd_3;
wire [7:0]	xgmii_rxc_0, xgmii_rxc_1, xgmii_rxc_2, xgmii_rxc_3;

wire [3:0]	xphy_tx_disable;
wire		xphy_gt_txclk322;
wire		xphy_gt_txusrclk;
wire		xphy_gt_txusrclk2;
wire		xphy_gt_qplllock;
wire		xphy_gt_qplloutclk;
wire		xphy_gt_qplloutrefclk;
wire		xphy_gt_txuserrdy;
wire		xphy_areset_clk_156_25;
wire		xphy_reset_counter_done;
wire		xphy_gttxreset;
wire		xphy_gtrxreset;


wire [4:0]	xphy0_prtad;
wire		xphy0_signal_detect;
wire [7:0]	xphy0_status;

wire [4:0]	xphy1_prtad;
wire		xphy1_signal_detect;
wire [7:0]	xphy1_status;

wire [4:0]	xphy2_prtad;
wire		xphy2_signal_detect;
wire [7:0]	xphy2_status;

wire [4:0]	xphy3_prtad;
wire		xphy3_signal_detect;
wire [7:0]	xphy3_status;

// ---------------
// Clock and Reset
// ---------------

// Register to improve timing

IBUFGDS # (
	.DIFF_TERM    ("TRUE"),
	.IBUF_LOW_PWR ("FALSE")
) diff_clk_200 (
	.I    (clk_ref_p  ),
	.IB   (clk_ref_n  ),
	.O    (clk_ref_200_i )  
);

BUFG u_bufg_clk_ref (
	.O (clk_ref_200),
	.I (clk_ref_200_i)
);

//- Clocking
wire [11:0]	device_temp;
wire		clk50;
reg [1:0]	clk_divide = 2'b00;


always @(posedge clk_ref_200)
	clk_divide  <= clk_divide + 1'b1;

BUFG buffer_clk50 (
	.I    (clk_divide[1]),
	.O    (clk50	)
);

`ifdef USE_SI5324
//-SI 5324 programming
clock_control cc_inst (
	.i2c_clk(i2c_clk),
	.i2c_data(i2c_data),
	.i2c_mux_rst_n(i2c_mux_rst_n),
	.si5324_rst_n(si5324_rst_n),
	.rst(sys_rst),
	.clk50(clk50)
);
`endif
wire clksi570;
IBUFDS IBUFDS_0 (
	.I(si570_refclk_p),
	.IB(si570_refclk_n),
	.O(clksi570)
);
OBUFDS OBUFDS_0 (
	.I(clksi570),
	.O(user_sma_clock_p),
	.OB(user_sma_clock_n)
);

 
`ifdef SIMULATION
// Deliberately not driving to default value or assigning a value
// It will be driven by the simulation testbench by dot reference
wire sim_speedup_control;
`else
wire sim_speedup_control = 1'b0;
`endif
 
//- Network Path instance #0
assign xphy0_prtad = 5'd0;
assign xphy0_signal_detect  = 1'b1;
assign xphy_tx_fault = 1'b0;

network_path_shared network_path_inst_0 (
`ifdef USE_SI5324
	.xphy_refclk_p(xphy_refclk_clk_p),
	.xphy_refclk_n(xphy_refclk_clk_n),
`else
	.xphy_refclk_p(sma_mgt_refclk_p),
	.xphy_refclk_n(sma_mgt_refclk_n),
`endif
	.xphy_txp(xphy0_txp),
	.xphy_txn(xphy0_txn),
	.xphy_rxp(xphy0_rxp),
	.xphy_rxn(xphy0_rxn),
	.txusrclk(xphy_gt_txusrclk),
	.txusrclk2(xphy_gt_txusrclk2),
	.tx_resetdone(xphy_gt0_tx_resetdone),
	.xgmii_txd(xgmii_txd_0),
	.xgmii_txc(xgmii_txc_0),
	.xgmii_rxd(xgmii_rxd_0),
	.xgmii_rxc(xgmii_rxc_0),
	.areset_clk156(xphy_areset_clk_156_25),
	.gttxreset(xphy_gttxreset),
	.gtrxreset(xphy_gtrxreset),
	.txuserrdy(xphy_gt_txuserrdy),
	.qplllock(xphy_gt_qplllock),
	.qplloutclk(xphy_gt_qplloutclk),
	.qplloutrefclk(xphy_gt_qplloutrefclk),
	.reset_counter_done(xphy_reset_counter_done),
	.dclk(xgemac_clk_156),  
	.xphy_status(xphy0_status),
	.xphy_tx_disable(xphy_tx_disable[0]),
	.signal_detect(xphy0_signal_detect),
	.tx_fault(xphy_tx_fault), 
	.prtad(xphy0_prtad),
	.clk156(xgemac_clk_156),
	.sys_rst(sys_rst),
	.sim_speedup_control(sim_speedup_control)
); 

`ifdef ENABLE_XGMII1
//- Network Path instance #1
assign xphy1_prtad = 5'd1;
assign xphy1_signal_detect = 1'b1;

network_path network_path_inst_1 (
	.xphy_txp(xphy1_txp),
	.xphy_txn(xphy1_txn),
	.xphy_rxp(xphy1_rxp),
	.xphy_rxn(xphy1_rxn),
	.txusrclk(xphy_gt_txusrclk),
	.txusrclk2(xphy_gt_txusrclk2),
	.tx_resetdone(xphy_gt1_tx_resetdone),
	.xgmii_txd(xgmii_txd_1),
	.xgmii_txc(xgmii_txc_1),
	.xgmii_rxd(xgmii_rxd_1),
	.xgmii_rxc(xgmii_rxc_1),
	.areset_clk156(xphy_areset_clk_156_25),
	.gttxreset(xphy_gttxreset),
	.gtrxreset(xphy_gtrxreset),
	.txuserrdy(xphy_gt_txuserrdy),
	.qplllock(xphy_gt_qplllock),
	.qplloutclk(xphy_gt_qplloutclk),
	.qplloutrefclk(xphy_gt_qplloutrefclk),
	.reset_counter_done(xphy_reset_counter_done),
	.dclk(xgemac_clk_156),  
	.xphy_status(xphy1_status),
	.xphy_tx_disable(xphy_tx_disable[1]),
	.signal_detect(xphy1_signal_detect),
	.tx_fault(xphy_tx_fault), 
	.prtad(xphy1_prtad),
	.clk156(xgemac_clk_156),
	.sys_rst(sys_rst),
	.sim_speedup_control(sim_speedup_control)
  ); 
`endif

`ifdef ENABLE_XGMII2
//- Network Path instance #2
assign xphy2_prtad = 5'd2;
assign xphy2_signal_detect = 1'b1;

network_path network_path_inst_2 (
	.xphy_txp(xphy2_txp),
	.xphy_txn(xphy2_txn),
	.xphy_rxp(xphy2_rxp),
	.xphy_rxn(xphy2_rxn),
	.txusrclk(xphy_gt_txusrclk),
	.txusrclk2(xphy_gt_txusrclk2),
	.tx_resetdone(xphy_gt2_tx_resetdone),
	.xgmii_txd(xgmii_txd_2),
	.xgmii_txc(xgmii_txc_2),
	.xgmii_rxd(xgmii_rxd_2),
	.xgmii_rxc(xgmii_rxc_2),
	.areset_clk156(xphy_areset_clk_156_25),
	.gttxreset(xphy_gttxreset),
	.gtrxreset(xphy_gtrxreset),
	.txuserrdy(xphy_gt_txuserrdy),
	.qplllock(xphy_gt_qplllock),
	.qplloutclk(xphy_gt_qplloutclk),
	.qplloutrefclk(xphy_gt_qplloutrefclk),
	.reset_counter_done(xphy_reset_counter_done),
	.dclk(xgemac_clk_156),  
	.xphy_status(xphy2_status),
	.xphy_tx_disable(xphy_tx_disable[2]),
	.signal_detect(xphy2_signal_detect),
	.tx_fault(xphy_tx_fault), 
	.prtad(xphy2_prtad),
	.clk156(xgemac_clk_156),
	.sys_rst(sys_rst),
	.sim_speedup_control(sim_speedup_control)
  ); 
`endif

`ifdef ENABLE_XGMII3
//- Network Path instance #3
assign xphy3_prtad = 5'd3;
assign xphy3_signal_detect = 1'b1;

network_path network_path_inst_3 (
	.xphy_txp(xphy3_txp),
	.xphy_txn(xphy3_txn),
	.xphy_rxp(xphy3_rxp),
	.xphy_rxn(xphy3_rxn),
	.txusrclk(xphy_gt_txusrclk),
	.txusrclk2(xphy_gt_txusrclk2),
	.tx_resetdone(xphy_gt3_tx_resetdone),
	.xgmii_txd(xgmii_txd_3),
	.xgmii_txc(xgmii_txc_3),
	.xgmii_rxd(xgmii_rxd_3),
	.xgmii_rxc(xgmii_rxc_3),
	.areset_clk156(xphy_areset_clk_156_25),
	.gttxreset(xphy_gttxreset),
	.gtrxreset(xphy_gtrxreset),
	.txuserrdy(xphy_gt_txuserrdy),
	.qplllock(xphy_gt_qplllock),
	.qplloutclk(xphy_gt_qplloutclk),
	.qplloutrefclk(xphy_gt_qplloutrefclk),
	.reset_counter_done(xphy_reset_counter_done),
	.dclk(xgemac_clk_156),  
	.xphy_status(xphy3_status),
	.xphy_tx_disable(xphy_tx_disable[3]),
	.signal_detect(xphy3_signal_detect),
	.tx_fault(xphy_tx_fault), 
	.prtad(xphy3_prtad),
	.clk156(xgemac_clk_156),
	.sys_rst(sys_rst),
	.sim_speedup_control(sim_speedup_control)
); 
`endif

// ----------------------
// -- User Application --
// ----------------------

wire [63:0] xgmii_txd;
wire [7:0] xgmii_txc;
app app_inst (
	.sys_rst(sys_rst),
	// XGMII interface
	.xgmii_clk(xgemac_clk_156),
	.xgmii_txd(xgmii_txd),
	.xgmii_txc(xgmii_txc),
	.xgmii_rxd(xgmii_rxd_0),
	.xgmii_rxc(xgmii_rxc_0),
	.xphy_status(xphy0_status),
	// BUTTON
	.button_n(button_n),
	.button_s(button_s),
	.button_w(button_w),
	.button_e(button_e),
	.button_c(button_c),
	// DIP SW
	.dipsw(dipsw),
	// Diagnostic LEDs
	.led(led)
);

// Combined 10GBASE-R quad link status
//assign led[7:0] = {4'b000, xphy3_status[0], xphy2_status[0], xphy1_status[0], xphy0_status[0]};

//- Disable Laser when unconnected on SFP+
assign sfp_tx_disable = 4'b0000;

assign xgmii_txc_0 = xgmii_txc;
assign xgmii_txd_0 = xgmii_txd;
`ifdef ENABLE_XGMII1
assign xgmii_txc_1 = xgmii_txc;
assign xgmii_txd_1 = xgmii_txd;
`endif
`ifdef ENABLE_XGMII2
assign xgmii_txc_2 = xgmii_txc;
assign xgmii_txd_2 = xgmii_txd;
`endif
`ifdef ENABLE_XGMII3
assign xgmii_txc_3 = xgmii_txc;
assign xgmii_txd_3 = xgmii_txd;
`endif

endmodule
`default_nettype wire
