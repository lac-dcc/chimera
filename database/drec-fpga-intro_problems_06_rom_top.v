// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module top(
    input CLK,

    output DS_EN1, DS_EN2, DS_EN3, DS_EN4,
    output DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G
);

wire [15:0]d;

wire [3:0]anodes;
assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4} = ~anodes;

wire [6:0]segments;
assign {DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G} = segments;

clk_div clk_div(.clk_in(CLK), .clk_out(clk2));

clk_div #(.X(24)) clk_div2(.clk_in(CLK), .clk_out(clk3));

hex_display hd(.clk(clk2), .data(d), .anodes(anodes), .segments(segments));

rom_fetcher rom_fetcher(.clk(clk3), .q(d));

endmodule

module rom_fetcher(
    input clk,

    output [15:0]q
);

reg [7:0]pc = 0;
wire [7:0]pc_next = pc + 1;

rom #(.WIDTH(16)) rom(.clk(clk), .addr(pc), .q(q));
//rom_comb #(.WIDTH(16)) rom_comb(.addr(pc), .q(q));

always @(posedge clk) begin
    pc <= pc_next;
end

endmodule
