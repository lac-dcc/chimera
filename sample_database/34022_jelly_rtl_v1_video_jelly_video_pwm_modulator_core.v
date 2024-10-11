// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_video_pwm_modulator_core
        #(
            parameter   TUSER_WIDTH = 1,
            parameter   TDATA_WIDTH = 8
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,
            input   wire                        aclken,
            
            input   wire                        ctl_enable,
            input   wire    [TDATA_WIDTH-1:0]   param_th,
            input   wire    [TDATA_WIDTH-1:0]   param_step,
            input   wire                        param_inv,
            
            input   wire    [TUSER_WIDTH-1:0]   s_axi4s_tuser,
            input   wire                        s_axi4s_tlast,
            input   wire    [TDATA_WIDTH-1:0]   s_axi4s_tdata,
            input   wire                        s_axi4s_tvalid,
            output  wire                        s_axi4s_tready,
            
            output  wire    [TUSER_WIDTH-1:0]   m_axi4s_tuser,
            output  wire                        m_axi4s_tlast,
            output  wire    [0:0]               m_axi4s_tbinary,
            output  wire    [TDATA_WIDTH-1:0]   m_axi4s_tdata,
            output  wire                        m_axi4s_tvalid,
            input   wire                        m_axi4s_tready
        );
    
    wire                            cke;
    
    reg     [TUSER_WIDTH-1:0]       st0_tuser;
    reg                             st0_tlast;
    reg     [TDATA_WIDTH-1:0]       st0_tdata;
    reg                             st0_tvalid;
    
    reg     [TDATA_WIDTH-1:0]       st1_th;
    wire    [TDATA_WIDTH:0]         st1_th_next = st1_th + param_step;
    
    reg     [TUSER_WIDTH-1:0]       st1_tuser;
    reg                             st1_tlast;
    reg     [TDATA_WIDTH-1:0]       st1_tdata;
    reg                             st1_tvalid;
    
    reg     [TDATA_WIDTH-1:0]       st2_th;
    reg     [TUSER_WIDTH-1:0]       st2_tuser;
    reg                             st2_tlast;
    reg     [0:0]                   st2_tbinary;
    reg     [TDATA_WIDTH-1:0]       st2_tdata;
    reg                             st2_tvalid;
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            st0_tuser   <= {TUSER_WIDTH{1'bx}};
            st0_tlast   <= 1'bx;
            st0_tdata   <= {TDATA_WIDTH{1'bx}};
            st0_tvalid  <= 1'b0;
            
            st1_th      <= {TDATA_WIDTH{1'bx}};
            st1_tuser   <= {TUSER_WIDTH{1'bx}};
            st1_tlast   <= 1'bx;
            st1_tdata   <= {TDATA_WIDTH{1'bx}};
            st1_tvalid  <= 1'b0;
            
            st2_tuser   <= {TUSER_WIDTH{1'bx}};
            st2_tlast   <= 1'bx;
            st2_tdata   <= {TDATA_WIDTH{1'bx}};
            st2_tbinary <= 1'bx;
            st2_tvalid  <= 1'b0;
        end
        else if ( cke ) begin
            // stage 0
            st0_tuser   <= s_axi4s_tuser;
            st0_tlast   <= s_axi4s_tlast;
            st0_tdata   <= s_axi4s_tdata;
            st0_tvalid  <= s_axi4s_tvalid;
            
            
            // stage 1
            if ( st0_tvalid && st0_tuser ) begin
                if ( ctl_enable && !st1_th_next[TDATA_WIDTH] ) begin
                    st1_th <= st1_th_next;
                end
                else begin
                    st1_th <= param_th;
                end
            end
            st1_tuser  <= st0_tuser;
            st1_tlast  <= st0_tlast;
            st1_tdata  <= st0_tdata;
            st1_tvalid <= st0_tvalid;
            
            
            // stage 2
            st2_tuser  <= st1_tuser;
            st2_tlast  <= st1_tlast;
            st2_tdata  <= st1_tdata;
            st2_tvalid <= st1_tvalid;
            if ( st1_tdata > st1_th ) begin
                st2_tbinary <= 1'b1 ^ param_inv;
            end
            else begin
                st2_tbinary <= 1'b0 ^ param_inv;
            end
        end
    end
    
    assign cke = aclken && (!m_axi4s_tvalid || m_axi4s_tready);
    
    assign s_axi4s_tready = cke;
    
    assign m_axi4s_tuser   = st2_tuser;
    assign m_axi4s_tlast   = st2_tlast;
    assign m_axi4s_tbinary = st2_tbinary;
    assign m_axi4s_tdata   = st2_tdata;
    assign m_axi4s_tvalid  = st2_tvalid;
    
endmodule


`default_nettype wire


// end of file
