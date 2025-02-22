// This program was cloned from: https://github.com/lnis-uofu/OpenFPGA
// License: MIT License

//-----------------------------------------------------
// Design Name : dual_port_ram
// File Name   : dpram.v
// Function    : Dual port RAM 32x1024 
// Coder       : Aurelien
//-----------------------------------------------------

module dpram (
	input clk,
	input wen,
	input ren,
	input[0:9] waddr,
	input[0:9] raddr,
	input[0:31] d_in,
	output[0:31] d_out );

		dpram_1024x32_core memory_0 (
			.wclk		(clk),
			.wen		(wen),
			.waddr		(waddr),
			.data_in	(d_in),
			.rclk		(clk),
			.ren		(ren),
			.raddr		(raddr),
			.d_out		(d_out) );

endmodule

module dpram_1024x32_core (
	input wclk,
	input wen,
	input[0:9] waddr,
	input[0:31] data_in,
	input rclk,
	input ren,
	input[0:9] raddr,
	output[0:31] d_out );

	reg[0:31] ram[0:1023];
	reg[0:31] internal;

	assign d_out = internal;

	always @(posedge wclk) begin
		if(wen) begin
			ram[waddr] <= data_in;
		end
	end

	always @(posedge rclk) begin
		if(ren) begin
			internal <= ram[raddr];
		end
	end

endmodule
