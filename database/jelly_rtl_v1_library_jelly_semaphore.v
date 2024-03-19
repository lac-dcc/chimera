// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// AXIなどのコマンド発行制限用を想定
// 上限/下限チェックは行わないので、上位側で保証すること


// semaphore
module jelly_semaphore
        #(
            parameter   ASYNC         = 0,
            parameter   COUNTER_WIDTH = 9,
            parameter   INIT_COUNTER  = 256
        )
        (
            // カウンタ値返却側
            input   wire                        rel_reset,
            input   wire                        rel_clk,
            input   wire    [COUNTER_WIDTH-1:0] rel_add,
            input   wire                        rel_valid,
            
            // カウンタ値取得側
            input   wire                        req_reset,
            input   wire                        req_clk,
            input   wire    [COUNTER_WIDTH-1:0] req_sub,
            input   wire                        req_valid,
            output  wire                        req_empty,
            output  wire    [COUNTER_WIDTH-1:0] req_counter
        );
    
    wire    [COUNTER_WIDTH-1:0]     add_counter;
    wire                            add_valid;
    
    jelly_counter_async
            #(
                .ASYNC          (ASYNC),
                .COUNTER_WIDTH  (COUNTER_WIDTH)
            )
        i_counter_async
            (
                .s_reset        (rel_reset),
                .s_clk          (rel_clk),
                .s_add          (rel_add),
                .s_valid        (rel_valid),
                
                .m_reset        (req_reset),
                .m_clk          (req_clk),
                .m_counter      (add_counter),
                .m_valid        (add_valid)
            );
    

    reg     [COUNTER_WIDTH-1:0]     reg_counter;
    reg                             reg_empty;
    
    always @(posedge req_clk ) begin
        if ( req_reset ) begin
            reg_counter <= INIT_COUNTER;
            reg_empty   <= (INIT_COUNTER == {COUNTER_WIDTH{1'b0}});
        end
        else begin
            reg_counter <= reg_counter + (add_valid ? add_counter : {COUNTER_WIDTH{1'b0}})
                                       - (req_valid ? req_sub     : {COUNTER_WIDTH{1'b0}});
            
            reg_empty   <= ((reg_counter + (add_valid ? add_counter : {COUNTER_WIDTH{1'b0}}))
                                        == (req_valid ? req_sub     : {COUNTER_WIDTH{1'b0}}));
        end
    end

    /*
    reg     [COUNTER_WIDTH-1:0]     reg_counter, next_counter;
    reg                             reg_empty,   next_empty;
    
    always @* begin
        next_counter = reg_counter;
        next_empty   = reg_empty;
        
        if ( add_valid ) begin
            next_counter = next_counter + rel_add;
        end
        
        if ( req_valid ) begin
            next_counter = next_counter - req_sub;
        end
        
        next_empty = (next_counter == {COUNTER_WIDTH{1'b0}});
    end
    
    always @(posedge req_clk ) begin
        if ( req_reset ) begin
            reg_counter <= INIT_COUNTER;
            reg_empty   <= (INIT_COUNTER == {COUNTER_WIDTH{1'b0}});
        end
        else begin
            reg_counter <= next_counter;
            reg_empty   <= next_empty;
        end
    end
    */
    
    assign req_empty   = reg_empty;
    assign req_counter = reg_counter;
    
endmodule


`default_nettype wire


// end of file
