// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

module outport(
    input wire clk,         // clock signal
    input wire clr,         // clear signal
    input wire enable,      // write/enable signal
    input wire [31:0] d,    // 32-bit input from bus
    output reg [31:0] q     // 32-bit output to output unit
);

	// Initialize output to 0
	initial q = 0;

	// Register behavior
	always @ (posedge clk) begin
		if (clr)
			q <= 0;
		else if (enable)
			q <= d;
	end

endmodule

module inport(
    input wire clk,         // clock signal
    input wire clr,         // clear signal
    input wire enable,      // write/enable signal
    input wire [31:0] d,    // 32-bit input from input device
    output reg [31:0] q     // 32-bit output to bus
);

	// Initialize output to 0
	initial q = 0;

	// Register behavior
	always @ (posedge clk) begin
		if (clr)
			q <= 0;
		else if (enable)
			q <= d;
	end

endmodule