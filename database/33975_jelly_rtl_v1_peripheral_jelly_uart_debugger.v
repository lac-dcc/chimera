// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// UART debuger interface
module jelly_uart_debugger
        #(
            parameter   TX_FIFO_PTR_WIDTH = 10,
            parameter   RX_FIFO_PTR_WIDTH = 10,
            parameter   DIVIDER_WIDTH     = 8
        )
        (
            // system
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        endian,

            input   wire    [DIVIDER_WIDTH-1:0] divider,
            
            // uart
            input   wire                        uart_reset,
            input   wire                        uart_clk,
            output  wire                        uart_tx,
            input   wire                        uart_rx,
            
            // debug port (whishbone)
            output  wire    [3:0]               m_wb_adr_o,
            input   wire    [31:0]              m_wb_dat_i,
            output  wire    [31:0]              m_wb_dat_o,
            output  wire                        m_wb_we_o,
            output  wire    [3:0]               m_wb_sel_o,
            output  wire                        m_wb_stb_o,
            input   wire                        m_wb_ack_i
        );
    
    
    wire    [7:0]   uart_tx_data;
    wire            uart_tx_valid;
    wire            uart_tx_ready;
                       
    wire    [7:0]   uart_rx_data;
    wire            uart_rx_valid;
    wire            uart_rx_ready;
    
    
    // UART core
    jelly_uart_core
            #(
                .TX_FIFO_PTR_WIDTH  (TX_FIFO_PTR_WIDTH),
                .RX_FIFO_PTR_WIDTH  (RX_FIFO_PTR_WIDTH),
                .DIVIDER_WIDTH      (DIVIDER_WIDTH)
            )
        i_uart_core
            (
                .reset              (reset),
                .clk                (clk),
                
                .uart_reset         (uart_reset),
                .uart_clk           (uart_clk),
                .uart_tx            (uart_tx),
                .uart_rx            (uart_rx),
                .divider            (divider),
                
                .tx_data            (uart_tx_data),
                .tx_valid           (uart_tx_valid),
                .tx_ready           (uart_tx_ready),
                
                .rx_data            (uart_rx_data),
                .rx_valid           (uart_rx_valid),
                .rx_ready           (uart_rx_ready),
                
                .tx_fifo_free_count (),
                .rx_fifo_data_count ()
            );


    // debug comm
    jelly_cpu_dbg_comm
        i_cpu_dbg_comm
            (
                .reset              (reset),
                .clk                (clk),
                .endian             (endian),
                
                .comm_tx_data       (uart_tx_data),
                .comm_tx_valid      (uart_tx_valid),
                .comm_tx_ready      (uart_tx_ready),
                .comm_rx_data       (uart_rx_data),
                .comm_rx_valid      (uart_rx_valid),
                .comm_rx_ready      (uart_rx_ready),
                
                .wb_dbg_adr_o       (m_wb_adr_o),
                .wb_dbg_dat_i       (m_wb_dat_i),
                .wb_dbg_dat_o       (m_wb_dat_o),
                .wb_dbg_we_o        (m_wb_we_o),
                .wb_dbg_sel_o       (m_wb_sel_o),
                .wb_dbg_stb_o       (m_wb_stb_o),
                .wb_dbg_ack_i       (m_wb_ack_i)
            );

endmodule


`default_nettype wire


// end of file
