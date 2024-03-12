`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 			Gpixel
// Engineer: 			HangWang
// 
// Create Date:    	16:28:29 11/25/2014 
// Module Name:    	image_tx 
// Project Name: 		GVISION200
// Target Devices: 	Spartan-6 xc6slx150-3fg900
// Tool versions: 	ISE13.1
// Description: 		use camera link to transfer data to labview
// Revision: 
// 		V1.0-First created
//////////////////////////////////////////////////////////////////////////////////
module image_tx(clk_txg, clk_txio, tx_strobe, rst_tx_n,
	fval, lval, dval,
	chan_0, chan_1, chan_2, chan_3, chan_4, chan_5, chan_6, chan_7,
	cl_x_p, cl_x_n, cl_xclk_p, cl_xclk_n,
	cl_y_p, cl_y_n, cl_yclk_p, cl_yclk_n,
	cl_z_p, cl_z_n, cl_zclk_p, cl_zclk_n
	);

	// clock & reset
	input				clk_txg;
	input				clk_txio;
	input				tx_strobe;
	input				rst_tx_n;
	
	// image sync information
	input				fval;
	input				lval;
	input				dval;
	
	// data inputs
	input  [7:0]	chan_0;
	input  [7:0]	chan_1;
	input  [7:0]	chan_2;
	input  [7:0]	chan_3;
	input  [7:0]	chan_4;
	input  [7:0]	chan_5;
	input  [7:0]	chan_6;
	input  [7:0]	chan_7;
	
	// camera link x channel
	output [3:0]	cl_x_p;
	output [3:0]	cl_x_n;
	output 			cl_xclk_p;
	output 			cl_xclk_n;
		
	// camera link y channel
	output [3:0]	cl_y_p;
	output [3:0]	cl_y_n;
	output 			cl_yclk_p;
	output 			cl_yclk_n;
	
	// camera link z channel
	output [3:0]	cl_z_p;
	output [3:0]	cl_z_n;
	output 			cl_zclk_p;
	output 			cl_zclk_n;

	
	wire [6:0]		cl_datain [14:0];
	wire [14:0]		cl_dataout_p;
	wire [14:0]		cl_dataout_n;
	
	genvar			i;
	
	
	// mapping:	lvds
	assign cl_xclk_p	= cl_dataout_p[0];	assign cl_yclk_p	= cl_dataout_p[5];	assign cl_zclk_p	= cl_dataout_p[10];
	assign cl_xclk_n	= cl_dataout_n[0];	assign cl_yclk_n	= cl_dataout_n[5];	assign cl_zclk_n	= cl_dataout_n[10];
	assign cl_x_p[0]	= cl_dataout_p[1];	assign cl_y_p[0]	= cl_dataout_p[6];	assign cl_z_p[0]	= cl_dataout_p[11];
	assign cl_x_n[0]	= cl_dataout_n[1];	assign cl_y_n[0]	= cl_dataout_n[6];	assign cl_z_n[0]	= cl_dataout_n[11];
	assign cl_x_p[1]	= cl_dataout_p[2];	assign cl_y_p[1]	= cl_dataout_p[7];	assign cl_z_p[1]	= cl_dataout_p[12];
	assign cl_x_n[1]	= cl_dataout_n[2];	assign cl_y_n[1]	= cl_dataout_n[7];	assign cl_z_n[1]	= cl_dataout_n[12];
	assign cl_x_p[2]	= cl_dataout_p[3];	assign cl_y_p[2]	= cl_dataout_p[8];	assign cl_z_p[2]	= cl_dataout_p[13];
	assign cl_x_n[2]	= cl_dataout_n[3];	assign cl_y_n[2]	= cl_dataout_n[8];	assign cl_z_n[2]	= cl_dataout_n[13];
	assign cl_x_p[3]	= cl_dataout_p[4];	assign cl_y_p[3]	= cl_dataout_p[9];	assign cl_z_p[3]	= cl_dataout_p[14];
	assign cl_x_n[3]	= cl_dataout_n[4];	assign cl_y_n[3]	= cl_dataout_n[9];	assign cl_z_n[3]	= cl_dataout_n[14];

	// medium camera link mapping
	assign cl_datain[4] 		= {1'b1,			chan_2[7],	chan_2[6],	chan_1[7],	chan_1[6],	chan_0[7],	chan_0[6]};
	assign cl_datain[3] 		= {dval,			fval,			lval,			chan_2[5],	chan_2[4],	chan_2[3],	chan_2[2]};	
	assign cl_datain[2] 		= {chan_2[1],	chan_2[0],	chan_1[5],	chan_1[4],	chan_1[3],	chan_1[2],	chan_1[1]}; 
	assign cl_datain[1] 		= {chan_1[0],	chan_0[5],	chan_0[4],	chan_0[3],	chan_0[2],	chan_0[1],	chan_0[0]};
	assign cl_datain[0] 		= {1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1};

	assign cl_datain[9] 		= {1'b1,			chan_5[7],	chan_5[6],	chan_4[7],	chan_4[6],	chan_3[7],	chan_3[6]};
	assign cl_datain[8] 		= {dval,			fval,			lval,			chan_5[5],	chan_5[4],	chan_5[3],	chan_5[2]};	
	assign cl_datain[7] 		= {chan_5[1],	chan_5[0],	chan_4[5],	chan_4[4],	chan_4[3],	chan_4[2],	chan_4[1]}; 
	assign cl_datain[6] 		= {chan_4[0],	chan_3[5],	chan_3[4],	chan_3[3],	chan_3[2],	chan_3[1],	chan_3[0]};
	assign cl_datain[5] 		= {1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1};
	
	assign cl_datain[14]		= {1'b1,			1'b1,			1'b1,			chan_7[7],	chan_7[6],	chan_6[7],	chan_6[6]};
	assign cl_datain[13]		= {dval,			fval,			lval,			1'b0,			1'b0,			1'b0,			1'b0		};	
	assign cl_datain[12]		= {1'b0,			1'b0,			chan_7[5],	chan_7[4],	chan_7[3],	chan_7[2],	chan_7[1]}; 
	assign cl_datain[11]		= {chan_7[0],	chan_6[5],	chan_6[4],	chan_6[3],	chan_6[2],	chan_6[1],	chan_6[0]};
	assign cl_datain[10]		= {1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1};
				
	generate 
		for (i = 0; i < 15; i = i+1) begin: loop
			odes2ser_7_to_1 odes2ser_inst(
				.txioclk				(clk_txio), 
				.txdes2serstrobe	(tx_strobe), 
				.gclk					(clk_txg), 
				.reset				(~rst_tx_n), 
				.tx_swap				(1'b0), 
				.datain				(cl_datain[i]), 
				.dataout_p			(cl_dataout_p[i]), 
				.dataout_n			(cl_dataout_n[i])
			);
		end
	endgenerate
		
endmodule
