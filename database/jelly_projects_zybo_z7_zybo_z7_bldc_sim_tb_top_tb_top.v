// ---------------------------------------------------------------------------
//
//                                  Copyright (C) 2015-2020 by Ryuz
//                                  https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module tb_top();
    localparam RATE = 1000.0/125.0;
    
    initial begin
        $dumpfile("tb_top.vcd");
        $dumpvars(0, tb_top);
        
    #1000000000
        $finish;
    end
    
    
    reg     reset = 1'b1;
    initial #(RATE*100) reset = 1'b0;
    
    reg     clk = 1'b1;
    always #(RATE/2.0) clk = ~clk;
    
    
    // ----------------------------------
    //  top net
    // ----------------------------------
    
    wire            bldc_u_en;
    wire            bldc_v_en;
    wire            bldc_w_en;
    wire            bldc_u_hl;
    wire            bldc_v_hl;
    wire            bldc_w_hl;
    
    wire    [3:0]       led;
    
    zybo_z7_bldc
            #(
                .SUB_PAHSE_WIDTH    (8)
            )
        i_top
            (
                .in_reset           (reset),
                .in_clk125          (clk),
                
                .dip_sw             (4'b0101),
                
                .bldc_u_en          (bldc_u_en),
                .bldc_v_en          (bldc_v_en),
                .bldc_w_en          (bldc_w_en),
                .bldc_u_hl          (bldc_u_hl),
                .bldc_v_hl          (bldc_v_hl),
                .bldc_w_hl          (bldc_w_hl)
            );
    
    
    wire    [31:0]  en_sum = bldc_u_en + bldc_v_en + bldc_w_en;
    
    
endmodule


`default_nettype wire


// end of file
