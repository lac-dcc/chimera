// This program was cloned from: https://github.com/Harminder13/RISC-Computer-Design
// License: MIT License

module Register(
	input wire clk,
	input wire clr, 
	input wire W_E,
	
	input wire[31:0] input_D,
	output reg[31:0] output_Q
);

initial output_Q = 32'b0;

always @(posedge clk) begin
	if (clr) begin
		output_Q <= 32'b0;
	end 
	else if (W_E) begin
		output_Q <= input_D;
	end
end

endmodule
