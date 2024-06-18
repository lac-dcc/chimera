// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Dataflow Modelling for 2 to 4 Decoder

module decoder_2_to_4_df(A, B, Y0, Y1, Y2, Y3);
input A, B; output Y0, Y1, Y2, Y3;
assign Y0 = ~A&~B;
assign Y1 = ~A&B;
assign Y2 = A&~B;
assign Y3 = A&B;
endmodule