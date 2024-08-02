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
module jelly_bit_shift
        #(
            parameter   SHIFT_WIDTH   = 4,
            parameter   DATA_WIDTH    = (1 << SHIFT_WIDTH),
            
            parameter   LEFT       = 0,
            parameter   ARITHMETIC = 0,
            parameter   ROTATION   = 0,
            
            
            parameter   USE_PRIMITIVE = 0,
            parameter   DEVICE        = "RTL"
        )
        (
            input   wire    [SHIFT_WIDTH-1:0]   shift,
            input   wire    [DATA_WIDTH-1:0]    in_data,
            output  wire    [DATA_WIDTH-1:0]    out_data
        );
    
    genvar      i;
    
    wire    [DATA_WIDTH-1:0]    stuffing;
    
    assign stuffing = ROTATION              ? in_data                             :
                      (!LEFT && ARITHMETIC) ? {DATA_WIDTH{in_data[DATA_WIDTH-1]}} :
                                              {DATA_WIDTH{1'b0}};
    
    generate
    if ( !USE_PRIMITIVE || DEVICE == "RTL" ) begin : blk_rtl
        assign out_data = LEFT ? (({in_data, stuffing} << shift) >> DATA_WIDTH) :
                                 (({in_data, stuffing} >> shift));
    end
    else begin : blk_mux
        // LEFT時に primitive のマルチプレクサに適合するように結線をリバースする
        
        // input reverse
        wire    [DATA_WIDTH-1:0]    rev_stuffing;
        wire    [DATA_WIDTH-1:0]    rev_in_data;
        for ( i = 0; i < DATA_WIDTH; i = i+1 ) begin : loop_in_rev
            assign rev_stuffing[i] = LEFT ? stuffing[DATA_WIDTH-1-i] : stuffing[i];
            assign rev_in_data [i] = LEFT ? in_data [DATA_WIDTH-1-i] : in_data [i];
        end
        
        // selector
        wire    [DATA_WIDTH-1:0]    sel_data;
        for ( i = 0; i < DATA_WIDTH; i = i+1 ) begin : loop_mux
            wire    [DATA_WIDTH-1:0]    sel_bits = ({rev_stuffing, rev_in_data} >> i);
            jelly_bit_selector
                    #(
                        .SEL_WIDTH      (SHIFT_WIDTH),
                        .BIT_WIDTH      (DATA_WIDTH),
                        .USE_PRIMITIVE  (USE_PRIMITIVE),
                        .DEVICE         (DEVICE)
                    )
                i_bit_selector
                    (
                        .sel            (shift),
                        .din            (sel_bits),
                        .dout           (sel_data[i])
                    );
        end
        
        // output reverse
        for ( i = 0; i < DATA_WIDTH; i = i+1 ) begin : loop_out_rev
            assign out_data[i] = LEFT ? sel_data[DATA_WIDTH-1-i] : sel_data[i];
        end
    end
    endgenerate
    
endmodule



`default_nettype wire


// end of file
