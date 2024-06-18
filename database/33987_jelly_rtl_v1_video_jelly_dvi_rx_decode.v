// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_dvi_rx_decode
        (
            input   wire            reset,
            input   wire            clk,
            
            input   wire    [9:0]   in_d,
            
            output  wire            out_de,
            output  wire    [7:0]   out_d,
            output  wire            out_c0,
            output  wire            out_c1
        );
    
    // stage 0
    wire    [9:0]       st0_d = in_d;
    
    // stage 1
    reg                 st1_de;
    reg                 st1_c0;
    reg                 st1_c1;
    reg     [7:0]       st1_d;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st1_de    <= 1'b0;
            st1_c0    <= 1'b0;
            st1_c1    <= 1'b0;
            st1_d     <= {8{1'bx}};
        end
        else begin
            // stage 1
            st1_de <= 1'b0;
            case ( st0_d )
            10'b1101010100: {st1_c1, st1_c0} <= 2'b00;
            10'b0010101011: {st1_c1, st1_c0} <= 2'b01;
            10'b0101010100: {st1_c1, st1_c0} <= 2'b10;
            10'b1010101011: {st1_c1, st1_c0} <= 2'b11;
            default:
                begin
                st1_de <= 1'b1;
                case ( st0_d[9:8] )
                2'b00 : st1_d <= ~( st0_d[7:0] ^ { st0_d[6:1], 1'b1});
                2'b01 : st1_d <=  ( st0_d[7:0] ^ { st0_d[6:1], 1'b0});
                2'b10 : st1_d <= ~(~st0_d[7:0] ^ {~st0_d[6:1], 1'b1});
                2'b11 : st1_d <=  (~st0_d[7:0] ^ {~st0_d[6:1], 1'b0});
                endcase
                end
            endcase
        end
    end
    
    assign out_de = st1_de;
    assign out_d  = st1_d;
    assign out_c0 = st1_c0;
    assign out_c1 = st1_c1;
    
endmodule


`default_nettype wire


// end of file
