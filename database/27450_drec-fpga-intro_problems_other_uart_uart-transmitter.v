// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module uart_transmitter
#(
  parameter NATIVE_CLK_FREQUENCY = 1000000000,
  parameter BAUDRATE = 9600,
  parameter FRAME_DATA_LENGTH = 8,
  parameter BIG_ENDIAN = 0
) (input clk, input sending, input [0:FRAME_DATA_LENGTH - 1]data, output busy, output reg tx = 1);

    reg reset = 0;
    clock_divider #(
        .NATIVE_CLK_FREQUENCY(NATIVE_CLK_FREQUENCY),
        .TARGET_CLK_FREQUENCY(BAUDRATE)
    ) clk_div(.clk(clk), .reset(reset), .target_clk(target_clk));

    // 0 is considered idle, another three are for initial 0, 1 and for the last 1
    parameter MAX_TRANSMITTED_BIT = FRAME_DATA_LENGTH + 3;

    reg [0:$clog2(MAX_TRANSMITTED_BIT) - 1]transmitted_bit = 0;

    assign busy = transmitted_bit != 0;
    assign got_new_data = sending && !busy;

    reg [0:MAX_TRANSMITTED_BIT - 1]saved_data = { 1'b0, {FRAME_DATA_LENGTH{1'b0}}, 2'b11 };
    always @(posedge clk) begin
        if (got_new_data) begin
            if (!BIG_ENDIAN)
                for (integer i = 0; i < FRAME_DATA_LENGTH; i ++)
                    saved_data[i + 1] <= data[FRAME_DATA_LENGTH - 1 - i];
            else
                saved_data[1:FRAME_DATA_LENGTH] <= data;
            transmitted_bit <= 1;

            tx <= 1; // Send transmission start signal
        end

        reset <= got_new_data;
    end

    always @(negedge target_clk)
        if (busy) begin
            tx <= saved_data[transmitted_bit - 1];
            transmitted_bit <= (transmitted_bit == MAX_TRANSMITTED_BIT) ? 0 : transmitted_bit + 1;
        end else
            tx <= 1'b1;
endmodule
