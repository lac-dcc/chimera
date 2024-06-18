// This program was cloned from: https://github.com/sbasu3/TT07-ANN
// License: Apache License 2.0

module uart (
    input wire clk,
    input wire reset,
    input wire txd,
    output wire rxd
);

parameter BAUD_RATE = 9600;
parameter CLK_FREQ = 50000000; // Clock frequency
parameter COUNT_ONE_BIT = CLK_FREQ / BAUD_RATE;

reg [15:0] counter;
reg [7:0] tx_data;
reg [7:0] rx_data;
reg tx_busy;
reg rx_busy;
reg [3:0] bit_counter;
reg state;

// State definitions
localparam IDLE = 2'b00, START = 2'b01, DATA = 2'b10, STOP = 2'b11;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        counter <= 0;
        state <= IDLE;
    end else begin
        case (state)
            IDLE: begin
                if (tx_busy) begin
                    state <= START;
                end
            end
            START: begin
                if (counter == COUNT_ONE_BIT) begin
                    counter <= 0;
                    state <= DATA;
                end else begin
                    counter <= counter + 1;
                end
            end
            DATA: begin
                if (counter == COUNT_ONE_BIT) begin
                    counter <= 0;
                    if (bit_counter == 7) begin
                        state <= STOP;
                    end else begin
                        bit_counter <= bit_counter + 1;
                    end
                end else begin
                    counter <= counter + 1;
                end
            end
            STOP: begin
                if (counter == COUNT_ONE_BIT) begin
                    counter <= 0;
                    state <= IDLE;
                    tx_busy <= 0;
                end else begin
                    counter <= counter + 1;
                end
            end
        endcase
    end
end

endmodule