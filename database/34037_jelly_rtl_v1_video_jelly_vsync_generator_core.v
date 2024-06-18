// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The FPGA processing system
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// vide sync generator
module jelly_vsync_generator_core
        #(
            parameter   V_COUNTER_WIDTH = 12,
            parameter   H_COUNTER_WIDTH = 12
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            
            input   wire                            ctl_enable,
            output  wire                            ctl_busy,
            
            input   wire    [H_COUNTER_WIDTH-1:0]   param_htotal,
            input   wire    [H_COUNTER_WIDTH-1:0]   param_hdisp_start,
            input   wire    [H_COUNTER_WIDTH-1:0]   param_hdisp_end,
            input   wire    [H_COUNTER_WIDTH-1:0]   param_hsync_start,
            input   wire    [H_COUNTER_WIDTH-1:0]   param_hsync_end,
            input   wire                            param_hsync_pol,        // 0:n 1:p
            input   wire    [V_COUNTER_WIDTH-1:0]   param_vtotal,
            input   wire    [V_COUNTER_WIDTH-1:0]   param_vdisp_start,
            input   wire    [V_COUNTER_WIDTH-1:0]   param_vdisp_end,
            input   wire    [V_COUNTER_WIDTH-1:0]   param_vsync_start,
            input   wire    [V_COUNTER_WIDTH-1:0]   param_vsync_end,
            input   wire                            param_vsync_pol,        // 0:n 1:p
            
            output  wire                            out_vsync,
            output  wire                            out_hsync,
            output  wire                            out_de
        );
    
    // control stage
    reg                             reg_busy;
    reg                             reg_h_last;
    reg     [H_COUNTER_WIDTH-1:0]   reg_h_count;
    reg     [V_COUNTER_WIDTH-1:0]   reg_v_count;
    wire    [H_COUNTER_WIDTH-1:0]   next_h_count = reg_h_count + 1'b1;
    wire    [V_COUNTER_WIDTH-1:0]   next_v_count = reg_v_count + 1'b1;
    
    // pipeline stage1
    reg                             st1_vsync;
    reg                             st1_hsync;
    reg                             st1_vde;
    reg                             st1_hde;
    
    // pipeline stage2
    reg                             st2_vsync;
    reg                             st2_hsync;
    reg                             st2_de;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_busy    <= 1'b0;
            reg_h_last  <= 1'b0;
            reg_h_count <= {H_COUNTER_WIDTH{1'b0}};
            reg_v_count <= {V_COUNTER_WIDTH{1'b0}};
            
            st1_vsync   <= 1'b0;
            st1_hsync   <= 1'b0;
            st1_vde     <= 1'b0;
            st1_hde     <= 1'b0;
            
            st2_vsync   <= 1'b0;
            st2_hsync   <= 1'b0;
            st2_de      <= 1'b0;
        end
        else begin
            // control stage
            if ( !reg_busy ) begin
                reg_busy    <= ctl_enable;
                reg_h_last  <= 1'b0;
                reg_h_count <= {H_COUNTER_WIDTH{1'b0}};
                reg_v_count <= {V_COUNTER_WIDTH{1'b0}};
            end
            else begin
                reg_h_count <= next_h_count;
                reg_h_last  <= (next_h_count == (param_htotal-1'b1));
                if ( reg_h_last ) begin
                    reg_h_count <= {H_COUNTER_WIDTH{1'b0}};
                    reg_v_count <= next_v_count;
                    if ( next_v_count == param_vtotal ) begin
                        reg_busy    <= ctl_enable;
                        reg_v_count <= {V_COUNTER_WIDTH{1'b0}};
                    end
                end
            end
            
            
            // stage1
            if ( reg_h_count == param_hdisp_start ) begin
                st1_hde <= reg_busy;
            end
            
            if ( reg_h_count == param_hdisp_end ) begin
                st1_hde <= 1'b0;
            end
            
            if ( reg_h_count == param_hsync_start ) begin
                st1_hsync <= param_hsync_pol;
            end
            if ( reg_h_count == param_hsync_end ) begin
                st1_hsync <= ~param_hsync_pol;
            end
            
            if ( reg_v_count == param_vdisp_start ) begin
                st1_vde <= reg_busy;
            end
            if ( reg_v_count == param_vdisp_end /*&& reg_h_last*/ ) begin
                st1_vde <= 1'b0;
            end
            
            if ( reg_v_count == param_vsync_start ) begin
                st1_vsync <= param_vsync_pol;
            end
            if ( reg_v_count == param_vsync_end /*&& reg_h_last*/ ) begin
                st1_vsync <= ~param_vsync_pol;
            end
            
            
            // stage2
            st2_vsync <= st1_vsync;
            st2_hsync <= st1_hsync;
            st2_de    <= st1_vde & st1_hde;
        end
    end
    
    assign ctl_busy  = reg_busy;
    
    assign out_vsync = st2_vsync;
    assign out_hsync = st2_hsync;
    assign out_de    = st2_de;
    
    
endmodule


`default_nettype wire


// end of file
