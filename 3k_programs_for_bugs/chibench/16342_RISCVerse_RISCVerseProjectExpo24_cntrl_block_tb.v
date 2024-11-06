// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License

`timescale 1ns / 1ps
`timescale 1ns / 1ps

module cntrl_block_tb;

// Parameters
parameter data_width = 32;

// Inputs
reg rst = 0;
reg [31:0] instr_reg_fetch;

// Outputs
wire [31:0] cntrl_sig_decode;

// Instantiate the module under test
cntrl_block uut (
    .rst(rst),
    .instr_reg_fetch(instr_reg_fetch),
    .cntrl_sig_decode(cntrl_sig_decode)
);

// Testbench logic
initial begin
    // Test case for R-type instruction
    instr_reg_fetch = 7'b0110011; // R-type opcode
    #10;

    // Test case for I-type instruction
    instr_reg_fetch = 7'b0010011; // I-type opcode
    #10;

    // Test case for B-type instruction
    instr_reg_fetch = 7'b1100011; // B-type opcode
    #10;

    // Test case for S-type instruction
    instr_reg_fetch = 7'b0100011; // S-type opcode
    #10;

    // Test case for L-type instruction
    instr_reg_fetch = 7'b0000011; // L-type opcode
    #10;

    // Wait for 100 clock cycles after testing all instruction types
    #100;

    // Finish simulation
    $finish;
end

// Display output
always @(posedge rst) begin
    $display("cntrl_sig_decode = %h", cntrl_sig_decode);
end

endmodule

