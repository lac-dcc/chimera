/* ---------------------------------------------------- *
 * Title       : Floating Point Adder Simulation        *
 * Project     : Fixed Floating Point Adder Multiplier  *
 * ---------------------------------------------------- *
 * File        : float_add_sim.v                        *
 * Author      : Yigit Suoglu                           *
 * Last Edit   : 11/01/2021                               *
 * ---------------------------------------------------- *
 * Description : Simulation for Floating Point Adder    *
 * ---------------------------------------------------- */

`timescale 1ns / 1ps
//`include "Sources/adder-multiplier.v"

module flpa_sim();
  reg [9:0] fra1, fra2;
  reg sign1, sign2;
  reg [4:0] exp1, exp2;
  wire [15:0] result, num1, num2;
  wire overflow, zero;
  wire [9:0] res_fra, expected_fra;
  wire res_sign, nan, precisionLost, expected_sign;
  wire [4:0] res_exp, expected_exp;

  assign {res_sign, res_exp, res_fra} = result;
  assign num1 = {sign1, exp1, fra1};
  assign num2 = {sign2, exp2, fra2};

  float_adder uut(num1, num2, result, overflow, zero, nan, precisionLost);

  wire correct;
  reg [15:0] result_expected;

  assign correct = (result_expected == result);
  assign {expected_sign,expected_exp,expected_fra} = result_expected;

  initial
    begin
      //Bug
      {sign1, exp1, fra1} = 16'hc0b0;
      {sign2, exp2, fra2} = 16'h1cc0;
      result_expected = 16'hc0ae;
      #100
      {sign1, exp1, fra1} = 16'h00e0;
      {sign2, exp2, fra2} = 16'h5060;
      result_expected = 16'h5060;
      #100
      {sign1, exp1, fra1} = 16'h29a8;
      {sign2, exp2, fra2} = 16'he1f9;
      result_expected = 16'he1f9;
      #100
      {sign1, exp1, fra1} = 16'h54a5;
      {sign2, exp2, fra2} = 16'h1cc0;
      result_expected = 16'h54a5;
      #100
      {sign1, exp1, fra1} = 16'h00b8;
      {sign2, exp2, fra2} = 16'h0080;
      result_expected = 16'h0138;
      #100
      //Addition with precision lost
      sign1 = 0;
      sign2 = 0;
      exp1 = 21;
      exp2 = 14;
      fra1 = 10'b10100101;
      fra2 = 10'b11001100;
      result_expected = 16'h54ae;
      #100
      //Addition of two numbers with same exp
      sign1 = 0;
      sign2 = 0;
      exp1 = 4;
      exp2 = 4;
      fra1 = 10'b10100000;
      fra2 = 10'b01101100;
      result_expected = 16'h1486;
      #100
      //Addition without precision lost
      sign1 = 0;
      sign2 = 0;
      exp1 = 10;
      exp2 = 12;
      fra1 = 10'b11100000;
      fra2 = 10'b01101001;
      result_expected = 16'h31a1;
      #100
      //Addition diffrent signs without precision lost
      sign1 = 0;
      sign2 = 1;
      exp1 = 5;
      exp2 = 6;
      fra1 = 10'b10101100;
      fra2 = 10'b00101101;
      result_expected = 16'h935c;
      #100
      //Addition diffrent signs without precision lost
      sign1 = 1;
      sign2 = 0;
      exp1 = 13;
      exp2 = 13;
      fra1 = 10'b00001100;
      fra2 = 10'b11101100;
      result_expected = 16'h2b00;
      #100
      //Addition diffrent signs without precision lost
      sign1 = 1;
      sign2 = 0;
      exp1 = 30;
      exp2 = 30;
      fra1 = 10'b10101010;
      fra2 = 10'b10101100;
      result_expected = 16'h5400;
      #100
      //Zero flag
      sign1 = 1;
      sign2 = 0;
      exp1 = 25;
      exp2 = 25;
      fra1 = 10'b10011101;
      fra2 = 10'b10011101;
      result_expected = 16'h8000;
      #100
      //nan flag
      sign1 = 0;
      sign2 = 0;
      exp1 = 5'b10001;
      exp2 = 5'b11111;
      fra1 = 10'b11111111;
      fra2 = 10'b11111111;
      result_expected = 16'h7cff;
      #100
      //Overflow flag
      sign1 = 0;
      sign2 = 0;
      exp1 = 5'b11110;
      exp2 = 5'b11110;
      fra1 = 10'b1111111111;
      fra2 = 10'b1111111111;
      result_expected = 16'h7c00;
      #100
      //Overflow flag
      sign1 = 0;
      sign2 = 0;
      exp1 = 5'b11111;
      exp2 = 5'b10010;
      fra1 = 10'b0000000000;
      fra2 = 10'b1110000011;
      result_expected = 16'h7c00;
    end
endmodule//module_name