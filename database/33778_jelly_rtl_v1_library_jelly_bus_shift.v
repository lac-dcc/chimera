// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// shift
module jelly_bus_shift
        #(
            parameter   SHIFT_WIDTH   = 4,
            parameter   NUM           = (1 << SHIFT_WIDTH),
            parameter   DATA_WIDTH    = 8,
            
            parameter   LEFT          = 0,
            parameter   ARITHMETIC    = 0,      // <- 使わない？
            parameter   ROTATION      = 0,
            
            parameter   USE_PRIMITIVE = 0,
            parameter   DEVICE        = "7SERIES" // "RTL"
        )
        (
            input   wire    [SHIFT_WIDTH-1:0]       shift,
            input   wire    [NUM*DATA_WIDTH-1:0]    in_data,
            output  wire    [NUM*DATA_WIDTH-1:0]    out_data
        );
    
    genvar      i, j;
    
    generate
    for ( i = 0; i < DATA_WIDTH; i = i+1 ) begin : loop_shift
        wire    [NUM-1:0]   in_bus;
        wire    [NUM-1:0]   out_bus;
        
        for ( j = 0; j < NUM; j = j+1 ) begin : loop_in_bus
            assign in_bus[j] = in_data[j*DATA_WIDTH + i];
        end
        
        jelly_bit_shift
                #(
                    .SHIFT_WIDTH    (SHIFT_WIDTH),
                    .DATA_WIDTH     (NUM),
                    
                    .LEFT           (LEFT),
                    .ARITHMETIC     (ARITHMETIC),
                    .ROTATION       (ROTATION),
                    
                    .USE_PRIMITIVE  (USE_PRIMITIVE),
                    .DEVICE         (DEVICE)
                )
            i_bit_shift
                (
                    .shift          (shift),
                    .in_data        (in_bus),
                    .out_data       (out_bus)
                );
        
        for ( j = 0; j < NUM; j = j+1 ) begin : loop_out_bus
            assign out_data[j*DATA_WIDTH + i] = out_bus[j];
        end
    end
    endgenerate
    
    
endmodule



`default_nettype wire


// end of file
