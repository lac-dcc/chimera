/* ---------------------------------------------------- *
 * Title       : Floating Point Multiplier Simulation   *
 * Project     : Fixed Floating Point Adder Multiplier  *
 * ---------------------------------------------------- *
 * File        : float_multi_sim.v                      *
 * Author      : Yigit Suoglu                           *
 * Last Edit   : /01/2021                             *
 * ---------------------------------------------------- *
 * Description : Simulation for Floating Point          *
 *               Multiplier                             *
 * ---------------------------------------------------- */

`timescale 1ns / 1ps
// `include "Sources/adder-multiplier.v"

module flpm_sim();
  reg [9:0] fra1, fra2;
  reg sign1, sign2;
  reg [4:0] exp1, exp2;
  wire [15:0] result, num1, num2;
  wire overflow, zero, precisionLost;
  wire [9:0] res_fra, expected_fra;
  wire res_sign, nan, expected_sign;
  wire [4:0] res_exp, expected_exp;
  reg [15:0] result_expected;

  assign {res_sign, res_exp, res_fra} = result;
  assign num1 = {sign1, exp1, fra1};
  assign num2 = {sign2, exp2, fra2};

  float_multi uut(num1, num2, result, overflow, zero, nan, precisionLost);
  wire correct;

  assign correct = result == result_expected;
  assign {expected_sign,expected_exp,expected_fra} = result_expected;

  initial
    begin//Buggy cases
      {sign1, exp1, fra1} = 16'h4689;
      {sign2, exp2, fra2} = 16'h0025;
      result_expected = 16'h00f2;
      #100
      {sign1, exp1, fra1} = 16'h4489;
      {sign2, exp2, fra2} = 16'h001d;
      result_expected = 16'h0084;
      #100
      {sign1, exp1, fra1} = 16'h1234;
      {sign2, exp2, fra2} = 16'h9876;
      result_expected = 16'h801b;
      #100
      {sign1, exp1, fra1} = 16'h8216;
      {sign2, exp2, fra2} = 16'h20be;
      result_expected = 16'h8004;
      #100
      //Multipcation with precision lost
      sign1 = 0;
      sign2 = 0;
      exp1 = 21;
      exp2 = 4;
      fra1 = 10'b10100101;
      fra2 = 10'b11001100;
      result_expected = 16'h2992;
      #100
      //Multipcation without precision lost
      sign1 = 0;
      sign2 = 0;
      exp1 = 4;
      exp2 = 4;
      fra1 = 10'b10100000;
      fra2 = 10'b01100000;
      result_expected = 16'h5;
      #100
      //Multipcation without precision lost diffrent signs
      sign1 = 1;
      sign2 = 0;
      exp1 = 16;
      exp2 = 7;
      fra1 = 10'b10110000;
      fra2 = 10'b11000000;
      result_expected = 16'ha191;
      #100
      //Multipcation with Zero
      sign1 = 0;
      sign2 = 0;
      exp1 = 16;
      exp2 = 0;
      fra1 = 10'b10110000;
      fra2 = 10'b00000000;
      result_expected = 16'h0;
      #100
      //Multipcation with Infinite
      sign1 = 0;
      sign2 = 0;
      exp1 = 16;
      exp2 = 5'b11111;
      fra1 = 10'b10110000;
      fra2 = 10'b00000000;
      result_expected = 16'h7c00;
      #100
      //Overflow
      sign1 = 0;
      sign2 = 0;
      exp1 = 16;
      exp2 = 20;
      fra1 = 10'b10110000;
      fra2 = 10'b01011000;
      result_expected = 16'h5517;
      #100
      //Multipcation of 1 subnormal, 1 normal
      sign1 = 0;
      sign2 = 0;
      exp1 = 0;
      exp2 = 20;
      fra1 = 10'b11100000;
      fra2 = 10'b01100000;
      result_expected = 16'hfa8;
      #100
      //Multipcation of 2 subnormal
      sign1 = 0;
      sign2 = 0;
      exp1 = 0;
      exp2 = 0;
      fra1 = 10'b10111000;
      fra2 = 10'b10000000;
      result_expected = 16'h0;
    end
endmodule//module_name