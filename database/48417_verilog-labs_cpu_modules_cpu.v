// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

module cpu(
    
    /* Input clocking signal */
    input wire clk
);

/* Current instruction address */
wire [31:0]instr_addr;

/* Current instruction */
wire [31:0]instr_data;

/* 
 * Read-only memory 
 * Reads and returns current instruction 'instruction_data'
 * from address 'instruction_addr'
 */
rom #(.ADDR_WIDTH(7), .DATA_WIDTH(32)) rom(
    .clk(clk), 
    .addr(instr_addr[6:0]), 
    .q(instr_data)
);

/* 
 * CPU's core 
 * Executes 'instr_data' instruction 
 * and returns next instruction address
 * in 'instr_addr'
 */
core core(
    .clk(clk),
    .instr_data(instr_data), .last_pc(2**7-1),
    .instr_addr(instr_addr)
);

endmodule
