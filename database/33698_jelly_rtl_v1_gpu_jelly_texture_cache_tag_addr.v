// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_texture_cache_tag_addr
        #(
            parameter   PARALLEL_SIZE  = 0,                                         // 0:1, 1:2, 2:4, 2:4, 3:8 ....
            parameter   ALGORITHM      = PARALLEL_SIZE > 0 ? "SUDOKU" : "TWIST",    // "NORMAL", "SUDOKU", "TWIST"
            
            parameter   ADDR_X_WIDTH   = 4,
            parameter   ADDR_Y_WIDTH   = 4,
            parameter   TAG_ADDR_WIDTH = 6,
            parameter   INDEX_WIDTH    = ALGORITHM == "NORMAL" ? ADDR_Y_WIDTH + ADDR_X_WIDTH - TAG_ADDR_WIDTH : ADDR_Y_WIDTH + ADDR_X_WIDTH,
            
            // local
            parameter   ID_WIDTH       = PARALLEL_SIZE  > 0 ? PARALLEL_SIZE  : 1,
            parameter   TAG_ADDR_BITS  = TAG_ADDR_WIDTH > 0 ? TAG_ADDR_WIDTH : 1
        )
        (
            input   wire    [ADDR_X_WIDTH-1:0]      addrx,
            input   wire    [ADDR_Y_WIDTH-1:0]      addry,
            
            output  wire    [ID_WIDTH-1:0]          unit_id,
            output  wire    [TAG_ADDR_BITS-1:0]     tag_addr,
            output  wire    [INDEX_WIDTH-1:0]       index
        );
    
    localparam  SHUFFLE_WIDTH    = PARALLEL_SIZE + TAG_ADDR_WIDTH;
    localparam  HALF_ADDR_WIDTH  = TAG_ADDR_WIDTH / 2;
    localparam  TWIST_OFFSET     = (1 << (PARALLEL_SIZE + TAG_ADDR_WIDTH - 1));
    
    localparam  HALF1_ADDR_WIDTH = (TAG_ADDR_WIDTH + 1) / 2;
    localparam  HALF1_ADDR_BITS  = HALF1_ADDR_WIDTH > 0 ? HALF1_ADDR_WIDTH : 1;
    localparam  HALF2_ADDR_WIDTH = TAG_ADDR_WIDTH - HALF1_ADDR_WIDTH;
    localparam  HALF2_ADDR_BITS  = HALF2_ADDR_WIDTH > 0 ? HALF2_ADDR_WIDTH : 1;
    
    generate
    if ( ALGORITHM == "SUDOKU" ) begin : blk_sudoku
        wire    [SHUFFLE_WIDTH-1:0]     shuffle_x    = addrx;
        wire    [SHUFFLE_WIDTH-1:0]     shuffle_y    = addry;
        
        wire    [SHUFFLE_WIDTH-1:0]     shuffle_addr = (({shuffle_y, shuffle_y} >> HALF_ADDR_WIDTH) + shuffle_x);
        
        assign unit_id  = PARALLEL_SIZE > 0 ? shuffle_addr : 0;
        assign tag_addr = (shuffle_addr >> PARALLEL_SIZE);
        assign index    = {addry, addrx};
    end
    else if ( ALGORITHM == "TWIST" ) begin : blk_twist
        wire    [SHUFFLE_WIDTH-1:0]     shuffle_addr = addrx + (TWIST_OFFSET * addry) - addry;
        
        assign unit_id  = PARALLEL_SIZE > 0 ? shuffle_addr : 0;
        assign tag_addr = (shuffle_addr >> PARALLEL_SIZE);
        assign index    = {addry, addrx};
    end
    else if ( ALGORITHM == "NORMAL" ) begin : blk_normal
        wire    [SHUFFLE_WIDTH-1:0]     shuffle_addr = addrx + (TWIST_OFFSET * addry) - addry;
        
        wire    [HALF1_ADDR_BITS-1:0]   tag_addr_x = addrx & ((1 << HALF1_ADDR_WIDTH) - 1);
        wire    [HALF2_ADDR_BITS-1:0]   tag_addr_y = addry & ((1 << HALF2_ADDR_WIDTH) - 1);
        wire    [INDEX_WIDTH-1:0]       index_x    = addrx >> HALF1_ADDR_WIDTH;
        wire    [INDEX_WIDTH-1:0]       index_y    = addry >> HALF2_ADDR_WIDTH;
        
        assign unit_id  = PARALLEL_SIZE > 0 ? shuffle_addr : 0;
        assign tag_addr = ((tag_addr_y << HALF1_ADDR_WIDTH) | tag_addr_x);
        assign index    = ((index_y << (ADDR_X_WIDTH - HALF1_ADDR_WIDTH)) | index_x);
    end
    endgenerate
    
endmodule



`default_nettype wire


// end of file
