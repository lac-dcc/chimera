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



module jelly_uart_tx
        (
            // system
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        dv_pulse,
            
            // UART
            output  wire                        uart_tx,
            
            // control
            input   wire    [7:0]               tx_data,
            input   wire                        tx_valid,
            output  wire                        tx_ready
        );
    
    // TX
    reg                         tx_busy;
    reg     [6:0]               tx_count;
    reg     [8:0]               tx_buf;
    
    always @ ( posedge clk ) begin
        if ( reset ) begin
            tx_busy      <= 1'b0;
            tx_count     <= {7{1'bx}};
            tx_buf[0]    <= 1'b1;
            tx_buf[8:1]  <= {8{1'bx}};
        end
        else if ( dv_pulse ) begin
            if ( !tx_busy ) begin
                if ( tx_valid ) begin
                    tx_busy      <= 1'b1;
                    tx_buf[0]    <= 1'b0;
                    tx_buf[8:1]  <= tx_data;
                    tx_count     <= 7'h00;
                end
            end
            else begin
                tx_count <= tx_count + 1'b1;
                if ( tx_count[2:0] == 4'h7 ) begin
                    tx_buf <= {1'b1, tx_buf[8:1]};
                    if ( tx_count[6:3] == 4'ha ) begin
                        tx_busy <= 1'b0;
                    end
                end
            end
        end
    end
    
    assign tx_ready = ~tx_busy & dv_pulse;
    assign uart_tx  = tx_buf[0];
    
endmodule


`default_nettype wire


// end of file
