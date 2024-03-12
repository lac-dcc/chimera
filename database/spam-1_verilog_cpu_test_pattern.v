// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`include "cpu.v"
`include "../lib/assertion.v"
`include "psuedo_assembler.sv"
`timescale 1ns/1ns



`define SEMICOLON ;
`define COMMA ,

module test();

    import alu_ops::*;

   `include "../lib/display_snippet.sv"

    logic clk=0;
    cpu CPU(1'b0, clk);

    ////////////////////////////////////////////////////////////////////////////////////////////////////
    // TESTS ===========================================================================================
    ////////////////////////////////////////////////////////////////////////////////////////////////////

    localparam MAX_PC=100;
    `DEFINE_CODE_VARS(MAX_PC)
    //string_bits CODE [MAX_PC];
    //string CODE_NUM [MAX_PC];
    //string TEMP_STRING;
    //string_bits CODE_TEXT [MAX_PC];



    logic [47:0] data =0;
    int addr;
    string rom1 = "roms/pattern1.rom";
    string rom2 = "roms/pattern2.rom";
    string rom3 = "roms/pattern3.rom";
    string rom4 = "roms/pattern4.rom";
    string rom5 = "roms/pattern5.rom";
    string rom6 = "roms/pattern6.rom";
    int n_file1;
    int n_file2;
    int n_file3;
    int n_file4;
    int n_file5;
    int n_file6;

    integer counter=0;
    integer pcAddress=0;

    initial begin

        pcAddress=0;

        for (pcAddress=0; pcAddress < 256; pcAddress++) begin
            // make b count in opposite direction so it's distinctive in test
            //             aluop      t           a          b            cond
            `INSTRUCTION_N(pcAddress, pcAddress,  pcAddress, 7-pcAddress, pcAddress,        0,         `SET_FLAGS,  `CM_STD, `DIRECT  ,   pcAddress, pcAddress ); 

            $display("CODE : %-s" , CODE_NUM[pcAddress]);
        end

        //             address,   target, devA,     devB, operation, condition, flagControl, addressMode, absoluteAddress, immedValue
//        `INSTRUCTION_S(pcAddress, marlo,  not_used, immed, A,        A,         `NA_FLAGS,   `REGISTER,   16'(pcAddress), 8'(pcAddress) ); pcAddress++;
//       `INSTRUCTION_S(pcAddress, marhi,  not_used, immed, B,        C,         `SET_FLAGS,  `DIRECT  ,   16'(pcAddress), 8'(pcAddress) ); pcAddress++;

        n_file1 = $fopen(rom1, "wb");
        n_file2 = $fopen(rom2, "wb");
        n_file3 = $fopen(rom3, "wb");
        n_file4 = $fopen(rom4, "wb");
        n_file5 = $fopen(rom5, "wb");
        n_file6 = $fopen(rom6, "wb");

        for (addr=0; addr < pcAddress; addr++) begin
            $display("CODE : %-s" , CODE_NUM[addr]);

            // little endian 
            data = `ROM(addr);
            #1000

            $fwrite(n_file1, "%c", data[7:0]);
            $fwrite(n_file2, "%c", data[15:8]);
            $fwrite(n_file3, "%c", data[23:16]);
            $fwrite(n_file4, "%c", data[31:24]);
            $fwrite(n_file5, "%c", data[39:32]);
            $fwrite(n_file6, "%c", data[47:40]);

            $display("written %d", addr, " = %8b %8b %8b %8b %8b %8b", 
                data[47:40],
                data[39:32],
                data[31:24],
                data[23:16],
                data[15:8],
                data[7:0],
                );
            end    
        $fclose(n_file1);
        $fclose(n_file2);
        $fclose(n_file3);
        $fclose(n_file4);
        $fclose(n_file5);
        $fclose(n_file6);

        $display("DONE");
        $finish();
    end

endmodule : test
