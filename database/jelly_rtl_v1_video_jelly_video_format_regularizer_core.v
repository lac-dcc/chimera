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


module jelly_video_format_regularizer_core
        #(
            parameter   TUSER_WIDTH       = 1,
            parameter   TDATA_WIDTH       = 24,
            parameter   X_WIDTH           = 12,
            parameter   Y_WIDTH           = 12,
            parameter   INDEX_WIDTH       = 1,
            parameter   FRAME_TIMER_WIDTH = 32,
            parameter   TIMER_WIDTH       = 32,
            parameter   S_SLAVE_REGS      = 1,
            parameter   S_MASTER_REGS     = 1,
            parameter   M_SLAVE_REGS      = 1,
            parameter   M_MASTER_REGS     = 1
        )
        (
            input   wire                            aresetn,
            input   wire                            aclk,
            input   wire                            aclken,
            
            input   wire                            ctl_enable,
            input   wire                            ctl_update,
            output  wire    [INDEX_WIDTH-1:0]       ctl_index,
            output  wire                            ctl_busy,
            input   wire                            ctl_skip,
            input   wire                            ctl_frm_timer_en,
            input   wire    [FRAME_TIMER_WIDTH-1:0] ctl_frm_timeout,
            
            input   wire    [X_WIDTH-1:0]           param_width,
            input   wire    [Y_WIDTH-1:0]           param_height,
            input   wire    [TDATA_WIDTH-1:0]       param_fill,
            input   wire    [TIMER_WIDTH-1:0]       param_timeout,

            output  reg     [X_WIDTH-1:0]           current_width,
            output  reg     [Y_WIDTH-1:0]           current_height,
            
            input   wire    [TUSER_WIDTH-1:0]       s_axi4s_tuser,
            input   wire                            s_axi4s_tlast,
            input   wire    [TDATA_WIDTH-1:0]       s_axi4s_tdata,
            input   wire                            s_axi4s_tvalid,
            output  wire                            s_axi4s_tready,
            
            output  wire    [TUSER_WIDTH-1:0]       m_axi4s_tuser,
            output  wire                            m_axi4s_tlast,
            output  wire    [TDATA_WIDTH-1:0]       m_axi4s_tdata,
            output  wire                            m_axi4s_tvalid,
            input   wire                            m_axi4s_tready
        );
    
    
    // input FF
    wire    [TUSER_WIDTH-1:0]   in_tuser;
    wire                        in_tlast;
    wire    [TDATA_WIDTH-1:0]   in_tdata;
    wire                        in_tvalid;
    wire                        in_tready;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (TUSER_WIDTH + 1 + TDATA_WIDTH),
                .SLAVE_REGS     (S_SLAVE_REGS),
                .MASTER_REGS    (S_MASTER_REGS)
            )
        i_pipeline_insert_ff_s
            (
                .reset          (~aresetn),
                .clk            (aclk),
                .cke            (aclken),
                
                .s_data         ({s_axi4s_tuser, s_axi4s_tlast, s_axi4s_tdata}),
                .s_valid        (s_axi4s_tvalid),
                .s_ready        (s_axi4s_tready),
                
                .m_data         ({in_tuser, in_tlast, in_tdata}),
                .m_valid        (in_tvalid),
                .m_ready        (in_tready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
    
    wire                            cke;
    
    reg     [INDEX_WIDTH-1:0]       reg_index;
    reg     [X_WIDTH-1:0]           reg_param_width;
    reg     [Y_WIDTH-1:0]           reg_param_height;
    reg     [TDATA_WIDTH-1:0]       reg_param_fill;
    reg     [TIMER_WIDTH-1:0]       reg_param_timeout;
    
    reg                             reg_busy;
    reg                             reg_fill_h;
    reg                             reg_fill_v;
    reg                             reg_skip;
    
    reg                             reg_frame_timeout;
    reg     [FRAME_TIMER_WIDTH-1:0] reg_frame_timer;
    
    reg                             reg_timeout;
    reg     [TIMER_WIDTH-1:0]       reg_timer;
    reg     [X_WIDTH-1:0]           reg_x;
    reg     [Y_WIDTH-1:0]           reg_y;
    reg                             reg_x_last;
    reg                             reg_y_last;
    
    wire                            sig_x_first = (reg_x == 0);
    wire                            sig_y_first = (reg_y == 0);
//  wire                            sig_x_last  = (reg_x == reg_param_width);
//  wire                            sig_y_last  = (reg_y == reg_param_height);
    wire                            sig_x_last  = reg_x_last;
    wire                            sig_y_last  = reg_y_last;
    
    reg     [TUSER_WIDTH-1:0]       reg_tuser;
    reg                             reg_tlast;
    reg     [TDATA_WIDTH-1:0]       reg_tdata;
    reg                             reg_tvalid;
    wire                            sig_tready;
    
    wire                            sig_valid;
    
    
    assign sig_valid = (!reg_busy && (((in_tuser[0] && in_tvalid) || reg_frame_timeout) && ctl_enable))
                            || (reg_busy && ((!reg_skip && in_tvalid && in_tready) || (reg_fill_h || reg_fill_v)));
    
    assign in_tready = cke && ((!reg_busy && (~in_tuser[0] || ctl_enable || ctl_skip)) || (reg_busy && ((~in_tuser[0] && !reg_fill_h) || reg_skip)));
    
    assign cke       = aclken && (!reg_tvalid || sig_tready);
    
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            current_width     <= {X_WIDTH{1'b0}};
            current_height    <= {Y_WIDTH{1'b0}};
            
            reg_index         <= {INDEX_WIDTH{1'b0}};
            reg_param_width   <= {X_WIDTH{1'bx}};
            reg_param_height  <= {Y_WIDTH{1'bx}};
            reg_param_fill    <= {TDATA_WIDTH{1'bx}};
            reg_param_timeout <= {TIMER_WIDTH{1'bx}};
            
            reg_frame_timeout <= 1'b0;
            reg_frame_timer   <= {FRAME_TIMER_WIDTH{1'b0}};
            
            reg_busy          <= 1'b0;
            reg_fill_h        <= 1'bx;
            reg_fill_v        <= 1'bx;
            reg_skip          <= 1'bx;
            reg_timeout       <= 1'bx;
            reg_timer         <= {TIMER_WIDTH{1'bx}};
            reg_x             <= {X_WIDTH{1'b0}};
            reg_x_last        <= 1'b0;
            reg_y             <= {Y_WIDTH{1'b0}};
            reg_y_last        <= 1'b0;
            
            reg_tuser         <= {TUSER_WIDTH{1'bx}};
            reg_tlast         <= 1'bx;
            reg_tdata         <= {TDATA_WIDTH{1'bx}};
            reg_tvalid        <= 1'b0;
        end
        else if ( cke ) begin
            // skip
            if ( (sig_x_last && sig_valid) && !reg_fill_h ) begin
                reg_skip <= 1'b1;
            end
            if ( in_tlast && in_tvalid ) begin
                reg_skip <= 1'b0;
            end
            
            // fill_h
            if ( !reg_skip && (in_tlast && in_tvalid) ) begin
                reg_fill_h <= 1'b1;
            end
            if ( sig_x_last && sig_valid ) begin
                reg_fill_h <= 1'b0;
            end
            
            // fill_v
            if ( reg_busy && (in_tuser[0] && in_tvalid) ) begin
                reg_fill_v <= 1'b1;
            end
            if ( sig_x_last && sig_y_last && sig_valid) begin
                reg_fill_v <= 1'b0;
            end
            
            // timer
            reg_timer <= reg_timer + 1;
            if ( reg_param_timeout != 0 && reg_timer == reg_param_timeout ) begin
                reg_timeout <= 1'b1;
            end
            if ( !reg_busy || in_tvalid ) begin
                reg_timer   <= {TIMER_WIDTH{1'b0}};
                reg_timeout <= 1'b0;
            end
            
            if ( reg_timeout ) begin
                reg_skip   <= 1'b1;
                reg_fill_h <= 1'b1;
                reg_fill_v <= 1'b1;
            end
            
            // frame timer
            reg_frame_timeout <= 1'b0;
            if ( ctl_enable && ctl_frm_timer_en && ~reg_busy ) begin
                reg_frame_timer <= reg_frame_timer + 1'b1;
                if ( reg_frame_timer == ctl_frm_timeout ) begin
                    reg_frame_timeout <= 1'b1;
                end
            end
            else begin
                reg_frame_timer <= {FRAME_TIMER_WIDTH{1'b0}};
            end
            
            
            // x-y count
            if ( sig_valid ) begin
                reg_x      <= reg_x + 1'b1;
                reg_x_last <= ((reg_x + 1'b1) == reg_param_width);
                if ( sig_x_last ) begin
                    reg_x      <= {X_WIDTH{1'b0}};
                    reg_x_last <= 1'b0; // (reg_param_width == 1);
                    reg_y      <= reg_y + 1'b1;
                    reg_y_last <= ((reg_y + 1'b1) == reg_param_height);
                    if ( sig_y_last ) begin
                        reg_y      <= {Y_WIDTH{1'b0}};
                        reg_y_last <= 1'b0;
                    end
                end
            end
            
            // control
            if ( !reg_busy ) begin
                reg_skip    <= 1'b1;
                reg_fill_h  <= 1'b0;
                reg_fill_v  <= 1'b0;
                reg_x       <= {X_WIDTH{1'b0}};
                reg_x_last  <= 1'b0; // (param_width == 1);
                reg_y       <= {Y_WIDTH{1'b0}};
                reg_y_last  <= 1'b0; // (param_height == 1);
                
                reg_param_width   <= {X_WIDTH{1'bx}};
                reg_param_height  <= {Y_WIDTH{1'bx}};
                reg_param_fill    <= {TDATA_WIDTH{1'bx}};
                
                if ( ((in_tuser[0] && in_tvalid) || reg_frame_timeout) && ctl_enable ) begin
                    // start
                    reg_busy          <= 1'b1;
                    reg_skip          <= 1'b0;
                    reg_x             <= 1;
                    
                    if ( reg_frame_timeout ) begin
                        reg_fill_v  <= 1'b1;
                    end
                    
                    if ( ctl_update ) begin
                        // parameter update
                        reg_index         <= reg_index + 1'b1;
                        reg_param_width   <= param_width  - 1;
                        reg_param_height  <= param_height - 1;
                        reg_param_fill    <= param_fill;
                        reg_param_timeout <= param_timeout;
                        current_width     <= param_width;
                        current_height    <= param_height;
                    end
                end
            end
            else begin
                if ( sig_x_last && sig_y_last && sig_valid ) begin
                    // end
                    reg_busy   <= 1'b0;
                    
                    reg_x      <= {X_WIDTH{1'b0}};
                    reg_x_last <= 1'b0;
                    reg_y      <= {Y_WIDTH{1'b0}};
                    reg_y_last <= 1'b0;
                end
            end
            
            
            // data
            reg_tuser  <= sig_x_first && sig_y_first;
            reg_tlast  <= sig_x_last;
            reg_tdata  <= reg_fill_h || reg_fill_v || reg_frame_timeout ? reg_param_fill : in_tdata;
            reg_tvalid <= sig_valid;
        end
    end
    
    assign ctl_busy  = reg_busy;
    assign ctl_index = reg_index;
    
    // output FF
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (TUSER_WIDTH + 1 + TDATA_WIDTH),
                .SLAVE_REGS     (S_SLAVE_REGS),
                .MASTER_REGS    (S_MASTER_REGS)
            )
        i_pipeline_insert_ff_m
            (
                .reset          (~aresetn),
                .clk            (aclk),
                .cke            (aclken),
                
                .s_data         ({reg_tuser, reg_tlast, reg_tdata}),
                .s_valid        (reg_tvalid),
                .s_ready        (sig_tready),
                
                .m_data         ({m_axi4s_tuser, m_axi4s_tlast, m_axi4s_tdata}),
                .m_valid        (m_axi4s_tvalid),
                .m_ready        (m_axi4s_tready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
    
endmodule



`default_nettype wire



// end of file
