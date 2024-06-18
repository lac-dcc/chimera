// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module encoder
#(parameter WIDTH = 2)
(
    input [(2**WIDTH)-1:0] x,
    output reg [WIDTH-1:0] y
);

always @*
    case (x)
        4'b0001: y = 2'b00;
        4'b0010: y = 2'b01;
        4'b0100: y = 2'b10;
        4'b1000: y = 2'b11;
        default: y = 2'bxx;
    endcase

endmodule;
