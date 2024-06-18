// This program was cloned from: https://github.com/skerr92/O2-Trainer
// License: MIT License

`default_nettype none

module alu(input wire clk, 
           input wire [1:0] op, 
           input wire [1:0] operA,
           input wire [1:0] operB,
           output reg [1:0] alu_out);

    always @(posedge clk) begin 
        case (op)
        0: alu_out <= operB + operA;
        1: alu_out <= operB - operA;
        2: alu_out <= operB & operA;
        3: alu_out <= ~operA;
        default: alu_out <= 2'b00;
        endcase
    end

endmodule