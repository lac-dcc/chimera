// This program was cloned from: https://github.com/altASIC/Open-CryptoNight-ASIC
// License: Apache License 2.0

module multiplier (
	clk,
	reset_n,
	in_A,
	in_B,
	in_valid,
	product
	);

// 2 means multiply between registers
// 3 means two clock multicycle path for multiply
// 4 means three clock multicycle path for multiply
parameter MULTIPLIER_DELAY = 2;

initial begin
	$display("MULTIPLIER_DELAY == %0d", MULTIPLIER_DELAY);
	if (MULTIPLIER_DELAY < 1 || MULTIPLIER_DELAY > 3) begin
		$display("*** MULTIPLIER_DELAY misconfigured! ****");
		$stop;
	end
end

input clk;
input reset_n;
input [127:0] in_A, in_B;
input in_valid;
output [127:0] product;

reg [127:0] product_reg;

reg [MULTIPLIER_DELAY-2:0] VALID;
reg [63:0] A, B;

wire [127:0] AB = A * B;
wire [127:0] AB0 = in_A[63:0] * in_B[63:0];
assign product = MULTIPLIER_DELAY == 0 ? AB0 :  MULTIPLIER_DELAY == 1 ? AB : product_reg;

function [127:0] mac;
input [63:0] a;
input [31:0] b;
input [127:0] c;
begin
	mac = c >> 32;
	mac[127:32] = mac[127:32] + a * b ;
end
endfunction

always @(posedge clk or negedge reset_n) begin
	if (!reset_n) begin
		product_reg <= 0;
		A <= 0;
		B <= 0;
		VALID <= 0;
	end else begin
		if (MULTIPLIER_DELAY==1);
		else if (VALID[MULTIPLIER_DELAY-2]) // Multicycle
			product_reg <= AB;
		if (in_valid) begin
			A <= in_A;
			B <= in_B;
		end
		VALID <= {VALID, in_valid};
	end
end

endmodule // multiplier
