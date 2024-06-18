// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module TopModule #(
 parameter AdderWidth =8,
 parameter MultiplierWidth =8,
parameter adder_instance_WIDTH=AdderWidth,
parameter another_adder_instance_WIDTH=AdderWidth,
parameter multiplier_instance_WIDTH=MultiplierWidth,
parameter another_multiplier_instance_WIDTH=MultiplierWidth) (
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
  
wire [ adder_instance_WIDTH -1:0] adder_instance_a;
wire [ adder_instance_WIDTH -1:0] adder_instance_b;
wire [ adder_instance_WIDTH -1:0] adder_instance_sum;
wire [ another_adder_instance_WIDTH -1:0] another_adder_instance_a;
wire [ another_adder_instance_WIDTH -1:0] another_adder_instance_b;
wire [ another_adder_instance_WIDTH -1:0] another_adder_instance_sum;
 
  assign   adder_instance_sum  =  adder_instance_a  +  adder_instance_b  ;

  
 
  assign   another_adder_instance_sum  =  another_adder_instance_a  +  another_adder_instance_b  ;
assign adder_instance_a = adder_a;
assign adder_instance_b = adder_b;
assign sum = adder_instance_sum;
assign another_adder_instance_a = x;
assign another_adder_instance_b = y;
assign sum = another_adder_instance_sum;
 
  
wire [ multiplier_instance_WIDTH -1:0] multiplier_instance_a;
wire [ multiplier_instance_WIDTH -1:0] multiplier_instance_b;
wire [ multiplier_instance_WIDTH -1:0] multiplier_instance_product;
wire [ another_multiplier_instance_WIDTH -1:0] another_multiplier_instance_a;
wire [ another_multiplier_instance_WIDTH -1:0] another_multiplier_instance_b;
wire [ another_multiplier_instance_WIDTH -1:0] another_multiplier_instance_product;
 
  assign   multiplier_instance_product  =  multiplier_instance_a  *  multiplier_instance_b  ;

  
 
  assign   another_multiplier_instance_product  =  another_multiplier_instance_a  *  another_multiplier_instance_b  ;
assign multiplier_instance_a = multiplier_a;
assign multiplier_instance_b = multiplier_b;
assign product = multiplier_instance_product;
assign another_multiplier_instance_a = x;
assign another_multiplier_instance_b = y;
assign product = another_multiplier_instance_product;
 initial
    begin 
      a =0;
      b =1;
    end  
endmodule
