// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Test Bench for 3 to 8 Decoder

module TB_3_to_8_decoder();
wire [7:0]Y; reg A, B, C;

//triggering Test Bench for Dataflow Modelling
decoder_3_to_8_df triggering_dataflowModelling(A, B, C, Y);

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