// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_mipi_rx_lane
        #(
            parameter LANES          = 2,
            parameter TDATA_SIZE     = 0,
            
            parameter FIFO_PTR_WIDTH = 5,
            parameter FIFO_RAM_TYPE  = "distributed",
            
            parameter ASYNC          = 1,
            parameter LANE_SYNC      = 1,
            
            parameter TDATA_WIDTH    = (8 << TDATA_SIZE)
        )
        (
            // input
            input   wire                        rxreseths,
            input   wire                        rxbyteclkhs,
            input   wire    [LANES*8-1:0]       rxdatahs,
            input   wire    [LANES-1:0]         rxvalidhs,
            input   wire    [LANES-1:0]         rxactivehs,
            input   wire    [LANES-1:0]         rxsynchs,
            
            // output
            input   wire                        aresetn,
            input   wire                        aclk,
            output  wire    [TDATA_WIDTH-1:0]   m_axi4s_tdata,
            output  wire    [0:0]               m_axi4s_tuser,
            output  wire                        m_axi4s_tlast,
            output  wire                        m_axi4s_tvalid,
            input   wire                        m_axi4s_tready
        );
    
    wire    reset = rxreseths;
    wire    clk   = rxbyteclkhs;
    
    
    // レーン間同期
    wire    [LANES*8-1:0]   sync_rxdatahs;
    wire    [LANES-1:0]     sync_rxvalidhs;
    wire    [LANES-1:0]     sync_rxactivehs;
    wire    [LANES-1:0]     sync_rxsynchs;
    
    generate
    if ( LANE_SYNC ) begin : blk_sync
        jelly_mipi_rx_lane_sync
                #(
                    .LANES          (LANES)
                )
            i_mipi_rx_lane_sync
                (
                    .reset          (reset),
                    .clk            (clk),
                    
                    .in_rxdatahs    (rxdatahs),
                    .in_rxvalidhs   (rxvalidhs),
                    .in_rxactivehs  (rxactivehs),
                    .in_rxsynchs    (rxsynchs),
                    
                    .out_rxdatahs   (sync_rxdatahs),
                    .out_rxvalidhs  (sync_rxvalidhs),
                    .out_rxactivehs (sync_rxactivehs),
                    .out_rxsynchs   (sync_rxsynchs)
                );
    end
    else begin : blk_bypass
        assign sync_rxdatahs   = rxdatahs;
        assign sync_rxvalidhs  = rxvalidhs;
        assign sync_rxactivehs = rxactivehs;
        assign sync_rxsynchs   = rxsynchs;
    end
    endgenerate
    
    
    // パケット切り出し
    wire                    recv_first;
    wire                    recv_last;
    wire    [LANES*8-1:0]   recv_data;
    wire                    recv_valid;
    
    jelly_mipi_rx_lane_recv
            #(
                .LANES          (LANES)
            )
        i_mipi_rx_lane_recv
            (
                .reset          (reset),
                .clk            (clk),
                
                .in_rxdatahs    (sync_rxdatahs),
                .in_rxvalidhs   (sync_rxvalidhs),
                .in_rxactivehs  (sync_rxactivehs),
                .in_rxsynchs    (sync_rxsynchs),
                
                .out_first      (recv_first),
                .out_last       (recv_last),
                .out_data       (recv_data),
                .out_valid      (recv_valid)
            );
    
    
    // FIFO
    wire                    fifo_first;
    wire                    fifo_last;
    wire    [LANES*8-1:0]   fifo_data;
    wire                    fifo_valid;
    wire                    fifo_ready;
    
    jelly_fifo_generic_fwtf
            #(
                .ASYNC          (1),
                .DATA_WIDTH     (2+8*LANES),
                .PTR_WIDTH      (FIFO_PTR_WIDTH),
                .DOUT_REGS      (0),
                .RAM_TYPE       (FIFO_RAM_TYPE),
                .LOW_DEALY      (0),
                .SLAVE_REGS     (0),
                .MASTER_REGS    (1)
            )
        i_fifo_generic_fwtf
            (
                .s_reset        (reset),
                .s_clk          (clk),
                .s_data         ({recv_first, recv_last, recv_data}),
                .s_valid        (recv_valid),
                .s_ready        (),
                .s_free_count   (),
                
                .m_reset        (~aresetn),
                .m_clk          (aclk),
                .m_data         ({fifo_first, fifo_last, fifo_data}),
                .m_valid        (fifo_valid),
                .m_ready        (fifo_ready),
                .m_data_count   ()
            );
    
    
    // width convert
    localparam LANE_SIZE = (LANES == 1) ? 0 :
                           (LANES == 2) ? 1 : 2;
    
    jelly_data_width_converter
            #(
                .UNIT_WIDTH     (8),
                .S_DATA_SIZE    (LANE_SIZE),
                .M_DATA_SIZE    (TDATA_SIZE)
            )
        i_data_width_converter
            (
                .reset          (~aresetn),
                .clk            (aclk),
                .cke            (1'b1),
                
                .endian         (1'b0),
                
                .s_data         (fifo_data),
                .s_first        (fifo_first),
                .s_last         (fifo_last),
                .s_valid        (fifo_valid),
                .s_ready        (fifo_ready),
                
                .m_data         (m_axi4s_tdata),
                .m_first        (m_axi4s_tuser),
                .m_last         (m_axi4s_tlast),
                .m_valid        (m_axi4s_tvalid),
                .m_ready        (m_axi4s_tready)
            );
    
endmodule


`default_nettype wire


// end of file
