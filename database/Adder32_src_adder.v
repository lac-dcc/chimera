// This program was cloned from: https://github.com/HVT06/Adder32
// License: Apache License 2.0

module fa(c_in, x_in, y_in, sum, carry);
  
  input c_in, x_in, y_in;
  output carry, sum;
  
  assign sum = x_in ^ y_in ^ c_in;
  assign carry = (x_in & y_in & c_in)|(x_in & y_in) |(x_in & c_in) | (y_in & c_in);
  
endmodule


module ha(x_in, y_in, sum, carry);
  
  input x_in, y_in;
  output carry, sum;
  
  assign sum = x_in ^ y_in;
  assign carry = x_in & y_in;
  
endmodule

module fa_no_carry_out(c_in, x_in, y_in, sum/*, carry*/);
  
  input c_in, x_in, y_in;
  output /*carry,*/ sum;
  
  assign sum = x_in ^ y_in ^ c_in;
  //assign carry = (x_in & y_in & c_in)|(x_in & y_in) |(x_in & c_in) | (y_in & c_in);
  
endmodule

