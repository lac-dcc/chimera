// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//   math
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_video_trimming_core
        #(
            parameter   TUSER_WIDTH   = 1,
            parameter   TDATA_WIDTH   = 24,
            parameter   X_WIDTH       = 12,
            parameter   Y_WIDTH       = 12,
            parameter   M_SLAVE_REGS  = 1,
            parameter   M_MASTER_REGS = 1
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,
            input   wire                        aclken,
            
            input   wire                        param_enable,
            input   wire    [X_WIDTH-1:0]       param_x_start,
            input   wire    [X_WIDTH-1:0]       param_x_end,
            input   wire    [Y_WIDTH-1:0]       param_y_start,
            input   wire    [Y_WIDTH-1:0]       param_y_end,
            
            input   wire    [TUSER_WIDTH-1:0]   s_axi4s_tuser,
            input   wire                        s_axi4s_tlast,
            input   wire    [TDATA_WIDTH-1:0]   s_axi4s_tdata,
            input   wire                        s_axi4s_tvalid,
            output  wire                        s_axi4s_tready,
            
            output  wire    [TUSER_WIDTH-1:0]   m_axi4s_tuser,
            output  wire                        m_axi4s_tlast,
            output  wire    [TDATA_WIDTH-1:0]   m_axi4s_tdata,
            output  wire                        m_axi4s_tvalid,
            input   wire                        m_axi4s_tready
        );
    
    wire                        cke;
    
    reg     [TUSER_WIDTH-1:0]   st0_tuser;
    reg                         st0_tlast;
    reg     [TDATA_WIDTH-1:0]   st0_tdata;
    reg                         st0_tvalid;
    
    reg                         st1_enable;
    reg     [X_WIDTH-1:0]       st1_x;
    reg     [Y_WIDTH-1:0]       st1_y;
    reg     [TUSER_WIDTH-1:0]   st1_tuser;
    reg                         st1_tlast;
    reg     [TDATA_WIDTH-1:0]   st1_tdata;
    reg                         st1_tvalid;
    
    reg     [TUSER_WIDTH-1:0]   st2_tuser;
    reg                         st2_tlast;
    reg     [TDATA_WIDTH-1:0]   st2_tdata;
    reg                         st2_tvalid;
    
    always @(posedge aclk) begin
        if ( aclken && s_axi4s_tready ) begin
            // stage 0
            st0_tuser  <= s_axi4s_tuser;
            st0_tlast  <= s_axi4s_tlast;
            st0_tdata  <= s_axi4s_tdata;
            
            // stage 1
            if ( st0_tvalid ) begin
                st1_x <= st1_x + 1'b1;
                if ( st0_tlast ) begin
                    st1_x <= 0;
                    st1_y <= st1_y + 1'b1;
                end
                if ( st0_tuser[0] ) begin
                    st1_enable <= param_enable;
                    st1_x      <= 0;
                    st1_y      <= 0;
                end
            end
            st1_tuser    <= st0_tuser;
            st1_tlast    <= st0_tlast;
            st1_tdata    <= st0_tdata;
            
            // stage2
            st2_tuser    <= st1_tuser;
            st2_tuser[0] <= st2_tuser[0];
            st2_tlast    <= (st1_x == param_x_end);
            st2_tdata    <= st1_tdata;
            if ( st1_tvalid && st1_tuser[0] ) begin
                st2_tuser[0] <= 1'b1;
            end
            else if ( st2_tvalid ) begin
                st2_tuser[0] <= 1'b0;
            end
        end
    end
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            st0_tvalid <= 1'b0;
            st1_tvalid <= 1'b0;
            st2_tvalid <= 1'b0;
        end
        else if ( aclken && s_axi4s_tready ) begin
            st0_tvalid <= s_axi4s_tvalid;
            st1_tvalid <= st0_tvalid;
            st2_tvalid <= st1_tvalid && st1_enable
                            && (st1_x >= param_x_start) && (st1_x <= param_x_end)
                            && (st1_y >= param_y_start) && (st1_y <= param_y_end);
        end
    end
    
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (TUSER_WIDTH+1+TDATA_WIDTH),
                .SLAVE_REGS         (M_SLAVE_REGS),
                .MASTER_REGS        (M_MASTER_REGS)
            )
        i_pipeline_insert_ff
            (
                .reset              (~aresetn),
                .clk                (aclk),
                .cke                (aclken),
                
                .s_data             ({st2_tuser, st2_tlast, st2_tdata}),
                .s_valid            (st2_tvalid),
                .s_ready            (s_axi4s_tready),
                
                .m_data             ({m_axi4s_tuser, m_axi4s_tlast, m_axi4s_tdata}),
                .m_valid            (m_axi4s_tvalid),
                .m_ready            (m_axi4s_tready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    
endmodule



`default_nettype wire



// end of file
