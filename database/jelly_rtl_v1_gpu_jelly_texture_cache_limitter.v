// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_texture_cache_limitter
        #(
            parameter   LIMIT_NUM    = 1,   // if 0, no-limitter
            parameter   PACKET_FIRST = 0
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            
            input   wire                            arvalid,
            input   wire                            arready,
            input   wire                            rlast,
            input   wire                            rvalid,
            input   wire                            rready,
            
            output  wire                            limit_arready
        );
    
    
    localparam  COUNTER_WIDTH  = LIMIT_NUM <     2 ?  1 :
                                 LIMIT_NUM <     4 ?  2 :
                                 LIMIT_NUM <     8 ?  3 :
                                 LIMIT_NUM <    16 ?  4 :
                                 LIMIT_NUM <    32 ?  5 :
                                 LIMIT_NUM <    64 ?  6 :
                                 LIMIT_NUM <   128 ?  7 :
                                 LIMIT_NUM <   256 ?  8 :
                                 LIMIT_NUM <   512 ?  9 :
                                 LIMIT_NUM <  1024 ? 10 :
                                 LIMIT_NUM <  2048 ? 11 :
                                 LIMIT_NUM <  4096 ? 12 :
                                 LIMIT_NUM <  8192 ? 13 :
                                 LIMIT_NUM < 16384 ? 14 :
                                 LIMIT_NUM < 32768 ? 15 : 16;
    
    
    generate
    if ( LIMIT_NUM <= 0 ) begin : blk_bypass
        assign limit_arready = 1'b1;
    end
    else begin : blk_limitter
        // packet end
        wire    rend;
        
        if ( PACKET_FIRST ) begin
            reg     reg_rfirst;
            always @(posedge clk) begin
                if ( reset ) begin
                    reg_rfirst <= 1'b1;
                end
                else begin
                    if ( rvalid && rready ) begin
                        reg_rfirst <= rlast;
                    end
                end
            end
            assign rend = reg_rfirst;
        end
        else begin
            assign rend = rlast;
        end
        
        
        // limitter
        reg     [COUNTER_WIDTH-1:0]     reg_counter, next_counter;
        reg                             reg_arready, next_arready;
        
        always @* begin
            next_counter = reg_counter;
            next_arready = reg_arready;
            
            if ( arvalid && arready ) begin
                next_counter = next_counter + 1'b1;
            end
            
            if ( rvalid && rready && rend ) begin
                next_counter = next_counter - 1'b1;
            end
            
            next_arready = (next_counter < LIMIT_NUM);
        end
        
        always @(posedge clk) begin
            if ( reset ) begin
                reg_counter <= {COUNTER_WIDTH{1'b0}};
                reg_arready <= 1'b1;
            end
            else begin
                reg_counter <= next_counter;
                reg_arready <= next_arready;
            end
        end
        
        assign limit_arready = reg_arready;
    end
    endgenerate
    
    
endmodule



`default_nettype wire


// end of file
