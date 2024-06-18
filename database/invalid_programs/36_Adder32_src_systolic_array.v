// This program was cloned from: https://github.com/HVT06/Adder32
// License: Apache License 2.0

`include "PE.v"


module tt_um_systolic_array(ui_in, data_in2, data_in3, data_in4, data_in5, clk, rst_n, ena,clear ,uo_out, data_out2, data_out3, data_out4, data_out5);
  
  parameter zero_input = 16'b0000000000000000;
  input [7:0] ui_in;
  input [7:0] data_in2;
  input [7:0] data_in3;
  input [7:0] data_in4;
  input [7:0] data_in5;
  input clk, rst_n, ena, clear;

  output  [15:0] uo_out;
  output  [15:0] data_out2;
  output  [15:0] data_out3;
  output  [15:0] data_out4;
  output  [15:0] data_out5;

  wire[7:0] e11, e12, e13, e14, e15;
  wire[7:0] e21, e22, e23, e24, e25;
  wire[7:0] e31, e32, e33, e34, e35;
  wire[7:0] e41, e42, e43, e44, e45;
  wire[7:0] e51, e52, e53, e54, e55;

  wire[15:0] ps11, ps12, ps13, ps14, ps15;
  wire[15:0] ps21, ps22, ps23, ps24, ps25;
  wire[15:0] ps31, ps32, ps33, ps34, ps35;
  wire[15:0] ps41, ps42, ps43, ps44, ps45;
  

  PE PE11(ui_in, zero_input, clk, clear, e11, ps11);
  PE #(8'b00000010)PE21(data_in2, ps11, clk, clear, e21, ps21);
  PE #(8'b00000011)PE31(data_in3, ps21, clk, clear, e31, ps31);
  PE #(8'b00000100)PE41(data_in4, ps31, clk, clear, e41, ps41);
  PE #(8'b00000101)PE51(data_in5, ps41, clk, clear, e51, uo_out);

  PE PE12(e11, zero_input, clk, clear, e12, ps12);
  PE #(8'b00000010)PE22(e21, ps12, clk, clear, e22, ps22);
  PE #(8'b00000011)PE32(e31, ps22, clk, clear, e32, ps32);
  PE #(8'b00000100)PE42(e41, ps32, clk, clear, e42, ps42);
  PE #(8'b00000101)PE52(e51, ps42, clk, clear, e52, data_out2);
  
  PE PE13(e12, zero_input, clk, clear, e13, ps13);
  PE #(8'b00000010)PE23(e22, ps13, clk, clear, e23, ps23);
  PE #(8'b00000011)PE33(e32, ps23, clk, clear, e33, ps33);
  PE #(8'b00000100)PE43(e42, ps33, clk, clear, e43, ps43);
  PE #(8'b00000101)PE53(e52, ps43, clk, clear, e53, data_out3);

  PE PE14(e13, zero_input, clk, clear, e14, ps14);
  PE #(8'b00000010)PE24(e23, ps14, clk, clear, e24, ps24);
  PE #(8'b00000011)PE34(e33, ps24, clk, clear, e34, ps34);
  PE #(8'b00000100)PE44(e43, ps34, clk, clear, e44, ps44);
  PE #(8'b00000101)PE54(e53, ps44, clk, clear, e54, data_out4);
  
  PE PE15(e14, zero_input, clk, clear, e15, ps15);
  PE #(8'b00000010)PE25(e24, ps15, clk, clear, e25, ps25);
  PE #(8'b00000011)PE35(e34, ps25, clk, clear, e35, ps35);
  PE #(8'b00000100)PE45(e44, ps35, clk, clear, e45, ps45);
  PE #(8'b00000101)PE55(e54, ps45, clk, clear, e55, data_out5);
  
endmodule
