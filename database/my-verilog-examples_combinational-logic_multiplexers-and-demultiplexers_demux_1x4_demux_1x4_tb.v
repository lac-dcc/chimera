// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in demux_1x4.vh

module DEMUX_4x1_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg             Y;
    reg [1:0]       SEL;
    wire            A, B, C, D;

    // FOR TESTING  
    reg             TICK;
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg             AEXP, BEXP, CEXP, DEXP;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST (behavioral)
    demux_1x4_behavioral UUT_demux_1x4_behavioral(
        .y(Y),
        .sel(SEL),
        .a(A), .b(B), .c(C), .d(D)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("demux_1x4_tb.vcd");
        $dumpvars(0, DEMUX_4x1_TB);
    end

    // TICK PERIOD
    localparam TICKPERIOD = 20;

    // TICK
    always begin
        #(TICKPERIOD/2) TICK = ~TICK;
    end

    // INITIALIZE TESTBENCH
    initial begin

        // OPEN VECTOR FILE - THROW AWAY FIRST LINE
        FD=$fopen("demux_1x4_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b %b %b %b", COMMENT, SEL, Y, AEXP, BEXP, CEXP, DEXP);
        TICK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                 | TIME(ns) | SEL | Y | A | B | C | D |");
        $display("                 --------------------------------------");
        // $monitor("%4d  %10s | %8d | %1b  | %1b | %1b | %1b | %1b | %1b |", VECTORCOUNT, COMMENT, $time, SEL, Y, A, B, C, D);

    end

    // APPLY TEST VECTORS ON NEG EDGE TICK (ADD DELAY)
    always @(negedge TICK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b %b %b %b", COMMENT, SEL, Y, AEXP, BEXP, CEXP, DEXP);

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

    // CHECK TEST VECTORS ON POS EGDE TICK
    always @(posedge TICK) begin

        // WAIT A BIT
        #5;

        // DISPLAY OUTPUT ON POS EDGE TICK
        $display("%4d  %10s | %8d | %1b  | %1b | %1b | %1b | %1b | %1b |", VECTORCOUNT, COMMENT, $time, SEL, Y, A, B, C, D);

        // CHECK EACH VECTOR RESULT
        if ((A !== AEXP) | (B !== BEXP) | (C !== CEXP) | (D !== DEXP)) begin
            $display("***ERROR (behavioral) - Expected A=%b, B=%b, C=%b, D=%b", AEXP, BEXP, CEXP, DEXP);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
