// This program was cloned from: https://github.com/maomran/softmax
// License: Apache License 2.0

`timescale 1ns/1ps
module adder_tb();

reg            clk;
reg            rst;
reg    [31:0]   input_a;
reg    [31:0]   input_b;
reg             input_a_stb;
reg             input_b_stb;
reg            output_z_ack;
wire            input_a_ack;
wire            input_b_ack;
wire            output_z_stb;
wire   [31:0]  output_z;
initial begin 
  clk = 1;
  rst = 1;
  input_a_stb = 0;  
  input_b_stb = 0;
  output_z_ack = 0;
  #10
  rst = 0;
////////////////////////////  
  input_a_stb = 1;  
  input_b_stb = 1;
  output_z_ack = 1;
//  #5
  input_a = 32'h3f800000;
  input_b = 32'h3f800000;
  #32
  // input_a_stb = 0;  
  // input_b_stb = 0;
  // output_z_ack = 0;
  // #10
////////////////////////////  
//     input_a_stb = 0;  
//   input_b_stb = 0;
//   output_z_ack = 0;
// ////////////////////////////  
//   #10
  //   input_a_stb = 1;  
  // input_b_stb = 1;
  // output_z_ack = 1;
  // #5
  input_a = 32'h3f000000;
  input_b = 32'h3f000000;
  #32
  input_a = 32'h3f000000;
  input_b = 32'hbf000000;
    
  
end

adder DUT (        
        input_a,
        input_b,
        input_a_stb,
        input_b_stb,
        output_z_ack,
        clk,
        rst,
        output_z,
        output_z_stb,
        input_a_ack,
        input_b_ack);

always 
#1 clk = ~clk;

endmodule // adder_tb