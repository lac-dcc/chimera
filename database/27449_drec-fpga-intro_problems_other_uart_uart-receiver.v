// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module uart_receiver
#(
  parameter NATIVE_CLK_FREQUENCY = 1000000000,
  parameter BAUDRATE = 9600,
  parameter FRAME_DATA_LENGTH = 8,
  parameter BIG_ENDIAN = 0
) (input clk, input rx, output reg [0:FRAME_DATA_LENGTH - 1]received_data = 0, output busy);

    reg reset = 1;
    clock_divider #(
        .NATIVE_CLK_FREQUENCY(NATIVE_CLK_FREQUENCY),
        .TARGET_CLK_FREQUENCY(BAUDRATE),
        .DELAYED_START(1)
    ) clk_div(.clk(clk), .reset(reset), .target_clk(target_clk));

    // 0 is considered idle, another three are for initial 0 and for the last 1
    parameter MAX_RECEIVED_BIT = FRAME_DATA_LENGTH + 2;
    reg [0:$clog2(MAX_RECEIVED_BIT) - 1]received_bit = 0;
       
    assign busy = received_bit != 0;
    assign got_new_transmission = !rx && !busy;

    always @(negedge clk)
        if (got_new_transmission) begin
            received_bit <= 1;
            reset <= 0;
            received_data <= 0; // This is kind of unnecessary, not sure if it impacts syntesis though 
        end else if (!busy)
            reset <= 1;

    always @(negedge target_clk)
        if (busy) begin
            if (received_bit != 1)
                received_data[BIG_ENDIAN ? received_bit - 2 : (FRAME_DATA_LENGTH - 1) - (received_bit - 2)] <= rx;
            received_bit <= (received_bit == MAX_RECEIVED_BIT) ? 0 : received_bit + 1;
        end
endmodule
