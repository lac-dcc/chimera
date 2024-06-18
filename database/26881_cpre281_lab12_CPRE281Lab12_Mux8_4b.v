// This program was cloned from: https://github.com/regales/cpre281
// License: Apache License 2.0

module Mux8_4b(S2, S1, S0, W0, W1, W2, W3, W4, W5, W6, W7, F);
input S2, S1, S0;
input [3:0] W0, W1, W2, W3, W4, W5, W6, W7;
output [3:0]F;
	
reg[3:0]F;
always@(S2, S1, S0,W0, W1, W2, W3, W4, W5, W6, W7)
	
begin
case({S2, S1, S0})
3'b000:F = W0;
3'b001:F = W1;
3'b010:F = W2;
3'b011:F = W3;
3'b100:F = W4;
3'b101:F = W5;
3'b110:F = W6;
3'b111:F = W7;
endcase
end
endmodule

