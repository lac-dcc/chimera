// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_vsync_adjust_de_core
        #(
            parameter   USER_WIDTH        = 0,
            parameter   H_COUNT_WIDTH     = 14,
            parameter   V_COUNT_WIDTH     = 14,
            
            parameter   USER_BITS         = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            
            output  wire                                update_trig,
            
            input   wire                                enable,
            output  wire                                busy,
            
            input   wire    [H_COUNT_WIDTH-1:0]         param_hsize,
            input   wire    [V_COUNT_WIDTH-1:0]         param_vsize,
            input   wire    [H_COUNT_WIDTH-1:0]         param_hstart,
            input   wire    [V_COUNT_WIDTH-1:0]         param_vstart,
            input   wire                                param_vpol,
            input   wire                                param_hpol,
            
            input   wire                                in_vsync,
            input   wire                                in_hsync,
            input   wire    [USER_BITS-1:0]             in_user,
            
            output  wire                                out_vsync,
            output  wire                                out_hsync,
            output  wire                                out_de,
            output  wire    [USER_BITS-1:0]             out_user
        );
    
    
    // sync detect
    wire    pol_vsync = out_vsync ^ param_vpol;
    wire    pol_hsync = out_hsync ^ param_hpol;
    reg     prev_vsync;
    reg     prev_hsync;
    always @(posedge clk) begin
        prev_vsync <= pol_vsync;
        prev_hsync <= pol_hsync;
    end
    
    wire    frame_start = ({prev_vsync, pol_vsync} == 2'b01);
    wire    frame_end   = ({prev_vsync, pol_vsync} == 2'b10);
    wire    line_start  = ({prev_hsync, pol_hsync} == 2'b01);
    wire    line_end    = ({prev_hsync, pol_hsync} == 2'b10);
    
    
    reg                             reg_enable;
    reg     [V_COUNT_WIDTH-1:0]     reg_v_count;
    reg     [H_COUNT_WIDTH-1:0]     reg_h_count;
    reg     [V_COUNT_WIDTH-1:0]     reg_v_de_count;
    reg     [H_COUNT_WIDTH-1:0]     reg_h_de_count;
    reg                             reg_v_de;
    reg                             reg_h_de;
    reg                             reg_de;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_enable      <= 1'b0;
            reg_v_count     <= {V_COUNT_WIDTH{1'bx}};
            reg_h_count     <= {H_COUNT_WIDTH{1'bx}};
            reg_v_de_count  <= {V_COUNT_WIDTH{1'bx}};
            reg_h_de_count  <= {H_COUNT_WIDTH{1'bx}};
            reg_v_de        <= 1'bx;
            reg_h_de        <= 1'bx;
            reg_de          <= 1'b0;
        end
        else begin
            // V-Sync
            if ( frame_start ) begin
                reg_enable     <= enable;
                reg_v_count    <= 0;
                reg_v_de_count <= 0;
                reg_v_de       <= 1'b0;
            end
            else if ( line_end ) begin
                reg_v_count <= reg_v_count + 1'b1;
                if ( reg_v_de_count > 0 ) begin
                    reg_v_de_count <= reg_v_de_count - 1'b1;
                end
                else begin
                    reg_v_de <= 1'b0;
                end
                
                if ( reg_v_count == param_vstart ) begin
                    reg_v_de_count <= param_vsize;
                    reg_v_de       <= 1'b1;
                end
            end
            
            // H-Sync
            if ( line_end ) begin
                reg_h_count    <= 0;
                reg_h_de_count <= 0;
                reg_h_de       <= 1'b0;
            end
            else begin
                reg_h_count    <= reg_h_count + 1'b1;
                if ( reg_h_de_count > 0 ) begin
                    reg_h_de_count <= reg_h_de_count - 1'b1;
                end
                else begin
                    reg_h_de <= 1'b0;
                end
                
                if ( reg_h_count == param_hstart ) begin
                    reg_h_de_count <= param_hsize;
                    reg_h_de       <= 1'b1;
                end
            end
            
            // H-sync
            reg_de <= (reg_enable && reg_v_de && reg_h_de);
        end
    end
    
    assign update_trig = frame_end;
    
    assign busy        = (pol_vsync && reg_enable);
    
    assign out_vsync   = in_vsync;
    assign out_hsync   = in_hsync;
    assign out_de      = reg_de;
    assign out_user    = in_user;
    
    
endmodule


`default_nettype wire


// end of file
