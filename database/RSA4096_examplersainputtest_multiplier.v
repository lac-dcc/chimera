// Quartus II Verilog Template
// Unsigned multiply with input and output registers

module multiplier
#(parameter WIDTH=32)
(
	input clk,
	input [WIDTH-1:0] dataa,
	input [WIDTH-1:0] datab,
	output reg [WIDTH-1:0] dataoutl,
	output reg [WIDTH-1:0] dataouth
);

	// Declare input and output registers
	wire [2*WIDTH-1:0] mult_out;
	assign mult_out = dataa * datab;
	
	// Update data
	always @ (posedge clk)
	begin
		dataoutl <= mult_out[WIDTH-1:0];
		dataouth <= mult_out[2*WIDTH-1:WIDTH];
	end

endmodule
