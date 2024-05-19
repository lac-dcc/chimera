// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`include "cpu.v"
`include "../lib/assertion.v"
`include "psuedo_assembler.sv"
`timescale 1ns/1ns



`define SEMICOLON ;
`define COMMA ,

module test();
    bit doSim = 1; 

    import alu_ops::*;

   `include "../lib/display_snippet.sv"

    logic clk=0;
    bit _RESET_SWITCH = 0;
    cpu CPU(_RESET_SWITCH, clk);
    int TCLK=1000;

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
    integer targ=0;
    integer adev=0;
    integer bdev=0;
    integer aluop=0;
    integer immed=0;

    initial begin

        icount=0;

        `DEV_EQ_IMMED8(icount, rega, 0); 
        `DEV_EQ_IMMED8(icount, regb, 0); 
        `DEV_EQ_IMMED8(icount, regc, 0); 
        `DEV_EQ_IMMED8(icount, regd, 0); 
        `DEV_EQ_IMMED8(icount, pchitmp, 0); 
        `DEV_EQ_IMMED8(icount, marhi, 0); 
        `DEV_EQ_IMMED8(icount, marlo, 0); 


        while( icount < 65536 ) begin
            targ=icount%16;
            adev=icount%8;
            bdev=icount%8;
            //immed=((icount+10)%256); // make the immed > curent pc to reduce the risk of a PC loop occuring where it jumps to curent instruction 
            immed=$random;

            if (targ == control::TDEV_halt) begin
                // skip halt so I can eumerate all devices
                targ=0;
            end
            if (targ == control::TDEV_pclo) begin
                // skip pclo as this seems to get stuck in page 0
                targ=control::TDEV_pchitmp;
            end
            if (adev == control::ADEV_not_used) begin
                // skip undefined adev
                adev=0;
            end
            if (bdev == control::BDEV_ram & targ == control::TDEV_ram) begin
                // skip cos cant read and write ram at same time
                bdev=0;
            end
            
            
            aluop = OP_A_PLUS_B;
            `INSTRUCTION_N(icount, aluop, (targ), (adev), (bdev), 0, `SET_FLAGS, `CM_STD, `REGISTER, icount, (immed)) ;
            icount++;
        end

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
                //DUMP();
                clk=0;
                #TCLK;
                $display("%9t ", $time, " CLOCK UP - PC INC");
                clk = 1; // high fetch phase - +ve clk reset _mr
            end
        end




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
        $finish();
    end

    task DUMP;
         //   DUMP_OP;
            `define DD $display ("%9t ", $time,  "     DUMP  ", 

            `DD " phase_exec=%1b", CPU.phase_exec);
            `DD " PC=%1d (0x%4h) PCHItmp=%d (%2x)", CPU.pc_addr, CPU.pc_addr, CPU.PC.PCHITMP, CPU.PC.PCHITMP);
            `DD " instruction=%08b:%08b:%08b:%08b:%08b:%08b", CPU.ctrl.instruction_6, CPU.ctrl.instruction_5, CPU.ctrl.instruction_4, CPU.ctrl.instruction_3, CPU.ctrl.instruction_2, CPU.ctrl.instruction_1);
            `DD " amode=%1s", control::fAddrMode(CPU._addrmode_register), " addbbus=0x%4x", CPU.address_bus);
            `DD " rom=%08b:%08b:%08b:%08b:%08b:%08b",  CPU.ctrl.rom_6.D, CPU.ctrl.rom_5.D, CPU.ctrl.rom_4.D, CPU.ctrl.rom_3.D, CPU.ctrl.rom_2.D, CPU.ctrl.rom_1.D);
            `DD " immed8=%08b", CPU.ctrl.immed8);
            `DD " ram=%08b", CPU.ram64.D);
            `DD " tdev=%5b(%s)", CPU.targ_dev, control::tdevname(CPU.targ_dev),
                " adev=%4b(%s)", CPU.abus_dev, control::adevname(CPU.abus_dev),
                " bdev=%4b(%s)", CPU.bbus_dev,control::bdevname(CPU.bbus_dev),
                " alu_op=%5b(%s)", CPU.alu_op, aluopName(CPU.alu_op)
            );            
            `DD " abus=%8b bbus=%8b alu_result_bus=%8b", CPU.abus, CPU.bbus, CPU.alu_result_bus);
            `DD " ALUFLAGS czonGLEN=%8b ", CPU.alu_flags_czonGLEN );
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
