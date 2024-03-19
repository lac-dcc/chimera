`timescale 1ps / 1ps

//`define SIMULATION_ILA

module top (
	input  wire FPGA_SYSCLK_P,
	input  wire FPGA_SYSCLK_N,
	inout  wire I2C_FPGA_SCL,
	inout  wire I2C_FPGA_SDA,
	output wire [7:0] LED,

	// Ethernet
	input  wire SFP_CLK_P,
	input  wire SFP_CLK_N,
	output wire SFP_REC_CLK_P,
	output wire SFP_REC_CLK_N,
	input  wire SFP_CLK_ALARM_B,

	// Ethernet (ETH0)
	input  wire ETH0_TX_P,
	input  wire ETH0_TX_N,
	output wire ETH0_RX_P,
	output wire ETH0_RX_N,
	input  wire ETH0_TX_FAULT,
	input  wire ETH0_RX_LOS,
	output wire ETH0_TX_DISABLE,
	// Ethernet (ETH1)
	input  wire ETH1_TX_P,
	input  wire ETH1_TX_N,
	output wire ETH1_RX_P,
	output wire ETH1_RX_N,
	input  wire ETH1_TX_FAULT,
	input  wire ETH1_RX_LOS,
	output wire ETH1_TX_DISABLE 
	// SRAM Interface
	//input       [0:0]     qdriip_cq_p,  
	//input       [0:0]     qdriip_cq_n,
	//input       [35:0]    qdriip_q,
	//inout wire  [0:0]     qdriip_k_p,
	//inout wire  [0:0]     qdriip_k_n,
	//output wire [35:0]    qdriip_d,
	//output wire [18:0]    qdriip_sa,
	//output wire           qdriip_w_n,
	//output wire           qdriip_r_n,
	//output wire [3:0]     qdriip_bw_n,
	//output wire           qdriip_dll_off_n
);


/*
 *  Core Clocking 
 */
wire clk200;
IBUFDS IBUFDS_clk200 (
	.I   (FPGA_SYSCLK_P),
	.IB  (FPGA_SYSCLK_N),
	.O   (clk200)
);

wire clk100;
reg clock_divide = 1'b0;
always @(posedge clk200)
	clock_divide <= ~clock_divide;

BUFG buffer_clk100 (
	.I  (clock_divide),
	.O  (clk100)
);

/*
 *  Core Reset 
 *  ***FPGA specified logic
 */
reg [13:0] cold_counter = 14'd0;
reg        sys_rst;
always @(posedge clk200) 
	if (cold_counter != 14'h3fff) begin
		cold_counter <= cold_counter + 14'd1;
		sys_rst <= 1'b1;
	end else
		sys_rst <= 1'b0;
/*
 *  Ethernet Top Instance
 */

eth_top u_eth_top (
	.clk100             (clk100),
	.clk200             (clk200),
	.sys_rst            (sys_rst),
	.debug              (LED),
	
	/* XGMII */
	.SFP_CLK_P          (SFP_CLK_P),
	.SFP_CLK_N          (SFP_CLK_N),
	.SFP_REC_CLK_P      (SFP_REC_CLK_P),
	.SFP_REC_CLK_N      (SFP_REC_CLK_N),

	.ETH0_TX_P          (ETH0_TX_P),
	.ETH0_TX_N          (ETH0_TX_N),
	.ETH0_RX_P          (ETH0_RX_P),
	.ETH0_RX_N          (ETH0_RX_N),

	.I2C_FPGA_SCL       (I2C_FPGA_SCL),
	.I2C_FPGA_SDA       (I2C_FPGA_SDA),

	.SFP_CLK_ALARM_B    (SFP_CLK_ALARM_B),

	.ETH0_TX_FAULT      (ETH0_TX_FAULT ),
	.ETH0_RX_LOS        (ETH0_RX_LOS   ),
	.ETH0_TX_DISABLE    (ETH0_TX_DISABLE),
	
	.ETH1_TX_P          (ETH1_TX_P),
	.ETH1_TX_N          (ETH1_TX_N),
	.ETH1_RX_P          (ETH1_RX_P),
	.ETH1_RX_N          (ETH1_RX_N),
	.ETH1_TX_FAULT      (ETH1_TX_FAULT ),
	.ETH1_RX_LOS        (ETH1_RX_LOS   ),
	.ETH1_TX_DISABLE    (ETH1_TX_DISABLE) 
);

endmodule

