// This program was cloned from: https://github.com/navin9212/RISC-V
// License: Apache License 2.0

module imem_test;
    reg clk_tb;
    reg reset_tb;
    reg IorD_tb;
    reg MemWrite_tb;
    reg IRWrite_tb;
    reg [3:0] AluControl_tb;
    reg [31:0] pc_tb;
    reg [31:0] AluOut_tb;
    reg [31:0] rsB_tb;
    wire [31:0] addr_tb;
    wire [31:0] instruction_tb;
    wire [31:0] data_tb;

imem i0(
    .clk(clk_tb),
    .reset(reset_tb),
    .IorD_reg(IorD_tb),
    .MemWrite_reg(MemWrite_tb),
    .IRWrite_reg(IRWrite_tb),
    .AluControl_reg(AluControl_tb),
    .pc_reg(pc_tb),
    .AluOut_reg(AluOut_tb),
    .rsB_reg(rsB_tb),
    .addr_reg(addr_tb),
    .instruction_reg(instruction_tb),
    .data_reg(data_tb)
);

always #5 clk_tb = ~clk_tb;

//  Initial block to set initial values
initial begin
    clk_tb <= 0;
    reset_tb <= 1;
    IorD_tb = 0;
    MemWrite_tb = 0;
    IRWrite_tb = 0;
    AluControl_tb = 4'b0000;
    pc_tb = 32'h00000000;
    AluOut_tb = 32'h00000000;
    rsB_tb = 32'h00000000;
    
    // Initialize memory locations
    i0.memory[8'h0] = 32'h11223344;
    i0.memory[8'h4] = 32'h55667788;
    i0.memory[8'h8] = 32'h45628748;
    
    #8
    reset_tb <= 0;
    
    // Memory Write (MemWrite_tb = 1)
    IorD_tb = 1'b1;
    MemWrite_tb = 1'b1;
    IRWrite_tb = 1'b0;
    AluControl_tb = 4'b1010; // sw
    pc_tb = 32'h11000023;
    AluOut_tb = 32'h00000000;
    rsB_tb = 32'haabbccdd;
    #10
    
    // Instruction Extraction (IRWrite_tb = 1)
    IorD_tb = 1'b0;
    MemWrite_tb = 1'b1;
    IRWrite_tb = 1'b1;
    AluControl_tb = 4'bzzzz; // sw
    pc_tb = 32'h00000008;
    AluOut_tb = 32'h00000000;
    rsB_tb = 32'h00000000;
    #20
    $finish;
end
endmodule