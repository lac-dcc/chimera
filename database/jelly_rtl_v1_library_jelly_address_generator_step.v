// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// step幅でのアドレスを生成する
module jelly_address_generator_step
        #(
            parameter   USER_WIDTH = 0,
            parameter   ADDR_WIDTH = 32,
            parameter   STEP_WIDTH = ADDR_WIDTH,
            parameter   LEN_WIDTH  = 32,
            parameter   LEN_OFFSET = 1'b1,
            
            // loacal
            parameter   USER_BITS  = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [USER_BITS-1:0]     s_user,
            input   wire    [ADDR_WIDTH-1:0]    s_addr,
            input   wire    [STEP_WIDTH-1:0]    s_step,
            input   wire    [LEN_WIDTH-1:0]     s_len,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [USER_BITS-1:0]     m_user,
            output  wire    [ADDR_WIDTH-1:0]    m_addr,
            output  wire                        m_first,
            output  wire                        m_last,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    
    reg     [ADDR_WIDTH-1:0]        reg_addr;
    reg     [STEP_WIDTH-1:0]        reg_step;
    reg     [LEN_WIDTH-1:0]         reg_len;
    reg     [USER_BITS-1:0]         reg_user;
    reg                             reg_first;
    reg                             reg_last;
    reg                             reg_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_addr  <= {ADDR_WIDTH{1'bx}};
            reg_step  <= {STEP_WIDTH{1'bx}};
            reg_len   <= {LEN_WIDTH{1'bx}};
            reg_user  <= {USER_BITS{1'bx}};
            reg_first <= 1'bx;
            reg_last  <= 1'bx;
            reg_valid <= 1'b0;
        end
        else if ( cke ) begin
            if ( !reg_valid ) begin
                reg_addr  <= s_addr;
                reg_step  <= s_step;
                reg_user  <= s_user;
                reg_first <= 1'b1;
                reg_last  <= (s_len == (1'b1 - LEN_OFFSET));
                reg_len   <= s_len + (LEN_OFFSET - 1'b1);
                reg_valid <= (s_len >= (1'b1 - LEN_OFFSET));
            end
            else if ( m_ready ) begin
                if ( reg_last ) begin
                    reg_addr  <= {ADDR_WIDTH{1'bx}};
                    reg_step  <= {STEP_WIDTH{1'bx}};
                    reg_len   <= {LEN_WIDTH{1'bx}};
                    reg_user  <= {USER_BITS{1'bx}};
                    reg_first <= 1'bx;
                    reg_last  <= 1'bx;
                    reg_valid <= 1'b0;
                end
                else begin
                    reg_addr  <= reg_addr  + reg_step;
                    reg_len   <= reg_len - 1'b1;
                    reg_first <= 1'b0;
                    reg_last  <= (reg_len == 1);
                end
            end
        end
    end
    
    assign s_ready  = ~reg_valid;
    
    assign m_addr   = reg_addr;
    assign m_first  = reg_first;
    assign m_last   = reg_last;
    assign m_user   = reg_user;
    assign m_valid  = reg_valid;
    
endmodule


`default_nettype wire


// end of file
