// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

`default_nettype none

//  Top level io for this module should stay the same to fit into the scan_wrapper.
//  The pin connections within the user_module are up to you,
//  although (if one is present) it is recommended to place a clock on io_in[0].
//  This allows use of the internal clock divider if you wish.
module user_module_341431502448362067(
    input [7:0] io_in,
    output [7:0] io_out
);

alu_341431502448362067 alu(
    .op(io_in[7:4]),
    .a(io_in[3]),
    .b(io_in[2]),
    .rstn(io_in[1]),
    .clk(io_in[0]),
    .out(io_out[0])
);


endmodule

module alu_341431502448362067 #(parameter MSB = 8) (
    input [3:0] op,
    input a,
    input b,
    input clk,
    input en,
    input rstn,
    output reg out
);

localparam
    add  = 4'b0001,
    neg  = 4'b0000,
    bor  = 4'b1001,
    bneg = 4'b1000,
    band = 4'b1010,
    bxor = 4'b1100;

reg carry;

always @ (posedge clk) begin
    if (!rstn) begin
        out <= 0;
        carry <= 0;
    end else
        case(op)
        add:
            if (carry) begin
                out <= a == b;
                carry <= a | b;
            end else begin
                out <= a ^ b;
                carry <= a & b;
            end
        neg:
            begin
                out <= ~a == carry;
                carry <= ~a | carry;
            end
        bor:
            out <= a | b;
        bneg:
            out <= ~a;
        band:
            out <= a & b;
        bxor:
            out <= a ^ b;

        endcase
end

endmodule
