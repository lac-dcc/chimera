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


// 倍速クロック多重化部
module jelly_clkx2_mux
        #(
            parameter   DATA_WIDTH = 32
        )
        (
            input   wire                        reset,
            input   wire                        cke,
            input   wire                        clkx2,
            input   wire                        phase,
            
            input   wire    [DATA_WIDTH-1:0]    in0_data,
            input   wire                        in0_valid,
            
            input   wire    [DATA_WIDTH-1:0]    in1_data,
            input   wire                        in1_valid,
            
            output  wire    [DATA_WIDTH-1:0]    out_data,
            output  wire                        out_valid
        );
    
    reg     [DATA_WIDTH-1:0]    reg_data;
    reg                         reg_valid;
    
    always @(posedge clkx2) begin
        if ( reset ) begin
            reg_data  <= {DATA_WIDTH{1'bx}};
            reg_valid <= 1'bx;
        end
        else if ( cke ) begin
            reg_data  <= phase ? in0_data  : in1_data;
            reg_valid <= phase ? in0_valid : in1_valid;
        end
    end
    
    
endmodule


`default_nettype wire


// end of file
