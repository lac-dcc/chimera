// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files in fifo_synchronous.vh

module FIFO_SYNCHRONOUS_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg             CLK;
    reg             RST;
    reg  [7:0]      DATA_IN;
    reg             PUSH;
    wire            FULL;
    wire [7:0]      DATA_OUT;
    reg             POP;
    wire            EMPTY;
  
    // FOR TESTING  
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg             FULLEXP;
    reg [7:0]       DATA_OUTEXP;
    reg             EMPTYEXP;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST
    fifo_synchronous_structural UUT_fifo_synchronous_structural(
        .clk(CLK),
        .rst(RST),
        .data_in(DATA_IN),
        .push(PUSH),
        .full(FULL),
        .data_out(DATA_OUT),
        .pop(POP),
        .empty(EMPTY)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("fifo_synchronous_tb.vcd");
        $dumpvars(0, FIFO_SYNCHRONOUS_TB);
    end

    // CLK PERIOD
    localparam CLKPERIOD = 20;

    // CLK
    always begin
        #(CLKPERIOD/2) CLK = ~CLK;
    end

    // INITIALIZE TESTBENCH
    initial begin

        // OPEN VECTOR FILE - THROW AWAY FIRST LINE
        FD=$fopen("fifo_synchronous_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b %b %b %b %b", COMMENT, RST, PUSH, FULLEXP, DATA_IN, POP, EMPTYEXP, DATA_OUTEXP);
        CLK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                 | TIME(ns) | RST | PUSH | FULL | DATA_IN  | POP | EMPTY | DATA_OUT |");
        $display("                 ----------------------------------------------------------------");
        // $monitor("%4d  %10s | %8d |  %1b  |  %1b   |  %1b   | %1b |  %1b  |   %1b   | %1b |",
        //           VECTORCOUNT, COMMENT, $time, RST, WE, FULL, DATA_IN, RE, EMPTY, DATA_OUT);

    end

    // APPLY TEST VECTORS ON NEG EDGE CLK (ADD DELAY)
    always @(negedge CLK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b %b %b %b %b", COMMENT, RST, PUSH, FULLEXP, DATA_IN, POP, EMPTYEXP, DATA_OUTEXP);

        // CHECK IF EOF - PRINT SUMMARY, CLOSE VECTOR FILE AND FINISH TB
        if (COUNT == -1) begin
            $fclose(FD);
            $display();
            $display(" VECTORS: %4d", VECTORCOUNT);
            $display("  ERRORS: %4d", ERRORS);
            $display();
            $display("TEST END ----------------------------------");
            $display();
            $finish;
        end

        // GET ANOTHER VECTOR
        VECTORCOUNT = VECTORCOUNT + 1;

    end

    // CHECK TEST VECTORS ON POS EGDE CLK
    always @(posedge CLK) begin

        // WAIT A BIT
        #5;

        // DISPLAY OUTPUT ON POS EDGE CLK
        $display("%4d  %10s | %8d |  %1b  |  %1b   |  %1b   | %1b |  %1b  |   %1b   | %1b |",
                  VECTORCOUNT, COMMENT, $time, RST, PUSH, FULL, DATA_IN, POP, EMPTY, DATA_OUT);

        // CHECK EACH VECTOR RESULT
        if ((FULL !== FULLEXP) | (DATA_OUT !== DATA_OUTEXP) |(EMPTY !== EMPTYEXP)) begin
            $display("***ERROR - Expected FULL=%b, DATA_OUT=%b, EMPTY=%b", FULLEXP, DATA_OUTEXP, EMPTYEXP);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
