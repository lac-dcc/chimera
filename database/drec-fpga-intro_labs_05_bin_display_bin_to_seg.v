// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module bin_to_seg(
    input data,

    output reg [6:0]segments
);

always @(*) begin
    case (data)
        1'b0: segments = 7'b1111110;
        1'b1: segments = 7'b0110000;
    endcase
end

endmodule
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module bin_to_seg(
    input data,

    output reg [6:0]segments
);

always @(*) begin
    case (data)
        1'b0: segments = 7'b1111110;
        1'b1: segments = 7'b0110000;
    endcase
end

endmodule
