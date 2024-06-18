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


module jelly_video_resize_half_h_core
        #(
            parameter   TUSER_WIDTH   = 1,
            parameter   COMPONENT_NUM = 3,
            parameter   DATA_WIDTH    = 8,
            parameter   TDATA_WIDTH   = COMPONENT_NUM*DATA_WIDTH,
            parameter   M_SLAVE_REGS  = 1,
            parameter   M_MASTER_REGS = 1
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,
            input   wire                        aclken,
            
            input   wire                        param_enable,
            
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
    
    integer                     i;
    
    reg                         st0_x;
    reg     [TUSER_WIDTH-1:0]   st0_prev_tuser;
    reg     [TDATA_WIDTH-1:0]   st0_prev_tdata;
    reg     [TUSER_WIDTH-1:0]   st0_tuser;
    reg                         st0_tlast;
    reg     [TDATA_WIDTH-1:0]   st0_tdata;
    reg                         st0_tvalid;
    
    reg     [TUSER_WIDTH-1:0]   st1_tuser;
    reg                         st1_tlast;
    reg     [TDATA_WIDTH-1:0]   st1_tdata;
    reg                         st1_tvalid;
    
    always @(posedge aclk) begin
        if ( aclken && s_axi4s_tready ) begin
            // stage 0
            st0_tuser  <= s_axi4s_tuser;
            st0_tlast  <= s_axi4s_tlast;
            st0_tdata  <= s_axi4s_tdata;
            
            if ( st0_tvalid ) begin
                st0_prev_tuser <= st0_tuser[0];
                st0_prev_tdata <= st0_tdata;
            end
            
            st0_x      <= st0_x + st0_tvalid;
            if ( st0_tvalid && st0_tlast ) begin
                st0_x <= 1'b0;
            end
            if ( s_axi4s_tvalid && s_axi4s_tuser[0] ) begin
                st0_x <= 1'b0;
            end
            
            
            // stage 1
            if ( param_enable ) begin
                st1_tuser <= st0_prev_tuser;
                st1_tlast <= st0_tlast;
                for ( i = 0; i < COMPONENT_NUM; i = i+1 ) begin
                    st1_tdata[i*DATA_WIDTH +: DATA_WIDTH]
                        <= ({1'b0, st0_tdata[i*DATA_WIDTH +: DATA_WIDTH]} + {1'b0, st0_prev_tdata[i*DATA_WIDTH +: DATA_WIDTH]}) >> 1;
                end
            end
            else begin
                st1_tuser <= st0_tuser;
                st1_tlast <= st0_tlast;
                st1_tdata <= st0_tdata;
            end
        end
    end
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            st0_tvalid <= 1'b0;
            st1_tvalid <= 1'b0;
        end
        else if ( aclken && s_axi4s_tready ) begin
            st0_tvalid <= s_axi4s_tvalid;
            st1_tvalid <= st0_tvalid && (!param_enable || st0_x || st0_tlast);
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
                
                .s_data             ({st1_tuser, st1_tlast, st1_tdata}),
                .s_valid            (st1_tvalid),
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
