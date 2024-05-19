// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`include "../lib/assertion.v"
`include "cpu.v"
`include "ports.v"
`include "psuedo_assembler.sv"
`timescale 1ns/1ns



`define SEMICOLON ;
`define COMMA ,

module test();
    bit doSim = 1; 

    import alu_ops::*;
    import ports::*;

   `include "../lib/display_snippet.sv"

    logic clk=0;
    bit _RESET_SWITCH = 0;
    cpu CPU(_RESET_SWITCH, clk);
    int TCLK=1000;

    ////////////////////////////////////////////////////////////////////////////////////////////////////
    // TESTS ===========================================================================================
    ////////////////////////////////////////////////////////////////////////////////////////////////////

    localparam MAX_PC=100;
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

    initial begin

        icount=0;
        //           pc ,       aluop,  targ,     adev,   bdev,   cond,   setflags,   condmode,   addrmode,   addr,   immed
        `INSTRUCTION(icount,    B,      portsel,  rega,   immed,  A,      `KEEP_FLAGS,`CM_STD,    `NA_AMODE,  'z,     PORT_RD_GAMEPAD1); 

        `INSTRUCTION(icount,    B,      marlo,    rega,   port,   A,      `KEEP_FLAGS,`CM_STD,    `NA_AMODE,  'z,     8'hz); 

        `JMP_IMMED16(icount,    0); 


        n_file1 = $fopen(rom1, "wb");
        n_file2 = $fopen(rom2, "wb");
        n_file3 = $fopen(rom3, "wb");
        n_file4 = $fopen(rom4, "wb");
        n_file5 = $fopen(rom5, "wb");
        n_file6 = $fopen(rom6, "wb");

        for (addr=0; addr < icount; addr++) begin
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
                //sleep(1000);
                #TCLK
                $display("");
                $display("%9t ", $time, " CLOCK GOING DOWN - EXEC ", CPU.disasmCur());
                $display("%9t ", $time, " MAR ", CPU.MARLO.Q);
                //DUMP();
                clk=0;
                #TCLK;
                $display("%9t ", $time, " CLOCK UP - PC INC");
                clk = 1; // high fetch phase - +ve clk reset _mr
            end
        end
        
    end

    int ctrl;
    initial begin
        ctrl = $fopen("gamepad.control", "wb");
        $fwrite(ctrl, "c1=10\n");
        $fwrite(ctrl, "#100000\n");
        $fwrite(ctrl, "c1=20\n");
        $fwrite(ctrl, "#1000\n");
        $fclose(ctrl);
        $display("closed gamepad.control");
        #200000
        $display("FINISHED");
        $finish();
    end


endmodule : test
