// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License

`timescale 1ns / 1ps
`timescale 1ns / 1ps

module reg_bank_tb;

// Parameters
parameter data_width = 32;

// Inputs
reg clk = 0;
reg rst = 0;
reg [31:0] instr_reg_fetch;
reg [31:0] alu_control_decode;

// Outputs
wire [31:0] operand_a;
wire [31:0] operand_b;

// Instantiate the module under test
reg_bank uut (
    .clk(clk),
    .rst(rst),
    .instr_reg_fetch(instr_reg_fetch),
    .alu_control_decode(alu_control_decode),
    .operand_a(operand_a),
    .operand_b(operand_b)
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
    // Provide some stimulus here
    // Example: Set values for instr_reg_fetch, alu_control_decode
    instr_reg_fetch = 32'h12345678;
    alu_control_decode = 4'b10; // Assuming alu_control_decode[1] is set to 1 for testing

    // Wait for 100 clock cycles
    #100;

    // Finish simulation
    $finish;
end

// Display outputs
always @(posedge clk) begin
    $display("operand_a = %h, operand_b = %h", operand_a, operand_b);
end

endmodule

