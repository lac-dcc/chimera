// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module bin_display(
    input clk,
    input [3:0]data,

    output [3:0]anodes,
    output [6:0]segments
);

reg [1:0]i = 0;

assign anodes = (4'b1 << i);

always @(posedge clk) begin
    i <= i + 2'b1;
end

wire b = data[i];

bin_to_seg bin_to_seg(.data(b), .segments(segments));

endmodule
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module bin_display(
    input clk,
    input [3:0]data,

    output [3:0]anodes,
    output [6:0]segments
);

reg [1:0]i = 0;

assign anodes = (4'b1 << i);

always @(posedge clk) begin
    i <= i + 2'b1;
end

wire b = data[i];

bin_to_seg bin_to_seg(.data(b), .segments(segments));

endmodule
