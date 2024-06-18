// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License

`timescale 1ns / 1ps

module Control_Block_Testbench;

// Parameters
reg clk;

// Inputs
reg rst;
reg [31:0] instr_reg_fetch;

// Outputs
wire [31:0] cntrl_sig_decode;


Contrl_Block uut (
    .rst(rst),
    .instr_reg_fetch(instr_reg_fetch),
    .cntrl_sig_decode(cntrl_sig_decode)
);

 initial begin
        clk = 1'b0; // Initialize clock to 0
    end

 // Clock generation
 always #5 clk = ~clk;


initial begin
  	$dumpfile("dump.vcd");
    $dumpvars(0, tb_cntrl_block);
    // Reset sequence
    rst = 0;
    #50;
    rst = 1;
    #50;
    
    // Test cases
    // r_type
    instr_reg_fetch = 7'b0110011;
    #50;

    // i_type
    instr_reg_fetch = 7'b0010011;
    #50;

    // b_type
    instr_reg_fetch = 7'b1100011;
    #50;

    // s_type
    instr_reg_fetch = 7'b0100011;
    #50;

    // l_type
    instr_reg_fetch = 7'b0000011;
    #50;


    instr_reg_fetch = 7'b0000000;
    #50;

    instr_reg_fetch = 7'b1111111;
    #50;
    
    // End simulation
    $finish;
end

endmodule
