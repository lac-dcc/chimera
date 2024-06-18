// This program was cloned from: https://github.com/the-pinbo/RISC-SPM
// License: MIT License

`include "Clock_Unit.v"
`include "RISC_SPM.v"

module RISC_SPM_TB ();
    reg rst;
    wire clk;
    parameter word_size = 8;
    reg [8:0] k;

    Clock_Unit M1 (clk);
    RISC_SPM M2 (clk, rst);

    initial begin
        $dumpfile("test_RISC_SPM.vcd");
        $dumpvars(0, RISC_SPM_TB);
    end

    // define probes
    wire [word_size-1:0] word0, word1, word2, word3, word4, word5, word6;
    wire [word_size-1:0] word7, word8, word9, word10, word11, word12, word13;
    wire [word_size-1:0] word14;

    wire [word_size-1:0] word128, word129, word130, word131, word132, word255;
    wire [word_size-1:0] word133, word134, word135, word136, word137;
    wire [word_size-1:0] word138, word139, word140;
    assign word0 = M2.M2_SRAM.memory[0];
    assign word1 = M2.M2_SRAM.memory[1];
    assign word2 = M2.M2_SRAM.memory[2];
    assign word3 = M2.M2_SRAM.memory[3];
    assign word4 = M2.M2_SRAM.memory[4];
    assign word5 = M2.M2_SRAM.memory[5];
    assign word6 = M2.M2_SRAM.memory[6];
    assign word7 = M2.M2_SRAM.memory[7];
    assign word8 = M2.M2_SRAM.memory[8];
    assign word9 = M2.M2_SRAM.memory[9];
    assign word10 = M2.M2_SRAM.memory[10];
    assign word11 = M2.M2_SRAM.memory[11];
    assign word12 = M2.M2_SRAM.memory[12];
    assign word13 = M2.M2_SRAM.memory[13];
    assign word14 = M2.M2_SRAM.memory[14];

    assign word128 = M2.M2_SRAM.memory[128];
    assign word129 = M2.M2_SRAM.memory[129];
    assign word130 = M2.M2_SRAM.memory[130];
    assign word131 = M2.M2_SRAM.memory[131];
    assign word132 = M2.M2_SRAM.memory[132];
    assign word133 = M2.M2_SRAM.memory[133];
    assign word134 = M2.M2_SRAM.memory[134];
    assign word135 = M2.M2_SRAM.memory[135];
    assign word136 = M2.M2_SRAM.memory[136];
    assign word137 = M2.M2_SRAM.memory[137];
    assign word138 = M2.M2_SRAM.memory[138];
    assign word139 = M2.M2_SRAM.memory[139];
    assign word140 = M2.M2_SRAM.memory[140];


    assign word255 = M2.M2_SRAM.memory[255];

    initial #1000 $finish;

    // Initialize Memory
    initial begin
        #2 rst = 0; 
        for (k=0;k<=255;k=k+1)
            M2.M2_SRAM.memory[k] = 0; 
        #10 rst = 1;
    end

    initial begin
        // Load program
        #5
        // opcode_src_dest
        // NOP
        M2.M2_SRAM.memory[0] = 8'b0000_00_00;		
        // ldr R0 69
        M2.M2_SRAM.memory[1] = 8'b1010_00_00;		
        M2.M2_SRAM.memory[2] = 69; // 2
        // ldr R1 89
        M2.M2_SRAM.memory[3] = 8'b1010_00_01;		
        M2.M2_SRAM.memory[4] = 89; // 2
        // ldr R2 79
        M2.M2_SRAM.memory[5] = 8'b1010_00_10;		
        M2.M2_SRAM.memory[6] = 79; // 2
        // ldr R3 99
        M2.M2_SRAM.memory[7] = 8'b1010_00_11;		
        M2.M2_SRAM.memory[8] = 99; // 2

    end
endmodule
