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
    int cycle=0;


    integer populate_label;
    integer verify_label;
    integer verify_label_begin;
    integer verify_label_end;
    integer error_label = 32;
    initial begin

         icount = 0;

         `INSTRUCTION(icount, B, marlo, not_used, immed, A, `NA_FLAGS, `CM_STD, `NA_AMODE, 'z, 0); // 0
         `INSTRUCTION(icount, B, marhi, not_used, immed, A, `NA_FLAGS, `CM_STD, `NA_AMODE, 'z, 0); // 1

         populate_label = icount;
         `INSTRUCTION(icount, B,               ram ,  not_used,  marlo, A, `NA_FLAGS,  `CM_STD, `NA_AMODE, 'z, 'z); // 2
         `INSTRUCTION(icount, B_PLUS_1,        marlo, not_used,  marlo, A, `SET_FLAGS, `CM_STD, `NA_AMODE, 'z, 'z); // 3
         `INSTRUCTION(icount, A_PLUS_B_PLUS_C, marhi, marhi,     immed, A, `SET_FLAGS, `CM_STD, `NA_AMODE, 'z, 0); // 4

         `INSTRUCTION(icount, B,      pchitmp, not_used,  immed, C, `NA_FLAGS, `CM_INV, `NA_AMODE, 1'bz, populate_label >> 8); // 5
         `INSTRUCTION(icount, B,      pc,      not_used,  immed, C, `NA_FLAGS, `CM_INV, `NA_AMODE, 1'bz, populate_label); // 6


         verify_label_begin = icount;
         `INSTRUCTION(icount, B, marlo, not_used, immed, A, `NA_FLAGS, `CM_STD, `NA_AMODE, 'z, 0); // 7
         `INSTRUCTION(icount, B, marhi, not_used, immed, A, `NA_FLAGS, `CM_STD, `NA_AMODE, 'z, 0); // 8

         verify_label = icount;
        // compare data at ram location N to value B
         `INSTRUCTION(icount, B, rega,       not_used, ram,   A,  `NA_FLAGS, `CM_STD, `NA_AMODE, 'z, 'z); // 9      A=RAM
         `INSTRUCTION(icount, B, not_used11, rega,     marlo, A,  `SET_FLAGS,`CM_STD, `NA_AMODE, 'z, 'z); // 10     COMPARE MARLO to A
         `INSTRUCTION(icount, B, pchitmp,    not_used, immed, NE, `NA_FLAGS, `CM_STD, `NA_AMODE, 'z, error_label >> 8); // 11
         `INSTRUCTION(icount, B, pc,         not_used, immed, NE, `NA_FLAGS, `CM_STD, `NA_AMODE, 'z, error_label); // 12

         verify_label_end = icount;
         `INSTRUCTION(icount, B_PLUS_1,        marlo, not_used,  marlo, A, `SET_FLAGS, `CM_STD, `NA_AMODE, 'z, 'z); // 13
         `INSTRUCTION(icount, A_PLUS_B_PLUS_C, marhi, marhi,     immed, A, `SET_FLAGS, `CM_STD, `NA_AMODE, 'z, 0); // 14

         `INSTRUCTION(icount, B, pchitmp, not_used,  immed, C, `NA_FLAGS, `CM_INV, `NA_AMODE, 'z, verify_label >> 8); // 15
         `INSTRUCTION(icount, B, pc,      not_used,  immed, C, `NA_FLAGS, `CM_INV, `NA_AMODE, 'z, verify_label); // 16

        // got to end of data successully - break 
         `INSTRUCTION(icount, B, halt,    not_used, immed,   A, `NA_FLAGS, `CM_STD, `NA_AMODE, 'z, 0); // 17      OK
        // just run verify again
         `INSTRUCTION(icount, B, pchitmp, not_used, immed,   A, `NA_FLAGS, `CM_STD, `NA_AMODE, 'z, verify_label_begin >> 8); // 18
         `INSTRUCTION(icount, B, pc,      not_used, immed,   A, `NA_FLAGS, `CM_STD, `NA_AMODE, 'z, verify_label_begin); // 19

         icount = error_label;

         `INSTRUCTION(icount, B, halt,    rega,     ram,   A, `NA_FLAGS, `CM_STD, `NA_AMODE, 'z, 1); // 32      HALT IF NOT EQ
         `INSTRUCTION(icount, B, pchitmp, not_used, immed, A, `NA_FLAGS, `CM_STD, `NA_AMODE, 'z, verify_label_end >> 8); // 33
         `INSTRUCTION(icount, B, pc,      not_used, immed, A, `NA_FLAGS, `CM_STD, `NA_AMODE, 'z, verify_label_end); // 34

         `INSTRUCTION(icount, B, halt,    rega,     ram,   A, `NA_FLAGS, `CM_STD, `NA_AMODE, 'z, 2); // ERROR IF COMES HERE



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

                                                                    // upper bit of T not connected in HW yet
            $display("        %d", addr, " = aaaaattt taaabbbC CCCFIbtM AAAAAAAA AAAAAAAA IIIIIIII");
            $display("written %d", addr, " = %8b %8b %8b %8b %8b %8b(data:%c)", 
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
                cycle ++;
                #TCLK
                $display("");
                $display("%9t ", $time, " CYCLE %-1d ", cycle,  " CLOCK DOWN - EXEC ", CPU.disasmCur());
                DUMP;
                clk=0;
                #TCLK;
                $display("CLOCK UP - PC INC");
                clk = 1; // high fetch phase - +ve clk reset _mr
                $display("%9t RT", $realtime);
            end
        end

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

    task DUMP;
         //   DUMP_OP;
            `define DD $display ("%9t ", $time,  "DUMP  ", 

            `DD " phase_exec=%1d", CPU.phase_exec);
            `DD " PC=%1d (0x%4h) PCHItmp=%d (%2x)", CPU.pc_addr, CPU.pc_addr, CPU.PC.PCHITMP, CPU.PC.PCHITMP);
            `DD " instruction=%08b:%08b:%08b:%08b:%08b:%08b", CPU.ctrl.instruction_6, CPU.ctrl.instruction_5, CPU.ctrl.instruction_4, CPU.ctrl.instruction_3, CPU.ctrl.instruction_2, CPU.ctrl.instruction_1);
            `DD " addrmode=%1s", control::fAddrMode(CPU._addrmode_register),
                " addbbus=0x%4x", CPU.address_bus);
            `DD " rom=%08b:%08b:%08b:%08b:%08b:%08b",  CPU.ctrl.rom_6.D, CPU.ctrl.rom_5.D, CPU.ctrl.rom_4.D, CPU.ctrl.rom_3.D, CPU.ctrl.rom_2.D, CPU.ctrl.rom_1.D);
            `DD " immed8=%08b", CPU.ctrl.immed8);
            `DD " ram=%08b", CPU.ram64.D);
            `DD " tdev=%5b(%s)", CPU.targ_dev, control::tdevname(CPU.targ_dev),
                " adev=%4b(%s)", CPU.abus_dev, control::adevname(CPU.abus_dev),
                " bdev=%4b(%s)", CPU.bbus_dev,control::bdevname(CPU.bbus_dev),
                " alu_op=%5b(%s)", CPU.alu_op, aluopName(CPU.alu_op)
            );            
            `DD " abus=%8b bbus=%8b alu_result_bus=%8b", CPU.abus, CPU.bbus, CPU.alu_result_bus);
            `DD " ALUFLAGS czonGLEN=%8b ", CPU.alu_flags_czonGLEN);
            `DD " FLAGSREG czonGLEN=%8b gated_flags_clk=%1b", CPU.status_register_czonGLEN.Q, CPU.gated_flags_clk);
            `DD " FLAGS _flag_do=%b _flag_di=%b", CPU._flag_do, CPU._flag_di);
            `DD " condition=%02d(%1s) _do_exec=%b _set_flags=%b", CPU.ctrl.condition, control::condname(CPU.ctrl.condition), CPU.ctrl._do_exec, CPU._set_flags);
            `DD " MAR=%8b:%8b (0x%2x:%2x)", CPU.MARHI.Q, CPU.MARLO.Q, CPU.MARHI.Q, CPU.MARLO.Q);
            `DD "  REGA:%08b", CPU.regFile.get(0),
                 "  REGB:%08b", CPU.regFile.get(1),
                 "  REGC:%08b", CPU.regFile.get(2),
                 "  REGD:%08b", CPU.regFile.get(3)
                 );

            `define LOG_ADEV_SEL(DNAME) " _adev_``DNAME``=%1b", CPU._adev_``DNAME``
            `define LOG_BDEV_SEL(DNAME) " _bdev_``DNAME``=%1b", CPU._bdev_``DNAME``
            `define LOG_TDEV_SEL(DNAME) " _``DNAME``_in=%1b",  CPU._``DNAME``_in
            $display("%9t", $time, " DUMP   WIRES ", `CONTROL_WIRES(LOG, `COMMA));
    endtask 


endmodule : test
