// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   math
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_video_gate_core
        #(
            parameter   TUSER_WIDTH   = 1,
            parameter   TDATA_WIDTH   = 24,
            parameter   S_SLAVE_REGS  = 1,
            parameter   S_MASTER_REGS = 0
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,
            input   wire                        aclken,
            
            input   wire                        enable,
            output  wire                        busy,
            
            input   wire                        param_skip,
            
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
    
    
    wire    [TUSER_WIDTH-1:0]   axi4s_in_tuser;
    wire                        axi4s_in_tlast;
    wire    [TDATA_WIDTH-1:0]   axi4s_in_tdata;
    wire                        axi4s_in_tvalid;
    wire                        axi4s_in_tready;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (TUSER_WIDTH+1+TDATA_WIDTH),
                .SLAVE_REGS         (S_SLAVE_REGS),
                .MASTER_REGS        (S_MASTER_REGS)
            )
        i_pipeline_insert_ff
            (
                .reset              (~aresetn),
                .clk                (aclk),
                .cke                (aclken),
                
                .s_data             ({s_axi4s_tuser, s_axi4s_tlast, s_axi4s_tdata}),
                .s_valid            (s_axi4s_tvalid),
                .s_ready            (s_axi4s_tready),
                
                .m_data             ({axi4s_in_tuser, axi4s_in_tlast, axi4s_in_tdata}),
                .m_valid            (axi4s_in_tvalid),
                .m_ready            (axi4s_in_tready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    
    reg                         reg_busy;
    reg                         reg_skip;
    
    reg     [TUSER_WIDTH-1:0]   reg_tuser;
    reg                         reg_tlast;
    reg     [TDATA_WIDTH-1:0]   reg_tdata;
    reg                         reg_tvalid;
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            reg_busy   <= 1'b0;
            reg_skip   <= 1'bx;
            
            reg_tuser  <= {TUSER_WIDTH{1'bx}};
            reg_tlast  <= 1'bx;
            reg_tdata  <= {TDATA_WIDTH{1'bx}};
            reg_tvalid <= 1'b0;
        end
        else if ( aclken && (!m_axi4s_tvalid || m_axi4s_tready) ) begin
            if ( axi4s_in_tuser[0] && axi4s_in_tvalid ) begin
                reg_busy   <= enable;
                reg_skip   <= param_skip;
                reg_tuser  <= axi4s_in_tuser;
                reg_tlast  <= axi4s_in_tlast;
                reg_tdata  <= axi4s_in_tdata;
                reg_tvalid <= enable;
            end
            else begin
                reg_tuser  <= axi4s_in_tuser;
                reg_tlast  <= axi4s_in_tlast;
                reg_tdata  <= axi4s_in_tdata;
                reg_tvalid <= (axi4s_in_tvalid & reg_busy);
            end
        end
    end
    
    
    assign busy           = reg_busy;
    
    assign axi4s_in_tready = (!m_axi4s_tvalid || m_axi4s_tready) &&
                                (
                                    ( axi4s_in_tuser[0] && (enable   || param_skip)) ||
                                    (!axi4s_in_tuser[0] && (reg_busy || reg_skip  ))
                                );
    
    assign m_axi4s_tuser  = reg_tuser;
    assign m_axi4s_tlast  = reg_tlast;
    assign m_axi4s_tdata  = reg_tdata;
    assign m_axi4s_tvalid = reg_tvalid;
    
    
endmodule


`default_nettype wire


// end of file
