`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////
// Company: 		Gpixel
// Engineer: 		Hongliang.An
// Create Date:	09/04/2014 
// Module Name: 	iserdes_1_to_12_data_diff
// Project Name: 	
// Target Devices:Spartan-6 xc6slx150-3fg900
// Tool versions: ISE13.1
// Function:		1-bit generic 1:12 data receiver module with differential
//						inputs. Includes state machine to control CAL and the
//						phase detector. Data is reveived MSB first.
// Interface:
// Dependencies:
// Revision:
//		V1.0 - First created
//////////////////////////////////////////////////////////////////////////
module iserdes_1_to_12_data_diff(
	clk_rxg_x1, clk_rxg_x2, clk_rxio, reset,
	rxserdesstrobe,gear_reset,
	bitslip, shifter_addr,
	datain_p, datain_n,
	data_out,
	align_en
	);

	// CLOCK & RESET
	input				clk_rxg_x1;
	input				clk_rxg_x2;
	input				clk_rxio;
	input				reset;
	input				rxserdesstrobe;
	input          gear_reset;
	// CONTROL SIGNALS
	input				bitslip;
	input [3:0]		shifter_addr;
	
	// DATA
	input				datain_p;
	input				datain_n;
	
	output [11:0]	data_out;
	
	input				align_en;
	
	//reg    [11:0]	data_out;
	
	wire [5:0]		data_par1;
	wire [11:0]		data_par2;
	
	reg				bitslip_q;
	reg				bitslip_r;
	reg [2:0]		cnt_bitslip;
	reg				rev_en;
	
	always @(negedge clk_rxg_x2) begin
		if (reset) begin
			bitslip_q	<= 1'b0;
			bitslip_r	<= 1'b0;
		end
		else begin
			bitslip_q	<= bitslip;
			bitslip_r	<= 1'b0;
			
			if (bitslip == 1'b1 && bitslip_q == 1'b0) begin
				bitslip_r	<= 1'b1;
			end
			
		end
	end
	
	always @(negedge clk_rxg_x2) begin
		if (reset) begin
			cnt_bitslip		<= 3'b000;
			rev_en			<= 1'b0;
		end
		else begin
			rev_en			<= 1'b0;
			
			if (bitslip_r == 1'b1) begin
				if (cnt_bitslip == 3'd5) begin
					rev_en			<= 1'b1;
					cnt_bitslip		<= 3'd0;
				end
				else begin
					cnt_bitslip		<= cnt_bitslip + 3'd1;
				end
			end
		end
	end
	// Instantiate ISERDES_1_TO_6
	iserdes_1_to_6_data_diff iserdes(
		.gclk					(clk_rxg_x2), 
		.rxioclk				(clk_rxio), 
		.reset				(reset), 
		.rxserdesstrobe	(rxserdesstrobe), 
		.bitslip				(bitslip_r), 
		.datain_p			(datain_p), 
		.datain_n			(datain_n), 
		.data_out			(data_par1),
		.align_en			(align_en)
	);
	
	// Instantiate GEARBOX_2_TO_1
	gearbox_2_to_1 gearbox(
		.clk_rxg_x1			(clk_rxg_x1), 
		.clk_rxg_x2			(clk_rxg_x2), 
		.gear_reset			(~reset), 
		.rev_en				(rev_en),
		.data_in				(data_par1), 
		.data_out			(data_par2)
	);	

// Instantiate SHIFTER_VAR
	shifter_var_w12_d16 shifter_var(
		.a						(shifter_addr),
		.d						(data_par2),
		.clk					(clk_rxg_x1),
		.q						(data_out)
	);

endmodule
