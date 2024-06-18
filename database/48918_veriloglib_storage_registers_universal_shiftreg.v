// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module universal_shiftreg
#(parameter WIDTH = 8)
(
    input clk,
    input rst_n,
    input [2:0] operation,
    input shift_in,
    input [WIDTH-1:0] parallel_din,
    output reg [WIDTH-1:0] dout
);

    always @(posedge clk)
    begin
        if(!rst_n)
            dout <= 0;
        else
            begin
                case(operation)
                    3'b000: dout <= 0;                                          // reset register
                    3'b001: dout <= {dout[WIDTH-2:0], shift_in};                // shift left logical
                    3'b010: dout <= {shift_in, dout[WIDTH-1:1]};                // shift right logical
                    3'b011: dout <= parallel_din;                               // parallel load
                    3'b100: dout <= {dout[WIDTH-2:0], dout[WIDTH-1]};           // rotate left
                    3'b101: dout <= {dout[0], dout[WIDTH-1:1]};                 // rotate right
                    3'b110: dout <= {dout[WIDTH-1], dout[WIDTH-3:0], shift_in}; // shift left numerical
                    3'b111: dout <= {dout[WIDTH-1], shift_in, dout[WIDTH-2:1]}; // shift right numerical
                    default: dout <= dout;                                      // maintain value
                endcase
            end
    end

endmodule
