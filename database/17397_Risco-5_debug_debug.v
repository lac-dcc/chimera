// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module Debug #(
    parameter INITIAL_ADDRESS = 32'h0000FFFF,
    parameter COUNTER_BITS = 32,
    parameter BUS_WIDHT = 32
)(
    input wire clk,
    input wire reset,
    input wire tx,
    output wire rx,
    output wire clk_o,
    output reg [BUS_WIDHT - 1:0] output_a,
    output reg [BUS_WIDHT - 1:0] output_b,
    output reg [BUS_WIDHT - 1:0] output_c,
    output reg [BUS_WIDHT - 1:0] output_d,

    input wire [BUS_WIDHT - 1:0] input_y,
    input wire [BUS_WIDHT - 1:0] input_z
);

reg option, out_enable, pulse;
reg [COUNTER_BITS-1 : 0] divider;

initial begin
    option = 1'b0;
    out_enable = 1'b0;
    pulse = 1'b0;
    divider = 32'h0;
end

ClkDivider #(
    .COUNTER_BITS(COUNTER_BITS)
) ClkDivider(
    .clk(clk),
    .reset(reset),
    .option(option),
    .out_enable(out_enable),
    .divider(divider),
    .pulse(pulse),
    .clk_o(clk_o)
);

always @(posedge clk ) begin
    
end
    
endmodule
