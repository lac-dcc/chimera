// This program was cloned from: https://github.com/ahmd-kamel/Single-Cycle_MIPS
// License: The Unlicense

module TOP_MIPS 
#(
    parameter DATA_WIDTH = 32
) (
    input clk, reset_n,
    output [DATA_WIDTH - 1 : 0] test_value
);
    
    wire mem_write;
    wire [DATA_WIDTH - 1 : 0] alu_out;
    wire [DATA_WIDTH - 1 : 0] write_data;
    wire [DATA_WIDTH - 1 : 0] read_data;
    wire [DATA_WIDTH - 1 : 0] pc;
    wire [DATA_WIDTH - 1 : 0] instr;

    MIPS TOP_MIPS_CU(
        .clk(clk), 
        .reset_n(reset_n),
        .instr(instr),
        .read_data(read_data),
        .mem_write(mem_write),
        .pc(pc),
        .write_data(write_data),
        .alu_out(alu_out)
    );
    
    DATA_MEMORY TOP_MIPS_DATA_MEMORY(
        .clk(clk),
        .reset_n(reset_n),
        .write_enable(mem_write),
        .address(alu_out),
        .write_data(write_data),
        .read_data(read_data),
        .test_value(test_value)
    );
    
    INSTRUCTION_MEMORY  TOP_MIPS_INSTRUCTION_MEMORY(
        .pc_in(pc),
        .ins_out(instr)
    );
    
    
endmodule
