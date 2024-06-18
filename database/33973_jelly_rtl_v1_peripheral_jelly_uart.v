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


// uart
module jelly_uart
        #(
            parameter   TX_FIFO_PTR_WIDTH = 4,
            parameter   RX_FIFO_PTR_WIDTH = 4,
            
            parameter   WB_ADR_WIDTH      = 2,
            parameter   WB_DAT_WIDTH      = 32,
            parameter   WB_SEL_WIDTH      = (WB_DAT_WIDTH / 8),
            
            parameter   DIVIDER_WIDTH     = 8,
            parameter   DIVIDER_INIT      = 54-1,
            
            parameter   SIMULATION        = 0,
            parameter   DEBUG             = 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            
            // UART
            input   wire                        uart_reset,
            input   wire                        uart_clk,
            output  wire                        uart_tx,
            input   wire                        uart_rx,
            
            output  wire                        irq_rx,
            output  wire                        irq_tx,
            
            // control
            input   wire    [WB_ADR_WIDTH-1:0]  s_wb_adr_i,
            output  wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_i,
            input   wire                        s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]  s_wb_sel_i,
            input   wire                        s_wb_stb_i,
            output  wire                        s_wb_ack_o
        );
    
    // FIFO size
    localparam  TX_FIFO_SIZE = (1 << TX_FIFO_PTR_WIDTH);
    localparam  RX_FIFO_SIZE = (1 << RX_FIFO_PTR_WIDTH);
    

    // register address
    localparam  UART_ADR_TX      = 2'b00;
    localparam  UART_ADR_RX      = 2'b00;
    localparam  UART_ADR_STATUS  = 2'b01;
    localparam  UART_ADR_DIVIDER = 2'b10;
    
    
    // -------------------------
    //   Core
    // -------------------------
    
    reg     [DIVIDER_WIDTH-1:0]     divider;
    
    wire    [7:0]                   tx_data;
    wire                            tx_valid;
    wire                            tx_ready;

    wire    [7:0]                   rx_data;
    wire                            rx_valid;
    wire                            rx_ready;
    
    wire    [TX_FIFO_PTR_WIDTH:0]   tx_fifo_free_count;
//  wire    [RX_FIFO_PTR_WIDTH:0]   rx_fifo_data_count;
    
    jelly_uart_core
            #(
                .TX_FIFO_PTR_WIDTH  (TX_FIFO_PTR_WIDTH),
                .RX_FIFO_PTR_WIDTH  (RX_FIFO_PTR_WIDTH),
                .DIVIDER_WIDTH      (DIVIDER_WIDTH),
                .SIMULATION         (SIMULATION),
                .DEBUG              (DEBUG)
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
                
                .tx_data            (tx_data),
                .tx_valid           (tx_valid),
                .tx_ready           (tx_ready),
                
                .rx_data            (rx_data),
                .rx_valid           (rx_valid),
                .rx_ready           (rx_ready),
                
                .tx_fifo_free_count (tx_fifo_free_count),
                .rx_fifo_data_count ()//(rx_fifo_data_count)
            );
    
    
    // irq
    assign irq_tx = (tx_fifo_free_count == TX_FIFO_SIZE);
    assign irq_rx = rx_valid;
    
    
    // -------------------------
    //  register
    // -------------------------
    
    // TX
    assign tx_valid = s_wb_stb_i & s_wb_we_i & (s_wb_adr_i == UART_ADR_TX);
    assign tx_data  = s_wb_dat_i[7:0];
    
    // RX
    assign rx_ready = s_wb_stb_i & !s_wb_we_i & (s_wb_adr_i == UART_ADR_RX);
    
    
    always @(posedge clk) begin
        if ( reset ) begin
            divider <= DIVIDER_INIT;
        end
        else begin
            if ( s_wb_stb_i && s_wb_we_i && (s_wb_adr_i == 2) ) begin
                divider <= s_wb_dat_i[DIVIDER_WIDTH-1:0];
            end
        end
    end
    
    assign s_wb_dat_o = (s_wb_stb_i && (s_wb_adr_i == UART_ADR_RX))      ? rx_data              :
                        (s_wb_stb_i && (s_wb_adr_i == UART_ADR_STATUS))  ? {tx_ready, rx_valid} :
                        (s_wb_stb_i && (s_wb_adr_i == UART_ADR_DIVIDER)) ? divider              :
                        {WB_DAT_WIDTH{1'b0}};
    
    assign s_wb_ack_o = s_wb_stb_i;
    
    
endmodule


`default_nettype wire



// end of file
