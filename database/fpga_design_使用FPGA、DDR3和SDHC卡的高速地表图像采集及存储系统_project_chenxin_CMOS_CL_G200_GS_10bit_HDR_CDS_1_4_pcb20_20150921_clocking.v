`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 			Gpixel
// Engineer: 			HangWang
// 
// Create Date:    	16:28:29 11/25/2014 
// Module Name:    	clocking
// Project Name: 		GVISION200
// Target Devices: 	Spartan-6 xc6slx150-3fg900
// Tool versions: 	ISE13.1
// Description: 		Generate clocking and reset signal for each part.
// Revision: 
// 		V1.0-First created
//////////////////////////////////////////////////////////////////////////////////
module clocking(clk_50M, rst_n, clk_main,
	clk_lvds_ddr_out_p, clk_lvds_ddr_out_n, clk_col_out, 
	clk_fix, rst_fix_n, clk_rxg, clk_rxio, rst_rx_n,
	clk_txg, clk_txio, tx_strobe, rst_tx_n,
	clk_lvds_sdr_in_p, clk_lvds_sdr_in_n, clk_lvds_ddr_out
	);

// INTERFACE
	input				clk_50M;
	input				clk_lvds_ddr_out_p;
	input				clk_lvds_ddr_out_n;
	input				clk_col_out;
	input				rst_n;
	
	output			clk_main;
	
	output			clk_fix;
	output			rst_fix_n;
	
	output			clk_rxg;
	output			clk_rxio;
	output			rst_rx_n;
	
	output			clk_txg;
	output			clk_txio;
	output			tx_strobe;
	output			rst_tx_n;
	
	output			clk_lvds_sdr_in_p;
	output			clk_lvds_sdr_in_n;
	
	output			clk_lvds_ddr_out;
	
/**** SIGNAL ****/

	wire				clk_50M_bufg;
	
// FOR CLK_LVDS_SDR_IN
	wire				dcm_lvds_fb;
	wire				dcm_lvds_locked;
	wire				clk_lvds_sdr_in_unbuf;

// FOR CLK_RX
	wire				clk_lvds_ddr_out_unbuf;
	
	wire				dcm_rx_fb;
	wire				dcm_rx_locked;
	wire				clk_rxio_unbuf;
	

// FOR CLK_TX
	wire				dcm3_fb;
	wire				dcm3_locked;
	wire				clk_dcm3_unbuf;
	wire				rst_dcm3_n;
	reg  [4:0]		rst_dcm3_n_pipe;
	
	wire				dcm4_fb;
	wire				dcm4_locked;
	wire				clk_dcm4_unbuf;
	wire				rst_dcm4_n;
	reg  [4:0]		rst_dcm4_n_pipe;
	
	
	wire				pll_clkfb;
	wire				pll_lock;
	wire				clk_txg_unbuf;
	wire				clk_txio_unbuf;
	
	wire				clk_lvds_sdr_in;
	wire				clk_lvds_sdr;


	
	wire				rst_pll_n;
	reg  [4:0]		rst_pll_n_pipe;

/**** INPUT PROC ****/
	BUFG	BUFG_INPUT_CLOCK(
		.O		(clk_50M_bufg), 
		.I		(clk_50M)
	);
	
	IBUFDS #(
		.DIFF_TERM		("TRUE"),
		.IOSTANDARD		("LVDS_33"))
	INST_CLK_LVDS_DDR_OUT(
		.O					(clk_lvds_ddr_out_unbuf),
		.I					(clk_lvds_ddr_out_p),
		.IB				(clk_lvds_ddr_out_n)
	);
	
/**** OUTPUT PROC ****/	
	assign	clk_fix		=	clk_dcm4_unbuf;
	assign	rst_fix_n 	=	rst_dcm4_n;
	
	gclk_2_gpio gclk_2_gpio_2(
		.gclk_in(clk_50M_bufg), 
		.clk_out(clk_main), 
		.ce(1'b1)
	);	
	
	OBUFDS #(
		.IOSTANDARD("LVDS_33")
	)
	inst_lvds_sdr_in(
		.O(clk_lvds_sdr_in_p),
		.OB(clk_lvds_sdr_in_n),
		.I(clk_lvds_sdr)
	);
	
	BUFG BUFG_INST11(
					.I(clk_lvds_sdr_in_unbuf),
					.O(clk_lvds_sdr_in)
					);
	
	
//////////////////////////////////////////////////////////////////////////////////////////
		gclk_2_sdr_2(
		.clk_lvds_sdr_in(clk_lvds_sdr_in), 
		.clk_lvds_sdr(clk_lvds_sdr), 
		.ce(1'b1)
	);	
//////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	assign	clk_rxg = clk_dcm4_unbuf;
	
	DCM_SP #(
		.CLKDV_DIVIDE	(2.0),
		.CLKFX_DIVIDE	(28),
		.CLKFX_MULTIPLY(10),
		.CLKIN_PERIOD	(20)
	)
	DCM_SP_DCM8(
		.CLK0				(dcm4_fb),
		.CLKFX			(clk_dcm4_unbuf),// 20MHz
		.LOCKED			(dcm4_locked),
		.CLKFB			(dcm4_fb),
		.CLKIN			(clk_50M_bufg),// 50MHz
		.DSSEN			(1'b0),
		.PSCLK			(1'b0),
		.PSEN				(1'b0),
		.PSINCDEC		(1'b0),
		.RST				(~(rst_n))
	);
	assign	rst_dcm4_n = rst_dcm4_n_pipe[0];
	always @(posedge clk_dcm4_unbuf) begin
		if (!(rst_n) || dcm4_locked == 1'b0) begin
			rst_dcm4_n_pipe		<= 5'b00000;
		end
		else begin
			rst_dcm4_n_pipe		<= {1'b1, rst_dcm4_n_pipe[4:1]};
		end
	end
	
	BUFG BUFG_CLK_RXIO(
		.O		(clk_rxio),
		.I		(clk_rxio_unbuf)
	);
	
	assign	rst_rx_n		= rst_dcm4_n;

	BUFG BUFG_INST (
		.O							(clk_txg),
		.I							(clk_txg_unbuf)
	);
						
	BUFPLL # (
		.DIVIDE					(7),
		.ENABLE_SYNC			("TRUE")
	)
	BUFPLL_INST (
		.IOCLK					(clk_txio),
		.LOCK						(),
		.SERDESSTROBE			(tx_strobe),
		.GCLK						(clk_txg),
		.LOCKED					(pll_locked),
		.PLLIN					(clk_txio_unbuf)
	);
	
   always @(posedge clk_txg_unbuf) begin
		if ( pll_locked == 1'b0) begin
			rst_pll_n_pipe		<= 5'b00000;
		end
		else begin
			rst_pll_n_pipe		<= {1'b1, rst_pll_n_pipe[4:1]};
		end
	end
	
	assign	rst_tx_n		= rst_pll_n_pipe[0];
	
	
	BUFG BUFG_RXLVDS_DDR(
		.O		(clk_lvds_ddr_out),
		.I		(clk_lvds_ddr_out_unbuf)
	);	
	

	
	

/**** LVDS_SDR_IN_CLK ****/
	DCM_SP #(
		.CLKDV_DIVIDE	(2.0),
		.CLKFX_DIVIDE	(1),
		.CLKFX_MULTIPLY(3),
		.CLKIN_PERIOD	(20)
	)
	DCM_SP_DCM4(
		.CLK0				(dcm_lvds_fb),
		.CLKFX			(clk_lvds_sdr_in_unbuf),//////	150MHz
		.LOCKED			(dcm_lvds_locked),
		.CLKFB			(dcm_lvds_fb),
		.CLKIN			(clk_50M_bufg),
		.DSSEN			(1'b0),
		.PSCLK			(1'b0),
		.PSEN				(1'b0),
		.PSINCDEC		(1'b0),
		.RST				(~rst_n)
	);
	
	
/**** RX_CLK ****/
	DCM_SP #(
		.CLKDV_DIVIDE	(2.0),
		.CLKFX_DIVIDE	(1),
		.CLKFX_MULTIPLY(6),
		.CLKIN_PERIOD	(20)
	)
	DCM_SP_DCM2(
		.CLK0				(dcm_rx_fb),
		.CLKFX			(clk_rxio_unbuf),
		.LOCKED			(dcm_rx_locked),
		.CLKFB			(dcm_rx_fb),
		.CLKIN			(clk_50M_bufg),
		.DSSEN			(1'b0),
		.PSCLK			(1'b0),
		.PSEN				(1'b0),
		.PSINCDEC		(1'b0),
		.RST				(~rst_n)
	);


/**** TX_CLK ****/
	DCM_SP #(
		.CLKDV_DIVIDE	(2.0),
		.CLKFX_DIVIDE	(2),
		.CLKFX_MULTIPLY(2),
		.CLKIN_PERIOD	(20)
	)
	DCM_SP_DCM3(
		.CLK0				(dcm3_fb),
		.CLKFX			(clk_dcm3_unbuf),// 50MHz
		.LOCKED			(dcm3_locked),
		.CLKFB			(dcm3_fb),
		.CLKIN			(clk_50M_bufg),// 50MHz
		.DSSEN			(1'b0),
		.PSCLK			(1'b0),
		.PSEN				(1'b0),
		.PSINCDEC		(1'b0),
		.RST				(~(rst_n))
	);

	assign	rst_dcm3_n = rst_dcm3_n_pipe[0];
	always @(posedge clk_dcm3_unbuf) begin
		if (!(rst_n) || dcm3_locked == 1'b0) begin
			rst_dcm3_n_pipe		<= 5'b00000;
		end
		else begin
			rst_dcm3_n_pipe		<= {1'b1, rst_dcm3_n_pipe[4:1]};
		end
	end

	PLL_BASE #(
		.CLKFBOUT_MULT			(21),
		.CLKOUT0_DIVIDE		(2),
		.CLKOUT1_DIVIDE		(14),
		.CLKIN_PERIOD			(20),
		.CLK_FEEDBACK			("CLKFBOUT")
	)
	PLL_BASE_INST (
		.CLKFBOUT				(pll_clkfb),
		.CLKOUT0					(clk_txio_unbuf),// 350MHz
		.CLKOUT1					(clk_txg_unbuf),	// 50MHz
		.CLKOUT2					(),
		.CLKOUT3					(),
		.CLKOUT4					(),
		.CLKOUT5					(),
		.LOCKED					(pll_locked),
		.CLKFBIN					(pll_clkfb),
		.CLKIN					(clk_col_out),// 50MHz
		.RST						(~rst_dcm3_n)
	);
	
	
endmodule
