module top(input clk, output [7:0] pmod1, output [3:0] led);

	reg [27:0] counter = 0;
	always @(posedge clk) counter <= counter + 1;

        assign pmod1[0] = clk;
	assign led[0:3] = counter[24:27];
endmodule
