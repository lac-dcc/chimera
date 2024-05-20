// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Test Bench Modelling for 1:4 DeMux

module TB_1_to_4_deMux();
wire [3:0]Y; reg I; reg S1, S0;

//triggering Test Bench for Dataflow Modelling
deMux_1_to_4_df triggering_dataflowModelling(I, S1, S0, Y);

initial
begin

//setting sample input I to be logic high (1)
I = 1'b1;

//passing combinations for select lines to get desired output
S1 = 1'b0; S0 = 1'b0;
#200;
S1 = 1'b0; S0 = 1'b1;
#200;
S1 = 1'b1; S0 = 1'b0;
#200;
S1 = 1'b1; S0 = 1'b1;
end
endmodule