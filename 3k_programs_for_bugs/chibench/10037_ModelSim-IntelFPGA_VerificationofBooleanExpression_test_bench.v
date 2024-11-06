// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Test Bench Modelling for Verification of Y = AB + BC + CA

module TB_Expression();
wire Y; reg A, B, C;

//trigerring Test Bench for Behavioural Modelling
exp_beh trigger_behaviouralModelling(Y, A, B, C);

initial
begin
A = 1'b0; B = 1'b0; C = 1'b0;
#100;
A = 1'b0; B = 1'b0; C = 1'b1;
#100;
A = 1'b0; B = 1'b1; C = 1'b0;
#100;
A = 1'b0; B = 1'b1; C = 1'b1;
#100;
A = 1'b1; B = 1'b0; C = 1'b0;
#100;
A = 1'b1; B = 1'b0; C = 1'b1;
#100;
A = 1'b1; B = 1'b1; C = 1'b0;
#100;
A = 1'b1; B = 1'b1; C = 1'b1;

end
endmodule