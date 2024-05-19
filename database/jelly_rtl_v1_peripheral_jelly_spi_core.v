// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale       1ns / 1ps
`default_nettype none



// uart
module jelly_spi_core
        #(
            parameter DIVIDER_WIDTH = 16
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            
            input   wire    [DIVIDER_WIDTH-1:0] clk_dvider,
            input   wire                        lsb_first,
            
            output  wire                        spi_clk,
            output  wire                        spi_di,
            input   wire                        spi_do,
            
            input   wire    [7:0]               tx_data,
            input   wire                        tx_valid,
            output  wire                        tx_ready,
            
            output  wire    [7:0]               rx_data,
            output  wire                        rx_valid,
            
            output  wire                        busy
        );
    
    
    // state
    localparam  [2:0]   ST_START = 3'd0, ST_STOP = 3'd1, ST_ACK = 3'd2, ST_NAK = 3'd3, ST_SEND = 3'd4, ST_RECV = 3'd5;
    
    
    // clock dvider
    reg     [DIVIDER_WIDTH-1:0]     reg_clk_counter;
    reg                             reg_clk_triger;
    
    // clock dvider
    always @( posedge clk ) begin
        if ( reset ) begin
            reg_clk_counter <= 0;
            reg_clk_triger  <= 1'b0;
        end
        else begin
            if ( busy ) begin
                if ( reg_clk_counter == 0 ) begin
                    reg_clk_counter <= clk_dvider;
                    reg_clk_triger  <= 1'b1;
                end
                else begin
                    reg_clk_counter <= reg_clk_counter - 1'b1;
                    reg_clk_triger  <= 1'b0;
                end
            end
            else begin
                // idle
                reg_clk_counter <= clk_dvider;
                reg_clk_triger  <= 1'b0;
            end
        end
    end
    
    
    // state machine
    reg             reg_busy;
    reg     [3:0]   reg_counter;
    reg             reg_last;
    reg     [7:0]   reg_recv_data;
    reg     [7:0]   reg_send_data;
    
    wire    [3:0]   next_counter;
    assign next_counter = reg_counter + 1'b1;
    
    always @( posedge clk ) begin
        if ( reset ) begin
            reg_busy       <= 1'b0;
            reg_counter    <= 4'd0;
            reg_recv_data  <= 8'h00;
            reg_send_data  <= 8'h00;
        end
        else begin
            if ( tx_valid & tx_ready ) begin
                reg_busy      <= 1'b1;
                reg_send_data <= tx_data;
            end
            else if ( reg_busy ) begin
                if ( reg_clk_triger ) begin
                    reg_counter <= next_counter;
                    if ( reg_last ) begin
                        reg_busy <= 1'b0;
                    end
                    else begin
                        if ( reg_counter[0] ) begin
                            reg_send_data <= lsb_first ? {1'b0, reg_send_data[7:1]}   : {reg_send_data[6:0], 1'b0};
                        end
                        else begin
                            reg_recv_data <= lsb_first ? {spi_do, reg_recv_data[7:1]} : {reg_recv_data[6:0], spi_do};
                        end
                    end
                end
            end
            else begin
                reg_counter <= 6'd0;
            end
            reg_last <= (next_counter == 0);
        end
    end
    
    assign spi_clk  = reg_counter[0];
    assign spi_di   = lsb_first ? reg_send_data[0] : reg_send_data[7];
    
    assign tx_ready = ~reg_busy | (reg_clk_triger & reg_last);
    
    assign rx_data  = reg_recv_data;
    assign rx_valid = (reg_clk_triger & reg_last);
    
    
    assign busy     = reg_busy;
    
endmodule


`default_nettype wire


// end of file

