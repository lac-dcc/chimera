`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 			Gpixel
// Engineer: 			HangWang
// 
// Create Date:    	16:28:29 11/25/2014 
// Module Name:    	odes2ser_7_to_1
// Project Name: 		GVISION200
// Target Devices: 	Spartan-6 xc6slx150-3fg900
// Tool versions: 	ISE13.1
// Description: 		
// Revision: 
// 		V1.0-First created
//////////////////////////////////////////////////////////////////////////////////
module odes2ser_7_to_1(txioclk, txdes2serstrobe, gclk, reset, tx_swap, datain, dataout_p, dataout_n);

	input 		txioclk;
	input 		txdes2serstrobe;
	input 		gclk;
	input 		reset;
	input 		tx_swap;
	input [6:0] datain;
	output 		dataout_p;
	output 		dataout_n;
	
	wire 			dataout_unswap;
	wire 			dataout;
	wire 			master_do;
	wire 			master_to;
	wire 			slave_do;
	wire 			slave_to;
	
	// swap
	assign dataout	= dataout_unswap ^ tx_swap;
	
	// instance a obufds for lvds output
	OBUFDS #(.IOSTANDARD("LVDS_33"))
	io_data_out(
					.O		(dataout_p), 
					.OB	(dataout_n), 
					.I		(dataout)
					);

	/***** instance oserdes2 *****/
	// master oserdes2
	OSERDES2 #(
		.DATA_RATE_OQ	("SDR"), 						// Output Data Rate ("SDR" or "DDR")
		.DATA_RATE_OT	("SDR"), 						// 3-state Data Rate ("SDR" or "DDR")
		.DATA_WIDTH		(7), 								// Parallel data width (2-8)
		.OUTPUT_MODE	("DIFFERENTIAL"), 			// "SINGLE_ENDED" or "DIFFERENTIAL"
		.SERDES_MODE	("MASTER") 						// "NONE", "MASTER" or "SLAVE"
	)
	OSERDES2_master(
		.OQ				(dataout_unswap), 			// 1-bit Data output to pad or IODELAY2
		.SHIFTOUT1		(master_do), 					// 1-bit Cascade data output
		.SHIFTOUT2		(master_to), 					// 1-bit Cascade 3-state output
		.SHIFTOUT3		(), 								// 1-bit Cascade differential data output
		.SHIFTOUT4		(), 								// 1-bit Cascade differential 3-state output
		.TQ				(), 								// 1-bit 3-state output to pad or IODELAY2
		.CLK0				(txioclk), 						// 1-bit I/O clock input
		.CLK1				(1'b0), 							// 1-bit Secondary I/O clock input
		.CLKDIV			(gclk), 							// 1-bit Logic domain clock input
																// D1 - D4: 1-bit (each) Parallel data inputs
		.D1				(datain[2]),
		.D2				(datain[1]),
		.D3				(datain[0]),
		.D4				(),
		.IOCE				(txdes2serstrobe), 			// 1-bit Data strobe input
		.OCE				(1'b1), 							// 1-bit Clock enable input
		.RST				(reset), 						// 1-bit Asynchrnous reset input
		.SHIFTIN1		(1'b1), 							// 1-bit Cascade data input
		.SHIFTIN2		(1'b1),							// 1-bit Cascade 3-state input
		.SHIFTIN3		(slave_do), 					// 1-bit Cascade differential data input
		.SHIFTIN4		(slave_to), 					// 1-bit Cascade differential 3-state input
																// T1 - T4: 1-bit (each) 3-state control inputs
		.T1				(1'b0),
		.T2				(1'b0),
		.T3				(1'b0),
		.T4				(1'b0),
		.TCE				(1'b1), 							// 1-bit 3-state clock enable input
		.TRAIN			(1'b0) 							// 1-bit Training pattern enable input
	);
	// slave oserdes2
	OSERDES2 #(
		.DATA_RATE_OQ	("SDR"), 						// Output Data Rate ("SDR" or "DDR")
		.DATA_RATE_OT	("SDR"), 						// 3-state Data Rate ("SDR" or "DDR")
		.DATA_WIDTH		(7), 								// Parallel data width (2-8)
		.OUTPUT_MODE	("DIFFERENTIAL"), 			// "SINGLE_ENDED" or "DIFFERENTIAL"
		.SERDES_MODE	("SLAVE") 						// "NONE", "MASTER" or "SLAVE"
	)
	OSERDES2_slave(
		.OQ				(), 								// 1-bit Data output to pad or IODELAY2
		.SHIFTOUT1		(), 								// 1-bit Cascade data output
		.SHIFTOUT2		(), 								// 1-bit Cascade 3-state output
		.SHIFTOUT3		(slave_do), 					// 1-bit Cascade differential data output
		.SHIFTOUT4		(slave_to), 					// 1-bit Cascade differential 3-state output
		.TQ				(), 								// 1-bit 3-state output to pad or IODELAY2
		.CLK0				(txioclk), 						// 1-bit I/O clock input
		.CLK1				(1'b0), 							// 1-bit Secondary I/O clock input
		.CLKDIV			(gclk), 							// 1-bit Logic domain clock input
																// D1 - D4: 1-bit (each) Parallel data inputs
		.D1				(datain[6]),
		.D2				(datain[5]),
		.D3				(datain[4]),
		.D4				(datain[3]),
		.IOCE				(txdes2serstrobe), 			// 1-bit Data strobe input
		.OCE				(1'b1), 							// 1-bit Clock enable input
		.RST				(reset), 						// 1-bit Asynchrnous reset input
		.SHIFTIN1		(master_do), 					// 1-bit Cascade data input
		.SHIFTIN2		(master_to), 					// 1-bit Cascade 3-state input
		.SHIFTIN3		(1'b1), 							// 1-bit Cascade differential data input
		.SHIFTIN4		(1'b1), 							// 1-bit Cascade differential 3-state input
																// T1 - T4: 1-bit (each) 3-state control inputs
		.T1				(1'b0),
		.T2				(1'b0),
		.T3				(1'b0),
		.T4				(1'b0),
		.TCE				(1'b1), 							// 1-bit 3-state clock enable input
		.TRAIN			(1'b0) 							// 1-bit Training pattern enable input
	);
	
endmodule
