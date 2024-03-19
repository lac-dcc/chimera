`timescale 1ns / 1ps
//--------------------------------------------------------------
// author 		: Noodle
// introduciton : this mudole used to be build CMOS timing 
// 				  and complete baseband data transform to single path for p1_d.
//--------------------------------------------------------------


module ad9361_txdata(
	input sys_rst,		// system reset from FPGA
	input fb_clk,		// feedback from DATA_CLK

	input signed [11:0] bb_i_path,		// baseband i path
	input signed [11:0] bb_q_path,		// baseband q path
	(*mark_debug = "true"*)output reg signed [11:0] bb_iq,			// merge baseband i and q into individual path
    output reg tx_frame						// TX_FRAME
    );


reg [11:0] bb_q_path_buf;	// use for delay
reg [11:0] bb_q_path_buf1;	// use for delay
integer swap_cnt;		

/*delay q path with 2 clock cycle*/
always @(negedge fb_clk) begin
	if (sys_rst) begin
		bb_q_path_buf <= 0;
	end else begin
		bb_q_path_buf <= bb_q_path;
		bb_q_path_buf1 <= bb_q_path_buf;
	end
end

/*build SDR timing for iq data transfer to p1_d*/
always @(negedge fb_clk) begin
	if (sys_rst) begin
		swap_cnt <= 0;
		tx_frame <= 0;
		bb_iq <= 0;
	end else begin
		case(swap_cnt) 
			0 : begin
				swap_cnt <= swap_cnt+1;
				tx_frame <= 1;		// indicate data is valid in TX_FRAME raising edge
				bb_iq <= bb_i_path;
			end
			1 : begin
				tx_frame <= 0;
				bb_iq <= bb_q_path_buf1;
				swap_cnt <= 0;
			end
			default : begin
				swap_cnt <= 0;
			end
		endcase
	end
end


endmodule
