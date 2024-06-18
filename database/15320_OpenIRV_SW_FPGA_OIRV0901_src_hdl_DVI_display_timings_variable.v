// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

// Project F: Display Timings
// (C)2019 Will Green, Open Source Hardware released under the MIT License
// Learn more at https://projectf.io

/* 
 * ----------------------------------------------------------------------------
 * Original project repository: https://github.com/projf/display_controller
 * Modified for OpenIRV project by Vaagn Oganesyan <ovgn@protonmail.com>
 * ----------------------------------------------------------------------------
 */


`timescale 1ps / 1ps
`default_nettype none


module display_timings_variable
(
    input  wire         [15:0]  h_res,
    input  wire         [15:0]  v_res,
    input  wire         [15:0]  h_fp,
    input  wire         [15:0]  h_sync,
    input  wire         [15:0]  h_bp,
    input  wire         [15:0]  v_fp,
    input  wire         [15:0]  v_sync,
    input  wire         [15:0]  v_bp,
    input  wire                 h_pol,
    input  wire                 v_pol,
    
    input  wire                 i_pix_clk,  // pixel clock
    input  wire                 i_rst,      // reset: restarts frame (active high)
    output wire                 o_hs,       // horizontal sync
    output wire                 o_vs,       // vertical sync
    output wire                 o_de,       // display enable: high during active video
    output wire                 o_frame,    // high for one tick at the start of each frame
    output reg  signed  [15:0]  o_sx,       // horizontal beam position (including blanking)
    output reg  signed  [15:0]  o_sy        // vertical beam position (including blanking)
);
    
    reg signed  [15:0]  h_sta;
    reg signed  [15:0]  hs_sta;
    reg signed  [15:0]  hs_end;
    reg signed  [15:0]  ha_sta;
    reg signed  [15:0]  ha_end;
    reg                 h_pol_reg;
    
    reg signed  [15:0]  v_sta;
    reg signed  [15:0]  vs_sta;
    reg signed  [15:0]  vs_end;
    reg signed  [15:0]  va_sta;
    reg signed  [15:0]  va_end;
    reg                 v_pol_reg;
    
    
    always @(posedge i_pix_clk) begin
        // horizontal: sync, active, and pixels
        h_sta     <= 0 - h_fp - h_sync - h_bp;  // horizontal start
        hs_sta    <= h_sta + h_fp;              // sync start
        hs_end    <= hs_sta + h_sync;           // sync end
        ha_sta    <= 0;                         // active start
        ha_end    <= h_res - 1;                 // active end
        h_pol_reg <= h_pol;                     // horizontal sync polarity (0:neg, 1:pos)
        
        // vertical: sync, active, and pixels
        v_sta     <= 0 - v_fp - v_sync - v_bp;  // vertical start
        vs_sta    <= v_sta + v_fp;              // sync start
        vs_end    <= vs_sta + v_sync;           // sync end
        va_sta    <= 0;                         // active start
        va_end    <= v_res - 1;                 // active end
        v_pol_reg <= v_pol;                     // vertical sync polarity (0:neg, 1:pos)
    end
    

    // generate sync signals with correct polarity
    assign o_hs = h_pol_reg ?  (o_sx > hs_sta && o_sx <= hs_end):
                              ~(o_sx > hs_sta && o_sx <= hs_end);
    
    assign o_vs = v_pol_reg ?  (o_sy > vs_sta && o_sy <= vs_end):
                              ~(o_sy > vs_sta && o_sy <= vs_end);
    
    // display enable: high during active period
    assign o_de = (o_sx >= 0 && o_sy >= 0);

    // o_frame: high for one tick at the start of each frame
    assign o_frame = (o_sy == v_sta && o_sx == h_sta);

    always @(posedge i_pix_clk) begin
        if (i_rst) begin    // reset to start of frame
            o_sx <= h_sta;
            o_sy <= v_sta;
        end else begin
            if (o_sx == ha_end) begin       // end of line
                o_sx <= h_sta;
                if (o_sy == va_end) begin   // end of frame
                    o_sy <= v_sta;
                end else begin
                    o_sy <= o_sy + 16'sh1;
                end
            end else begin
                o_sx <= o_sx + 16'sh1;
            end
        end
    end
    
endmodule

`default_nettype wire
