// This program was cloned from: https://github.com/vrteee/tt07-mini-aie-cgra
// License: Apache License 2.0

module dma (
    input logic clk,
    input logic reset,
    input logic start,
    input logic [7:0] data,
    output logic wr_en,
    output logic [7:0] data_out
);
    parameter IDLE_STATE = 2'b00;
    parameter WRITE_STATE = 2'b01;
    logic [1:0] state;
    logic [7:0] prev_data;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            state <= IDLE_STATE;
            data_out <= 8'b00110010;

        end else begin
            case (state)
                IDLE_STATE: begin
                    if (start)
                        state <= WRITE_STATE;
                end
                WRITE_STATE: begin
                    if (data != prev_data) begin
                        state <= IDLE_STATE;
                        prev_data <= data;
                        data_out <= data;
                    end
                end
                default: state <= IDLE_STATE;
            endcase
        end
    end

    assign wr_en = (state == WRITE_STATE);
endmodule

