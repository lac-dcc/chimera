// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top (I, Y);
input [7:0] I;//defines inputs
output [2:0]Y;//defines outputs
assign Y[2]=I[4] | I[5] | I[6] | I[7];
assign Y[1]=I[2] | I[3] | I[6] | I[7];
assign Y[0]=I[1] | I[3] | I[5] | I[7];
//determines assignments for Y according to karno table
endmodule
