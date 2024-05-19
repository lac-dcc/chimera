// This program was cloned from: https://github.com/irmo-de/xilinx-risc-v
// License: MIT License

`timescale 1 ns / 1 ps

module system_tb;
	reg clk = 1;
	always #5 clk = ~clk;

	reg resetn = 0;
	initial begin
		if ($test$plusargs("vcd")) begin
			$dumpfile("system.vcd");
			$dumpvars(0, system_tb);
		end
		repeat (100) @(posedge clk);
		resetn <= 1;
	end

//	wire trap;
//	wire [7:0] out_byte;
//	wire out_byte_en;

    wire led1;



	system uut (
		.clk        (clk        ),
		.led1(led1)
	);

//	always @(posedge clk) begin
//		if (resetn && out_byte_en) begin
//			$write("%c", out_byte);
//			$fflush;
//		end
//		if (resetn && trap) begin
//			$finish;
//		end
//	end
endmodule
