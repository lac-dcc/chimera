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
	reg [WIDTH-1:0] dataa_reg;
	reg [WIDTH-1:0] datab_reg;
	wire [2*WIDTH-1:0] mult_out;
	//wire [WIDTH-1:0] mult_outl;
//	wire [WIDTH-1:0] mult_outh;
	// Store the result of the multiply
	assign mult_out = dataa_reg * datab_reg;
	// Update data
	always @ (posedge clk)
	begin
		dataa_reg <= dataa;
		datab_reg <= datab;
		dataoutl <= mult_out[WIDTH-1:0];
		dataouth <= mult_out[2*WIDTH-1:WIDTH];
	end

endmodule
