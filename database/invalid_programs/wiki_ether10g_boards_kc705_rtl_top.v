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
	// SI570 user clock (input 156.25MHz)
	input wire si570_refclk_p,
	input wire si570_refclk_n,
	// USER SMA GPIO clock (output to USER SMA clock)
	output wire user_sma_gpio_p,
	output wire user_sma_gpio_n,
	// SMA MGT reference clock (input from USER SMA GPIO for SFP+ module)
	input wire sma_mgt_refclk_p,
	input wire sma_mgt_refclk_n,
	output wire xphy_txp, 
	output wire xphy_txn, 
	input wire xphy_rxp, 
	input wire xphy_rxn,
	output wire sfp_tx_disable,
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

wire [11:0]     device_temp;
wire	 	clk50;
reg [1:0]       clk_divide = 2'b00;


always @(posedge clk_ref_200)
	clk_divide  <= clk_divide + 1'b1;

BUFG buffer_clk50 (
	.I    (clk_divide[1]),
	.O    (clk50    )
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
	.O(user_sma_gpio_p),
	.OB(user_sma_gpio_n)
);


// -------------------
// -- Local Signals --
// -------------------

// Xilinx Hard Core Instantiation

wire		clk156;

wire [63:0]	xgmii_txd;
wire [7:0]	xgmii_txc;
wire [63:0]	xgmii_rxd;
wire [7:0]	xgmii_rxc;
  
wire [7:0]	xphy_status;
  

wire		nw_reset;
wire		txusrclk;
wire		txusrclk2;
wire		txclk322;
wire		areset_refclk_bufh;
wire		areset_clk156;
wire		mmcm_locked_clk156;
wire		gttxreset_txusrclk2;
wire		gttxreset;
wire		gtrxreset;
wire		txuserrdy;
wire		qplllock;
wire		qplloutclk;
wire		qplloutrefclk;
wire		qplloutclk1;
wire		qplloutclk2;
wire		qplloutrefclk1;
wire		qplloutrefclk2;
wire		reset_counter_done; 
wire		nw_reset_i;
wire		xphy_tx_resetdone;


  
//- Network Path signal declarations
wire [4:0]	xphy_prtad;
wire		xphy_signal_detect;
  

wire		xphyrefclk_i;    
wire		dclk_i;		     

wire		gt_pma_resetout_i;
wire		gt_pcs_resetout_i;	 
wire		gt_drpen_i;		
wire		gt_drpwe_i;		
wire [15:0]	gt_drpaddr_i;	      
wire [15:0]	gt_drpdi_i;		
wire [15:0]	gt_drpdo_i;		
wire		gt_drprdy_i;	       
wire		gt_resetdone_i;	    
wire [31:0]	gt_txd_i;		  
wire [7:0]	gt_txc_i;		  
wire [31:0]	gt_rxd_i;		  
wire [7:0]	gt_rxc_i;		  
wire [2:0]	gt_loopback_i;	     
wire		gt_txclk322_i;	     
wire		gt_rxclk322_i;	     
  
// ---------------
// Clock and Reset
// ---------------

wire		gt_pma_resetout;
wire		gt_pcs_resetout;
wire		gt_drpen;
wire		gt_drpwe;
wire [15:0]	gt_drpaddr;
wire [15:0]	gt_drpdi;
wire [15:0]	gt_drpdo;
wire		gt_drprdy;
wire		gt_resetdone;
wire [63:0]	gt_txd;
wire [7:0]	gt_txc;
wire [63:0]	gt_rxd;
wire [7:0]	gt_rxc;
wire [2:0]	gt_loopback;

// ---------------
// GT0 instance
// ---------------

assign xphy_prtad  = 5'd0;
assign xphy_signal_detect = 1'b1;
assign nw_reset = nw_reset_i;

`ifdef SIMULATION
	wire sim_speedup_control = 1'b1;
`else
	wire sim_speedup_control = 1'b0;
`endif
 
network_path network_path_inst_0 (
	//XGEMAC PHY IO
	.txusrclk(txusrclk),
	.txusrclk2(txusrclk2),
	.txclk322(txclk322),
	.areset_refclk_bufh(areset_refclk_bufh),
	.areset_clk156(areset_clk156),
	.mmcm_locked_clk156(mmcm_locked_clk156),
	.gttxreset_txusrclk2(gttxreset_txusrclk2),
	.gttxreset(gttxreset),
	.gtrxreset(gtrxreset),
	.txuserrdy(txuserrdy),
	.qplllock(qplllock),
	.qplloutclk(qplloutclk),
	.qplloutrefclk(qplloutrefclk),
	.reset_counter_done(reset_counter_done), 
	.txp(xphy_txp),
	.txn(xphy_txn),
	.rxp(xphy_rxp),
	.rxn(xphy_rxn),
	.tx_resetdone(xphy_tx_resetdone),
    
	.signal_detect(xphy_signal_detect),
	.tx_fault(1'b0),
	.prtad(xphy_prtad),
	.xphy_status(xphy_status),
	.clk156(clk156),
	.soft_reset(1'b0),
	.sys_rst((sys_rst & ~mmcm_locked_clk156)),
	.nw_rst_out(nw_reset_i),   
	.dclk(dclk_i), 
	.xgmii_txd(xgmii_txd),
	.xgmii_txc(xgmii_txc),
	.xgmii_rxd(xgmii_rxd),
	.xgmii_rxc(xgmii_rxc),
	.sim_speedup_control(sim_speedup_control),
`ifdef BOARD_REV10
	.polarity(1'b1)	// 1:KC705 Rev.1.0, see http://japan.xilinx.com/support/answers/46614.html
`else
	.polarity(1'b0)	// 0:KC705 Rev.1.1-
`endif
); 

xgbaser_gt_same_quad_wrapper xgbaser_gt_wrapper_inst_0 (
	.areset(sys_rst),
`ifdef USE_SI5324
	.refclk_p(xphy_refclk_clk_p),
	.refclk_n(xphy_refclk_clk_n),
`else
	.refclk_p(sma_mgt_refclk_p),
	.refclk_n(sma_mgt_refclk_n),
`endif
	.txclk322(txclk322),
	.gt0_tx_resetdone(xphy_tx_resetdone),
	.gt1_tx_resetdone(),

	.areset_refclk_bufh(areset_refclk_bufh),
	.areset_clk156(areset_clk156),
	.mmcm_locked_clk156(mmcm_locked_clk156),
	.gttxreset_txusrclk2(gttxreset_txusrclk2),
	.gttxreset(gttxreset),
	.gtrxreset(gtrxreset),
	.txuserrdy(txuserrdy),
	.reset_counter_done(reset_counter_done),
	.txusrclk(txusrclk),
	.txusrclk2(txusrclk2),
	.clk156(clk156),
	.dclk(dclk_i),
	.qpllreset(),
	.qplllock(qplllock),
	.qplloutclk(qplloutclk), 
	.qplloutrefclk(qplloutrefclk) 
);

// ----------------------
// -- User Application --
// ----------------------

app app_inst (
	.sys_rst(sys_rst),
	// XGMII interface
	.xgmii_clk(clk156),
	.xgmii_txd(xgmii_txd),
	.xgmii_txc(xgmii_txc),
	.xgmii_rxd(xgmii_rxd),
	.xgmii_rxc(xgmii_rxc),
	.xphy_status(xphy_status),
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


//- Tie off related to SFP+
assign sfp_tx_disable = 1'b1;	// SFP port enable

endmodule
`default_nettype wire
