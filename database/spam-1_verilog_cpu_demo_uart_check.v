// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan

// waits for DO to go active then writes character 66


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

        `DEV_EQ_IMMED8(icount, rega, 64); 
        `INSTRUCTION(icount, B, pchitmp, not_used, immed, A,  `SET_FLAGS, 'CM_STD, `NA_AMODE, 'z, `WRITE_UART>>8); 
        `INSTRUCTION(icount, B, pc     , not_used, immed, DO, `SET_FLAGS, 'CM_STD, `NA_AMODE, 'z, `WRITE_UART); 
        `JMP_IMMED16(icount, 0); 

icount = `WRITE_UART;
        `INSTRUCTION(icount, B, uart,   not_used, immed, A,  `SET_FLAGS, 'CM_STD, `NA_AMODE, 'z, 66);
        `INSTRUCTION(icount, B, halt,   not_used, immed, A,  `SET_FLAGS, 'CM_STD, `NA_AMODE, 'z, 66);


    end
    endtask : INIT_ROM

    int HALF_CLK=1500;

    initial begin
        //$timeformat(-3, 0, "ms", 10);

        INIT_ROM();

        _RESET_SWITCH = 0;
        clk=0;

        #HALF_CLK
        _RESET_SWITCH = 1;

        #HALF_CLK
        clk=0;

        
        #HALF_CLK
        clk=1; // fetch
        #HALF_CLK
        clk=0; // exec
        
        #HALF_CLK
        clk=1; // fetch
        #HALF_CLK
        clk=0; // exec
        
        #HALF_CLK
        clk=1; // fetch
        #HALF_CLK
        clk=0; // exec
        #HALF_CLK
        clk=1; // fetch
        #HALF_CLK
        clk=0; // exec
        #HALF_CLK
        clk=1; // fetch
        #HALF_CLK
        clk=0; // exec
        #HALF_CLK
        clk=1; // fetch
        #HALF_CLK

        clk=1; // fetch
        #HALF_CLK
        clk=0; // exec
        #HALF_CLK
        clk=1; // fetch
        #HALF_CLK
        clk=0; // exec
        #HALF_CLK
        clk=1; // fetch
        #HALF_CLK
        clk=0; // exec
        #HALF_CLK
        clk=1; // fetch
        #HALF_CLK
        clk=0; // exec

        $display("no more clocks");

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
            $display("%9t ", $time, "PC=%-d    ====  ENTERED EXEC PHASE ", {CPU.PCHI, CPU.PCLO});
            $display("%9t ", $time, "_gates_regfie_in ", CPU._gated_regfile_in , " _phase_exec ",  CPU._phase_exec , " _REGA_IN ", CPU._rega_in);
        end
    end

    // verify count each time MARLO changes
    integer not_initialised = 16'hffff + 1;
    integer last_count = not_initialised;
    integer count;
    integer last_marlo;


    always @( CPU.uart._TXE )
    begin
        $display("%9t", $time, " UART: _TXE %1d ", CPU.uart._TXE);
    end
    always @( CPU.uart._TXE_SUPPRESS )
    begin
        $display("%9t", $time, " UART: _TXE_SUPPRESS %1d ", CPU.uart._TXE_SUPPRESS);
    end
    //wire #(10) _gated_uart_wr = _uart_in | _phase_exec;   // sync clock data into uart - must occur AFTER uart_alubuf_buf has been enabled
    always @( CPU.uart.WR )
    begin
        $display("%9t", $time, " UART: WR %1d ", CPU.uart.WR);
    end
    always @( * )
    begin
        $display("%9t", $time, " UART: _gated_uart_wr %1d ", CPU._gated_uart_wr, " _uart_in %1d ", CPU._uart_in, " _phase_exec %1d ", CPU._phase_exec);
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
