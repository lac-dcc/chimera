module Delay #(parameter mhz=50,ms=0)(
	input clk,
	input active,
	output reg done = 0
);
	reg [31:0] count = 0;

	always @(posedge clk)
		if (active)
			begin
				if (count == mhz * 1000 * ms)
					begin
						count <= 0;
						done <= 1;
					end
				else count <= count + 1;
			end
		else
			begin
				count <= 0;
				done <= 0;
			end
		
endmodule