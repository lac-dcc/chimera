`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////
// Company: 		Gpixel
// Engineer: 		Hongliang.An
// Create Date:	09/04/2014 
// Module Name: 	gearbox_2_to_1
// Project Name: 	
// Target Devices:Spartan-6 xc6slx150-3fg900
// Tool versions: ISE13.1
// Function:		
// Interface:
// Dependencies:
// Revision:
//		V1.0 - First created
//////////////////////////////////////////////////////////////////////////
module gearbox_2_to_1(
	clk_rxg_x1, clk_rxg_x2, gear_reset, rev_en,
	data_in,
	data_out
	);
	
	// CLOCK & RESET
	input				clk_rxg_x1;
	input				clk_rxg_x2;
	input				gear_reset;
	input				rev_en;
	
	// DATA
	input	[5:0]		data_in;
	output [11:0]	data_out;

	reg				datain_even;
	         
	reg [5:0]		data_q1;
	reg [5:0]		data_q2;
	reg [11:0]		data_q;
	
	reg [5:0]		data_t1;
	
	assign			data_out	= data_q;
	
	always @(posedge clk_rxg_x2) begin
		if (!gear_reset) begin
			datain_even			<= 1'b1;
			data_t1				<= 6'd0;
			data_q1				<= 6'd0;
			data_q2				<= 6'd0;
		end
		else begin
			
			if (rev_en == 1'b1) begin
				datain_even		<= datain_even;
			end
			else begin
				datain_even			<= ~ datain_even;
			end
			
			if (datain_even == 1'b1) begin
				data_t1			<= data_in;
			end
			else begin
				data_q2			<= data_in;
			end
			
			data_q1				<= data_t1;
			
			
		end
	end
	
	

	always @(posedge clk_rxg_x1) begin
		if (!gear_reset) begin
			data_q				<= 12'd0;
			
		end
		else begin
			data_q				<= {data_q1, data_q2};
		end
	end

endmodule
