// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_axi4s_debug_monitor
        #(
            parameter   TUSER_WIDTH = 1,
            parameter   TDATA_WIDTH = 24,
            parameter   TIMER_WIDTH = 32,
            parameter   FRAME_WIDTH = 32,
            parameter   PIXEL_WIDTH = 32,
            parameter   X_WIDTH     = 16,
            parameter   Y_WIDTH     = 16
        )
        (
            input   wire                            aresetn,
            input   wire                            aclk,
            input   wire                            aclken,
            
            input   wire    [TUSER_WIDTH-1:0]       axi4s_tuser,
            input   wire                            axi4s_tlast,
            input   wire    [TDATA_WIDTH-1:0]       axi4s_tdata,
            input   wire                            axi4s_tvalid,
            input   wire                            axi4s_tready
        );
    
    
    (* MARK_DEBUG = "true" *)   reg     [TUSER_WIDTH-1:0]   dbg_axi4s_tuser;
    (* MARK_DEBUG = "true" *)   reg                         dbg_axi4s_tlast;
    (* MARK_DEBUG = "true" *)   reg     [TDATA_WIDTH-1:0]   dbg_axi4s_tdata;
    (* MARK_DEBUG = "true" *)   reg                         dbg_axi4s_tvalid;
    (* MARK_DEBUG = "true" *)   reg                         dbg_axi4s_tready;
    
    (* MARK_DEBUG = "true" *)   reg     [TIMER_WIDTH-1:0]   dbg_timer;
    (* MARK_DEBUG = "true" *)   reg     [PIXEL_WIDTH-1:0]   dbg_pixel;
    (* MARK_DEBUG = "true" *)   reg     [FRAME_WIDTH-1:0]   dbg_frame;
    (* MARK_DEBUG = "true" *)   reg     [X_WIDTH-1:0]       dbg_x;
    (* MARK_DEBUG = "true" *)   reg     [Y_WIDTH-1:0]       dbg_y;
    (* MARK_DEBUG = "true" *)   reg     [X_WIDTH-1:0]       dbg_width;
    (* MARK_DEBUG = "true" *)   reg     [Y_WIDTH-1:0]       dbg_height;
    
    always @(posedge aclk) begin
        dbg_axi4s_tuser  <= axi4s_tuser;
        dbg_axi4s_tlast  <= axi4s_tlast;
        dbg_axi4s_tdata  <= axi4s_tdata;
        dbg_axi4s_tvalid <= axi4s_tvalid;
        dbg_axi4s_tready <= axi4s_tready;
    end
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            dbg_timer  <= 0;
            dbg_pixel  <= 0;
            dbg_frame  <= 0;
            dbg_x      <= 0;
            dbg_y      <= 0;
            dbg_width  <= 0;
            dbg_height <= 0;
        end
        else if ( aclken ) begin
            dbg_timer <= dbg_timer + 1;
            
            if ( axi4s_tvalid && axi4s_tready ) begin
                dbg_pixel <= dbg_pixel + 1;
                dbg_x     <= dbg_x     + 1;
                
                if ( axi4s_tlast ) begin
                    dbg_x     <= 0;
                    dbg_y     <= dbg_y + 1;
                    dbg_width <= dbg_x + 1;
                end
                
                if ( axi4s_tuser[0] ) begin
                    dbg_frame  <= dbg_frame + 1;
                    dbg_pixel  <= 0;
    //              dbg_x      <= 0;
                    dbg_y      <= 0;
                    dbg_height <= dbg_y;
                end
            end
        end
    end
    
    
endmodule



`default_nettype wire



// end of file
