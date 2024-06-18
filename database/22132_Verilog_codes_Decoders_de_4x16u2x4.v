// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module decoder_4to16(
  input wire in0,
  input wire in1,
  input wire in2,
  input wire in3,

  output wire out0,
  output wire out1,
  output wire out2,
  output wire out3,

  output wire out4,
  output wire out5,
  output wire out6,
  output wire out7,


  output wire out8,
  output wire out9,
  output wire out10,
  output wire out11,


  output wire out12,
  output wire out13,
  output wire out14,
  output wire out15
);

assign out0 = (~in3 & ~in2 & ~in1 & ~in0); 
assign out1 = (~in3 & ~in2 & ~in1 & in0);
assign out2 = (~in3 & ~in2 & in1 & ~in0);
assign out3 = (~in3 & ~in2 & in1 & in0);
assign out4 = (~in3 & in2 & ~in1 & ~in0);
assign out5 = (~in3 & in2 & ~in1 & in0);
assign out6 = (~in3 & in2 & in1 & ~in0);
assign out7 = (~in3 & in2 & in1 & in0);
assign out8 = (in3 & ~in2 & ~in1 & ~in0);
assign out9 = (in3 & ~in2 & ~in1 & in0);
assign out10 = (in3 & ~in2 & in1 & ~in0);
assign out11 = (in3 & ~in2 & in1 & in0);
assign out12 = (in3 & in2 & ~in1 & ~in0);
assign out13 = (in3 & in2 & ~in1 & in0);
assign out14 = (in3 & in2 & in1 & ~in0);
assign out15 =  (in3 & in2 & in1 & in0);

endmodule