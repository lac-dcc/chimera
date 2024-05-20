// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module delimeter_dot (
  input a,
  input b,
  output z) ; 
  
wire  inst1_i1;
wire  inst1_i2;
wire  inst1_o1;
 
  assign  inst1_o1 = inst1_i1 & inst1_i2 ;
assign inst1_i1 = a;
assign inst1_i2 = b;
assign z = inst1_o1;
 
endmodule
