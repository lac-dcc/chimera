// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// ring bus unit
module jelly_stream_arbiter_bidirection
        #(
            parameter   S_NUM                = 8,
            parameter   S_ID_WIDTH           = 3,
            parameter   M_NUM                = 4,
            parameter   M_ID_WIDTH           = 2,
            parameter   REQ_DATA_WIDTH       = 24,
            parameter   REQ_LEN_WIDTH        = 0,
            parameter   ACK_DATA_WIDTH       = 24,
            parameter   ACK_LEN_WIDTH        = 8,
            parameter   IN_ORDER             = 1,
            parameter   ORDER_FIFO_PTR_WIDTH = 6,
            parameter   ORDER_FIFO_RAM_TYPE  = "distributed"
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
            // slave ports
            input   wire    [S_NUM*M_ID_WIDTH-1:0]      s_req_id_to,
            input   wire    [S_NUM-1:0]                 s_req_last,
            input   wire    [S_NUM*REQ_DATA_WIDTH-1:0]  s_req_data,
            input   wire    [S_NUM-1:0]                 s_req_valid,
            output  wire    [S_NUM-1:0]                 s_req_ready,
            
            output  wire    [S_NUM*M_ID_WIDTH-1:0]      s_ack_id_from,
            output  wire    [S_NUM-1:0]                 s_ack_last,
            output  wire    [S_NUM*ACK_DATA_WIDTH-1:0]  s_ack_data,
            output  wire    [S_NUM-1:0]                 s_ack_valid,
            input   wire    [S_NUM-1:0]                 s_ack_ready,
            
            
            // master ports
            output  wire    [M_NUM*S_ID_WIDTH-1:0]      m_req_id_from,
            output  wire    [M_NUM-1:0]                 m_req_last,
            output  wire    [M_NUM*REQ_DATA_WIDTH-1:0]  m_req_data,
            output  wire    [M_NUM-1:0]                 m_req_valid,
            input   wire    [M_NUM-1:0]                 m_req_ready,
            
            input   wire    [M_NUM*S_ID_WIDTH-1:0]      m_ack_id_to,
            input   wire    [M_NUM-1:0]                 m_ack_last,
            input   wire    [M_NUM*ACK_DATA_WIDTH-1:0]  m_ack_data,
            input   wire    [M_NUM-1:0]                 m_ack_valid,
            output  wire    [M_NUM-1:0]                 m_ack_ready
        );
    
    
    // req stream
    jelly_stream_arbiter_crossbar
            #(
                .S_NUM                  (S_NUM),
                .S_ID_WIDTH             (S_ID_WIDTH),
                .M_NUM                  (M_NUM),
                .M_ID_WIDTH             (M_ID_WIDTH),
                .DATA_WIDTH             (REQ_DATA_WIDTH),
                .LEN_WIDTH              (REQ_LEN_WIDTH),
                .S_REGS                 (0),
                .ALGORITHM              ("RINGBUS"),
                .USE_ID_FILTER          (0)
            )
        i_stream_arbiter_crossbar_req
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_id_to                (s_req_id_to),
                .s_last                 (s_req_last),
                .s_data                 (s_req_data),
                .s_valid                (s_req_valid),
                .s_ready                (s_req_ready),
                
                .m_id_from              (m_req_id_from),
                .m_last                 (m_req_last),
                .m_data                 (m_req_data),
                .m_valid                (m_req_valid),
                .m_ready                (m_req_ready),
                
                .filter_id              ({M_NUM*S_ID_WIDTH{1'bx}}),
                .filter_valid           ({M_NUM{1'b0}}),
                .filter_ready           ()
            );
    
    wire    [S_NUM*M_ID_WIDTH-1:0]  filter_id    = s_req_id_to;
    wire    [S_NUM-1:0]             filter_valid = (s_req_valid & s_req_ready & s_req_last);
    
    
    // ack stream
    jelly_stream_arbiter_crossbar
            #(
                .S_NUM                  (M_NUM),
                .S_ID_WIDTH             (M_ID_WIDTH),
                .M_NUM                  (S_NUM),
                .M_ID_WIDTH             (S_ID_WIDTH),
                .DATA_WIDTH             (ACK_DATA_WIDTH),
                .S_REGS                 (0),
                .ALGORITHM              ("RINGBUS"),
                .USE_ID_FILTER          (IN_ORDER),
                .FILTER_FIFO_PTR_WIDTH  (ORDER_FIFO_PTR_WIDTH),
                .FILTER_FIFO_RAM_TYPE   (ORDER_FIFO_RAM_TYPE)
            )
        i_ring_bus_crossbar_ack
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_id_to                (m_ack_id_to),
                .s_last                 (m_ack_last),
                .s_data                 (m_ack_data),
                .s_valid                (m_ack_valid),
                .s_ready                (m_ack_ready),
                
                .m_id_from              (s_ack_id_from),
                .m_last                 (s_ack_last),
                .m_data                 (s_ack_data),
                .m_valid                (s_ack_valid),
                .m_ready                (s_ack_ready),
                
                .filter_id              (filter_id),
                .filter_valid           (filter_valid),
                .filter_ready           ()
            );
    
    
endmodule



`default_nettype wire


// end of file
