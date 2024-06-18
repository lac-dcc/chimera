// This program was cloned from: https://github.com/the-pinbo/RISC-SPM
// License: MIT License

module Memory_Unit 
#(
    parameter word_size = 8, memory_size = 256
)(
    output [word_size-1: 0] data_out, 
    input [word_size-1: 0] data_in, address, 
    input clk, write
);
    reg [word_size-1: 0] memory [memory_size-1: 0];
    assign data_out = memory[address];
    always @ (posedge clk)
        if (write) memory[address] = data_in;
endmodule