// This program was cloned from: https://github.com/mr-bammby/FPGA_comm
// License: MIT License

module uart_rx
#(
    parameter DELAY_FRAMES = 2812, // 27,000,000 (27Mhz) / 9600 Baud rate
    parameter BIT_PER_WORD = 7
)
(
    input rx_pin,
    output [1:0] led,
    input clk,
    output [BIT_PER_WORD:0] data,
    output data_ready,
    output comm_err
);

localparam HALF_DELAY_FRAMES = DELAY_FRAMES/2 - 1;

localparam UART_RX_STATE_WAIT       = 0;
localparam UART_RX_STATE_START_BIT  = 1;
localparam UART_RX_STATE_RECEIVE    = 2;
localparam UART_RX_STATE_STOP_BIT   = 3;
localparam UART_RX_STATE_DONE       = 4;

reg [3:0] state = UART_RX_STATE_WAIT;
reg [24:0] rx_counter = 0;
reg [7:0] bit_counter = 0;
reg [BIT_PER_WORD:0] data_reg = 0;
reg data_ready_reg = 0;
reg [1:0] ledReg = 0;
reg [23:0] clockCounter = 0;
reg err_reg = 0;

always @(posedge clk) begin
    case (state)
        UART_RX_STATE_WAIT: begin
            if (rx_pin == 0) begin
                state <= UART_RX_STATE_START_BIT;
                rx_counter <= 0;
                bit_counter <= 0;
                ledReg <= 1;
            end
            else
                ledReg <= 0;
        end
        UART_RX_STATE_START_BIT: begin
            if ((rx_counter + 1) >= HALF_DELAY_FRAMES) begin
                if (rx_pin == 0) begin
                    state <= UART_RX_STATE_RECEIVE;
                    ledReg <= 2;
                end
                else begin
                    err_reg <= 1;
                    state <= UART_RX_STATE_STOP_BIT;
                    ledReg <= 3;
                end
                rx_counter <= 0;
                data_ready_reg <= 0;
            end else
                rx_counter <= rx_counter + 1;
        end
        UART_RX_STATE_RECEIVE : begin
            if ((rx_counter + 1) == DELAY_FRAMES) begin
                data_reg[bit_counter] = rx_pin;
                if (bit_counter == BIT_PER_WORD) begin
                    state <= UART_RX_STATE_STOP_BIT;
                end else
                    bit_counter <= bit_counter + 1;
                rx_counter <= 0;
            end else
                rx_counter <= rx_counter + 1;
        end
        UART_RX_STATE_STOP_BIT : begin
            if ((rx_counter + 1) == DELAY_FRAMES) begin
                state <= UART_RX_STATE_WAIT;
                if (rx_pin == 1) begin
                    state <= UART_RX_STATE_WAIT;
                    err_reg <= 0;
                    if (err_reg == 0) begin
                        data_ready_reg <= 1;
                    end
                end
                else begin
                    err_reg <= 1;
                    ledReg <= 3;
                end
            end else
                rx_counter <= rx_counter + 1;
        end
    endcase
end

assign led = ledReg;
assign data_ready = data_ready_reg;
assign data = data_reg;
assign comm_err = err_reg;

endmodule