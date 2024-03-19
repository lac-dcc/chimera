// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// 整数の順次インクリメント/デクリメント値生成コア
module jelly_integer_step
        #(
            parameter   DATA_WIDTH = 32
        )
        (
            input   wire                                clk,
            
            input   wire    [5:0]                       cke,
            
            // input
            input   wire    signed  [DATA_WIDTH-1:0]    s_param_init,
            input   wire    signed  [DATA_WIDTH-1:0]    s_param_step,
            input   wire                                s_initial,
            input   wire                                s_increment,
            
            // output
            output  wire    signed  [DATA_WIDTH-1:0]    m_data
        );
    
    reg     signed  [DATA_WIDTH-1:0]    reg_data;
    
    always @(posedge clk) begin
        if ( cke ) begin
            if ( s_initial ) begin
                reg_data <= s_param_init;
            end
            else begin
                if ( s_increment ) begin
                    reg_data <= reg_data + s_param_step;
                end
            end
        end
    end
    
    assign m_data = reg_data;
    
endmodule


`default_nettype wire


// end of file
