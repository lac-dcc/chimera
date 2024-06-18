// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License

`timescale 1ns / 1ps

module top_fetch1_tb;

	// Testbench signals
	reg clk;
	reg rst;
	reg pc_select_execute;
	reg [31:0] pc_target_execute;
	reg rd_wr;
	wire [31:0] pc_fetch;
	wire [31:0] next_pc_fetch;
	wire [31:0] instruction_fetch;

// Instantiate the TopFetchModule
top_fetch1 top_fetch1_inst(
	.clk(clk),
	.rst(rst),
	.pc_select_execute(pc_select_execute),
	.pc_target_execute(pc_target_execute),
	.rd_wr(rd_wr),
	.pc_fetch(pc_fetch),
	.next_pc_fetch(next_pc_fetch),
	.instruction_fetch(instruction_fetch)
	);

// Clock generation
initial begin
	clk = 0;
	forever #5 clk = ~clk;  
end

// Test sequence
initial begin
	$dumpfile("top_fetch1.vcd"); 
	$dumpvars(0, top_fetch1_tb);
    
	// Initialize signals
	rst = 0;
	pc_select_execute = 0;
	pc_target_execute = 32'h00000000;
	rd_wr = 1;  // Read operation
	    
	#10;  // Hold reset for 10ns
	rst = 1;
	
	// Initialize memory with some data (for simplicity, initializing only the first few addresses)
	top_fetch1_inst.memory_inst.instr_mem[0] = 8'hDE;
	top_fetch1_inst.memory_inst.instr_mem[1] = 8'hAD;
	top_fetch1_inst.memory_inst.instr_mem[2] = 8'hBE;
	top_fetch1_inst.memory_inst.instr_mem[3] = 8'hEF;
	
	top_fetch1_inst.memory_inst.instr_mem[4] = 8'hBA;
	top_fetch1_inst.memory_inst.instr_mem[5] = 8'hAD;
	top_fetch1_inst.memory_inst.instr_mem[6] = 8'hC0;
	top_fetch1_inst.memory_inst.instr_mem[7] = 8'hDE;
	
	// Wait for a few clock cycles to observe the behavior
	#40;
	    
	pc_select_execute = 1;
	pc_target_execute = 32'h00000004;  // Set target PC to 4
	#20;  // Wait for a few clock cycles
	    
	pc_select_execute = 0;
	#20;
	$finish;
end

endmodule

