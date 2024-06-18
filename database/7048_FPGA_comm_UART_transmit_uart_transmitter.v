// This program was cloned from: https://github.com/mr-bammby/FPGA_comm
// License: MIT License

module uart_tx
#(
    parameter DELAY_FRAMES = 2812, // 27,000,000 (27Mhz) / 9600 Baud rate
    parameter BIT_PER_WORD = 7 
)
(
    output tx_pin,
    output [2:0] led,
    input clk,
    input [BIT_PER_WORD:0] data,
    input data_ready,
    output sampled
);

localparam DEBOUNCE_DELAY   = 23'b111111111111111111;

localparam UART_TX_STATE_WAIT       = 0;
localparam UART_TX_STATE_INIT       = 1;
localparam UART_TX_STATE_START_BIT  = 2;
localparam UART_TX_STATE_TRANSMIT   = 3;
localparam UART_TX_STATE_STOP_BIT   = 4;
localparam UART_TX_STATE_DONE       = 5;

reg [3:0] state = UART_TX_STATE_WAIT;
reg [24:0] tx_counter = 0;
reg [7:0] bit_counter = 0;
reg [BIT_PER_WORD:0] data_reg = 0;
reg out = 1;
reg new_data = 0;
reg [5:0] ledReg = 1;
reg semple_reg = 0;
reg old_data_ready = 0;

always @(posedge clk) begin
    if (old_data_ready == 0 && data_ready == 1) begin
        new_data <= 1;
    end
    old_data_ready <= data_ready;
    case (state)
        UART_TX_STATE_WAIT: begin
            if (new_data == 1) begin
                state <= UART_TX_STATE_INIT;
            end
        end
        UART_TX_STATE_INIT: begin
            tx_counter <= 0;
            if (new_data == 1) begin
                data_reg <= data;
                state <= UART_TX_STATE_START_BIT;
                ledReg <= 2;
                new_data <= 0;
            end else begin
                ledReg <= 4;
                state <= UART_TX_STATE_DONE;
            end
        end
        UART_TX_STATE_START_BIT : begin
            out <= 0;
            if ((tx_counter + 1) == DELAY_FRAMES) begin
                semple_reg <= 0;
                state <= UART_TX_STATE_TRANSMIT;
                tx_counter <= 0;
                bit_counter <= 0;
            end else begin
                semple_reg <= 1;
                tx_counter <= tx_counter + 1;
            end          
        end
        UART_TX_STATE_TRANSMIT : begin
            out <= data_reg[bit_counter];
            if ((tx_counter + 1) == DELAY_FRAMES) begin
                if (bit_counter == BIT_PER_WORD) begin
                    state <= UART_TX_STATE_STOP_BIT;
                end else
                    bit_counter <= bit_counter + 1;
                tx_counter <= 0;
            end else
                tx_counter <= tx_counter + 1;
        end
        UART_TX_STATE_STOP_BIT : begin
            out <= 1;
            if ((tx_counter + 1) == DELAY_FRAMES) begin
                state <= UART_TX_STATE_INIT;
                tx_counter <= 0;
            end else
                tx_counter <= tx_counter + 1;
        end
        UART_TX_STATE_DONE : begin
            if ((tx_counter + 1) == DEBOUNCE_DELAY) begin
                state <= UART_TX_STATE_WAIT;
                ledReg <= 1;
            end else
                tx_counter <= tx_counter + 1;
        end
    endcase
end

assign tx_pin = out;
assign led = ledReg;
assign sampled = semple_reg;

endmodule