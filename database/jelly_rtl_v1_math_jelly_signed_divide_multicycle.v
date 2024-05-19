// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale       1ns / 1ps
`default_nettype none


// example
//  7 /  3 =  2,  7 %  3 =  1
//  7 / -3 = -2,  7 % -3 =  1
// -7 /  3 = -2, -7 %  3 = -1
// -7 / -3 =  2, -7 % -3 = -1

// 符号つき整数マルチサイクル除算器
module jelly_signed_divide_multicycle
        #(
            parameter   DATA_WIDTH = 32
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
            // input
            input   wire    signed  [DATA_WIDTH-1:0]    s_data0,
            input   wire    signed  [DATA_WIDTH-1:0]    s_data1,
            input   wire                                s_valid,
            output  wire                                s_ready,
            
            // output
            output  wire    signed  [DATA_WIDTH-1:0]    m_quotient,
            output  wire    signed  [DATA_WIDTH-1:0]    m_remainder,
            output  wire                                m_valid,
            input   wire                                m_ready
        );
    
    
    // NEG
    function [DATA_WIDTH-1:0]   neg;
    input   [DATA_WIDTH-1:0]    in_data;
        begin
            neg = ~in_data + 1;
        end
    endfunction
    
    // ABS
    function [DATA_WIDTH-1:0]   abs;
    input   [DATA_WIDTH-1:0]    in_data;
        begin
            abs = in_data[DATA_WIDTH-1] ? ~in_data + 1 : in_data;
        end
    endfunction
    
    
    reg                         reg_busy;
    reg                         reg_ready;
    reg                         reg_valid;
    
    reg     [DATA_WIDTH-1:0]    reg_counter;
    wire    [DATA_WIDTH-1:0]    next_counter = {reg_counter, 1'b1};
    
    reg     [DATA_WIDTH-1:0]    reg_quotient;
    reg     [DATA_WIDTH-1:0]    reg_remainder;
    reg     [DATA_WIDTH-1:0]    reg_divisor;

    reg                         reg_quotient_sign;
    reg                         reg_remainder_sign;
    
    
    wire    [DATA_WIDTH-1:0]    remainder1;
    wire    [DATA_WIDTH-1:0]    quotient1;
    wire    [DATA_WIDTH:0]      quotient2;
    
    
    assign {remainder1, quotient1} = {reg_remainder, reg_quotient, ~quotient2[DATA_WIDTH]};
    assign quotient2               = remainder1 - reg_divisor;
    
    always @ ( posedge clk ) begin
        if ( reset ) begin
            reg_busy           <= 1'b0;
            reg_ready          <= 1'b0;
            reg_valid          <= 1'b0;
            reg_counter        <= {DATA_WIDTH{1'bx}};
            reg_quotient       <= {DATA_WIDTH{1'bx}};
            reg_remainder      <= {DATA_WIDTH{1'bx}};
            reg_divisor        <= {DATA_WIDTH{1'bx}};
            reg_quotient_sign  <= 1'bx;
            reg_remainder_sign <= 1'bx;
        end
        else if ( cke ) begin
            if ( !reg_busy && !reg_valid ) begin
                reg_ready <= 1'b1;
            end
            
            if ( m_valid & m_ready ) begin
                reg_valid <= 1'b0;
                reg_ready <= 1'b1;
            end
            
            if ( s_valid & s_ready ) begin
                reg_remainder      <= {DATA_WIDTH{1'b0}};
                reg_quotient       <= abs(s_data0);
                reg_divisor        <= abs(s_data1);
                reg_quotient_sign  <= (s_data0[DATA_WIDTH-1] ^ s_data1[DATA_WIDTH-1]);
                reg_remainder_sign <= s_data0[DATA_WIDTH-1];
                reg_busy           <= 1'b1;
                reg_ready          <= 1'b0;
                reg_counter        <= 0;
            end
            else if ( reg_busy ) begin
                reg_remainder <= quotient2[DATA_WIDTH] ? remainder1 : quotient2[DATA_WIDTH-1:0];
                reg_quotient  <= quotient1;
                
                reg_counter <= next_counter;
                if ( next_counter[DATA_WIDTH-1] ) begin
                    reg_busy  <= 1'b0;
                    reg_valid <= 1'b1;
                end
            end
        end
    end
    
    assign s_ready     = reg_ready;
    
    assign m_quotient  = reg_quotient_sign  ? neg(reg_quotient)  : reg_quotient;
    assign m_remainder = reg_remainder_sign ? neg(reg_remainder) : reg_remainder;
    assign m_valid     = reg_valid;
    
endmodule



`default_nettype wire



// end of file
