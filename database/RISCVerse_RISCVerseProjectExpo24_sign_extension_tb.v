// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module sign_extension_tb;

    // Signals
    reg rst;
    reg [31:0] instr_reg_fetch;
    wire [31:0] imm_data_decode;

    // Instantiate the sign_extension module
    sign_extension1 dut (
        .rst(rst),
        .instr_reg_fetch(instr_reg_fetch),
        .imm_data_decode(imm_data_decode)
    );

    // Initial values
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, sign_extension_tb);

        // Reset
        rst = 1;
        instr_reg_fetch = 32'h0;
        #10 rst = 0;

        // Test different opcodes
        #20 instr_reg_fetch = 32'b0010011; // i_type
        #30 $display("Immediate Data for i_type: %h", imm_data_decode);

        #40 instr_reg_fetch = 32'b0100011; // s_type
        #50 $display("Immediate Data for s_type: %h", imm_data_decode);

        #60 instr_reg_fetch = 32'b1100011; // b_type
        #70 $display("Immediate Data for b_type: %h", imm_data_decode);

        #80 instr_reg_fetch = 32'b0000011; // l_type
        #90 $display("Immediate Data for l_type: %h", imm_data_decode);

        #100 $finish;
    end

endmodule
