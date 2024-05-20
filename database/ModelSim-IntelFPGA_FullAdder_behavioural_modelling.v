// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Behavioural Modelling for Full Adder

module exp_beh(sum, carry, A, B, Cin);
input A, B, Cin; output sum, carry;
reg sum, carry;
always @ (A or B or Cin)
begin
case ({A, B, Cin})
3'b000 : begin sum = 0; carry = 0; end
3'b001 : begin sum = 1; carry = 0; end
3'b010 : begin sum = 1; carry = 0; end
3'b011 : begin sum = 0; carry = 1; end
3'b100 : begin sum = 1; carry = 0; end
3'b101 : begin sum = 0; carry = 1; end
3'b110 : begin sum = 0; carry = 1; end
3'b111 : begin sum = 1; carry = 1; end
endcase
end
endmodule