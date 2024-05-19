// This program was cloned from: https://github.com/SySS-Research/icestick-lpc-tpm-sniffer
// License: GNU General Public License v3.0

/*
 * iCEstick LPC TPM Sniffer (mem2serial.v)
 * 
 * Memory to serial
 */

module mem2serial #(parameter AW = 8)(
    input wire clk,
    input wire reset,                       // active low
    input wire [31:0] read_data,
    input wire read_empty,                  // high means input is empty
    input wire uart_ready,
    output reg read_clk_enable,
    output reg uart_clk_enable,
    output reg [7:0] uart_data
);
    
    // registers
    reg [7:0] write_pos;
    reg [47:0] data;

    // state machine
    localparam[3:0] STATE_IDLE = 4'd0;
    localparam[3:0] STATE_WRITE_DATA = 4'd1;
    localparam[3:0] STATE_WAIT_WRITE_DONE = 4'd2;
    localparam[3:0] STATE_WRITE_TRAILER = 4'd3;
    localparam[3:0] STATE_WAIT_WRITE_TRAILER_DONE = 4'd4;
    reg [3:0] state;

    // synchronous logic
    always @(posedge clk or negedge reset)
    begin
        if (~reset) begin
            state <= STATE_IDLE;
            uart_clk_enable <= 0;
            read_clk_enable <= 0;
            write_pos <= 0;
        end else
            case (state)
                STATE_IDLE:
                begin
                    if (~read_empty)
                        if (read_clk_enable)
                        begin
                            data <= read_data;
                            state <= STATE_WRITE_DATA;
                            read_clk_enable <= 0;
                            write_pos <= 40;
                        end else
                            read_clk_enable <= 1;
                    else
                        read_clk_enable <= 0;
                end

                STATE_WRITE_DATA:
                begin
                    if (uart_ready)
                    begin
                        uart_data[7] <= data[write_pos + 7];
                        uart_data[6] <= data[write_pos + 6];
                        uart_data[5] <= data[write_pos + 5];
                        uart_data[4] <= data[write_pos + 4];
                        uart_data[3] <= data[write_pos + 3];
                        uart_data[2] <= data[write_pos + 2];
                        uart_data[1] <= data[write_pos + 1];
                        uart_data[0] <= data[write_pos + 0];
                        uart_clk_enable <= 1;
                        write_pos <= write_pos - 8;
                        state <= STATE_WAIT_WRITE_DONE;
                    end
                end

                STATE_WAIT_WRITE_DONE:
                begin
                    if (~uart_ready)
                    begin
                        uart_clk_enable <= 0;
                        if (write_pos > 40)
                        begin                           // overflow. finished writing
                            write_pos <= 0;
                            state <= STATE_WRITE_TRAILER;
                        end else
                            state <= STATE_WRITE_DATA;
                    end
                end

                STATE_WRITE_TRAILER:
                begin
                    if (uart_ready)
                    begin
                        if (write_pos == 0)
                        begin
                            uart_clk_enable <= 1;
                            uart_data <= 8'h0a;
                            state <= STATE_WAIT_WRITE_TRAILER_DONE;
                        end
                        else if (write_pos >= 1)
                        begin
                            state <= STATE_IDLE;
                        end

                        write_pos <= write_pos + 1;
                    end
                end

                STATE_WAIT_WRITE_TRAILER_DONE:
                begin
                    if (~uart_ready)
                    begin
                        uart_clk_enable <= 0;
                        state <= STATE_WRITE_TRAILER;
                    end
                end
        endcase
    end

endmodule
