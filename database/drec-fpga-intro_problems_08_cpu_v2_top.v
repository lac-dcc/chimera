module top(
    input CLK,

    output DS_EN1, DS_EN2, DS_EN3, DS_EN4,
    output DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G
);

wire [3:0]anodes;
assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4} = ~anodes;

wire [6:0]segments;
assign {DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G} = segments;

cpu_top cpu_top(.clk(CLK), .data_out(/* Problem 5 */));

wire clk1;
clk_div clk_div(.clk_in(CLK), .clk_out(clk1));

hex_display hex_display(
    .clk(clk1), .data(/* Problem 5 */),
    .anodes(anodes), .segments(segments)
);

endmodule
