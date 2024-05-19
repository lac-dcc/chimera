// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the system on fpga system
//
//  Test DMA
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module sin_3phase_pwm
        #(
            parameter   PHASE_WIDTH   = 10,
            parameter   COUNTER_WIDTH = 12
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            
            input   wire    [PHASE_WIDTH-1:0]   in_phase,
            
            output  wire                        pwm_x,
            output  wire                        pwm_y,
            output  wire                        pwm_z
        );
    
    
    wire    [COUNTER_WIDTH-1:0]  x_th;
    wire    [COUNTER_WIDTH-1:0]  y_th;
    wire    [COUNTER_WIDTH-1:0]  z_th;
    sin_3phase_tbl
        i_sin_3phase_tbl
            (
                .reset      (reset),
                .clk        (clk),
                .cke        (1'b1),
                
                .in_phase   (in_phase),
                
                .out_x      (x_th),
                .out_y      (y_th),
                .out_z      (z_th)
            );
    
    
    reg     [COUNTER_WIDTH-1:0] reg_count;
    reg                         reg_pwm_x;
    reg                         reg_pwm_y;
    reg                         reg_pwm_z;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_count <= 0;
            reg_pwm_x <= 1'b0;
            reg_pwm_y <= 1'b0;
            reg_pwm_z <= 1'b0;
        end
        else begin
            reg_count <= reg_count + 1;
            reg_pwm_x <= reg_count < x_th;
            reg_pwm_y <= reg_count < y_th;
            reg_pwm_z <= reg_count < z_th;
        end
    end
    
    assign pwm_x = reg_pwm_x;
    assign pwm_y = reg_pwm_y;
    assign pwm_z = reg_pwm_z;
    
    
endmodule


`default_nettype wire


// end of file

