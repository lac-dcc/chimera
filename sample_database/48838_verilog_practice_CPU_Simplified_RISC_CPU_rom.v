// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

// ROM is used to store read-only data.

module rom (
	input [12:0] addr ,
	input 		 read ,
	input        ena  ,
	output wire [7:0] data
);
	reg [7:0] memory [13'h3ff : 0] ;
	assign data = (read && ena) ? memory[addr] : 8'bzzzz_zzzz ;

endmodule