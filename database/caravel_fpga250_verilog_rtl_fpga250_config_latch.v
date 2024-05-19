// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

// Synchronous flip-flop with enable for storing config data, may eventually be turned into an async latch

module config_latch #(
    parameter LENGTH = 8
) (
    input clk,
    input rst,
    input set,

    input [LENGTH-1:0] shifter_data,
    output [LENGTH-1:0] config_bits
);
    reg [LENGTH-1:0] stored_bits;

    assign config_bits = stored_bits;

    always @(posedge clk) begin
        if (rst == 1) begin
            stored_bits <= 0;
        end
        else if (set == 1) begin
            stored_bits <= shifter_data;
        end
        else begin
            stored_bits <= stored_bits;
        end
    end
endmodule