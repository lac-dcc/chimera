// This program was cloned from: https://github.com/suyashmahar/RISC-processor
// License: MIT License

`timescale 1ns / 1ps

module PCAdder #(
    parameter ARCHITECTURE = 32,
    parameter INCREMENT = 32'h00000004
)(
    input wire [ARCHITECTURE-1:0] pc_in_i,
    output wire [ARCHITECTURE-1:0] inc_pc_o
);

    Rip32 f_Adder_instance_1(
        .a_i(pc_in_i), 
        .b_i(INCREMENT), 
        .cin(1'b0),

        .cout(),
        .sum_o(inc_pc_o)
    );

endmodule
