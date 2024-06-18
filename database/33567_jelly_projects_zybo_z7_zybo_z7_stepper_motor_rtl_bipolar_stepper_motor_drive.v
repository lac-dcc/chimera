// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the system on fpga system
//
//  BLDC PWM
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module bipolar_stepper_motor_drive
        #(
            parameter   Q_WIDTH         = 16,       // 小数点サイズ
            parameter   MICROSTEP_WIDTH = 12,
            parameter   PAHSE_WIDTH     = 2 + Q_WIDTH
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            
            input   wire                        microstep_en,
            input   wire                        nanostep_en,
            input   wire                        asyc_update_en,
            
            input   wire    [PAHSE_WIDTH-1:0]   phase,
            output  wire                        update,
            
            output  wire                        out_a,
            output  wire                        out_b
        );
    
    
    wire    [1:0]    out_val;
    
    microstep_pwm_control
            #(
                .PAHSE_WIDTH        (2+Q_WIDTH),
                .Q_WIDTH            (Q_WIDTH),
                .OUTPUT_WIDTH       (2),
                .MICROSTEP_WIDTH    (MICROSTEP_WIDTH)
            )
        i_microstep_pwm_control
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
    
    
    reg     [1:0]                   reg_out;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_out <= 2'b00;
        end
        else begin
            case ( out_val )
            2'd0:   reg_out <= 2'b00;
            2'd1:   reg_out <= 2'b01;
            2'd2:   reg_out <= 2'b11;
            2'd3:   reg_out <= 2'b10;
            endcase
        end
    end
    
    assign out_a = reg_out[0];
    assign out_b = reg_out[1];
    
endmodule


`default_nettype wire


// end of file

