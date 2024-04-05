/*

Image Utils

Obv. this is just dumb copied from FP utils.

Testing

*/

`timescale 1ns / 100ps

`include "../../utils/sim/sim.v"

`include "../../image/rtl/image_defs.v"

module image_spec_check( input [31:0] in, output [31:0] out );

    localparam IS = `IS( 0, 0, 100, 100, 0, 1, 0, 8, 8, 8, 0, 0 );

    localparam X_l = `IS_X_l;
    localparam X_m = `IS_X_m;

    localparam Y_l = `IS_X_l;

    assign out = X_l;

    localparam ISw = `IS_w;

    assign out = ISw;

    localparam PS = `IS_PIPE_SPEC( IS );

    assign out = PS;

    localparam P_D_w = `P_Data_w( PS );
    assign out = P_D_w;

    localparam P_DS_w = `P_DataSize_w( PS );
    assign out = P_DS_w;

    localparam P_RDS_w = `P_RevDataSize_w( PS );
    assign out = P_RDS_w;

    localparam P_w = `P_w( PS );
    assign out = P_w;

    localparam Iw = `I_w( IS );
    assign out = Iw;

endmodule

