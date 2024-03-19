// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// uart
module jelly_uart_core
        #(
            parameter   TX_FIFO_PTR_WIDTH = 4,
            parameter   RX_FIFO_PTR_WIDTH = 4,
            parameter   DIVIDER_WIDTH     = 8,
            parameter   SIMULATION        = 0,
            parameter   DEBUG             = 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            
            input   wire                            uart_reset,
            input   wire                            uart_clk,
            output  wire                            uart_tx,
            input   wire                            uart_rx,
            input   wire    [DIVIDER_WIDTH-1:0]     divider,
            
            input   wire    [7:0]                   tx_data,
            input   wire                            tx_valid,
            output  wire                            tx_ready,
            
            output  wire    [7:0]                   rx_data,
            output  wire                            rx_valid,
            input   wire                            rx_ready,
            
            output  wire    [TX_FIFO_PTR_WIDTH:0]   tx_fifo_free_count,
            output  wire    [RX_FIFO_PTR_WIDTH:0]   rx_fifo_data_count
        );
    
    localparam  TX_FIFO_SIZE = (1 << TX_FIFO_PTR_WIDTH);
    localparam  RX_FIFO_SIZE = (1 << RX_FIFO_PTR_WIDTH);
    
    
    
    // -------------------------
    //  Clock divider
    // -------------------------
    
    reg                             dv_pulse;
    reg     [DIVIDER_WIDTH-1:0]     dv_counter;
    always @ ( posedge uart_clk ) begin
        if ( uart_reset ) begin
            dv_pulse   <= 1'b0;
            dv_counter <= 0;
        end
        else begin
            if ( dv_counter == divider ) begin
                dv_pulse   <= 1'b1;
                dv_counter <= 0;
            end
            else begin
                dv_pulse   <= 1'b0;
                dv_counter <= dv_counter + 1'b1;
            end
        end
    end
    
    
    // -------------------------
    //  TX
    // -------------------------
    
    // TX
    wire    [7:0]                   tx_fifo_rd_data;
    wire                            tx_fifo_rd_valid;
    wire                            tx_fifo_rd_ready;
    
    // FIFO
    jelly_fifo_async_fwtf
            #(
                .DATA_WIDTH     (8),
                .PTR_WIDTH      (TX_FIFO_PTR_WIDTH)
            )
        i_fifo_tx
            (
                .s_reset        (reset),                
                .s_clk          (clk),
                .s_data         (tx_data),
                .s_valid        (tx_valid),
                .s_ready        (tx_ready),
                .s_free_count   (tx_fifo_free_count),
                
                .m_reset        (uart_reset),
                .m_clk          (uart_clk),
                .m_data         (tx_fifo_rd_data),
                .m_valid        (tx_fifo_rd_valid),
                .m_ready        (tx_fifo_rd_ready),
                .m_data_count   ()
            );
    
    // transmitter
    jelly_uart_tx
        i_uart_tx
            (
                .reset          (uart_reset),
                .clk            (uart_clk),
                .dv_pulse       (dv_pulse),
                
                .uart_tx        (uart_tx),
                
                .tx_valid       (tx_fifo_rd_valid),
                .tx_data        (tx_fifo_rd_data), 
                .tx_ready       (tx_fifo_rd_ready)
            );
    
    
    
    
    // -------------------------
    //  RX
    // -------------------------
    
    wire    [7:0]                   rx_fifo_wr_data;
    wire                            rx_fifo_wr_valid;
//  wire                            rx_fifo_wr_ready;
    
    // FIFO
    jelly_fifo_async_fwtf
            #(
                .DATA_WIDTH     (8),
                .PTR_WIDTH      (RX_FIFO_PTR_WIDTH)
            )
        i_fifo_rx
            (
                .s_reset        (uart_reset),
                .s_clk          (uart_clk),
                .s_data         (rx_fifo_wr_data),
                .s_valid        (rx_fifo_wr_valid),
                .s_ready        (),
                .s_free_count   (),
                
                .m_reset        (reset),
                .m_clk          (clk),
                .m_data         (rx_data),
                .m_valid        (rx_valid),
                .m_ready        (rx_ready),
                .m_data_count   (rx_fifo_data_count)
            );
    
    // double latch
    reg     [2:0]       ff_uart_rx;
    always @(posedge uart_clk) begin
        if ( uart_reset ) begin
            ff_uart_rx <= 3'b111;
        end
        else begin
            ff_uart_rx <= {ff_uart_rx[1:0], uart_rx};
        end
    end
    
    // receiver
    jelly_uart_rx
        i_uart_rx
            (
                .reset          (uart_reset), 
                .clk            (uart_clk),
                .dv_pulse       (dv_pulse),
                
                .uart_rx        (ff_uart_rx[2]),
                
                .rx_valid       (rx_fifo_wr_valid),
                .rx_data        (rx_fifo_wr_data)
            );
    
    
    // -------------------------
    //  Debug
    // -------------------------
    
    generate
    if ( SIMULATION & DEBUG ) begin
        always @ ( posedge clk ) begin
            if ( rx_valid & rx_ready ) begin
                if ( rx_data >= 8'h20 && rx_data <= 8'h7e ) begin
                    $display("%m : [UART-RX] %h %c", rx_data, rx_data);
                end
                else begin
                    $display("%m : [UART-RX] %h", rx_data);
                end
            end
            
            if ( tx_valid & tx_ready ) begin
                if ( tx_data >= 8'h20 && tx_data <= 8'h7e ) begin
                    $display("%m : [UART-TX] %h %c", tx_data, tx_data);
                end
                else begin
                    $display("%m : [UART-TX] %h", tx_data);
                end
            end
        end
    end
    endgenerate
    
endmodule


`default_nettype wire


// end of file
