// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

module ramdp #(
	parameter AW = 5,
	parameter DW = 16
	)(
	input clk_wr     	     ,    // write clock
	input [DW-1:0] D 	     ,	  // write data
	input wr_en 	 	     ,    // write enable
	input [AW-1:0] addr_wr	 ,    // write address
	input clk_rd     	     ,    // read clock
	input rd_en 	 	     ,    // read enable
	input [AW-1:0] addr_rd	 ,    // read address
	output reg [DW-1:0] Q 	 	  // read data
	    	
);
	reg [DW-1 : 0] mem [(1<<AW)-1 : 0] ;

	always @(posedge clk_wr) begin
		if (wr_en) begin
			mem[addr_wr] <= D ;
		end
	end

	always @(posedge clk_rd) begin
		if (rd_en) begin
			Q <= mem[addr_rd] ;
		end
	end

endmodule