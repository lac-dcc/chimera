`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:13 12/31/2014 
// Design Name: 
// Module Name:    gen_image_val 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module gen_image_val( clk_rxg, rst_rx_n,
	sync_x, reg_cnt_timing_cycle, window_row_length, //grab_done,
	fval, lval	//dval
    );
// clock & reset
	input				clk_rxg;
	input				rst_rx_n;
	
	// interface & registers
	input				sync_x;
	input  [9:0]	reg_cnt_timing_cycle;
	input  [11:0]	window_row_length;
	//output			grab_done;
	
	// outputs
	output			fval;
	output			lval;
	//output			dval;

	reg				fval;
	reg				lval;
	//reg				grab_done;
	
	wire				sync;
	reg [11:0]		cnt_row;
	reg [9:0]		cnt_cycle;
	(*keep = "true"*)reg [3:0]		cnt_sync;
	
	// fsm
	(*keep = "true"*) reg fsm_gen;
	parameter	 	s_IDLE	= 1'b0,
						s_GEN		= 1'b1;
	// gen fval and lval
	//assign			dval	= lval;
	
	shift_register_1_var shift_sync(
												.a		(3'b101),//110_2
												.d		(sync_x),
												.clk	(clk_rxg),
												.q		(sync)
											  );
	always @(posedge clk_rxg) begin
		if (!rst_rx_n) begin
			fsm_gen 		<= s_IDLE;
			
			cnt_cycle	<= 10'd0;
			cnt_row		<= 12'd0;
			cnt_sync		<= 4'd0;
			
			//grab_done	<= 1'b0;
			fval			<= 1'b0;
			lval			<= 1'b0;
		end
		else begin
			case (fsm_gen) 
				s_IDLE:	begin
								lval	<= 1'b0;
								if (sync == 1'b1) begin
									if (cnt_sync == 4'd1) begin
										fsm_gen		  	<= s_GEN;
										cnt_cycle		<= 10'd0;
										lval				<= 1'b1;
										fval				<= 1'b1;
										//grab_done		<= 1'b0;
									end
									else begin
										cnt_sync			<= cnt_sync + 4'd1;
									end
								end
							end
				s_GEN:	begin
								if (cnt_cycle == reg_cnt_timing_cycle - 10'd2) begin
									cnt_cycle		<= 10'd0;
									fsm_gen			<= s_IDLE;											
								end
								else begin
									cnt_cycle		<= cnt_cycle + 10'd1;
								end
							
								if (cnt_cycle == 10'd127) begin
									lval				<= 1'b0;
									if (cnt_row == window_row_length - 12'd1) begin
										fval			<= 1'b0;
										cnt_sync		<= 4'd0;
										//grab_done 	<= 1'b1;
										cnt_row		<= 12'd0;
									end
									else begin
										cnt_row		<= cnt_row + 12'd1;
									end
								end
							end
			endcase
			
		end
	end	

endmodule
