// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// count leading zero
module jelly_integer_clz
        #(
            parameter   PIPELINES   = 1,
            parameter   COUNT_WIDTH = 5,
            parameter   DATA_WIDTH  = (1 << COUNT_WIDTH),
            parameter   UNIT_WIDTH  = 16
        )
        (
            input   wire                        clk,
            input   wire    [PIPELINES-1:0]     cke,
            
            // input
            input   wire    [DATA_WIDTH-1:0]    in_data,
            
            // output
            output  wire    [COUNT_WIDTH-1:0]   out_clz
        );
    
    localparam  UNIT_NUM  = (DATA_WIDTH + (UNIT_WIDTH-1)) / UNIT_WIDTH;
    localparam  EXT_WIDTH = UNIT_NUM * UNIT_WIDTH;
    
    
    generate
    if ( PIPELINES == 1 ) begin : blk_pipeline1
        // 1 cycle
        integer                     i;
        reg     [COUNT_WIDTH-1:0]   st0_clz;
        
        always @(posedge clk) begin
            if ( cke[0] ) begin
                st0_clz <= {COUNT_WIDTH{1'b1}};
                begin : block_clz
                    for ( i = 0; i < DATA_WIDTH; i = i+1 ) begin
                        if ( in_data[(DATA_WIDTH-1)-i] != 1'b0 ) begin
                            st0_clz <= i;
                            disable block_clz;
                        end
                    end
                end
            end
        end
        
        assign out_clz = st0_clz;
    end
    else begin : blk_pipeline2
        // 2 cycle
        integer                                 i, j;
        
        wire    [EXT_WIDTH-1:0]                 sig_data = (in_data << (EXT_WIDTH - DATA_WIDTH));
        
        reg     [UNIT_NUM-1:0]                  st0_en;
        reg     [UNIT_NUM*COUNT_WIDTH-1:0]      st0_count;
        
        reg     [COUNT_WIDTH-1:0]               st1_count;
        
        always @(posedge clk) begin
            if ( cke[0] ) begin
                for ( i = 0; i < UNIT_NUM; i = i+1 ) begin
                    st0_en   [i]                            <= 1'b0;
                    st0_count[i*COUNT_WIDTH +: COUNT_WIDTH] <= {COUNT_WIDTH{1'b1}};
                    begin : block_st0_count
                        for ( j = 0; j < UNIT_WIDTH; j = j+1 ) begin
                            if ( sig_data[(EXT_WIDTH-1)-(i*UNIT_WIDTH+j)] != 1'b0 ) begin
                                st0_en   [i]                            <= 1'b1;
                                st0_count[i*COUNT_WIDTH +: COUNT_WIDTH] <= i*UNIT_WIDTH+j;
                                disable block_st0_count;
                            end
                        end
                    end
                end
            end
            
            if ( cke[1] ) begin
                st1_count <= {COUNT_WIDTH{1'b1}};
                begin : block_st1_select
                    for ( i = 0; i < UNIT_NUM; i = i+1 ) begin
                        if ( st0_en[i] ) begin
                            st1_count <= st0_count[i*COUNT_WIDTH +: COUNT_WIDTH];
                            disable block_st1_select;
                        end
                    end
                end
            end
        end
        
        assign out_clz = st1_count;
    end
    endgenerate
    
endmodule


`default_nettype wire


// end of file
