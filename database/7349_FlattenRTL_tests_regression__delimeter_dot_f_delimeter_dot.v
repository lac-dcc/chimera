// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module delimeter_dot (
  input a,
  input b,
  output z) ; 
  bottom inst1(a,b,z); 
endmodule
 
module bottom (
  input i1,
  input i2,
  output o1) ; 
  assign o1=i1&i2; 
endmodule
 
