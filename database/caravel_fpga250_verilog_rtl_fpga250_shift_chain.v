// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

module shift_bit (
    input clk,
    input rst,

    input shift_enable,

    input shift_in,
    output shift_out
);
    reg config_bit;
    assign shift_out = config_bit;

    always @(posedge clk) begin
        if (rst == 1'b0) begin
            if (shift_enable == 1'b1) begin
                config_bit <= shift_in;
            end else begin
                config_bit <= config_bit;
            end
        end
        else config_bit <= 1'b0;
    end
endmodule

module shift_chain #(
    parameter LENGTH = 8
) (
    input clk,
    input rst,

    input shift_enable,
    
    input shift_in,
    output shift_out,

    output [LENGTH-1:0] config_data
);
    wire [LENGTH-1:0] intermediate;

    assign config_data = intermediate;

    genvar i;
    generate
        if (LENGTH == 0) assign shift_out = shift_in;
        if (LENGTH >= 1) begin
            shift_bit head_bit (
                .clk(clk),
                .rst(rst),
                .shift_enable(shift_enable),
                .shift_in(shift_in),
                .shift_out(intermediate[LENGTH - 1])
            );
            assign shift_out = intermediate[0];
        end
        if (LENGTH > 1) begin
            for (i = 1; i < LENGTH; i = i + 1) begin
                shift_bit shift_bit_i (
                    .clk(clk),
                    .rst(rst),
                    .shift_enable(shift_enable),
                    .shift_in(intermediate[i]),
                    .shift_out(intermediate[i - 1])
                );
            end
        end
    endgenerate
endmodule
