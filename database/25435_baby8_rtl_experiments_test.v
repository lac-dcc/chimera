// This program was cloned from: https://github.com/jeceljr/baby8
// License: MIT License

/*
 * Generated by Digital. Don't modify this file!
 * Any changes will be lost if this file is regenerated.
 */

module DIG_Register_BUS #(
    parameter Bits = 1
)
(
    input C,
    input en,
    input [(Bits - 1):0]D,
    output [(Bits - 1):0]Q
);

    reg [(Bits - 1):0] state = 'h0;

    assign Q = state;

    always @ (posedge C) begin
        if (en)
            state <= D;
   end
endmodule

module Mux_2x1_NBits #(
    parameter Bits = 2
)
(
    input [0:0] sel,
    input [(Bits - 1):0] in_0,
    input [(Bits - 1):0] in_1,
    output reg [(Bits - 1):0] out
);
    always @ (*) begin
        case (sel)
            1'h0: out = in_0;
            1'h1: out = in_1;
            default:
                out = 'h0;
        endcase
    end
endmodule


module Mux_8x1
(
    input [2:0] sel,
    input in_0,
    input in_1,
    input in_2,
    input in_3,
    input in_4,
    input in_5,
    input in_6,
    input in_7,
    output reg out
);
    always @ (*) begin
        case (sel)
            3'h0: out = in_0;
            3'h1: out = in_1;
            3'h2: out = in_2;
            3'h3: out = in_3;
            3'h4: out = in_4;
            3'h5: out = in_5;
            3'h6: out = in_6;
            3'h7: out = in_7;
            default:
                out = 'h0;
        endcase
    end
endmodule


// This circuit calculates the 16 possible conditions used by the test instruction
// in the same style as the PDP-11 and the ARM processors
module test (
  input [3:0] flags, // the Z, N, C and V bits generated from the ALU
  input curInt, // currently in Interrupt mode
  input clock,
  input saveFlags, // store the current values of the flags for later test instructions
  input [3:0] cond, // selects between 16 PDP-11/ARM style conditions
  output tr // test result indicates if the condition selected is true

);
  wire s0;
  wire [3:0] s1;
  wire s2;
  wire [3:0] s3;
  wire [3:0] s4;
  wire z;
  wire c;
  wire n;
  wire v;
  wire [2:0] s5;
  wire s6;
  wire s7;
  wire s8;
  wire s9;
  assign s2 = (curInt & saveFlags);
  assign s0 = (~ curInt & saveFlags);
  assign s5 = cond[3:1];
  // normalf
  DIG_Register_BUS #(
    .Bits(4)
  )
  DIG_Register_BUS_i0 (
    .D( flags ),
    .C( clock ),
    .en( s0 ),
    .Q( s1 )
  );
  // intf
  DIG_Register_BUS #(
    .Bits(4)
  )
  DIG_Register_BUS_i1 (
    .D( flags ),
    .C( clock ),
    .en( s2 ),
    .Q( s3 )
  );
  Mux_2x1_NBits #(
    .Bits(4)
  )
  Mux_2x1_NBits_i2 (
    .sel( curInt ),
    .in_0( s1 ),
    .in_1( s3 ),
    .out( s4 )
  );
  assign z = s4[0];
  assign c = s4[1];
  assign n = s4[2];
  assign v = s4[3];
  assign s6 = (~ z & c);
  assign s7 = ~ (n ^ v);
  assign s8 = ~ ((n & ~ z) ^ v);
  Mux_8x1 Mux_8x1_i3 (
    .sel( s5 ),
    .in_0( z ),
    .in_1( c ),
    .in_2( n ),
    .in_3( v ),
    .in_4( s6 ),
    .in_5( s7 ),
    .in_6( s8 ),
    .in_7( 1'b1 ),
    .out( s9 )
  );
  assign tr = (s9 ^ cond[0]);
endmodule
