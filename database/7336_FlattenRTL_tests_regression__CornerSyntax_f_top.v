// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module Adder #(
 parameter WIDTH =8) 
    (
  input [WIDTH-1:0] a,
  input [WIDTH-1:0] b,
  output [WIDTH-1:0] sum) ; 
  assign sum=a+b; 
endmodule
 
module Multiplier #(
 parameter WIDTH =8) 
    (
  input [WIDTH-1:0] a,
  input [WIDTH-1:0] b,
  output [WIDTH-1:0] product) ; 
  assign product=a*b; 
endmodule
 
module TopModule #(
 parameter AdderWidth =8,
 parameter MultiplierWidth =8) (
  input [7:0] x,
  input [7:0] y,
  output [7:0] sum,
  output [7:0] product) ; 
    
   wire [AdderWidth-1:0] adder_a ; 
   wire [AdderWidth-1:0] adder_b ;  
   wire [MultiplierWidth-1:0] multiplier_a ; 
   wire [MultiplierWidth-1:0] multiplier_b ;   
   reg a ; 
   reg b ;  
  Adder #(AdderWidth)adder_instance(adder_a,adder_b,sum);
  Adder #(AdderWidth)another_adder_instance(x,y,sum); 
  Multiplier #(MultiplierWidth)multiplier_instance(multiplier_a,multiplier_b,product);
  Multiplier #(MultiplierWidth)another_multiplier_instance(x,y,product); initial
    begin 
      a =0;
      b =1;
    end  
endmodule
 
