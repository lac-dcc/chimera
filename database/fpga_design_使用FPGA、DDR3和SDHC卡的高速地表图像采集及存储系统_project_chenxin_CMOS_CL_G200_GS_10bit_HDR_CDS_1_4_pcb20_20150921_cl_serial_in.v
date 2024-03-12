`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 			Gpixel
// Engineer: 			HangWang
// 
// Create Date:    	16:28:29 11/25/2014 
// Module Name:    	cl_serial_in 
// Project Name: 		GVISION200
// Target Devices: 	Spartan-6 xc6slx150-3fg900
// Tool versions: 	ISE13.1
// Description: 		cl_serail_in
// Revision: 
// 		V1.0-First created
//////////////////////////////////////////////////////////////////////////////////
module cl_serial_in(clk_fix, rst_fix_n, 
	cl_sertc_p, cl_sertc_n, lvds_swap, 
	measured_baud,
	rb1_wen, rb2_wen, rb3_wen, rb4_wen,
	reg_addr, reg_data
   );
	
	// clock & reset
	input				clk_fix;
	input				rst_fix_n;
	
	input				cl_sertc_p;
	input				cl_sertc_n;
	input				lvds_swap;
	
	output [15:0]	measured_baud;
	
	output			rb1_wen;
	output			rb2_wen;
	output			rb3_wen;
	output			rb4_wen;
	
	output [7:0]	reg_addr;
	output [7:0]	reg_data;
	
	reg  [15:0]		measured_baud;
	reg				rb1_wen;
	reg				rb2_wen;
	reg				rb3_wen;
	reg				rb4_wen;
	
	reg  [7:0]		reg_addr;
	reg  [7:0]		reg_data;
	
	wire				cl_sertc_unswap;
	wire 				cl_sertc;	
		
	reg  [1:0] 		reg_rb;								// reg bank
			
	reg  [3:0] 		deglitch;							// deglitching
	reg 				sertc_deglitch;
			
	reg  [7:0] 		rx_byte;								// buffer for read data
	reg  [15:0]		rx_cnt_baud;						// buffer for baud rate
	reg  [2:0] 		rx_cnt_bit;							// counter for read 8 bit data
	reg  [1:0] 		rx_cnt_byte;						// counter for distinguish 3-byte from labview
	
	reg  [2:0] 		fsm_sertc;							//FSM
	parameter 		s_IDLE 			= 3'b000,
						s_START_BIT 	= 3'b001,
						s_RECEIVE_DATA = 3'b011,
						s_STORE_DATA 	= 3'b010,
						s_STOP_BIT 		= 3'b110;
	
	
	
	// camera link lvds input interface primitive
	IBUFDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("LVDS_33"))
	inst_cl_sertc_ibufds(.O(cl_sertc_unswap),.I(cl_sertc_p),.IB(cl_sertc_n));

	assign	cl_sertc = rst_fix_n ? (cl_sertc_unswap ^ lvds_swap) : 1'b0;
	/**********************************************************************************/
	// RECEIVE DATA FROM SOFTWARE
	// One register is defined by:
	//  * a 2-bit register bank address ('RB')
	//  * a 8-bit register address (address in the register bank) ('A')
	//  * a 8-bit data word ('D')
	// One register transfer is done by 3 packets of startbit(0) - 8 bits - stopbit
	// The rgister information is divided over the 3 packets as follows:
	//  * First byte:  A(3) & A(2) & A(1) & A(0) & RB(1) & RB(0) & '0' & '1'
	//  * Second byte: D(1) & D(0) & A(7) & A(6) &  A(5) &  A(4) & '1' & '1'
	//  * Third byte:  D(7) & D(6) & D(5) & D(4) &  D(3) &  D(2) & '1' & '1'
	//  ! Data is transferred LSB first

	always @(negedge clk_fix)begin
		if(!rst_fix_n)begin
			fsm_sertc		<= s_IDLE;
			
			deglitch 		<= 4'b1111;
			sertc_deglitch <= 1'b1;
			
			rb1_wen 			<= 1'b0;
			rb2_wen 			<= 1'b0;
			rb3_wen 			<= 1'b0;
			rb4_wen			<= 1'b0;
			reg_rb			<= 2'b00;
			reg_addr			<= 8'b0000_0000;
			reg_data 		<= 8'b0000_0000;
			
			rx_byte			<= 8'b0000_0000;
			rx_cnt_bit 		<= 3'b000;
			rx_cnt_byte 	<= 2'b00;
			rx_cnt_baud 	<= 16'd0;
			
			measured_baud 	<= 16'd0;
		end
		else begin
			
			// deglitching
			deglitch <= {cl_sertc,deglitch[3:1]};
			if(deglitch == 4'b0000) begin
				sertc_deglitch 	<= 0;
			end
			else if(deglitch == 4'b1111) begin
					sertc_deglitch <= 1;
			end
			else begin
				sertc_deglitch 	<= sertc_deglitch;
			end
			
			// default values
			rb1_wen <= 0;
			rb2_wen <= 0;
			rb3_wen <= 0;
			rb4_wen <= 0;
			
			// FSM
			case(fsm_sertc)
				s_IDLE:			begin
										if (sertc_deglitch == 0)begin
											fsm_sertc 		<= s_START_BIT;
											rx_cnt_baud 	<= 16'd0;
											rx_byte			<= 8'd0;
										end
									end
				s_START_BIT:	begin
										rx_cnt_baud <= rx_cnt_baud + 16'd1;
										if (sertc_deglitch == 1)begin
											fsm_sertc 		<= s_RECEIVE_DATA;
											rx_cnt_bit 		<= 3'b111;
											
											measured_baud 	<= rx_cnt_baud;
											
											rx_cnt_baud 	<= rx_cnt_baud >> 1;
										end
									end
				s_RECEIVE_DATA:begin
										if (rx_cnt_baud == 0) begin
											rx_cnt_baud 	<= measured_baud;
											
											rx_byte 			<= {sertc_deglitch,rx_byte[7:1]};
											if(rx_cnt_bit == 0)
												fsm_sertc 	<= s_STORE_DATA;
											else
												rx_cnt_bit 	<= rx_cnt_bit - 3'd1;
										end
										else begin
											rx_cnt_baud 	<= rx_cnt_baud - 16'd1;
										end
									end
				s_STORE_DATA:	begin
										fsm_sertc 			<= s_STOP_BIT;
										rx_cnt_baud 		<= measured_baud;
										
										case (rx_byte[1:0])
											2'b01:	begin
															reg_rb         <= rx_byte[3:2];
															reg_addr[3:0]  <= rx_byte[7:4];

															rx_cnt_byte    <= 2'b00;
														end
											2'b11:	begin
															case(rx_cnt_byte)
																2'b00:	begin
																				reg_addr[7:4] 	<= rx_byte[5:2];
																				reg_data[1:0] 	<= rx_byte[7:6];
																				
																				rx_cnt_byte		<= rx_cnt_byte + 2'd1;
																			end
																2'b01:	begin
																				reg_data[7:2] 	<= rx_byte[7:2];
																				
																				rx_cnt_byte 	<= rx_cnt_byte + 2'd1;
																				
																				case(reg_rb)
																					2'b00:	rb1_wen <= 1;
																					2'b01:	rb2_wen <= 1;
																					2'b10:	rb3_wen <= 1;
																					2'b11:	rb4_wen <= 1;
																				endcase
																			end
															endcase
														end
										endcase
					
									end
				s_STOP_BIT:		begin
										if(rx_cnt_baud == 0)
											fsm_sertc 	<= s_IDLE;
										else
											rx_cnt_baud <= rx_cnt_baud - 16'd1;
									end
			endcase
		end
			
	end	


endmodule
