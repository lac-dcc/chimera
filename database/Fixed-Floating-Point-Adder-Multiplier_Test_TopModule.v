/* ----------------------------------------------------- *
 * Title       : FixFlo Adder Multiplier Modules         *
 * Project     : Fixed Floating Point Adder Multiplier   *
 * ----------------------------------------------------- *
 * File        : TopModule.v                             *
 * Author      : Yigit Suoglu                            *
 * Last Edit   : 22/05/2021                              *
 * ----------------------------------------------------- *
 * Description : Top module implementation for adder     *
 *               multiplier modules                      *
 * ----------------------------------------------------- */
`timescale 1ns / 1ps
// `include "Sources/adderMultiplier16.v"
// `include "Test/btn_debouncer.v"
// `include "Test/ssd_util.v"

module FixedFloatingAddMulti(clk, rst, sw, leds, btnU, btnL, btnR, btnD, seg, an);
  localparam IDLE = 2'b0, WAIT1 = 2'b1, WAIT2 = 2'b10, RESULT = 2'b11;
  localparam Floating_Add = 2'b0;
  localparam Floating_Mult = 2'b1;
  localparam Fixed_Add = 2'b10;
  localparam Fixed_Mult = 2'b11;
  input clk, rst;
  input [15:0] sw;
  input btnU, btnL, btnR, btnD;
  wire FlAd, FlMd, FiAd, FiMd; //Fi: fixed, Fl: floating, A: add, M: multiply
  wire FlA, FlM, FiA, FiM; //Fi: fixed, Fl: floating, A: add, M: multiply (debounced)
  output [15:0] leds;
  output [6:0] seg;
  output [3:0] an;
  wire commonBTN; //senstive to all buttons (except rst)
  wire [15:0] result_flA, result_flM, result_fiA, result_fiM, ssdIn;
  reg [15:0] num1, num2, ssdInRESULT;
  reg [1:0] state;
  reg overflow, zero, NaN, precisionLost;
  wire overflow_flA, zero_flA, NaN_flA;
  wire overflow_flM, zero_flM, NaN_flM, precisionLost_flM;
  wire overflow_fiA;
  wire overflow_fiM, precisionLost_fiM, precisionLost_flA;
  reg [1:0] op; //MSB for num format LSB for operation
  wire of_FlA, of_FlM, of_FiA, of_FiM; //overflow signals for operations
  wire ssdEnable; //enables decoders
  wire [3:0] digit0, digit1, digit2, digit3;

  //Switch outputs
  assign ssdIn = (&state) ? ssdInRESULT : sw;
  always@*
    begin
      case(op)
        Floating_Add:
          begin
            ssdInRESULT = result_flA;
            overflow = overflow_flA;
            zero = zero_flA;
            NaN = NaN_flA;
            precisionLost = precisionLost_flA;
          end
        Floating_Mult:
          begin
            ssdInRESULT = result_flM;
            overflow = overflow_flM;
            zero = zero_flM;
            NaN = NaN_flM;
            precisionLost = precisionLost_flM;
          end
        Fixed_Add:
          begin
            ssdInRESULT = result_fiA;
            overflow = overflow_fiA;
            zero = 1'b0;
            NaN = 1'b0;
            precisionLost = 1'b0;
          end
        Fixed_Mult:
          begin
            ssdInRESULT = result_fiM;
            overflow = overflow_fiM;
            zero = 1'b0;
            NaN = 1'b0;
            precisionLost = precisionLost_fiM;
          end
      endcase
      
    end
  
  //control signals
  assign ssdEnable = |state;
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
          op <= Floating_Add;
        end
      else
        begin
            op <= (commonBTN) ? {(FiA | FiM), (FiM | FlM)} : op;
        end
    end
  
  //State transactions
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        state <= WAIT1;
      else
        state <= state + {1'd0, (commonBTN & ~&state)};
    end

  //Operation buttons
  assign FlAd = btnU; //Up ~ Float Add
  assign FlMd = btnL; //Left ~ Float Multi
  assign FiAd = btnD; //Down ~ Fixed Add 
  assign FiMd = btnR; //Right ~ Fixed Multi
  debouncer db0(clk, rst, FlAd, FlA);
  debouncer db1(clk, rst, FlMd, FlM);
  debouncer db2(clk, rst, FiAd, FiA);
  debouncer db3(clk, rst, FiMd, FiM);
  assign commonBTN = FlA | FlM | FiA | FiM;

  //Leds
  assign leds = {overflow, zero, NaN, precisionLost, 10'd0, state};

  //uuts
  fixed_adder uut_FiA(num1, num2, result_fiA, overflow_fiA);
  fixed_multi uut_FiM(num1, num2, result_fiM, overflow_fiM, precisionLost_fiM,);
  float_multi uut_FlM(num1, num2, result_flM, overflow_flM, zero_flM, NaN_flM, precisionLost_flM);
  float_adder uut_FlA(num1, num2, result_flA, overflow_flA, zero_flA, NaN_flA, precisionLost_flA);

  //seven segment display
  assign {digit3, digit2, digit1, digit0} = ssdIn;
  ssdController4 ssdCntr(clk, rst, {4{ssdEnable}}, digit3, digit2, digit1, digit0, seg, an);
  
  //get numbers
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
          num1 <= 16'b0;
          num2 <= 16'b0;
        end
      else
        case(state)
          WAIT1: num1 <= sw;
          WAIT2: num2 <= sw;
        endcase
    end
endmodule
