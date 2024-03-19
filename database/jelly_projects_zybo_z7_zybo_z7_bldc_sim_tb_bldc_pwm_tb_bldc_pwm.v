// ---------------------------------------------------------------------------
//
//                                  Copyright (C) 2015-2020 by Ryuz
//                                  https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module tb_bldc_pwm();
    localparam RATE = 1000.0/125.0;
    
    initial begin
        $dumpfile("tb_bldc_pwm.vcd");
        $dumpvars(0, tb_bldc_pwm);
        
    #10000000
        $finish;
    end
    
    reg     reset = 1'b1;
    initial #(RATE*100) reset = 1'b0;
    
    reg     clk = 1'b1;
    always #(RATE/2.0) clk = ~clk;
    
    
    parameter   SUB_PAHSE_WIDTH = 8;
    parameter   PAHSE_WIDTH     = 3 + SUB_PAHSE_WIDTH;
    parameter   PAHSE_MAX     = {3'd5, {SUB_PAHSE_WIDTH{1'b1}}};
    
    
    reg     [PAHSE_WIDTH-1:0]   reg_phase = 0;
    wire                        update;
    wire                        pwm_u;
    wire                        pwm_v;
    wire                        pwm_w;
    wire                        en_u;
    wire                        en_v;
    wire                        en_w;
    
    bldc_pwm
            #(
                .SUB_PAHSE_WIDTH    (SUB_PAHSE_WIDTH),
                .ASYNC_UPDATE       (0)
            )
        i_bldc_pwm
            (
                .reset              (reset),
                .clk                (clk),
                
                .pwm                (1'b0),
                .phase              (reg_phase),
                .update             (update),
                
                .pwm_u              (pwm_u),
                .pwm_v              (pwm_v),
                .pwm_w              (pwm_w),
                .en_u               (en_u),
                .en_v               (en_v),
                .en_w               (en_w)
            );
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_phase <= 0;
        end
        else begin
            if ( update ) begin
                if ( reg_phase >= PAHSE_MAX ) begin
                    reg_phase <= 0;
                end
                else begin
                    reg_phase <= reg_phase + 1;
                end
            end
        end
    end
    
    
endmodule


`default_nettype wire


// end of file
