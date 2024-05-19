// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`include "cpu.v"
`include "../lib/assertion.v"
`include "../lib/util.v"
`include "psuedo_assembler.sv"
`include "control_lines.v"
`timescale 1ns/1ns



`define SEMICOLON ;
`define COMMA ,

module test();
    bit doSim = 1; 

    import alu_ops::*;
    import control::*;
    import util::*;

   `include "../lib/display_snippet.sv"

    logic clk=0;
    bit _RESET_SWITCH = 0;
    cpu CPU(_RESET_SWITCH, clk);

    ////////////////////////////////////////////////////////////////////////////////////////////////////
    // TESTS ===========================================================================================
    ////////////////////////////////////////////////////////////////////////////////////////////////////

    localparam MAX_PC=65536;
    `DEFINE_CODE_VARS(MAX_PC)


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

    integer icount=0;

    
    wire [7:0] cH = "H";
    wire [7:0] cE = "e";
    wire [7:0] cL = "l";
    wire [7:0] cO = "o";

    string NL=8'h0A;

    string hello = {"Hello!", NL};
    string bye = {"Bye!", NL};
    int idx;
    int loop_addr;
    int write_addr;

    int start;
    int write_loop;


    int TCLK=1000;
    int wait_input, wait_output;

    initial begin

        icount=0;

        start=icount;
        `DEV_EQ_IMMED8(icount, rega, 0); 
        `DEV_EQ_IMMED8(icount, regb, 0); 

        // wait for input
        wait_input = icount;
        `INSTRUCTION(icount, B, pchitmp, not_used, immed, A,  `SET_FLAGS, `CM_STD, `NA_AMODE, 'z, (wait_input>>8)); 
        `INSTRUCTION(icount, B, pc,      not_used, immed, DI, `SET_FLAGS, `CM_INV, `NA_AMODE, 'z, (wait_input)); 

        // read
        `INSTRUCTION(icount, A, rega,    uart,     not_used, DI,  `SET_FLAGS, `CM_STD, `NA_AMODE, 'z, 'z); 

        // wait for output ready
        wait_output = icount;
        `INSTRUCTION(icount, B, pchitmp, not_used, immed,    A,  `SET_FLAGS, `CM_STD, `NA_AMODE, 'z, (wait_output>>8)); 
        `INSTRUCTION(icount, B, pc,      not_used, immed,    DO, `SET_FLAGS, `CM_INV, `NA_AMODE, 'z, (wait_output)); 

        // write
        `INSTRUCTION(icount, A, uart,    rega,     not_used, A,  `SET_FLAGS, `CM_STD, `NA_AMODE, 'z, 'z);
        `JMP_IMMED16(icount, wait_input); 


        if (doSim) begin
            //`DISPLAY("init : _RESET_SWITCH=0")
            _RESET_SWITCH = 0;
            clk=0;
            #1000
            $display("RELEASE");
            _RESET_SWITCH = 1;
            clk = 1; // high fetch phase - +ve clk reset _mr
            #TCLK;

            while (1==1) begin
                sleep(1000);
                #TCLK
                $display("");
                $display("%9t ", $time, " CLOCK DOWN - EXEC ", CPU.disasmCur());
                clk=0;
                #TCLK;
                $display("CLOCK UP - PC INC");
                clk = 1; // high fetch phase - +ve clk reset _mr
                $display("%9t RT", $realtime);
            end
        end


        //`JMP_IMMED16(icount, 0); icount+=2; 
        n_file1 = $fopen(rom1, "wb");
        n_file2 = $fopen(rom2, "wb");
        n_file3 = $fopen(rom3, "wb");
        n_file4 = $fopen(rom4, "wb");
        n_file5 = $fopen(rom5, "wb");
        n_file6 = $fopen(rom6, "wb");

        for (addr=0; addr < icount; addr++) begin
            //$display("CODE : %-s" , CODE_NUM[addr]);

            // little endian 
            data = `ROM(addr);

            #1000

            $fwrite(n_file1, "%c", data[7:0]);
            $fwrite(n_file2, "%c", data[15:8]);
            $fwrite(n_file3, "%c", data[23:16]);
            $fwrite(n_file4, "%c", data[31:24]);
            $fwrite(n_file5, "%c", data[39:32]);
            $fwrite(n_file6, "%c", data[47:40]);

            $display("written %d", addr, " = %8b %8b %8b %8b %8b %8b(%c)", 
                data[47:40],
                data[39:32],
                data[31:24],
                data[23:16],
                data[15:8],
                data[7:0],
                printable(data[7:0]),
                );
            $display("CODE : %-s" , CPU.disasm(data), "(%c)(%d)",
                printable(data[7:0]),
                data[7:0]
             );
            $display("");
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

    function [7:0] printable([7:0] c);
        if (c == 0) return 32;
        else if ($isunknown(c)) return 32; 
        else if (c < 32 ) return 32; 
        else if (c >= 128) return 32;
        return c;
    endfunction

endmodule : test
