// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Test Bench Modelling for Half Subtractor

module TB_halfSubtractor();
wire diff, borr; reg A, B;

//triggering Test Bench for Dataflow Modelling
exp_df trigger_dataflowModelling(diff, borr, A, B);

initial
begin
A = 1'b0; B = 1'b0;
#100;
A = 1'b0; B = 1'b1;
#100;
A = 1'b1; B = 1'b0;
#100;
A = 1'b1; B = 1'b1;
end
endmodule