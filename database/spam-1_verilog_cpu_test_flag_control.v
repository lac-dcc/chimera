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

    import alu_ops::*;

   `include "../lib/display_snippet.sv"

    localparam SETTLE_TOLERANCE=50; // perhaps not needed now with new control logic impl

    // CLOCK ===================================================================================
    localparam TCLK=390;   // clock cycle

    // "Do not use an asynchronous reset within your design." - https://zipcpu.com/blog/2017/08/21/rules-for-newbies.html
    logic _RESET_SWITCH;

    logic clk=0;

    cpu CPU(_RESET_SWITCH, clk);
  
    initial begin
        $dumpfile("dumpfile.vcd");
        //$dumpvars(0, test, clk, _RESET_SWITCH, CPU);
        $dumpvars(0, test);
    end

    ////////////////////////////////////////////////////////////////////////////////////////////////////
    // TESTS ===========================================================================================
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    `define RAM(A) CPU.ram64.Mem[A]
    `define DATA(D) {40'bz, D} /* padded to rom width with z */

    localparam MAX_PC=100;
    `DEFINE_CODE_VARS(MAX_PC)

    integer ADD_ONE;
    `define WRITE_UART 60
    `define READ_UART 80
    integer WAIT_UART_OUT;

    // SETUP ROM
    integer counter=0;
    integer start;
    task INIT_ROM;
    begin

        `INSTRUCTION(counter, B, marlo, not_used, immed, A, `SET_FLAGS, `CM_STD, `NA_AMODE, 'z, 254); 
        `INSTRUCTION(counter, B, marhi, not_used, immed, A, `SET_FLAGS, `CM_STD, `NA_AMODE, 'z, 0); 

        start = counter;

        `TEXT(counter, "START OF MAIN LOOP BLOCK - ADD ONE TO MARLO");
        `INSTRUCTION(counter, B_PLUS_1, marlo, not_used, marlo, A, `SET_FLAGS, `CM_STD, `NA_AMODE, 'z, 'z); 

        `TEXT(counter, "CONDITIONAL C ADD ONE TO MARHI");
        `INSTRUCTION(counter, B_PLUS_1, marhi, not_used, marhi, C, `NA_FLAGS, `CM_STD, `NA_AMODE, 'z, 'z); 

        `TEXT(counter, "GOTO LOOP");
        `JMP_IMMED16(counter, start); 
    end
    endtask : INIT_ROM

    always @(posedge CPU.gated_flags_clk) begin
        if (CPU._phase_exec) begin
            $display("ILLEGAL FLAGS LOAD AT PC %d", CPU.pc_addr);
            $finish();
        end
    end 

    initial begin
/*
        CPU.PC.PCHI_7_4.count = 1;
        CPU.PC.PCHI_3_0.count = 4'ha;
        CPU.PC.PCLO_7_4.count = 4'hf;
        CPU.PC.PCLO_3_0.count = 0;
        #1000
*/
        
        //$timeformat(-3, 0, "ms", 10);


        INIT_ROM();
        _RESET_SWITCH = 0;
        #1000

        #1000
        clk=0;
        #10000

        _RESET_SWITCH = 1;
        #1000
        clk=1;
        #1000
       `Equals(CPU.pc_addr, 0); 
       `Equals(CPU._phase_exec, 1); 
       `Equals(CPU._flag_c, 'x); 

        // exec marlo load
        clk=0;
        #1000
       `Equals(CPU.pc_addr, 0); 
       `Equals(CPU._phase_exec, 0); 
       `Equals(CPU._flag_c, 1); 
       `Equals(CPU.MARLO.Q, 8'd254); 
       `Equals(CPU.MARHI.Q, CPU.MARHI.UNDEF); 

        // exec marhi load
        clk=1;
        #1000
        clk=0;
        #1000
       `Equals(CPU.pc_addr, 1); 
       `Equals(CPU._flag_c, 1); 
       `Equals(CPU.MARLO.Q, 254); 
       `Equals(CPU.MARHI.Q, 0); 

        // inc marlo 
        clk=1;
        #1000
        clk=0;
        #1000
       `Equals(CPU.pc_addr, 2); 
       `Equals(CPU._flag_c, 1); 
       `Equals(CPU.MARLO.Q, 255); 
       `Equals(CPU.MARHI.Q, 0); 

        // int marhi - skipped
        clk=1;
        #1000
        clk=0;
        #1000
       `Equals(CPU.pc_addr, 3); 
       `Equals(CPU._flag_c, 1); 
       `Equals(CPU.MARLO.Q, 255); 
       `Equals(CPU.MARHI.Q, 0); 

        // setup jump hi
        clk=1;
        #1000
        clk=0;
        #1000
       `Equals(CPU.pc_addr, 4); 
       `Equals(CPU._flag_c, 1); 
       `Equals(CPU.PC.PCHITMP, CPU.PC.PCHiTmpReg.UNDEF); 
       `Equals(CPU.MARLO.Q, 255); 
       `Equals(CPU.MARHI.Q, 0); 

        // setup pc load
        clk=1;
        #1000
        clk=0;
        #1000
       `Equals(CPU.pc_addr, 5); 
       `Equals(CPU._flag_c, 1); 
       `Equals(CPU.PC.PCHITMP, 0); 
       `Equals(CPU.MARLO.Q, 255); 
       `Equals(CPU.MARHI.Q, 0); 

        // inc marlo gives carry
        clk=1;
        #1000
       `Equals(CPU._flag_c, 1); 
        clk=0;
        #1000
       `Equals(CPU.pc_addr, 2); 
       `Equals(CPU._flag_c, 0); 
       `Equals(CPU.PC.PCHITMP, 0); 
       `Equals(CPU.MARLO.Q, 0); 
       `Equals(CPU.MARHI.Q, 0); 
       
        // inc marhi does not overwrite flags
        clk=1;
        #1000
       `Equals(CPU._flag_c, 0); 
        clk=0;
        #1000
       `Equals(CPU.pc_addr, 3); 
       `Equals(CPU._flag_c, 0);  // preserved
       `Equals(CPU.PC.PCHITMP, 0); 
       `Equals(CPU.MARLO.Q, 0); 
       `Equals(CPU.MARHI.Q, 1); 
       
        // setup jump hi
        clk=1;
        #1000
        clk=0;
        #1000
       `Equals(CPU.pc_addr, 4); 
       `Equals(CPU._flag_c, 1'b0); // flags preserved during PC assignments
       `Equals(CPU.PC.PCHITMP, 0);
       `Equals(CPU.MARLO.Q, 0); 
       `Equals(CPU.MARHI.Q, 1); 

        // setup pc load
        clk=1;
        #1000
        clk=0;
        #1000
       `Equals(CPU.pc_addr, 5); 
       `Equals(CPU._flag_c, 1'b0); // flags preserved during PC assignments
       `Equals(CPU.PC.PCHITMP, 0); 
       `Equals(CPU.MARLO.Q, 0); 
       `Equals(CPU.MARHI.Q, 1); 

        // inc marlo gives carry
        clk=1;
        #1000
        clk=0;
        #1000
       `Equals(CPU.pc_addr, 2); 
       `Equals(CPU._flag_c, 1); 
       `Equals(CPU.PC.PCHITMP, 0); 
       `Equals(CPU.MARLO.Q, 1); 
       `Equals(CPU.MARHI.Q, 1); 
       
        // inc marhi gives no carry
        clk=1;
        #1000
        clk=0;
        #1000
       `Equals(CPU.pc_addr, 3); 
       `Equals(CPU._flag_c, 1); 
       `Equals(CPU.PC.PCHITMP, 0); 
       `Equals(CPU.MARLO.Q, 1); 
       `Equals(CPU.MARHI.Q, 1); 
       
       
        $display("DONE - no more clocks");
       clk = 1; // END OF PROGRAM
        $finish();
        

    end

   // $timeformat [(unit_number, precision, suffix, min_width )] ;
    task DUMP;
            //DUMP_OP;
            `define DD $display ("%9t ", $time,  "DUMP  ", 

            `DD " phase_exec=%1b", CPU.phase_exec);
            `DD " disasm=%s", CPU.disasmCur());
            `DD " PC=%1d (0x%4h) PCHItmp=%d (%2x)", CPU.pc_addr, CPU.pc_addr, CPU.PC.PCHITMP, CPU.PC.PCHITMP);
            `DD " instruction=%08b:%08b:%08b:%08b:%08b:%08b", CPU.ctrl.instruction_6, CPU.ctrl.instruction_5, CPU.ctrl.instruction_4, CPU.ctrl.instruction_3, CPU.ctrl.instruction_2, CPU.ctrl.instruction_1);
            `DD " amode=%1s", control::fAddrMode(CPU._addrmode_register), " addbbus=0x%4x", CPU.address_bus);
            `DD " rom=%08b:%08b:%08b:%08b:%08b:%08b",  CPU.ctrl.rom_6.D, CPU.ctrl.rom_5.D, CPU.ctrl.rom_4.D, CPU.ctrl.rom_3.D, CPU.ctrl.rom_2.D, CPU.ctrl.rom_1.D);
            `DD " immed8=%08b", CPU.ctrl.immed8);
            `DD " ram=%08b", CPU.ram64.D);
            `DD " tdev=%4b(%s)", CPU.targ_dev, control::tdevname(CPU.targ_dev),
                " adev=%3b(%s)", CPU.abus_dev, control::adevname(CPU.abus_dev),
                " bdev=%4b(%s)", CPU.bbus_dev,control::bdevname(CPU.bbus_dev),
                " alu_op=%5b(%s)", CPU.alu_op, aluopName(CPU.alu_op)
            );            
            `DD " abus=%8b bbus=%8b alu_result_bus=%8b", CPU.abus, CPU.bbus, CPU.alu_result_bus);
            `DD " ALUFLAGS czonENGL=%8b ", CPU.alu_flags_czonENGL );
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
       `DD " ALUFLAGS czonENGL=%8b ", CPU.alu_flags_czonENGL );
       `DD " FLAGSREG czonENGL=%8b gated_flags_clk=%1b", CPU.status_register_czonENGL.Q, CPU.gated_flags_clk);
       `DD " FLAGS _flag_do=%b _flag_di=%b", CPU._flag_do, CPU._flag_di);
       `DD " condition=%02d(%1s) _do_exec=%b _set_flags=%b", CPU.ctrl.condition, control::condname(CPU.ctrl.condition), CPU.ctrl._do_exec, CPU._set_flags);
        //CPU.ctrl.dump;
       $display ("%9t ", $time,  "EXECUTE....");
    end

    always @( negedge CPU.phase_exec ) begin
       $display ("%9t ", $time,  "PHASE_EXEC exit");
       DUMP();
    end

    int clk_count =0;
    always @(CPU.PCHI or CPU.PCLO) begin
        $display("");
        $display("%9t ", $time, "INCREMENTED PC=%1d ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^", {CPU.PCHI, CPU.PCLO});
        currentCode = string_bits'(CODE[pcval]); // assign outside 'always' doesn't work so do here instead
        $display ("%9t ", $time,  "OPERATION %1d ", clk_count, ": %1s", currentCode);
        $display ("%9t ", $time,  "OPERATION %1d ", clk_count, ": %1s", CODE_NUM[pcval]);
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
