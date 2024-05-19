// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//
//                                  Copyright (C) 2015-2020 by Ryuz
//                                  https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module tb_sin_3phase_tbl();
    localparam RATE = 1000.0/125.0;
    
    initial begin
        $dumpfile("tb_sin_3phase_tbl.vcd");
        $dumpvars(0, tb_sin_3phase_tbl);
        
    #100000
        $finish;
    end
    
    reg     reset = 1'b1;
    initial #(RATE*100) reset = 1'b0;
    
    reg     clk = 1'b1;
    always #(RATE/2.0) clk = ~clk;
    
    wire            cke = 1;
    
    reg     [9:0]   in_phase = 0;
    
    wire    [11:0]  out_x;
    wire    [11:0]  out_y;
    wire    [11:0]  out_z;
    
    sin_3phase_tbl
        i_sin_3phase_tbl
            (
                .reset      (reset),
                .clk        (clk),
                .cke        (cke),
                
                .in_phase   (in_phase),
                
                .out_x      (out_x),
                .out_y      (out_y),
                .out_z      (out_z)
            );
    
    always @(posedge clk) begin
        if ( reset ) begin
            in_phase <= 0;
        end
        else if ( cke ) begin
            in_phase <= in_phase + 1;
        end
    end
    
    
endmodule


`default_nettype wire


// end of file
