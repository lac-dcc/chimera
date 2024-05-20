// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//code to implement Half Adder using Behavioral Modelling

module exp_beh(sum, carry, A, B);
input A, B; output sum, carry;
reg sum, carry;
always @ (A or B)
begin
case ({A, B})
2'b000 : begin sum = 0; carry = 0; end
2'b011 : begin sum = 1; carry = 0; end
2'b100 : begin sum = 1; carry = 0; end
2'b111 : begin sum = 0; carry = 1; end
endcase
end
endmodule