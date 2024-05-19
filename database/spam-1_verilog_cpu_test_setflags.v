// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan


//// RUN  and grep for OK to see counter incrementing
/*

Unit number Time unit Unit number Time unit 
    0        1 s        -8         10 ns 
   -1        100 ms     -9         1 ns 
   -2        10 ms      -10        100 ps 
   -3        1 ms       -11        10 ps 
   -4        100 us     -12        1 ps 
   -5        10 us      -13        100 fs 
   -6        1 us       -14        10 fs 
   -7        100 ns     -15        1 fs 
*/

`include "cpu.v"
`include "../lib/assertion.v"
`include "psuedo_assembler.sv"
// verilator lint_off ASSIGNDLY
// verilator lint_off STMTDLY

//`timescale 1ns/1ns
`timescale 1ns/1ns



`define SEMICOLON ;
`define COMMA ,

module test();

    import alu_ops::*;

   `include "../lib/display_snippet.sv"

    localparam SETTLE_TOLERANCE=50; // perhaps not needed now with new control logic impl

    // CLOCK ===================================================================================
    localparam TCLK=390;   // clock cycle

    // "Do not use an asynchronous reset within your design." - https://zipcpu.com/blog/2017/08/21/rules-for-newbies.html
    logic _RESET_SWITCH;

    logic clk=0;

/*
    always begin
       #TCLK clk = !clk;
    end
*/

    cpu CPU(_RESET_SWITCH, clk);


    ////////////////////////////////////////////////////////////////////////////////////////////////////
    // TESTS ===========================================================================================
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    `define RAM(A) CPU.ram64.Mem[A]
    `define DATA(D) {40'bz, D} /* padded to rom width with z */

    localparam MAX_PC=100;
    `DEFINE_CODE_VARS(MAX_PC)
    //string_bits CODE [MAX_PC];

    integer ADD_ONE;
    `define WRITE_UART 60
    `define READ_UART 80
    integer WAIT_UART_OUT;

    // SETUP ROM
    integer icount;
    task INIT_ROM;
    begin

         icount = 0;
        // A = 0, carry set
        `INSTRUCTION(icount, B_PLUS_1, rega, not_used, immed, A, `SET_FLAGS, `CM_STD, `NA_AMODE, 1'bz, 255);
        // B = 1, carry persisted
        `INSTRUCTION(icount, B_PLUS_1, regb, not_used, immed, C, `NA_FLAGS, `CM_STD, `NA_AMODE, 1'bz, 1);
        // B = 2, carry persisted
        `INSTRUCTION(icount, B_PLUS_1, regb, not_used, regb,  C, `NA_FLAGS, `CM_STD, `NA_AMODE, 1'bz, 1);
        // B = 3, carry persisted
        `INSTRUCTION(icount, B_PLUS_1, regb, not_used, regb,  C, `NA_FLAGS, `CM_STD, `NA_AMODE, 1'bz, 1);
        // C = 2, carry cleared
        `INSTRUCTION(icount, B_PLUS_1, regc, not_used, immed, C, `SET_FLAGS, `CM_STD, `NA_AMODE, 1'bz, 2);

        // carry is clear at the moment 
        // carry flag should not be set by these two instructions because second instruction doesn't execute
        `INSTRUCTION(icount, B,        rega, not_used, immed, A, `SET_FLAGS, `CM_STD, `NA_AMODE, 1'bz, 255);
        `INSTRUCTION(icount, B_PLUS_1, regb, not_used, immed, C, `SET_FLAGS, `CM_STD, `NA_AMODE, 1'bz, 255); // should NOT update carry bit !!

        `HALT(icount, 255); 
            
    end
    endtask : INIT_ROM

    initial begin
        //$timeformat(-3, 0, "ms", 10);

        INIT_ROM();

        //`DISPLAY("init : _RESET_SWITCH=0")
        _RESET_SWITCH = 0;
        clk=0;
        #1000
       `Equals(CPU._mrPC,'0);
       `Equals(CPU.pc_addr, 'x); 
       
        _RESET_SWITCH = 1;
       clk = 1; // high fetch phase - +ve clk reset _mr
       #TCLK;
       `Equals(CPU._mrPC,'0);
       `Equals(CPU.pc_addr, 0); 
       `Equals(CPU.status_register_czonENGL.Q[7],'x);

       clk = 0; // low = execute phase
       #TCLK
       `Equals(CPU._mrPC,1);
       `Equals(CPU.pc_addr, 0); 
       `Equals(CPU.status_register_czonENGL.Q, 8'b00111010); // 255 rolled over to 0
       `Equals(CPU.regFile.get(0), 8'd00); // default vals of reg
       `Equals(CPU.regFile.get(1), 8'h11); // default vals of reg
       `Equals(CPU.regFile.get(2), 8'h22); // default vals of reg
       `Equals(CPU.regFile.get(3), 8'h33); // default vals of reg


       clk = 1; // +ve updates PC
       #TCLK
       `Equals(CPU.pc_addr, 1); 

       clk = 0;
       #TCLK
       `Equals(CPU.pc_addr, 1); 
       `Equals(CPU.status_register_czonENGL.Q, 8'b00111010); // Flags not overwritten
       `Equals(CPU.regFile.get(0), 8'd00); // default vals of reg
       `Equals(CPU.regFile.get(1), 8'h02); 
       `Equals(CPU.regFile.get(2), 8'h22); // default vals of reg
       `Equals(CPU.regFile.get(3), 8'h33); // default vals of reg

       clk = 1;
       #TCLK
       `Equals(CPU.pc_addr, 2); 

       clk = 0;
       #TCLK
       `Equals(CPU.pc_addr, 2); 
       `Equals(CPU.status_register_czonENGL.Q, 8'b00111010); // Flags not overwritten
       `Equals(CPU.regFile.get(0), 8'd00); // default vals of reg
       `Equals(CPU.regFile.get(1), 8'h03); 
       `Equals(CPU.regFile.get(2), 8'h22); // default vals of reg
       `Equals(CPU.regFile.get(3), 8'h33); // default vals of reg

       clk = 1;
       #TCLK
       `Equals(CPU.pc_addr, 3); 

       clk = 0;
       #TCLK
       `Equals(CPU.status_register_czonENGL.Q, 8'b00111010); // Flags not overwritten
       `Equals(CPU.regFile.get(0), 8'd00); // default vals of reg
       `Equals(CPU.regFile.get(1), 8'h04); 
       `Equals(CPU.regFile.get(2), 8'h22); // default vals of reg
       `Equals(CPU.regFile.get(3), 8'h33); // default vals of reg

       clk = 1;
       #TCLK
       `Equals(CPU.pc_addr, 4); 

       clk = 0;
       #TCLK
       `Equals(CPU.status_register_czonENGL.Q, 8'b11111010); // Flags ARE overwritten
       `Equals(CPU.regFile.get(0), 8'd00); // default vals of reg
       `Equals(CPU.regFile.get(1), 8'h04); 
       `Equals(CPU.regFile.get(2), 8'h03); // default vals of reg
       `Equals(CPU.regFile.get(3), 8'h33); // default vals of reg

        // pair of ops - second op shouldn't update the flags !!
       clk = 1;
       #TCLK
       `Equals(CPU.pc_addr, 5); 

       clk = 0;
       #TCLK
       `Equals(CPU.status_register_czonENGL.Q, 8'b11101010); // Flags ARE overwritten
       `Equals(CPU.regFile.get(0), 8'd255); // default vals of reg
       `Equals(CPU.regFile.get(1), 8'h04); 
       `Equals(CPU.regFile.get(2), 8'h03); // default vals of reg
       `Equals(CPU.regFile.get(3), 8'h33); // default vals of reg

       clk = 1;
       #TCLK
       `Equals(CPU.pc_addr, 6); 

       clk = 0;
       #TCLK
       `Equals(CPU.status_register_czonENGL.Q, 8'b11101010); // Flags ARE overwritten
       `Equals(CPU.regFile.get(0), 8'd255); // default vals of reg
       `Equals(CPU.regFile.get(1), 8'h04); 
       `Equals(CPU.regFile.get(2), 8'h03); // default vals of reg
       `Equals(CPU.regFile.get(3), 8'h33); // default vals of reg

        // halt
       clk = 1;
       #TCLK
       clk = 0;
       #TCLK


        $error("SHOULD HAVE HALTED");
       `FINISH_AND_RETURN(1);

    end

   // $timeformat [(unit_number, precision, suffix, min_width )] ;
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
            `DD " ALUFLAGS czonENGL=%8b ", CPU.alu_flags_czonENGL);
            `DD " FLAGSREG czonENGL=%8b gated_flags_clk=%1b", CPU.status_register_czonENGL.Q, CPU.gated_flags_clk);
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

    always @* begin
        if (_RESET_SWITCH)  
            $display("\n%9t RESET SWITCH RELEASE   _RESET_SWITCH=%1b  ======================================================================\n", $time, _RESET_SWITCH); 
        else      
            $display("\n%9t RESET SWITCH SET       _RESET_SWITCH=%1b  ======================================================================\n", $time, _RESET_SWITCH); 
    end

    always @* begin
        if (CPU._mrPC)  
            $display("\n%9t PC RESET RELEASE   _mrPC=%1b  ======================================================================\n", $time, CPU._mrPC); 
        else      
            $display("\n%9t PC RESET SET       _mrPC=%1b  ======================================================================\n", $time, CPU._mrPC); 
    end

    integer pcval;
    assign pcval={CPU.PCHI, CPU.PCLO};

    string_bits currentCode; // create field so it can appear in dump file

    always @( posedge CPU.phase_exec ) begin
       $display ("%9t ", $time,  "PHASE_EXEC +ve");
       `DD " ALUFLAGS czonENGL=%8b ", CPU.alu_flags_czonENGL);
       `DD " FLAGSREG czonENGL=%8b gated_flags_clk=%1b", CPU.status_register_czonENGL.Q, CPU.gated_flags_clk);
       `DD " FLAGS _flag_do=%b _flag_di=%b", CPU._flag_do, CPU._flag_di);
       `DD " condition=%02d(%1s) _do_exec=%b _set_flags=%b", CPU.ctrl.condition, control::condname(CPU.ctrl.condition), CPU.ctrl._do_exec, CPU._set_flags);
        //CPU.ctrl.dump;
       $display ("%9t ", $time,  "EXECUTE....");
    end
    always @( negedge CPU.phase_exec ) begin
       $display ("%9t ", $time,  "PHASE_EXEC -ve");
       DUMP();
    end

    int clk_count =0;
    always @(CPU.PCHI or CPU.PCLO) begin
        $display("");
        $display("%9t ", $time, "INCREMENTED PC=%1d ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^", {CPU.PCHI, CPU.PCLO});
        currentCode = string_bits'(CODE[pcval]); // assign outside 'always' doesn't work so do here instead
        $display ("%9t ", $time,  "OPERATION %1d ", clk_count, ": %1s", currentCode);
        clk_count ++;
    end

    task DUMP_OP;
        $display ("%9t ", $time,  "DUMP  ", ": OPERATION: %11s        PC=%4h", currentCode,pcval);
        $display ("%9t ", $time,  "DUMP  ", ": PC    : %04h", pcval);
        $display ("%9t ", $time,  "DUMP  ", ": ROM 1 : %02h     %8b", CPU.ctrl.instruction_1, CPU.ctrl.instruction_1);
        $display ("%9t ", $time,  "DUMP  ", ": ROM 2 : %02h     %8b", CPU.ctrl.instruction_2, CPU.ctrl.instruction_2);
        $display ("%9t ", $time,  "DUMP  ", ": ROM 3 : %02h     %8b", CPU.ctrl.instruction_3, CPU.ctrl.instruction_3);
        $display ("%9t ", $time,  "DUMP  ", ": ROM 4 : %02h     %8b", CPU.ctrl.instruction_4, CPU.ctrl.instruction_4);
        $display ("%9t ", $time,  "DUMP  ", ": ROM 5 : %02h     %8b", CPU.ctrl.instruction_5, CPU.ctrl.instruction_5);
        $display ("%9t ", $time,  "DUMP  ", ": ROM 6 : %02h     %8b", CPU.ctrl.instruction_6, CPU.ctrl.instruction_6);
    endtask


///////////////////////////////////////////////////////////////////////////////////////////////////////
// CONSTRAINTS
///////////////////////////////////////////////////////////////////////////////////////////////////////
    always @(*) begin
        if (CPU._mrPC && CPU.phase_exec && CPU.ctrl.instruction_6 === 'x) begin
            #1
            //DUMP;
            $display("rom value instruction_6", CPU.ctrl.instruction_6); 
            $error("ERROR END OF PROGRAM - PROGRAM BYTE = XX "); 
            `FINISH_AND_RETURN(1);
        end
    end


endmodule : test
