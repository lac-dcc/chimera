// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan

//////////////// TO RUN TEST ... RUN AND GREP FOR  "OK" TO SEE COUNTER

// ADDRESSING TERMINOLOGY
//  IMMEDIATE ADDRESSING = INSTRUCTION CONTAINS THE CONSTANT VALUE DATA TO USE
//  DIRECT ADDRESSING = INSTRUCTION CONTAINS THE ADDRESS IN MEMORY OF THE DATA TO USE
//  REGISTER ADDRESSING = INSTRUCTION CONTAINS THE NAME OF THE REGISTER FROM WHICH TO FETCH THE DATA

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

    parameter LOG = 0;

    string rom;
    initial begin
        if (! $value$plusargs("rom=%s", rom)) begin
            $display("ERROR: please specify +rom=<rom> to start.");
`ifndef verilator
            $finish_and_return(1);
`endif
        end
    end

    import alu_ops::*;

    `include "../lib/display_snippet.sv"

    localparam SETTLE_TOLERANCE=50; // perhaps not needed now with new control logic impl

    // CLOCK ===================================================================================
    // half clock cycle - if phases are shorter then make this clock longer etc 100ns
    //localparam HALF_CLK_HI=300;   // half clock cycle - if phases are shorter then make this clock longer etc 100ns
    //localparam HALF_CLK_LO=50;   // half clock cycle - if phases are shorter then make this clock longer etc 100ns
    // !!! MADE THESE LONG SO OSCILLATIONS IN THINGS LIKE UART MODE LIKELY TO APPEAR
    localparam HALF_CLK_HI=500; // fetch 
    localparam HALF_CLK_LO=500;  // exec  

    // "Do not use an asynchronous reset within your design." - https://zipcpu.com/blog/2017/08/21/rules-for-newbies.html
    logic _RESET_SWITCH;

    logic clk;
    int opcount = 0;

    //always begin
    //   #CLOCK_INTERVAL clk = !clk;
    //end
    cpu #(.LOG(LOG)) CPU(_RESET_SWITCH, clk);


    ////////////////////////////////////////////////////////////////////////////////////////////////////
    // LOAD PROGRAM
    ////////////////////////////////////////////////////////////////////////////////////////////////////

function string strip;
    input string str; 
    begin
        strip = str;
        if (str.len() > 0) begin
            if (str[str.len()-1] == `NL) begin
                strip = str.substr(0, str.len()-2); 
            end
        end
    end
endfunction

    `define RAM(A) CPU.ram64.Mem[A]
    `define DATA(D) {40'bz, D} /* padded to rom width with z */

    localparam MAX_PC=2048;
    string_bits CODE_TEXT [MAX_PC];
    string_bits CODE [MAX_PC];

    integer counter =0;

    string str = "";
    localparam MAX_LINE_LENGTH=48+1; // space for nl
    reg [8*MAX_LINE_LENGTH:0] line; /* Line of text read from file */ 
    integer fControl, c, r=0, rs=0;
    logic [47:0] b;


    // SETUP ROM
    task INIT_ROM;
    begin

`ifndef verilator
        $display("opening rom file : %s", rom);
        fControl = $fopenr(rom); 
`endif
        if (fControl == `NULL) // If error opening file 
        begin
                $error("%9t ERROR ", $time, "failed opening file %s", rom);
`ifndef verilator
                $finish_and_return(1);
`endif
        end

        while (fControl != `NULL && r != -1)  
        begin
            line="";
            r = $fgets(line, fControl); 
            //$display("RL %d", r);
            if (r == MAX_LINE_LENGTH) begin
                str = strip(line);
                rs = $sscanf(line,"%48b", b); 
                //$display("RS %d", rs);
                //$display("B %b", b);
                if (rs != -1) begin
                    //`TEXT(counter + "ROM: %s (%48b)", line, b);
                    `TEXT(counter, line);
                    `ROM(counter) = b;
                    CODE[counter] = line;
                    counter ++;
                end
            end
            else
            if (r != 0) begin
                $error("%9t ERROR ", $time, "failed read - got %d chars but expected %d : '%d'", r, MAX_LINE_LENGTH, line);
`ifndef verilator
                $finish_and_return(1);
`endif
            end
            else begin
                r=-1;
            end
        end

        $display("PROGRAM LENGTH %d", counter);
    end
    endtask : INIT_ROM

    /////////////////////////////////////////////////////////////////////////////////////////////////////
    // RUN CLOCK
    /////////////////////////////////////////////////////////////////////////////////////////////////////

    integer icount=0;
    logic [47:0] data =0;

    wire [15:0] pc = {CPU.PCHI, CPU.PCLO};

    task CLK_UP; 
    begin
        // ENTER FETCH PHASE
        if (_RESET_SWITCH) icount++; else icount=0;

        if (LOG) $display("\n%9t", $time, " END OF EXECUTE VALUES"); 
        if (LOG) CPU.DUMP; 

        if (LOG) $display("\n%9t", $time, " CLK GOING HIGH  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ INSTRUCTION %1d", icount); 
        if (LOG) $display("\n%9t", $time, " ENTERING FETCH"); 
        clk = 1;

    end
    endtask


    task CLK_DN; 
    begin
        // ENTER EXEC PHASE
        opcount ++;

        begin 
            data = `ROM(pc);
            //$display(">>>> CODE[%d] : %-s" , pc, CPU.disasm(data));

            //$display("%9t", $time, " CLK GOING LOW  -----------------------------------------------------------------------"); 
            if (CPU.ctrl._do_exec == 0) begin
                $display("%9t", $time, " EXECUTING ..."); 
                $display("%9t", $time, " ---------"); 
                $display("%9t ", $time, "CYCLES %-6d : PC=%5d  %1s", opcount, {CPU.PCHI, CPU.PCLO}, CPU.disasm(data));
                $display("%9t", $time, " ---------"); 
                $display("%6s ", "", "= aaaaattt taaabbbC CCCFIbtM AAAAAAAA AAAAAAAA IIIIIIII");
                $display("%6s ", "", "= %8b %8b %8b %8b %8b %8b", 
                    data[47:40],
                    data[39:32],
                    data[31:24],
                    data[23:16],
                    data[15:8],
                    data[7:0]);
            end
            else
            begin
                $display("%9t", $time, " SKIPPING EXEC"); 
            end


            //CPU.DUMP; 
        
            //$display("%9t", $time, " -  -  -  - -  -  -  - -  -  -  - -  -  -  - -  -  -  - -  -  -  - -  -  -  -  ");
        end

/*
        if (LOG) 
        $display("%9t", $time, " DECOMPILE ",
            " PC=%-5d : ", pc,
            " %-1s = ", control::tdevname({CPU.ctrl.instruction[25], CPU.ctrl.instruction[42:39]}),
            " %1s", control::adevname(CPU.ctrl.instruction[38:36]),
            "  (%1s) ",  aluopName(CPU.ctrl.instruction[47:43]),
            " %1s", control::bdevname({CPU.ctrl.instruction[26],CPU.ctrl.instruction[35:33]}),
            "  {%1s ", control::condname(CPU.ctrl.instruction[32:29]),
            "%1s} ", CPU.ctrl.instruction[28] ? "S" : " ",
            "  %1s ", control::amode(CPU.ctrl.instruction[24]),
            " addr:%02x:%02x ", CPU.ctrl.instruction[23:16], CPU.ctrl.instruction[15:8],
            " imm:%02x (dec %d) ", CPU.ctrl.instruction[7:0], CPU.ctrl.instruction[7:0]
        );
*/

/*
        $display("%06t", $time, " RAM divisorL:H %02x:%02x dividendL:H %02x:%02x remainderL:H%02x:%02x resultL:H", 
                CPU.ram64.Mem[6],
                CPU.ram64.Mem[7],
                CPU.ram64.Mem[8],
                CPU.ram64.Mem[9],
                CPU.ram64.Mem[10],
                CPU.ram64.Mem[11],
                CPU.ram64.Mem[12],
                CPU.ram64.Mem[13]
            );
*/
        if (LOG) $display("%9t", $time, " -  -  -  - -  -  -  - -  -  -  - -  -  -  - -  -  -  - -  -  -  - -  -  -  -  ");
        clk = 0;
    end
    endtask


    integer count;

    task noop;
        // do nothing - just for syntax
    endtask: noop


    `define DUMP_REG $display("%9t", $time, " REGISTERS:", "  REGA:%08b", CPU.regFile.get(0), "  REGB:%08b", CPU.regFile.get(1), "  REGC:%08b", CPU.regFile.get(2), "  REGD:%08b", CPU.regFile.get(3)); 

    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, test);

        `define CYCLE begin CLK_UP; #HALF_CLK_HI CLK_DN; #HALF_CLK_LO; noop(); end
        `define FULL_CYCLE(N) for (count =0; count < N; count++) begin CLK_UP; #HALF_CLK_HI; CLK_DN; #HALF_CLK_LO; noop(); end

        INIT_ROM();

        `DISPLAY("init : _RESET_SWITCH=0")
        _RESET_SWITCH = 0;
        #1000
        CLK_DN;
        #1000
        CLK_UP;
        #1000
        _RESET_SWITCH = 1;

        while (1) begin
            #HALF_CLK_HI
            CLK_DN;
            #HALF_CLK_LO
            if (LOG) $display("%9t", $time, " DUMPREG:", "  PC=%1d ", pcval, "ALU:%03d", CPU.alu_result_bus, " REGA:%03d", CPU.regFile.get(0), "  REGB:%03d", CPU.regFile.get(1), "  REGC:%03d", CPU.regFile.get(2), "  REGD:%03d", CPU.regFile.get(3));
            if (LOG) $display("%9t", $time, " FLAGS czonENGL=%8b" , CPU._registered_flags_czonENGL);
            CLK_UP;
        end

        $display("END OF TEST CASES ==============================================");
        // verilator lint_on INFINITELOOP

        $finish();

    end


    integer pcval;
    assign pcval={CPU.PCHI, CPU.PCLO};

    string_bits currentCode; // create field so it can appear in dump file
    string_bits currentCodeText; // create field so it can appear in dump file

    always @(CPU.PCHI or CPU.PCLO) begin
        currentCode = string_bits'(CODE[pcval]); // assign outside 'always' doesn't work so do here instead
        currentCodeText = string_bits'(CODE_TEXT[pcval]);
        if (LOG) $display("%9t ", $time, "CYCLES %d : INCREMENTED PC=%1d    INSTRUCTION: %1s", opcount, {CPU.PCHI, CPU.PCLO}, currentCode);
            //$display(">>>> CODE[%d] : %-s" , pc, CPU.disasm(data));

        //if (currentCodeText != "") $display("%9t ", $time, "COMMENT: %1s", currentCodeText);

        if (pcval >= counter) begin
            $display("%9t ", $time, "INCREMENTED PC=%1d    BEYOND PROGRAM LENGTH %d", {CPU.PCHI, CPU.PCLO}, counter);
`ifndef verilator
            $finish_and_return(1);
`endif
        end
    end

    //`define DD  $display ("%9t ", $time,  "DUMP  ",
    task DUMP_OP;
          `DD ": PC  : %d", pcval);
          `DD ": CODE: %1s", currentCode);
          `DD ": %1s", label);
          label="";
    endtask


    task DUMP;
            DUMP_OP;
            `DD " phase=%1b", CPU.phase_exec);
            `DD " PC=%01d (PC=0x%4h) PCHItmp=%0d (%2x)", CPU.pc_addr, CPU.pc_addr, CPU.PC.PCHITMP, CPU.PC.PCHITMP);
            `DD " address_bus=0x%4x (%d) ", CPU.address_bus, CPU.address_bus);
            `DD " abus=%8b(%d) bbus=%8b(%d) alu_result_bus=%8b(%d)", CPU.abus, CPU.abus, CPU.bbus, CPU.bbus, CPU.alu_result_bus, CPU.alu_result_bus);
            `DD " FLAGS ALU        czonENGL=%8b ", CPU.alu_flags_czonENGL);
            `DD " FLAGS REGISTERED czonENGL=%8b gated_flags_clk=%1b", CPU._registered_flags_czonENGL, CPU.gated_flags_clk);
            `DD " FLAGS I/O  _flagdo=%1b _flags_di=%1b", CPU._flag_do, CPU._flag_di);
            `DD " MAR=%8b:%8b (0x%2x:%2x)", CPU.MARHI.Q, CPU.MARLO.Q, CPU.MARHI.Q, CPU.MARLO.Q);
            `DD " REGA:%08b", CPU.regFile.get(0),
                "  REGB:%08b", CPU.regFile.get(1),
                "  REGC:%08b", CPU.regFile.get(2),
                "  REGD:%08b", CPU.regFile.get(3)
                );
 //           `define LOG_ADEV_SEL(DNAME) " _adev_``DNAME``=%1b", CPU._adev_``DNAME``
  //          `define LOG_BDEV_SEL(DNAME) " _bdev_``DNAME``=%1b", CPU._bdev_``DNAME``
   //         `define LOG_TDEV_SEL(DNAME) " _``DNAME``_in=%1b",  CPU._``DNAME``_in
//            `DD " WIRES ", `CONTROL_WIRES(LOG, `COMMA));
    endtask 


    always @* 
        if (_RESET_SWITCH)  
            $display("\n%9t RESET SWITCH RELEASE   _RESET_SWITCH=%1b  ======================================================================\n", $time, _RESET_SWITCH); 
        else      
            $display("\n%9t RESET SWITCH SET       _RESET_SWITCH=%1b  ======================================================================\n", $time, _RESET_SWITCH); 

    always @* 
        if (CPU._mrPC)  
            $display("\n%9t PC RESET RELEASE   _mr=%1b  ======================================================================\n", $time, CPU._mrPC); 
        else      
            $display("\n%9t PC RESET SET       _mr=%1b  ======================================================================\n", $time, CPU._mrPC); 


    

    integer instCount = 0;

/*
    always @(CPU.clk) begin
        $display("%9t", $time, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CLK %1b  <<<<<<<<<<<<<<<<<<<<<<<", CPU.clk);
    end

    always @(posedge CPU.phase_exec) begin
        $display("%9t", $time, " START PHASE: EXECUTE (posedge) =============================================================="); 
    end

    always @(negedge CPU.phase_exec) begin
        $display("%9t", $time, " END PHASE: EXECUTE (negedge) =============================================================="); 
        DUMP;
    end
    always @(posedge CPU.phaseFetch) begin
        instCount ++;
        $display("%9t", $time, " START PHASE: FETCH (posedge)  INTRUCTION#=%-d ==============================================================", instCount); 
    end
*/
    
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
                $display("\n\n%9t ", $time, " ERROR ILLEGAL INDETERMINATE ADDR MODE _REG=%1b", CPU._addrmode_register);
                DUMP;
                $display("\n\n%9t ", $time, " ABORT");
                $finish();
            end
        end
    end

endmodule : test
