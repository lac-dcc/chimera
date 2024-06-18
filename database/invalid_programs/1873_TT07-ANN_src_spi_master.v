// This program was cloned from: https://github.com/sbasu3/TT07-ANN
// License: Apache License 2.0

module spi_master #(parameter DATA_WIDTH = 8) (
    input wire clk,
    input wire rst_n,
    input wire start,
    output reg ready,
    input wire [DATA_WIDTH-1:0] mosi_data,
    output wire [DATA_WIDTH-1:0] miso_data,
    output wire sclk,
    output wire cs_n
);

    localparam IDLE = 2'b00, START = 2'b01, SHIFT = 2'b10, STOP = 2'b11;
    reg [1:0] state, next_state;
    reg [DATA_WIDTH-1:0] shift_reg;
    reg [3:0] bit_counter;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    always @(state, start, bit_counter) begin
        case (state)
            IDLE: begin
                if (start) begin
                    next_state = START;
                end else begin
                    next_state = IDLE;
                end
            end
            START: begin
                next_state = SHIFT;
            end
            SHIFT: begin
                if (bit_counter == DATA_WIDTH-1) begin
                    next_state = STOP;
                end else begin
                    next_state = SHIFT;
                end
            end
            STOP: begin
                next_state = IDLE;
            end
        endcase
    end

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            shift_reg <= 0;
            bit_counter <= 0;
            ready <= 0;
            cs_n <= 1;
            sclk <= 0;
        end else begin
            case (state)
                IDLE: begin
                    ready <= 0;
                    cs_n <= 1;
                    sclk <= 0;
                end
                START: begin
                    shift_reg <= mosi_data;
                    bit_counter <= 0;
                    ready <= 0;
                    cs_n <= 0;
                    sclk <= 0;
                end
                SHIFT: begin
                    shift_reg <= shift_reg << 1;
                    bit_counter <= bit_counter + 1;
                    sclk <= ~sclk;
                end
                STOP: begin
                    ready <= 1;
                    cs_n <= 1;
                    sclk <= 0;
                end
            endcase
        end
    end

    assign miso_data = shift_reg;

endmodule