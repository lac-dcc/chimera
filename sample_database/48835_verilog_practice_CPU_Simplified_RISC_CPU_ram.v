// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

module ram (
	input ena ,
	input read,
	input write,
	inout wire [7:0] data ,
	input [9:0] addr
);
	reg [7 : 0] ram [10'h3ff:0] ;

	assign data = (read && ena) ? ram[addr] : 8'h zz;

	always @(posedge write) begin
		ram [addr] <= data ;
	end

endmodule