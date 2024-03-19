`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Scott R. Gravenhorst
// email: music.m0Aker@gte.net
// Create Date:    09/10/2007
// Design Name:    SVF
// Module Name:    SVF
// Project Name:   State Variable Filter
// Description:    RAM based SVF with shared multipliers.
// 
// maximum Q depends on sample rate, max Q increases with sample rate
//    Note: input signal q is really the reciprocal of Q sent by the patch editor.
//          q has 15 bit signed resolution.
// maximum input am0Plitude = +/- 2047 (12 bits)
//
//////////////////////////////////////////////////////////////////////////////////

module SVF_multi(
  clk,                    // system clock
  ena,                    // Tell the filter to go
  sel,                    // select from 8 filters
  f,                      // f (not Hz, but usable to control frequency, more linear as sample rate increases)
  q,                      // q (1/Q)
  In,
  Out,
  reset
  );

  input                clk;  
  input                ena;
  input         [2:0]  sel;
  input signed  [17:0] f;
  input signed  [17:0] q;
  input signed  [11:0] In;
  output signed [17:0] Out;
  input reset;

  wire               clk;
  wire               ena;
  wire        [2:0]  sel;
  wire signed [17:0] f;
  wire signed [17:0] q;
  wire signed [11:0] In;     // 12 bit data input
  reg signed  [11:0] InReg;
  wire signed [17:0] Out;
  wire reset;
  
  reg signed [35:0] z1 [7:0];                // feedback #1
  reg signed [35:0] z2 [7:0];                // feedback #2

  reg signed [35:0] z1_cache;
  reg signed [35:0] z2_cache;

  reg signed  [17:0] m0A = 18'sd0;
  reg signed  [17:0] m0B = 18'sd0;
  wire signed [35:0] m0P;
  
  reg signed  [17:0] m1A = 18'sd0;
  reg signed  [17:0] m1B = 18'sd0;
  wire signed [35:0] m1P;

  wire signed [35:0] IN_SignExt;

  assign IN_SignExt = {{6{InReg[11]}},InReg,18'h00000};    // sign extension

  assign Out = z2_cache >>> 18;

  assign m0P = m0A * m0B;

  assign m1P = m1A * m1B;

// SVF state machine, shares a multiplier
  reg run = 1'b0;
  reg [2:0] state = 3'b0;

  always @ ( posedge clk )
    begin
    if ( ena == 1'b1 ) 
      begin
      run <= 1'b1;
      state <= 3'd0;
      InReg <= In;     // lock the input value this enable cycle
      
      z1_cache <= z1[sel];
      z2_cache <= z2[sel];
      end
    else
      begin
      if ( run == 1'b1 )
        begin
        state <= state + 1;

        case ( state )

          3'd0:
            begin
            m0A <= z1_cache >>> 17;
            m0B <= q;

            m1A <= z1_cache >>> 17;
            m1B <= f;
            end

          3'd1:
            begin
            m0A <= f;
            m0B <= (IN_SignExt - m0P - z2_cache) >>> 17;      // m0B <- ( input - (q * z1) - z2 ), m0B also called "sum1"
            end
          
          3'd2:
            begin
            if ( reset )
              begin
              z1_cache <= 0;
              z2_cache <= 0;
              end
            else
              begin
              z2_cache <= m1P + z2_cache ;                    // z2 <- ( f * ( input - (q * z1) - z2 ) + z2 ) 
              z1_cache <= m0P + z1_cache ;                    // z1 <- (f * z1) + z1 ;
              end
            end
            
          3'd3:
            begin
            z1[sel] <= z1_cache;
            z2[sel] <= z2_cache;
            run <= 1'b0;
            end

        endcase

        end
      end
    end
endmodule
