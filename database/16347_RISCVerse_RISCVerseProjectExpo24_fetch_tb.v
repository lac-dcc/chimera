// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License

`timescale 1ns / 1ps

module fetch_tb;

// Parameters
parameter data_width = 32;

// Inputs
reg clk = 0;
reg rst = 0;

// Outputs
wire [data_width-1:0] instr_reg_fetch;
wire [data_width-1:0] pc_fetch;
wire [data_width-1:0] npc_fetch;

// Instantiate the module under test
fetch #(data_width) uut (
    .clk(clk),
    .rst(rst),
    .instr_reg_fetch(instr_reg_fetch),
    .pc_fetch(pc_fetch),
    .npc_fetch(npc_fetch)
);

// Clock generation
always #5 clk = ~clk;

// Reset generation
initial begin
    rst = 1;
    #10;
    rst = 0;
end

// Stimulus
initial begin
    // Wait for 100 clock cycles
    #100;

    // Finish simulation
    $finish;
end

// Display outputs
always @(posedge clk) begin
    $display("instr_reg_fetch = %h, pc_fetch = %h, npc_fetch = %h", instr_reg_fetch, pc_fetch, npc_fetch);
end

endmodule

