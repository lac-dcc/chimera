// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Test Bench Modelling for 1:2 DeMux

module TB_1_to_2_DeMux();
wire Y0, Y1; reg I; reg S;

//triggering the Test Bench for Behavioural Modelling
deMux_1_to_2_beh trigger_behaviouralModelling(I, S, Y0, Y1);

initial
begin

//setting sample input I = 1
I = 1'b1;

//passing select lines input combinations to get desired output
S = 1'b0;
#200;
S = 1'b1;
end
endmodule