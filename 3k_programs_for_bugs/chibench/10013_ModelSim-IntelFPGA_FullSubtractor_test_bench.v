// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Test Bench for Full Subtractor

module TB_fullSubtractor();
wire diff, borr; reg A, B, C;

//triggering Test Bench for Dataflow Modelling
exp_df trigger_dataflowModelling(diff, borr, A, B, C);

initial
begin
A = 1'b0; B = 1'b0; C = 1'b0;
#200;
A = 1'b0; B = 1'b0; C = 1'b1;
#200;
A = 1'b0; B = 1'b1; C = 1'b0;
#200;
A = 1'b0; B = 1'b1; C = 1'b1;
#200;
A = 1'b1; B = 1'b0; C = 1'b0;
#200;
A = 1'b1; B = 1'b0; C = 1'b1;
#200;
A = 1'b1; B = 1'b1; C = 1'b0;
#200;
A = 1'b1; B = 1'b1; C = 1'b1;
end
endmodule