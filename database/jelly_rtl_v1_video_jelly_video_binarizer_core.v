// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_video_binarizer_core
        #(
            parameter   TUSER_WIDTH = 1,
            parameter   TDATA_WIDTH = 8
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,
            
            input   wire    [TDATA_WIDTH-1:0]   param_th,
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
    reg     [0:0]                   st0_tbinary;
    reg     [TDATA_WIDTH-1:0]       st0_tdata;
    reg                             st0_tvalid;
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            st0_tuser       <= {TUSER_WIDTH{1'bx}};
            st0_tlast       <= 1'bx;
            st0_tdata       <= {TDATA_WIDTH{1'bx}};
            st0_tbinary     <= 1'bx;
            st0_tvalid      <= 1'b0;
        end
        else if ( cke ) begin
            st0_tuser   <= s_axi4s_tuser;
            st0_tlast   <= s_axi4s_tlast;
            st0_tdata   <= s_axi4s_tdata;
            st0_tvalid  <= s_axi4s_tvalid;
            if ( s_axi4s_tdata > param_th ) begin
                st0_tbinary <= 1'b1 ^ param_inv;
            end
            else begin
                st0_tbinary <= 1'b0 ^ param_inv;
            end
        end
    end
    
    assign cke = !m_axi4s_tvalid || m_axi4s_tready;
    
    assign s_axi4s_tready = cke;
    
    assign m_axi4s_tuser   = st0_tuser;
    assign m_axi4s_tlast   = st0_tlast;
    assign m_axi4s_tbinary = st0_tbinary;
    assign m_axi4s_tdata   = st0_tdata;
    assign m_axi4s_tvalid  = st0_tvalid;
    
endmodule


`default_nettype wire


// end of file
