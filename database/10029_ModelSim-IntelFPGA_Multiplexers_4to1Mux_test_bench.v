// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Test Bench for 4:1 Mux

module TB_4_to_1_mux();
wire Y; reg I0, I1, I2, I3; reg S1, S0;

//triggering Test Bench for Dataflow Modelling
mux_4_to_1_df trigger_dataflowModelling(Y, I0, I1, I2, I3, S1, S0);

initial
begin

//setting sample inputs for I0, I1, I2, I3
I0 = 1'b1; I1 = 1'b0; I2 = 1'b1; I3 = 1'b0;

//passing inputs for selectlines
S1 = 1'b0; S0 = 1'b0;
#100;
S1 = 1'b0; S0 = 1'b1;
#100;
S1 = 1'b1; S0 = 1'b0;
#100;
S1 = 1'b1; S0 = 1'b1;
end
endmodule