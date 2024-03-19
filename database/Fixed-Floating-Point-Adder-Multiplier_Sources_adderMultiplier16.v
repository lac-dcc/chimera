/* ----------------------------------------------------- *
 * Title       : FixFlo Adder Multiplier Modules         *
 * Project     : Fixed Floating Point Adder Multiplier   *
 * ----------------------------------------------------- *
 * File        : adderMultiplier16.v                     *
 * Author      : Yigit Suoglu                            *
 * Last Edit   : 20/05/2021                              *
 * Licence     : CERN-OHL-W                              *
 * ----------------------------------------------------- *
 * Description : Modules for addition and multiplication *
 *               of 16 bit unsigned fixed point and      *
 *               signed floating point formated numbers  *
 * ----------------------------------------------------- */

/*
 * Fixed Point Format:
 *   Most significant 8 bits represent integer part and Least significant 8 bits
 *   represent fraction part
 *   i.e. IIIIIIIIFFFFFFFF = IIIIIIII.FFFFFFFF
 * ----------------------------------------------------------------------------
 * Floating Point Format:
 *   binary16 (IEEE 754-2008) is used. MSB used as sign bit. 10 least significant
 *   bits are used as fraction and remaining bits are used as exponent.
 *   i.e. SEEEEEFFFFFFFFFF = (-1)^S * 1.FFFFFFFFFF * 2^(EEEEE - 15)
 */

`timescale 1ns / 1ps

//fixed adder adds unsigned fixed numbers.
module fixed_adder(num1, num2, result, overflow);
  input [15:0] num1, num2;
  output [15:0] result;
  output overflow;

  //single assign statement handles fixed additon
  assign {overflow, result} = (num1 + num2);
endmodule

//fixed multi multiplies unsigned fixed numbers.
module fixed_multi(num1, num2, result, overflow, precisionLost, result_full);
  input [15:0] num1, num2; //num1 is multiplicand and num2 is multiplier
  output [15:0] result;
  output overflow, precisionLost;
  reg [31:0] mid [15:0]; //shifted values
  reg [31:0] midB[3:0]; //addition of shifted values
  output [31:0] result_full; //32-bit results
  wire [31:0] num1_ext;

  assign num1_ext = {8'd0, num1, 8'd0};
  assign precisionLost = |result_full[7:0];
  assign result = result_full[23:8]; //get rid of extra bits
  assign overflow = |result_full[31:24]; // most significant 8-bit is overflow
  assign result_full = midB[0] + midB[1] + midB[2] + midB[3];
  always@* //midB wires are added for readability
    begin
      midB[0] = mid[0] + mid[4] + mid[8] + mid[15];
      midB[1] = mid[1] + mid[5] + mid[9] + mid[14];
      midB[2] = mid[2] + mid[6] + mid[10] + mid[13];
      midB[3] = mid[3] + mid[7] + mid[11] + mid[12];
    end
  always@* //shift and enable control
    begin
      mid[0]  = (num1_ext >> 8) & {32{num2[0]}};
      mid[1]  = (num1_ext >> 7) & {32{num2[1]}};
      mid[2]  = (num1_ext >> 6) & {32{num2[2]}};
      mid[3]  = (num1_ext >> 5) & {32{num2[3]}};
      mid[4]  = (num1_ext >> 4) & {32{num2[4]}};
      mid[5]  = (num1_ext >> 3) & {32{num2[5]}};
      mid[6]  = (num1_ext >> 2) & {32{num2[6]}};
      mid[7]  = (num1_ext >> 1) & {32{num2[7]}};
      mid[8]  =  num1_ext       & {32{num2[8]}};
      mid[9]  = (num1_ext << 1) & {32{num2[9]}};
      mid[10] = (num1_ext << 2) & {32{num2[10]}};
      mid[11] = (num1_ext << 3) & {32{num2[11]}};
      mid[12] = (num1_ext << 4) & {32{num2[12]}};
      mid[13] = (num1_ext << 5) & {32{num2[13]}};
      mid[14] = (num1_ext << 6) & {32{num2[14]}};
      mid[15] = (num1_ext << 7) & {32{num2[15]}};
    end

endmodule

//float multi multiplier floating point numbers.
module float_multi(num1, num2, result, overflow, zero, NaN, precisionLost);
  //Operands
  input [15:0] num1, num2;
  output [15:0] result;
  //Flags
  output overflow;//overflow flag
  output zero; //zero flag
  output NaN; //Not a Number flag
  output precisionLost;
  //Decode numbers
  wire sign1, sign2, signR; //hold signs
  wire [4:0] ex1, ex2, exR; //hold exponents
  wire [4:0] ex1_pre, ex2_pre, exR_calc; //hold exponents
  reg [4:0] exSubCor;
  wire [4:0] exSum_fault;
  wire ex_cannot_correct;
  wire [9:0] fra1, fra2, fraR; //hold fractions
  reg [9:0] fraSub, fraSub_corrected;
  wire [20:0] float1;
  wire [10:0] float2;
  wire exSum_sign;
  wire [6:0] exSum;
  wire [5:0] exSum_prebais, exSum_abs; //exponent sum
  wire [11:0] float_res, float_res_preround; //result
  wire [9:0] float_res_fra;
  wire [9:0] dump_res; //Lost precision
  reg [21:0] res_full;
  wire [21:0] res_full_preshift;
  reg [20:0] mid[10:0];
  wire inf_num; //at least on of the operands is inf.
  wire subNormal;
  wire zero_num_in, zero_calculated;

  //Partial flags
  assign zero_num_in = ~(|num1[14:0] & |num2[14:0]);
  assign zero_calculated = (subNormal & (fraSub == 10'd0)) | (exSum_sign & (~|res_full[20:11]));
  assign ex_cannot_correct = {1'b0,exSubCor} > exSum_abs; //?: or >=

  //Flags
  assign zero = zero_num_in | zero_calculated;
  assign NaN = (&num1[14:10] & |num1[9:0]) | (&num2[14:10] & |num2[9:0]);
  assign inf_num = (&num1[14:10] & ~|num1[9:0]) | (&num2[14:10] & ~|num2[9:0]); //check for infinate number
  assign overflow = inf_num | (~exSum[6] & exSum[5]);
  assign subNormal = ~|float_res[11:10];
  assign precisionLost = |dump_res | (exSum_prebais < 6'd15);
  
  //decode-encode numbers
  assign {sign1, ex1_pre, fra1} = num1;
  assign {sign2, ex2_pre, fra2} = num2;
  assign ex1 = ex1_pre + {4'd0, ~|ex1_pre};
  assign ex2 = ex2_pre + {4'd0, ~|ex2_pre};
  assign result = {signR, exR, fraR};
  
  //exponentials are added
  assign exSum = exSum_prebais - 7'd15;
  assign exSum_prebais = {1'b0,ex1} + {1'b0,ex2};
  assign exSum_abs = (exSum_sign) ? (~exSum[5:0] + 6'd1) : exSum[5:0];
  assign exSum_sign = exSum[6];

  //Get floating numbers
  assign float1 = {|ex1_pre, fra1, 10'd0};
  assign float2 = {|ex2_pre, fra2};

  //Calculate result
  assign signR = (sign1 ^ sign2);
  assign exR_calc = exSum[4:0] + {4'd0, float_res[11]} + (~exSubCor & {5{subNormal}}) + {4'd0, subNormal};
  assign exR = (exR_calc | {5{overflow}}) & {5{~(zero | exSum_sign | ex_cannot_correct)}};
  assign fraR = ((exSum_sign) ? res_full[20:11] :((subNormal) ? fraSub_corrected : float_res_fra)) & {10{~(zero | overflow)}} ;
  assign float_res_fra = (float_res[11]) ? float_res[10:1] : float_res[9:0];
  assign float_res = float_res_preround + {10'd0,dump_res[9]}; //? possibly generates wrong result due to overflow
  assign {float_res_preround, dump_res} = res_full_preshift;
  assign res_full_preshift = mid[0] + mid[1] + mid[2] + mid[3] + mid[4] + mid[5] + mid[6] + mid[7] + mid[8] + mid[9] + mid[10];
  assign exSum_fault = exSubCor - exSum_abs[4:0];
  always@*
    begin
      if(exSum_sign)
        case(exSum_abs)
          6'h0: res_full = res_full_preshift;
          6'h1: res_full = (res_full_preshift >> 1);
          6'h2: res_full = (res_full_preshift >> 2);
          6'h3: res_full = (res_full_preshift >> 3);
          6'h4: res_full = (res_full_preshift >> 4);
          6'h5: res_full = (res_full_preshift >> 5);
          6'h6: res_full = (res_full_preshift >> 6);
          6'h7: res_full = (res_full_preshift >> 7);
          6'h8: res_full = (res_full_preshift >> 8);
          6'h9: res_full = (res_full_preshift >> 9);
          6'ha: res_full = (res_full_preshift >> 10);
          6'hb: res_full = (res_full_preshift >> 11);
          6'hc: res_full = (res_full_preshift >> 12);
          6'hd: res_full = (res_full_preshift >> 13);
          6'he: res_full = (res_full_preshift >> 14);
          6'hf: res_full = (res_full_preshift >> 15);
          default: res_full = (res_full_preshift >> 16);
        endcase
      else
        res_full = res_full_preshift;
    end
  always@*
    begin
      if(ex_cannot_correct)
        case(exSum_fault)
          5'h0: fraSub_corrected = fraSub;
          5'h1: fraSub_corrected = (fraSub >> 1);
          5'h2: fraSub_corrected = (fraSub >> 2);
          5'h3: fraSub_corrected = (fraSub >> 3);
          5'h4: fraSub_corrected = (fraSub >> 4);
          5'h5: fraSub_corrected = (fraSub >> 5);
          5'h6: fraSub_corrected = (fraSub >> 6);
          5'h7: fraSub_corrected = (fraSub >> 7);
          5'h8: fraSub_corrected = (fraSub >> 8);
          5'h9: fraSub_corrected = (fraSub >> 9);
          default: fraSub_corrected = 10'h0;
        endcase
      else
        fraSub_corrected = fraSub;
    end

  always@* //create mids from fractions
    begin
      mid[0] = (float1 >> 10) & {21{float2[0]}};
      mid[1] = (float1 >> 9)  & {21{float2[1]}};
      mid[2] = (float1 >> 8)  & {21{float2[2]}};
      mid[3] = (float1 >> 7)  & {21{float2[3]}};
      mid[4] = (float1 >> 6)  & {21{float2[4]}};
      mid[5] = (float1 >> 5)  & {21{float2[5]}};
      mid[6] = (float1 >> 4)  & {21{float2[6]}};
      mid[7] = (float1 >> 3)  & {21{float2[7]}};
      mid[8] = (float1 >> 2)  & {21{float2[8]}};
      mid[9] = (float1 >> 1)  & {21{float2[9]}};
      mid[10] = float1        & {21{float2[10]}};
    end
  //Corrections for subnormal normal op
  always@*
    begin
      casex(res_full)
        22'b001xxxxxxxxxxxxxxxxxxx:
          begin
            fraSub = res_full[18:9];
          end
        22'b0001xxxxxxxxxxxxxxxxxx:
          begin
            fraSub = res_full[17:8];
          end
        22'b00001xxxxxxxxxxxxxxxxx:
          begin
            fraSub = res_full[16:7];
          end
        22'b000001xxxxxxxxxxxxxxxx:
          begin
            fraSub = res_full[15:6];
          end
        22'b0000001xxxxxxxxxxxxxxx:
          begin
            fraSub = res_full[14:5];
          end
        22'b00000001xxxxxxxxxxxxxx:
          begin
            fraSub = res_full[13:4];
          end
        22'b000000001xxxxxxxxxxxxx:
          begin
            fraSub = res_full[12:3];
          end
        22'b0000000001xxxxxxxxxxxx:
          begin
            fraSub = res_full[11:2];
          end
        22'b00000000001xxxxxxxxxxx:
          begin
            fraSub = res_full[10:1];
          end
        22'b000000000001xxxxxxxxxx:
          begin
            fraSub = res_full[9:0];
          end
        22'b0000000000001xxxxxxxxx:
          begin
            fraSub = {res_full[8:0], 1'd0};
          end
        22'b00000000000001xxxxxxxx:
          begin
            fraSub = {res_full[7:0], 2'd0};
          end
        22'b000000000000001xxxxxxx:
          begin
            fraSub = {res_full[6:0], 3'd0};
          end
        22'b0000000000000001xxxxxx:
          begin
            fraSub = {res_full[5:0], 4'd0};
          end
        22'b00000000000000001xxxxx:
          begin
            fraSub = {res_full[4:0], 5'd0};
          end
        22'b000000000000000001xxxx:
          begin
            fraSub = {res_full[3:0], 6'd0};
          end
        22'b0000000000000000001xxx:
          begin
            fraSub = {res_full[2:0], 7'd0};
          end
        22'b00000000000000000001xx:
          begin
            fraSub = {res_full[1:0], 8'd0};
          end
        22'b000000000000000000001x:
          begin
            fraSub = {res_full[0], 9'd0};
          end
        default:
          begin
            fraSub = 10'd0;
          end
      endcase
    end
  always@*
    begin
      casex(res_full)
        22'b001xxxxxxxxxxxxxxxxxxx:
          begin
            exSubCor = 5'd1;
          end
        22'b0001xxxxxxxxxxxxxxxxxx:
          begin
            exSubCor = 5'd2;
          end
        22'b00001xxxxxxxxxxxxxxxxx:
          begin
            exSubCor = 5'd3;
          end
        22'b000001xxxxxxxxxxxxxxxx:
          begin
            exSubCor = 5'd4;
          end
        22'b0000001xxxxxxxxxxxxxxx:
          begin
            exSubCor = 5'd5;
          end
        22'b00000001xxxxxxxxxxxxxx:
          begin
            exSubCor = 5'd6;
          end
        22'b000000001xxxxxxxxxxxxx:
          begin
            exSubCor = 5'd7;
          end
        22'b0000000001xxxxxxxxxxxx:
          begin
            exSubCor = 5'd8;
          end
        22'b00000000001xxxxxxxxxxx:
          begin
            exSubCor = 5'd9;
          end
        22'b000000000001xxxxxxxxxx:
          begin
            exSubCor = 5'd10;
          end
        22'b0000000000001xxxxxxxxx:
          begin
            exSubCor = 5'd11;
          end
        22'b00000000000001xxxxxxxx:
          begin
            exSubCor = 5'd12;
          end
        22'b000000000000001xxxxxxx:
          begin
            exSubCor = 5'd13;
          end
        22'b0000000000000001xxxxxx:
          begin
            exSubCor = 5'd14;
          end
        22'b00000000000000001xxxxx:
          begin
            exSubCor = 5'd15;
          end
        22'b000000000000000001xxxx:
          begin
            exSubCor = 5'd16;
          end
        22'b0000000000000000001xxx:
          begin
            exSubCor = 5'd17;
          end
        22'b00000000000000000001xx:
          begin
            exSubCor = 5'd18;
          end
        22'b000000000000000000001x:
          begin
            exSubCor = 5'd19;
          end
        default:
          begin
            exSubCor = 5'd0;
          end
      endcase
    end
endmodule

//float adder adds floating point numbers.
module float_adder(num1, num2, result, overflow, zero, NaN, precisionLost);
  //Ports
  input [15:0] num1, num2;
  output [15:0] result;
  output overflow; //overflow flag
  output zero; //zero flag
  output NaN; //Not a Number flag
  output reg precisionLost;
  //Reassing numbers as big and small
  reg [15:0] bigNum, smallNum; //to seperate big and small numbers
  //Decode big and small number
  wire [9:0] big_fra, small_fra; //to hold fraction part
  wire [4:0] big_ex_pre, small_ex_pre;
  wire [4:0] big_ex, small_ex; //to hold exponent part
  wire big_sig, small_sig; //to hold signs
  wire [10:0] big_float, small_float; //to hold as float number with integer
  reg [10:0] sign_small_float, shifted_small_float; //preparing small float
  wire [4:0] ex_diff; //difrence between exponentials
  reg [9:0] sum_shifted; //Shift fraction part of sum
  reg [3:0] shift_am;
  wire neg_exp;
  //Extensions for higher precision
  reg [9:0] small_extension;
  wire [9:0] sum_extension;

  wire [10:0] sum; //sum of numbers with integer parts
  wire sum_carry;
  wire sameSign;
  wire zeroSmall;
  wire inf_num; //at least on of the operands is inf.

  wire [4:0] res_exp_same_s, res_exp_diff_s;
  
  //Flags
  assign zero = (num1[14:0] == num2[14:0]) & (~num1[15] == num2[15]);
  assign overflow = ((&big_ex[4:1] & ~big_ex[0]) & sum_carry & sameSign) | inf_num;
  assign NaN = (&num1[14:10] & |num1[9:0]) | (&num2[14:10] & |num2[9:0]);
  assign inf_num = (&num1[14:10] & ~|num1[9:0]) | (&num2[14:10] & ~|num2[9:0]); //check for infinate number
  //Get result
  assign result[15] = big_sig; //result sign same as big sign
  assign res_exp_same_s = big_ex + {4'd0, (~zeroSmall & sum_carry & sameSign)} - {4'd0,({1'b0,result[9:0]} == sum)};
  assign res_exp_diff_s = (neg_exp | (shift_am == 4'd10)) ? 5'd0 : (~shift_am + big_ex + 5'd1);
  assign result[14:10] = ((sameSign) ? res_exp_same_s : res_exp_diff_s) | {5{overflow}}; //result exponent
  assign result[9:0] = ((zeroSmall) ? big_fra : ((sameSign) ? ((sum_carry) ? sum[10:1] : sum[9:0]) : ((neg_exp) ? 10'd0 : sum_shifted))) & {10{~overflow}};

  //decode numbers
  assign {big_sig, big_ex_pre, big_fra} = bigNum;
  assign {small_sig, small_ex_pre, small_fra} = smallNum;
  assign sameSign = (big_sig == small_sig);
  assign zeroSmall = ~(|small_ex | |small_fra);
  assign big_ex = big_ex_pre + {4'd0, ~|big_ex_pre};
  assign small_ex = small_ex_pre + {4'd0, ~|small_ex_pre};

  //add integer parts
  assign big_float = {|big_ex_pre, big_fra};
  assign small_float = {|small_ex_pre, small_fra};
  assign ex_diff = big_ex - small_ex; //diffrence between exponents
  assign {sum_carry, sum} = sign_small_float + big_float; //add numbers
  assign sum_extension = small_extension;

  //Get shift amount for subtraction
  assign neg_exp = (big_ex < shift_am);
  always@*
    begin
      casex(sum)
        11'b1xxxxxxxxxx: shift_am = 4'd0;
        11'b01xxxxxxxxx: shift_am = 4'd1;
        11'b001xxxxxxxx: shift_am = 4'd2;
        11'b0001xxxxxxx: shift_am = 4'd3;
        11'b00001xxxxxx: shift_am = 4'd4;
        11'b000001xxxxx: shift_am = 4'd5;
        11'b0000001xxxx: shift_am = 4'd6;
        11'b00000001xxx: shift_am = 4'd7;
        11'b000000001xx: shift_am = 4'd8;
        11'b0000000001x: shift_am = 4'd9;
        default: shift_am = 4'd10;
      endcase
    end

  //Shift result for sub.
  always@* 
    begin
      case (shift_am)
        4'd0: sum_shifted =  sum[9:0];
        4'd1: sum_shifted = {sum[8:0],sum_extension[9]};
        4'd2: sum_shifted = {sum[7:0],sum_extension[9:8]};
        4'd3: sum_shifted = {sum[6:0],sum_extension[9:7]};
        4'd4: sum_shifted = {sum[5:0],sum_extension[9:6]};
        4'd5: sum_shifted = {sum[4:0],sum_extension[9:5]};
        4'd6: sum_shifted = {sum[3:0],sum_extension[9:4]};
        4'd7: sum_shifted = {sum[2:0],sum_extension[9:3]};
        4'd8: sum_shifted = {sum[1:0],sum_extension[9:2]};
        4'd9: sum_shifted = {sum[0],  sum_extension[9:1]};
        default: sum_shifted = sum_extension;
      endcase
      case (shift_am)
        4'd0: precisionLost = |sum_extension;
        4'd1: precisionLost = |sum_extension[8:0];
        4'd2: precisionLost = |sum_extension[7:0];
        4'd3: precisionLost = |sum_extension[6:0];
        4'd4: precisionLost = |sum_extension[5:0];
        4'd5: precisionLost = |sum_extension[4:0];
        4'd6: precisionLost = |sum_extension[3:0];
        4'd7: precisionLost = |sum_extension[2:0];
        4'd8: precisionLost = |sum_extension[1:0];
        4'd9: precisionLost = |sum_extension[0];
        default: precisionLost = 1'b0;
      endcase
    end

  //take small number to exponent of big number
  always@* 
    begin
      case (ex_diff)
        5'h0: {shifted_small_float,small_extension} = {small_float,10'd0};
        5'h1: {shifted_small_float,small_extension} = {small_float,9'd0};
        5'h2: {shifted_small_float,small_extension} = {small_float,8'd0};
        5'h3: {shifted_small_float,small_extension} = {small_float,7'd0};
        5'h4: {shifted_small_float,small_extension} = {small_float,6'd0};
        5'h5: {shifted_small_float,small_extension} = {small_float,5'd0};
        5'h6: {shifted_small_float,small_extension} = {small_float,4'd0};
        5'h7: {shifted_small_float,small_extension} = {small_float,3'd0};
        5'h8: {shifted_small_float,small_extension} = {small_float,2'd0};
        5'h9: {shifted_small_float,small_extension} = {small_float,1'd0};
        5'ha: {shifted_small_float,small_extension} = small_float;
        5'hb: {shifted_small_float,small_extension} = small_float[10:1];
        5'hc: {shifted_small_float,small_extension} = small_float[10:2];
        5'hd: {shifted_small_float,small_extension} = small_float[10:3];
        5'he: {shifted_small_float,small_extension} = small_float[10:4];
        5'hf: {shifted_small_float,small_extension} = small_float[10:5];
        5'h10: {shifted_small_float,small_extension} = small_float[10:5];
        5'h11: {shifted_small_float,small_extension} = small_float[10:6];
        5'h12: {shifted_small_float,small_extension} = small_float[10:7];
        5'h13: {shifted_small_float,small_extension} = small_float[10:8];
        5'h14: {shifted_small_float,small_extension} = small_float[10:9];
        5'h15: {shifted_small_float,small_extension} = small_float[10];
        5'h16: {shifted_small_float,small_extension} = 0;
      endcase
    end

  always@* //if signs are diffrent take 2s compliment of small number
    begin
      if(sameSign)
        begin
          sign_small_float = shifted_small_float;
        end
      else
        begin
          sign_small_float = ~shifted_small_float + 11'b1;
        end
    end

  always@* //determine big number
    begin
      if(num2[14:10] > num1[14:10])
        begin
          bigNum = num2;
          smallNum = num1;
        end
      else if(num2[14:10] == num1[14:10])
        begin
          if(num2[9:0] > num1[9:0])
            begin
              bigNum = num2;
              smallNum = num1;
            end
          else
            begin
              bigNum = num1;
              smallNum = num2;
            end
        end
      else
        begin
          bigNum = num1;
          smallNum = num2;
        end
    end
endmodule
