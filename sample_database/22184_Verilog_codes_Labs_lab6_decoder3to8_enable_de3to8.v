// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module decoder_3to8(
  input en,
  input wire in0,
  input wire in1,
  input wire in2,
  
  output wire out0,
  output wire out1,
  output wire out2,
  output wire out3,
  
  output wire out4,
  output wire out5,
  output wire out6,
  output wire out7
  );

assign out0 = (en) ? ((~in2 & ~in1 & ~in0) & en) : 1'b0; 
assign out1 = (en) ? ((~in2 & ~in1 & in0) & en) : 1'b0;
assign out2 = (en) ? ((~in2 & in1 & ~in0) & en) : 1'b0;
assign out3 = (en) ? ((~in2 & in1 & in0) & en) : 1'b0;
assign out4 = (en) ? ((in2 & ~in1 & ~in0) & en) : 1'b0;
assign out5 = (en) ? ((in2 & ~in1 & in0) & en) : 1'b0;
assign out6 = (en) ? ((in2 & in1 & ~in0) & en) : 1'b0;
assign out7 = (en) ? ((in2 & in1 & in0) & en) : 1'b0;


endmodule