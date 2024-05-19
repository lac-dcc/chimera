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


// 倍速クロック位相検知
module jelly_clkx2_phase
        #(
            parameter   DATA_WIDTH = 32
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        clkx2,
            
            output  wire                        phase
        );
    
    
    reg     reg_clk_ff      = 1'b0;
    reg     reg_clkx2_ff    = 1'b1;
    reg     reg_clkx2_phase = 1'b0;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_clk_ff <= 1'b0;
        end
        else begin
            reg_clk_ff <= ~reg_clk_ff;
        end
    end
    
    always @(posedge clkx2) begin
        if ( reset ) begin
            reg_clkx2_ff    <= 1'b0;
            reg_clkx2_phase <= 1'b0;
        end
        else begin
            reg_clkx2_ff    <= reg_clk_ff;
            reg_clkx2_phase <= reg_clkx2_ff ^ reg_clk_ff;
        end
    end
    
    assign phase = reg_clkx2_phase;
    
endmodule


`default_nettype wire


// end of file
