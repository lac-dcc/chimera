// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

module pulse_sync (
	input clk_fast,    // fast Clock
	input clk_slow,    // slow Clock
	input rst_n   ,    // Asynchronous reset active low
	input din_en  ,

	output dout_en
);
	reg din_en_reg ;

	always @(posedge clk_fast or negedge rst_n) begin
		if (rst_n == 1'b0) begin
			din_en_reg <= 1'b0 ;
		end
		else begin
			din_en_reg <= din_en ^ din_en_reg ;
		end
	end

	reg [2:0] dout_en_reg ;

	always @(posedge clk_slow or negedge rst_n) begin
		if (rst_n == 1'b0) begin
			dout_en_reg <= 3'b00 ;
		end
		else begin
			dout_en_reg <= {dout_en_reg[1:0], din_en_reg} ;
		end
	end

	assign dout_en = dout_en_reg[2] ^ dout_en_reg[1] ;

endmodule