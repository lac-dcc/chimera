`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 			Gpixel
// Engineer: 			HangWang
// 
// Create Date:    	16:28:29 11/25/2014 
// Module Name:    	cl_serial_out 
// Project Name: 		GVISION200
// Target Devices: 	Spartan-6 xc6slx150-3fg900
// Tool versions: 	ISE13.1
// Description: 		serial output
// Revision: 
// 		V1.0-First created
//////////////////////////////////////////////////////////////////////////////////
module cl_serial_out(clk_fix, rst_fix_n, measured_baud, lvds_swap, 
	fifo_empty, fifo_ren, fifo_dout,
	cl_sertfg_p, cl_sertfg_n
	);

	// clock & reset
	input				clk_fix;
	input				rst_fix_n;
	
	input  [15:0]	measured_baud;
	input				lvds_swap;
	
	// fifo info
	input				fifo_empty;
	input  [7:0]	fifo_dout;
	output 			fifo_ren;
	
	// outputs
	output			cl_sertfg_p;
	output			cl_sertfg_n;


	reg				fifo_ren;
	
	// counters
	reg [15:0] 		tx_cnt_baud;
	reg [2:0] 		tx_cnt_bit;
		
	reg 				cl_sertfg;
	wire				cl_sertfg_swap;
	
	// FSM
	reg [1:0] 		fsm_sertfg;
	parameter 		s_IDLE 		= 2'b00,
						s_START_BIT = 2'b01,
						s_DATA_BITS = 2'b11,
						s_STOP_BIT	= 2'b10;
	
	// camera link lvds output interface primitive
	assign	cl_sertfg_swap	= cl_sertfg ^ lvds_swap;
	OBUFDS #(.IOSTANDARD("LVDS_33"))
	inst_cl_sertfg_bufds(.O(cl_sertfg_p),.OB(cl_sertfg_n),.I(cl_sertfg_swap));

	// oserdes
	always @(posedge clk_fix)begin
		if (!rst_fix_n)begin
			fsm_sertfg 	<= s_IDLE;
			tx_cnt_baud <= 16'd0;
			tx_cnt_bit	<= 3'd0;
			
			fifo_ren		<= 1'b0;
			cl_sertfg	<= 1'b1;
		end
		else begin
			fifo_ren	<= 0;	
			
			case(fsm_sertfg)
				s_IDLE:		begin
									if(fifo_empty == 0 && measured_baud != 0)begin
										fsm_sertfg 	<= s_START_BIT;
										tx_cnt_baud	<= measured_baud;
										fifo_ren 	<= 1;
									end
								end
				s_START_BIT:begin
									cl_sertfg	<= 0;
									if (tx_cnt_baud == 0) begin
										fsm_sertfg		<= s_DATA_BITS;
										tx_cnt_bit		<= 3'b000;
										tx_cnt_baud		<= measured_baud;
									end
									else begin
										tx_cnt_baud		<= tx_cnt_baud - 16'd1;							
									end
								end
				s_DATA_BITS:begin
									cl_sertfg	<= fifo_dout[tx_cnt_bit];
									if (tx_cnt_baud == 0) begin
										tx_cnt_baud		<=	measured_baud;
										if (tx_cnt_bit == 3'b111) begin
											fsm_sertfg 	<= s_STOP_BIT;
										end
										else begin
											tx_cnt_bit	<= tx_cnt_bit + 3'd1;
										end
									end
									else begin
										tx_cnt_baud		<= tx_cnt_baud - 16'd1;
									end
								end
				s_STOP_BIT:	begin
									cl_sertfg	<= 1;
									if (tx_cnt_baud == 0)begin
										fsm_sertfg		<= s_IDLE;
									end
									else begin
										tx_cnt_baud		<= tx_cnt_baud - 16'd1;
									end
								end
			endcase
		end
	end
endmodule
