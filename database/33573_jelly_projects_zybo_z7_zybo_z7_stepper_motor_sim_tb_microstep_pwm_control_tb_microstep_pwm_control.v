// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//
//                                  Copyright (C) 2015-2020 by Ryuz
//                                  https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module tb_microstep_pwm_control();
    localparam RATE = 1000.0/125.0;
    
    initial begin
        $dumpfile("tb_microstep_pwm_control.vcd");
        $dumpvars(0, tb_microstep_pwm_control);
        
    #10000000
        $finish;
    end
    
    reg     reset = 1'b1;
    initial #(RATE*100) reset = 1'b0;
    
    reg     clk = 1'b1;
    always #(RATE/2.0) clk = ~clk;
    
    
    parameter   PAHSE_WIDTH     = 16;
    parameter   Q_WIDTH         = 12;
    parameter   OUTPUT_WIDTH    = PAHSE_WIDTH - Q_WIDTH;
    parameter   MICROSTEP_WIDTH = 8;
    
    wire                        microstep_en   = 1'b1;
    wire                        nanostep_en    = 1'b1;
    wire                        asyc_update_en = 1'b0;
    
    wire    [PAHSE_WIDTH-1:0]   phase;
    wire                        update;
    
    wire    [OUTPUT_WIDTH-1:0]  out_val;
    
    microstep_pwm_control
            #(
                .PAHSE_WIDTH        (PAHSE_WIDTH),
                .Q_WIDTH            (Q_WIDTH),
                .OUTPUT_WIDTH       (OUTPUT_WIDTH),
                .MICROSTEP_WIDTH    (MICROSTEP_WIDTH)
            )
    microstep_pwm_control
            (
                .reset              (reset),
                .clk                (clk),
                
                .microstep_en       (microstep_en),
                .nanostep_en        (nanostep_en),
                .asyc_update_en     (asyc_update_en),
                
                .phase              (phase),
                .update             (update),
                
                .out_val            (out_val)
            );
    
    
    reg     [PAHSE_WIDTH-1:0]   reg_phase;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_phase <= 0;
        end
        else begin
            if ( update ) begin
                reg_phase <= reg_phase + 7;
            end
        end
    end
    
    assign phase = reg_phase;
    
    
endmodule


`default_nettype wire


// end of file
