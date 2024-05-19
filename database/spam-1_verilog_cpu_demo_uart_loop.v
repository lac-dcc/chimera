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
    localparam TCLK=1380;   // clock cycle

    // "Do not use an asynchronous reset within your design." - https://zipcpu.com/blog/2017/08/21/rules-for-newbies.html
    logic _RESET_SWITCH;

    logic clk=0;
    
    int exec_count=0;

    always begin
       #TCLK 
       clk = !clk;
       if (clk) exec_count++;
    end

    cpu CPU(_RESET_SWITCH, clk);


    ////////////////////////////////////////////////////////////////////////////////////////////////////
    // TESTS ===========================================================================================
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    `define RAM(A) CPU.ram64.Mem[A]
    `define DATA(D) {40'bz, D} /* padded to rom width with z */

    localparam MAX_PC=100;
    `DEFINE_CODE_VARS(MAX_PC)

    integer LOOP;
    integer ADD_ONE;
    `define WRITE_UART 60
    `define READ_UART 80

    // SETUP ROM
    integer icount;
    task INIT_ROM;
    begin

         // implement 16 bit counter
         icount = 0;

         `DEV_EQ_IMMED8(icount, rega, '0); 
         `DEV_EQ_IMMED8(icount, regb, '0); 
         `DEV_EQ_IMMED8(icount, regc, '0); 
         `DEV_EQ_IMMED8(icount, regd, '0); 
         `DEV_EQ_IMMED8(icount, marlo, '0); 
         `DEV_EQ_IMMED8(icount, marhi, '0); 


        // jump to read or write if 
         LOOP = icount;
         `JMP_IMMED_COND(icount, `READ_UART, DI);
         `JMP_IMMED_COND(icount, `WRITE_UART, DO); 
         `JMP_IMMED16(icount, LOOP); 

        // rega/b counter increment if we've read or written
         ADD_ONE=icount;
         `DEV_EQ_XI_ALU(icount, rega, rega, 1, A_PLUS_B) ; 
         `DEV_EQ_XI_ALU(icount, regb, regb, 0, A_PLUS_B_PLUS_C); 
         `DEV_EQ_XY_ALU(icount, marlo, not_used, rega, B_PLUS_1);  // modding MARLO triggers some other assertions below
         `JMP_IMMED16(icount, LOOP); 


        // write to uart
         icount = `WRITE_UART;
         `DEV_EQ_XY_ALU(icount, uart, rega, not_used, A); 
         `JMP_IMMED16(icount, ADD_ONE); 

        // read from uart
         icount = `READ_UART;
         `DEV_EQ_XY_ALU(icount, marhi, uart, not_used, A); 
         `DEV_EQ_XY_ALU(icount, marlo, not_used, rega, B_PLUS_1);  // modding MARLO triggers some other assertions below
         `JMP_IMMED16(icount, ADD_ONE); 

    end
    endtask : INIT_ROM

    initial begin
        //$timeformat(-3, 0, "ms", 10);

        INIT_ROM();

        _RESET_SWITCH = 0;
        clk=0;

        #1000
        _RESET_SWITCH = 1;

    end


    integer pcval;
    assign pcval={CPU.PCHI, CPU.PCLO};
    string_bits currentCode; // create field so it can appear in dump file
    if (1) always @(CPU.PCHI or CPU.PCLO) begin
        $display("");
        $display("%9t ", $time, "INCREMENTED PC=%-d ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^", {CPU.PCHI, CPU.PCLO});
        currentCode = string_bits'(CODE[pcval]); // assign outside 'always' doesn't work so do here instead
        $display ("%9t ", $time,  "OPERATION (cycle %1d): ", exec_count, " %-s", currentCode);
    end
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
    localparam TCLK=1380;   // clock cycle

    // "Do not use an asynchronous reset within your design." - https://zipcpu.com/blog/2017/08/21/rules-for-newbies.html
    logic _RESET_SWITCH;

    logic clk=0;
    
    int exec_count=0;

    always begin
       #TCLK 
       clk = !clk;
       if (clk) exec_count++;
    end

    cpu CPU(_RESET_SWITCH, clk);


    ////////////////////////////////////////////////////////////////////////////////////////////////////
    // TESTS ===========================================================================================
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    `define RAM(A) CPU.ram64.Mem[A]
    `define DATA(D) {40'bz, D} /* padded to rom width with z */

    localparam MAX_PC=100;
    `DEFINE_CODE_VARS(MAX_PC)

    integer LOOP;
    integer ADD_ONE;
    `define WRITE_UART 60
    `define READ_UART 80

    // SETUP ROM
    integer icount;
    task INIT_ROM;
    begin

         // implement 16 bit counter
         icount = 0;

         `DEV_EQ_IMMED8(icount, rega, '0); 
         `DEV_EQ_IMMED8(icount, regb, '0); 
         `DEV_EQ_IMMED8(icount, regc, '0); 
         `DEV_EQ_IMMED8(icount, regd, '0); 
         `DEV_EQ_IMMED8(icount, marlo, '0); 
         `DEV_EQ_IMMED8(icount, marhi, '0); 


        // jump to read or write if 
         LOOP = icount;
         `JMP_IMMED_COND(icount, `READ_UART, DI);
         `JMP_IMMED_COND(icount, `WRITE_UART, DO); 
         `JMP_IMMED16(icount, LOOP); 

        // rega/b counter increment if we've read or written
         ADD_ONE=icount;
         `DEV_EQ_XI_ALU(icount, rega, rega, 1, A_PLUS_B) ; 
         `DEV_EQ_XI_ALU(icount, regb, regb, 0, A_PLUS_B_PLUS_C); 
         `DEV_EQ_XY_ALU(icount, marlo, not_used, rega, B_PLUS_1);  // modding MARLO triggers some other assertions below
         `JMP_IMMED16(icount, LOOP); 


        // write to uart
         icount = `WRITE_UART;
         `DEV_EQ_XY_ALU(icount, uart, rega, not_used, A); 
         `JMP_IMMED16(icount, ADD_ONE); 

        // read from uart
         icount = `READ_UART;
         `DEV_EQ_XY_ALU(icount, marhi, uart, not_used, A); 
         `DEV_EQ_XY_ALU(icount, marlo, not_used, rega, B_PLUS_1);  // modding MARLO triggers some other assertions below
         `JMP_IMMED16(icount, ADD_ONE); 

    end
    endtask : INIT_ROM

    initial begin
        //$timeformat(-3, 0, "ms", 10);

        INIT_ROM();

        _RESET_SWITCH = 0;
        clk=0;

        #1000
        _RESET_SWITCH = 1;

    end


    integer pcval;
    assign pcval={CPU.PCHI, CPU.PCLO};
    string_bits currentCode; // create field so it can appear in dump file
    if (1) always @(CPU.PCHI or CPU.PCLO) begin
        $display("");
        $display("%9t ", $time, "INCREMENTED PC=%-d ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^", {CPU.PCHI, CPU.PCLO});
        currentCode = string_bits'(CODE[pcval]); // assign outside 'always' doesn't work so do here instead
        $display ("%9t ", $time,  "OPERATION (cycle %1d): ", exec_count, " %-s", currentCode);
    end
    if (1) always @(CPU.phase_exec) begin
        $display("");
        if (CPU.phase_exec) begin
            $display("%9t ", $time, "PC=%-d    ====  ENTERTED EXEC PHASE ", {CPU.PCHI, CPU.PCLO});
            $display("%9t ", $time, "_gated_regfile_in ", CPU._gated_regfile_in , " _phase_exec ",  CPU._phase_exec , " _REGA_IN ", CPU._rega_in);
        end
    end

    // verify count each time MARLO changes
    integer not_initialised = 16'hffff + 1;
    integer last_count = not_initialised;
    integer count;
    integer last_marlo;


    always @( CPU.MARLO.Q )
    begin
        count = { CPU.regFile.get(1), CPU.regFile.get(0) };

        $display("%9t", $time, " MARLO.Q = %4h ", CPU.MARLO.Q);
        $display("%9t", $time, " REGISTER COUNT = %4h ", 16'(count));
        $display("%9t", $time, " LAST COUNT = %2h ", last_count);
        $display("%9t", $time, " LAST MARLO = %2h ", last_marlo);
        $display("%9t", $time, " THIS MARLO = %2h ", CPU.MARLO.Q);
        last_marlo = CPU.MARLO.Q;
        

        if (last_count !== not_initialised) begin
            if (last_count == 65535 && count != 0) begin 
                $error("ERROR wrong count roll value : count=%1d (hex %02x) last_count=%1d but expected count=0", count , count, last_count);
                `FINISH_AND_RETURN(2);
            end
            
            if (count != 0 && last_count != 65535 && count != last_count+1) begin 
                $error("ERROR wrong count next +1 value : count=%1d (hex %02x) last_count=%1d but expected count=%1d", count , count, last_count, last_count+1);
                `FINISH_AND_RETURN(2);
            end
        end
/*
        else 
        begin
            if (count != 0) begin 
                $error("ERROR wrong initial count : count=%1d (hex %02x)", count, count);
                `FINISH_AND_RETURN(2);
            end
    
        end
*/
        
        $display("OK %4h", {CPU.regFile.get(1), CPU.regFile.get(0) });
        last_count=count;
    end

    
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
    if (1) always @(CPU.phase_exec) begin
        $display("");
        if (CPU.phase_exec) begin
            $display("%9t ", $time, "PC=%-d    ====  ENTERTED EXEC PHASE ", {CPU.PCHI, CPU.PCLO});
            $display("%9t ", $time, "_gated_regfile_in ", CPU._gated_regfile_in , " _phase_exec ",  CPU._phase_exec , " _REGA_IN ", CPU._rega_in);
        end
    end

    // verify count each time MARLO changes
    integer not_initialised = 16'hffff + 1;
    integer last_count = not_initialised;
    integer count;
    integer last_marlo;


    always @( CPU.MARLO.Q )
    begin
        count = { CPU.regFile.get(1), CPU.regFile.get(0) };

        $display("%9t", $time, " MARLO.Q = %4h ", CPU.MARLO.Q);
        $display("%9t", $time, " REGISTER COUNT = %4h ", 16'(count));
        $display("%9t", $time, " LAST COUNT = %2h ", last_count);
        $display("%9t", $time, " LAST MARLO = %2h ", last_marlo);
        $display("%9t", $time, " THIS MARLO = %2h ", CPU.MARLO.Q);
        last_marlo = CPU.MARLO.Q;
        

        if (last_count !== not_initialised) begin
            if (last_count == 65535 && count != 0) begin 
                $error("ERROR wrong count roll value : count=%1d (hex %02x) last_count=%1d but expected count=0", count , count, last_count);
                `FINISH_AND_RETURN(2);
            end
            
            if (count != 0 && last_count != 65535 && count != last_count+1) begin 
                $error("ERROR wrong count next +1 value : count=%1d (hex %02x) last_count=%1d but expected count=%1d", count , count, last_count, last_count+1);
                `FINISH_AND_RETURN(2);
            end
        end
/*
        else 
        begin
            if (count != 0) begin 
                $error("ERROR wrong initial count : count=%1d (hex %02x)", count, count);
                `FINISH_AND_RETURN(2);
            end
    
        end
*/
        
        $display("OK %4h", {CPU.regFile.get(1), CPU.regFile.get(0) });
        last_count=count;
    end

    
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
