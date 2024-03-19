`timescale 1ns/100ps

module tb();

	initial begin
		$dumpfile("waves.vcd");
		$dumpvars(0, u_ps2);
	end
	
	reg clk;
	wire ps2_clk, ps2_data;
	wire busy;
	reg req;
	wire [7:0] data = 8'h21;
	wire extended = 0;
	wire shift = 0;
	wire [7:0] led;

	initial begin
		clk = 1'b0;
	end

	initial begin
		repeat(5) @(posedge clk);
		req <= 1;
		repeat(1) @(posedge clk);
		req <= 0;

		repeat(100000) @(posedge clk);

		$finish;
	end

	always begin
		#5 clk = !clk;
	end


	ps2_send u_ps2 (
		.clk_25mhz(clk),
		.ps2_data(ps2_data),
		.ps2_clk(ps2_clk),
		.req(req),
		.busy(busy),
		.data(data),
		.extended(extended),
		.shift(shift),
		.led(led)
	);

endmodule
