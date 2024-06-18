// This program was cloned from: https://github.com/tioluwanimofe/cpu_verilog
// License: MIT License

//this is a implementation of a 2 to 1 multiplexer
module mux2_1(in0,in1,se1,out);
 input se1;      //immediate value
 input [31:0] in0, in1;           
 output reg [31:0] out;  // register output

 
 always @(in0,in1,se1)
 begin
  if(se1==1'b1) out = in0; 
  else out = in1;
 end   
 
endmodule
