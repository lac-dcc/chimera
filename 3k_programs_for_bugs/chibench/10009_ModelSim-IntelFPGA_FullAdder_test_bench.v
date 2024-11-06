// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Test Bench for Full Adder

module TB_fullAdder();
wire sum, carry; reg A, B, Cin;

//triggering Test Bench for Behavioural Modelling in same directory
exp_beh TB_BEH(sum, carry, A, B, Cin);

initial
begin
A = 1'b0; B = 1'b0; Cin = 1'b0;
#100;
A = 1'b0; B = 1'b0; Cin = 1'b1;
#100;
A = 1'b0; B = 1'b1; Cin = 1'b0;
#100;
A = 1'b0; B = 1'b1; Cin = 1'b1;
#100;
A = 1'b1; B = 1'b0; Cin = 1'b0;
#100;
A = 1'b1; B = 1'b0; Cin = 1'b1;
#100;
A = 1'b1; B = 1'b1; Cin = 1'b0;
#100;
A = 1'b1; B = 1'b1; Cin = 1'b1;

end
endmodule