// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Test Bench for 1:8 DeMux

module TB_1_to_8_deMux();
wire [7:0]Y; reg I; reg S2, S1, S0;

//triggering Test Bench for Dataflow Modelling
deMux_1_to_8_df triggering_dataflowModelling(I, S2, S1, S0, Y);

initial
begin

//setting sample testing input I to logic high (1)
I = 1'b1;

//passing select lines combinations to get desired outputs
S2 = 1'b0; S1 = 1'b0; S0 = 1'b0;
#200;
S2 = 1'b0; S1 = 1'b0; S0 = 1'b1;
#200;
S2 = 1'b0; S1 = 1'b1; S0 = 1'b0;
#200;
S2 = 1'b0; S1 = 1'b1; S0 = 1'b1;
#200;
S2 = 1'b1; S1 = 1'b0; S0 = 1'b0;
#200;
S2 = 1'b1; S1 = 1'b0; S0 = 1'b1;
#200;
S2 = 1'b1; S1 = 1'b1; S0 = 1'b0;
#200;
S2 = 1'b1; S1 = 1'b1; S0 = 1'b1;
end
endmodule