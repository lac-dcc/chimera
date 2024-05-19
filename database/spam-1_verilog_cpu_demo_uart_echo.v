// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan

//////////////// ECHOS RECEIVED BYTES BACK OUT

//////////////// TO RUN TEST ... RUN AND GREP FOR  TRANSMITTING

/* NEED A uart.control that does soem recieves and sends like this
t100000
r1
r2
r3
r4
/ Sleep for a bit to give cpu time to run then quit
#100000000
q
*/



//#!/usr/bin/iverilog -Ttyp -Wall -g2012 -gspecify -o test.vvp 
//`include "../control/controller.v"
`include "cpu.v"
`include "../lib/assertion.v"
`include "psuedo_assembler.sv"
// verilator lint_off ASSIGNDLY
// verilator lint_off STMTDLY

`timescale 1ns/1ns

`define SEMICOLON ;
`define COMMA ,

`define regEquals(A,B,C,D) begin \
        `Equals( CPU.regFile.get(0), 8'(A)); \
        `Equals( CPU.regFile.get(1), 8'(B)); \
        `Equals( CPU.regFile.get(2), 8'(C)); \
        `Equals( CPU.regFile.get(3), 8'(D)); \
    end

module test();
    import alu_ops::*;

    `include "../lib/display_snippet.sv"

    localparam SETTLE_TOLERANCE=50; // perhaps not needed now with new control logic impl

    // CLOCK ===================================================================================
    localparam HALF_CLK=365;   // half clock cycle - if phases are shorter then make this clock longer etc 100ns
    //localparam HALF_CLK=1335;   // half clock cycle - if phases are shorter then make this clock longer etc 100ns

    // "Do not use an asynchronous reset within your design." - https://zipcpu.com/blog/2017/08/21/rules-for-newbies.html
    logic _RESET_SWITCH;

    logic clk;

    //always begin
    //   #CLOCK_INTERVAL clk = !clk;
    //end
    cpu CPU(_RESET_SWITCH, clk);


    ////////////////////////////////////////////////////////////////////////////////////////////////////
    // TESTS ===========================================================================================
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    `define RAM(A) CPU.ram64.Mem[A]
    `define DATA(D) {40'bz, D} /* padded to rom width with z */

    localparam MAX_PC=2048;
    `DEFINE_CODE_VARS(MAX_PC)
    //string_bits CODE_TEXT [MAX_PC];
    //string_bits CODE [MAX_PC];

    integer counter =0;

    string hello = "Hello!";
    string bye = "Hello!";
    int idx;
    int read_loop;
    int write_loop;

    // SETUP ROM
    task INIT_ROM;
    begin

        counter=0;

        // do while DI 
        for (idx=0; idx<100; idx++) begin
          read_loop = counter;
          `INSTRUCTION(counter, B, pchitmp, not_used, immed,    A,  `SET_FLAGS, `CM_STD, `NA_AMODE, 'z, (read_loop>>8)); 
          `INSTRUCTION(counter, B, pc,      not_used, immed,    DI, `SET_FLAGS, `CM_INV, `NA_AMODE, 'z, (read_loop)); 
          `INSTRUCTION(counter, A, rega,    uart,     not_used, A,  `SET_FLAGS, `CM_STD, `NA_AMODE, 'z, 'z); 
          write_loop = counter;
          `INSTRUCTION(counter, B, pchitmp, not_used, immed,    A,  `SET_FLAGS, `CM_STD, `NA_AMODE, 'z, (write_loop>>8)); 
          `INSTRUCTION(counter, B, pc,      not_used, immed,    DO, `SET_FLAGS, `CM_INV, `NA_AMODE, 'z, (write_loop)); 
          `INSTRUCTION(counter, A, uart,    rega, immed,    A,  `SET_FLAGS,`CM_STD, `NA_AMODE, 'z, 'z);
        end

    end
    endtask : INIT_ROM

    integer icount=0;

    wire [15:0] pc = {CPU.PCHI, CPU.PCLO};

    task CLK_UP; 
    begin
        if (_RESET_SWITCH) icount++; else icount=0;

        $display("\n%9t", $time, " CLK GOING HIGH  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ INSTRUCTION %1d\n", icount); 
        clk = 1;
    end
    endtask

    task CLK_DN; 
    begin
        $display("\n%9t", $time, " CLK GOING LOW  -----------------------------------------------------------------------"); 
        DUMP; 
        $display("\n%9t", $time, " EXECUTING ..."); 
        clk = 0;
    end
    endtask


    // TESTS

    integer count;

    task noop;
        // do nothing - just for syntax
    endtask: noop


    `define DUMP_REG $display("%9t", $time, " REGISTERS:", "  REGA:%08b", CPU.regFile.get(0), "  REGB:%08b", CPU.regFile.get(1), "  REGC:%08b", CPU.regFile.get(2), "  REGD:%08b", CPU.regFile.get(3));

    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, test);

        `define CYCLE begin CLK_UP; #HALF_CLK CLK_DN; #HALF_CLK; noop(); end
        `define FULL_CYCLE(N) for (count =0; count < N; count++) begin CLK_UP; #HALF_CLK; CLK_DN; #HALF_CLK; noop(); end

        CPU.PC.PCHI_7_4.count = 15;
        CPU.PC.PCHI_3_0.count = 15;
        CPU.PC.PCLO_7_4.count = 15;
        CPU.PC.PCLO_3_0.count = 15;
        #1000

        INIT_ROM();
        `DISPLAY("init : _RESET_SWITCH=0")

        _RESET_SWITCH = 0;
        CLK_DN;
        #1000
        CLK_UP;
        #1000

        _RESET_SWITCH = 1;
        CLK_DN;
        #1000
        CLK_UP;
        #1000
        

        while (1==1) begin
            #100000
            CLK_DN;
            #100000
            CLK_UP;
        end

        $display("END OF TEST CASES ==============================================");
/*
*/

//`include "./generated_tests.v"
/*
        #HALF_CLK
        count=100;
        while (count -- > 0) begin
            #HALF_CLK
            CLK_UP;
            #HALF_CLK
            CLK_DN;
            $display("PC %2x:%2x !!!!!!!!!!!!!!!!!!!!!!!! CLK COUNT REMAINING=%-d", PCHI, PCLO, count);
        end
*/

        // consume any remaining code
        // verilator lint_off INFINITELOOP
        $display("FREE RUN CPU ==================================");
         while (1==1) begin
             #HALF_CLK
             CLK_UP;
             #HALF_CLK
             CLK_DN;
         end
        // verilator lint_on INFINITELOOP

        $display("END OF TEST");
        $finish();

    end


    integer pcval;
    assign pcval={CPU.PCHI, CPU.PCLO};

    string_bits currentCode; // create field so it can appear in dump file
    string_bits currentCodeText; // create field so it can appear in dump file

    always @(CPU.PCHI or CPU.PCLO) begin
        currentCode = string_bits'(CODE[pcval]); // assign outside 'always' doesn't work so do here instead
        currentCodeText = string_bits'(CODE_TEXT[pcval]);
        $display("%9t ", $time, "INCREMENTED PC=%1d    INSTRUCTION: %1s", {CPU.PCHI, CPU.PCLO}, currentCode);
        if (currentCodeText != "") $display("%9t ", $time, "COMMENT: %1s", currentCodeText);
    end

    `define DD  $display ("%9t ", $time,  "DUMP  ",
    task DUMP_OP;
          `DD ": CODE: %1s", currentCode);
          `DD ": %1s", label);
          label="";
    endtask


    task DUMP;
            `DD " _do_exec=%1d", CPU.ctrl._do_exec);
            DUMP_OP;
            `DD " phase_exec=%1d", CPU.phase_exec);
            `DD " PC=%01d (0x%4h) PCHItmp=%0d (%2x)", CPU.pc_addr, CPU.pc_addr, CPU.PC.PCHITMP, CPU.PC.PCHITMP);
            `DD " instruction=%08b:%08b:%08b:%08b:%08b:%08b", CPU.ctrl.instruction_6, CPU.ctrl.instruction_5, CPU.ctrl.instruction_4, CPU.ctrl.instruction_3, CPU.ctrl.instruction_2, CPU.ctrl.instruction_1);
            `DD " DIRECT=%02x:%02x", CPU.ctrl.direct_address_hi, CPU.ctrl.direct_address_lo);
            `DD " amode=%1s", control::fAddrMode(CPU._addrmode_register), " addbbus=0x%4x", CPU.address_bus);
            `DD " rom=%08b:%08b:%08b:%08b:%08b:%08b",  CPU.ctrl.rom_6.D, CPU.ctrl.rom_5.D, CPU.ctrl.rom_4.D, CPU.ctrl.rom_3.D, CPU.ctrl.rom_2.D, CPU.ctrl.rom_1.D);
            `DD " immed8=%08b", CPU.ctrl.immed8);
            `DD " ram=%08b", CPU.ram64.D);
            `DD " tdev=%b(%s)", CPU.targ_dev, control::tdevname(CPU.targ_dev),
                " adev=%b(%s)", CPU.abus_dev, control::adevname(CPU.abus_dev),
                " bdev=%b(%s)", CPU.bbus_dev,control::bdevname(CPU.bbus_dev),
                " alu_op=%b(%1s)", CPU.alu_op, aluopName(CPU.alu_op)
            );            
            `DD " abus=%8b bbus=%8b alu_result_bus=%8b", CPU.abus, CPU.bbus, CPU.alu_result_bus);
            `DD " condition=%02d(%1s) _do_exec=%b", CPU.ctrl.condition, control::condname(CPU.ctrl.condition), CPU.ctrl._do_exec);
            `DD " FLAGS czonENGL=%8b gated_flags_clk=%1b", CPU.status_register_czonENGL.Q, CPU.gated_flags_clk);
            `DD " FLAGS I/O  _flagdo=%1b _flags_di=%1b", CPU._flag_do, CPU._flag_di);
            `DD " MAR=%8b:%8b (0x%2x:%2x)", CPU.MARHI.Q, CPU.MARLO.Q, CPU.MARHI.Q, CPU.MARLO.Q);
            `DD "  REGA:%08b", CPU.regFile.get(0),
                "  REGB:%08b", CPU.regFile.get(1),
                "  REGC:%08b", CPU.regFile.get(2),
                "  REGD:%08b", CPU.regFile.get(3)
                );
            `define LOG_ADEV_SEL(DNAME) " _adev_``DNAME``=%1b", CPU._adev_``DNAME``
            `define LOG_BDEV_SEL(DNAME) " _bdev_``DNAME``=%1b", CPU._bdev_``DNAME``
            `define LOG_TDEV_SEL(DNAME) " _``DNAME``_in=%1b",  CPU._``DNAME``_in
            `DD " WIRES ", `CONTROL_WIRES(LOG, `COMMA));
    endtask 

    always @* 
        if (_RESET_SWITCH)  
            $display("\n%9t RESET SWITCH RELEASE   _RESET_SWITCH=%1b  ======================================================================\n", $time, _RESET_SWITCH); 
        else      
            $display("\n%9t RESET SWITCH SET       _RESET_SWITCH=%1b  ======================================================================\n", $time, _RESET_SWITCH); 

    always @* 
        if (CPU._mrPC)  
            $display("\n%9t PC RESET RELEASE   _mrPC=%1b  ======================================================================\n", $time, CPU._mrPC); 
        else      
            $display("\n%9t PC RESET SET       _mrPC=%1b  ======================================================================\n", $time, CPU._mrPC); 


    

    integer instCount = 0;

///////////////////////////////////////////////////////////////////////////////////////////////////////
// CONSTRAINTS
///////////////////////////////////////////////////////////////////////////////////////////////////////

    always @(posedge CPU.gated_flags_clk) begin
        if (CPU._phase_exec) begin
            $display("ILLEGAL FLAGS LOAD DURING FETCH PHASE");
            $finish();
        end
    end 
        
    // constraints

    always @(posedge CPU.phase_exec) begin
        if (_RESET_SWITCH && CPU.ctrl.instruction_6 === 'x) begin
           $display("instruction_6", CPU.ctrl.instruction_6); 
            DUMP;
            $display("ERROR END OF PROGRAM - PROGRAM BYTE = XX "); 
            `FINISH_AND_RETURN(1);
        end
    end

    logic [15:0] prev_address_bus;
    logic [7:0] prev_alu_result_bus;

    // constraints
    always @* begin
        // expect address and data to remain stable while ram write enabled
        if (!CPU._gated_ram_in) begin
            if (prev_address_bus != CPU.address_bus) begin
                $display("\n\n%9t ", $time, " ADDRESS CHANGED WHILE GATED RAM WRITE ENABLED");
                $display("\n\n%9t ", $time, " ABORT");
                $finish();
            end
            if (prev_alu_result_bus != CPU.alu_result_bus) begin
                $display("\n\n%9t ", $time, " DATA CHANGED WHILE GATED RAM WRITE ENABLED");
                $display("%9t ", $time, " prev = %8b, now = %8b", prev_alu_result_bus, CPU.alu_result_bus);
                $display("\n\n%9t ", $time, " ABORT");
                $finish();
            end
        end
        prev_address_bus = CPU.address_bus;
        prev_alu_result_bus = CPU.alu_result_bus;
    end

    always @* begin
        // permits a situation where the control lines conflict.
        // this is ok as long as they settle quickly and are settled before exec phase.
        if (CPU._mrPC & CPU.phase_exec) begin
            if (CPU._addrmode_register === 1'bx) begin
                $display("\n\n%9t ", $time, " ERROR ILLEGAL INDETERMINATE ADDR MODE _REG=%1b", CPU._addrmode_register );
                DUMP;
                $display("\n\n%9t ", $time, " ABORT");
                $finish();
            end
        end
    end

    always @( * )
    begin
        $display("%9t", $time, " OK MARHI:MARLO = %2h:%2h = %1d", CPU.MARHI.Q, CPU.MARLO.Q, (256*CPU.MARHI.Q)+ CPU.MARLO.Q);
    end

endmodule : test
