// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module hex_display(
    input clk,
    input [15:0]data,

    output [3:0]anodes,
    output [6:0]segments
);

reg [11:0]cnt = 0;
reg [1:0]i = 0;

assign anodes = (4'b1 << i);

always @(posedge clk) begin
    cnt <= cnt + 12'b1;

    if (&cnt)
        i <= i + 2'b1;
end

wire [3:0]b = data[i * 4 +: 4];

hex_to_seg hex_to_seg(.data(b), .segments(segments));

endmodule

module hex_to_seg(
    input [3:0]data,

    output reg [6:0]segments
);

always @(*) begin
    case (data)
        4'h0: segments = 7'b1111110;
        4'h1: segments = 7'b0110000;
        4'h2: segments = 7'b1101101;
        4'h3: segments = 7'b1111001;
        4'h4: segments = 7'b0110011;
        4'h5: segments = 7'b1011011;
        4'h6: segments = 7'b1011111;
        4'h7: segments = 7'b1110000;
        4'h8: segments = 7'b1111111;
        4'h9: segments = 7'b1111011;
        4'hA: segments = 7'b1110111;
        4'hB: segments = 7'b0011111;
        4'hC: segments = 7'b1001110;
        4'hD: segments = 7'b0111101;
        4'hE: segments = 7'b1101111;
        4'hF: segments = 7'b1000111;
    endcase
end

endmodule
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module hex_display(
    input clk,
    input [15:0]data,

    output [3:0]anodes,
    output [6:0]segments
);

reg [11:0]cnt = 0;
reg [1:0]i = 0;

assign anodes = (4'b1 << i);

always @(posedge clk) begin
    cnt <= cnt + 12'b1;

    if (&cnt)
        i <= i + 2'b1;
end

wire [3:0]b = data[i * 4 +: 4];

hex_to_seg hex_to_seg(.data(b), .segments(segments));

endmodule

module hex_to_seg(
    input [3:0]data,

    output reg [6:0]segments
);

always @(*) begin
    case (data)
        4'h0: segments = 7'b1111110;
        4'h1: segments = 7'b0110000;
        4'h2: segments = 7'b1101101;
        4'h3: segments = 7'b1111001;
        4'h4: segments = 7'b0110011;
        4'h5: segments = 7'b1011011;
        4'h6: segments = 7'b1011111;
        4'h7: segments = 7'b1110000;
        4'h8: segments = 7'b1111111;
        4'h9: segments = 7'b1111011;
        4'hA: segments = 7'b1110111;
        4'hB: segments = 7'b0011111;
        4'hC: segments = 7'b1001110;
        4'hD: segments = 7'b0111101;
        4'hE: segments = 7'b1101111;
        4'hF: segments = 7'b1000111;
    endcase
end

endmodule
