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


// selecter
module jelly_shift
        #(
            parameter   SHIFT_WIDTH  = 5,
            parameter   DATA_WIDTH   = 32
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,

            input   wire                        left,
            input   wire                        rotation,
            input   wire                        arithmetic,
            input   wire                        shift_signed,
            
            input   wire    [SHIFT_WIDTH-1:0]   shift,
            input   wire    [DATA_WIDTH-1:0]    din,
            output  reg     [DATA_WIDTH-1:0]    dout
        );
    
    wire            [SHIFT_WIDTH-1:0]   ushift = shift;
    wire    signed  [SHIFT_WIDTH-1:0]   sshift = shift;

    wire            [DATA_WIDTH-1:0]    udata  = din;
    wire    signed  [DATA_WIDTH-1:0]    sdata  = din;
    
    localparam  ROT_NUM   = ((1 << SHIFT_WIDTH) + DATA_WIDTH + (DATA_WIDTH-1)) / DATA_WIDTH;
    localparam  ROT_SHIFT = (ROT_NUM - 1) * DATA_WIDTH;
    
    always @* begin
        dout = {DATA_WIDTH{1'bx}};
        
        casex ( {rotation, shift_signed, left, arithmetic} )
        4'b0000: dout = (udata >>  ushift);
        4'b0001: dout = (sdata >>> ushift);
        4'b0010: dout = (udata <<  ushift);
        4'b0011: dout = (sdata <<< ushift);
        
        4'b0100: dout = ((sshift >= 0) ? (udata >>  sshift) : (udata <<  -sshift));
        4'b0101: dout = ((sshift >= 0) ? (sdata >>> sshift) : (sdata <<< -sshift));
        4'b0110: dout = ((sshift >= 0) ? (udata <<  sshift) : (udata >>  -sshift));
        4'b0111: dout = ((sshift >= 0) ? (sdata <<< sshift) : (sdata >>> -sshift));

        4'b100x: dout = ({ROT_NUM{udata}} >> ushift);
        4'b101x: dout = (({ROT_NUM{udata}} << ushift) >> ROT_SHIFT);
        4'b110x: dout = ((sshift >= 0) ? ({ROT_NUM{udata}} >> sshift) : (({ROT_NUM{udata}} << ushift) >> ROT_SHIFT));
        4'b111x: dout = ((sshift >= 0) ? (({ROT_NUM{udata}} << ushift) >> ROT_SHIFT) : ({ROT_NUM{udata}} >> sshift));
        default: dout = {DATA_WIDTH{1'bx}};
        endcase
    end
    
endmodule


`default_nettype wire


// end of file
