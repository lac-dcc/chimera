// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

module ccnt_gray #(
	parameter W = 32'd8
	)(
	input			clk   	   ,  // Clock
	input			rst_n 	   ,  // Asynchronous reset active low
	input			en 	  	   ,
	   
	output	[W-1:0]	cnt   	   ,  // count output
	output	[W-1:0]	cnt_gray   ,  // count's gray code
	output	[W-1:0]	cnt_gray_d    // count's gray code buffer output

);
	reg [W-1:0] cnt_r ;
	always @(posedge clk or negedge rst_n) begin
		if (rst_n == 1'b0) begin
			cnt_r <= 'b0 ;
		end
		else if (en) begin
			cnt_r <= cnt_r + 1'b1  ;
		end
	end

	assign cnt = cnt_r ;
	assign cnt_gray = cnt ^ (cnt >> 1) ;

	reg [W-1:0] cnt_gray_buf ;
	always @(posedge clk or negedge rst_n) begin
		if (rst_n == 1'b0) begin
			cnt_gray_buf <= 'b0 ;
		end
		else begin
			cnt_gray_buf <= cnt_gray ;
		end
	end

	assign cnt_gray_d = cnt_gray_buf ;

endmodule