`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:41:59 02/27/2015
// Design Name:   mapping_controller
// Module Name:   C:/Users/ceshi/Desktop/G200_GLN_32_02_27/tb_mapping_controller.v
// Project Name:  GVISION200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mapping_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_mapping_controller;

	// Inputs
	reg clk_rxg;
	reg rst_rx_n;
	reg [11:0] 	data_trained0;
	reg [11:0] 	data_trained1;
	reg [11:0] 	data_trained2;
	reg [11:0] 	data_trained3;
	reg [11:0] 	data_trained4;
	reg [11:0] 	data_trained5;
	reg [11:0] 	data_trained6;
	reg [11:0] 	data_trained7;
	reg [11:0] 	data_trained8;
	reg [11:0] 	data_trained9;
	reg [11:0] 	data_trained10;
	reg [11:0] 	data_trained11;
	reg [11:0] 	data_trained12;
	reg [11:0] 	data_trained13;
	reg [11:0] 	data_trained14;
	reg [11:0] 	data_trained15;
	reg 			fvals_map;
	reg 			lvals_map;
	
	reg	[11:0]	cnt_lvals;
	reg	[11:0]	cnt_fvals;
	reg	[1:0]		cnt;
	
	reg	[1:0]		fsm_lval;
	parameter		s_HIGH	=	2'b00,
						s_LOW		=	2'b01;	
	// Outputs
	wire [11:0] datapar_out0;
	wire [11:0] datapar_out1;
	wire [11:0] datapar_out2;
	wire [11:0] datapar_out3;
	wire [11:0] datapar_out4;
	wire [11:0] datapar_out5;
	wire [11:0] datapar_out6;
	wire [11:0] datapar_out7;
	wire fvals;
	wire lvals;

	// Instantiate the Unit Under Test (UUT)
	mapping_controller uut (
		.clk_rxg(clk_rxg), 
		.rst_rx_n(rst_rx_n), 
		.data_trained0(data_trained0), 
		.data_trained1(data_trained1), 
		.data_trained2(data_trained2), 
		.data_trained3(data_trained3), 
		.data_trained4(data_trained4), 
		.data_trained5(data_trained5), 
		.data_trained6(data_trained6), 
		.data_trained7(data_trained7), 
		.data_trained8(data_trained8), 
		.data_trained9(data_trained9), 
		.data_trained10(data_trained10), 
		.data_trained11(data_trained11), 
		.data_trained12(data_trained12), 
		.data_trained13(data_trained13), 
		.data_trained14(data_trained14), 
		.data_trained15(data_trained15), 
		.datapar_out0(datapar_out0), 
		.datapar_out1(datapar_out1), 
		.datapar_out2(datapar_out2), 
		.datapar_out3(datapar_out3), 
		.datapar_out4(datapar_out4), 
		.datapar_out5(datapar_out5), 
		.datapar_out6(datapar_out6), 
		.datapar_out7(datapar_out7), 
		.fvals_map(fvals_map), 
		.lvals_map(lvals_map), 
		.fvals(fvals), 
		.lvals(lvals)
	);

	initial begin
		// Initialize Inputs
		clk_rxg = 0;
		rst_rx_n = 0;
		data_trained0 		= 	1;
		data_trained1 		= 	2;
		data_trained2 		= 	1;
		data_trained3 		= 	2;
		data_trained4 		= 	1;
		data_trained5 		= 	2;
		data_trained6 		= 	1;
		data_trained7 		= 	2;
		data_trained8 		= 	1;
		data_trained9 		= 	2;
		data_trained10 	= 	1;
		data_trained11 	= 	2;
		data_trained12 	= 	1;
		data_trained13 	= 	2;
		data_trained14 	= 	1;
		data_trained15 	= 	2;	
		fvals_map 			= 	0;
		lvals_map			= 	0;

		// Wait 100 ns for global reset to finish
		#100;
		rst_rx_n	= 1;
        
		// Add stimulus here

	end
 	always	#10	clk_rxg = ~clk_rxg;
	
	always @(posedge clk_rxg) begin
		if(!rst_rx_n)	begin
			fvals_map			<= 1'b0;
			lvals_map 		 	<= 1'b0;
			cnt_lvals	 		<= 10'd0;
			cnt_fvals			<= 12'd0;
			cnt					<=	2'd0;
			fsm_lval				<=	s_HIGH;
		end
		else begin
			case(fsm_lval)
				s_HIGH:	begin
								if(cnt_lvals	==	10'd128)begin
									cnt_lvals			<=	10'd0;
									lvals_map			<=	1'b0;
									fsm_lval				<=	s_LOW;
								end
								else begin
									lvals_map			<=	1'b1;
									cnt_lvals			<=	cnt_lvals + 10'd1;
								end
							end
				s_LOW:	begin
								if(cnt_lvals	==	10'd1)begin
									cnt_lvals		<=	10'd1;
									lvals_map		<=	1'b1;
									fsm_lval			<=	s_HIGH;
								end
								else begin
									cnt_lvals		<=	cnt_lvals + 10'd1;
									lvals_map		<=	1'b0;
								end
							end
			endcase
			if(cnt_fvals == 12'd1028) begin
				cnt_fvals 			<= 12'd0;
				fvals_map 			<= 1'b0;
			end
			else begin
				cnt_fvals 			<= cnt_fvals + 12'd1;
				fvals_map 			<= 1'b1;
			end
		end
	end


endmodule

