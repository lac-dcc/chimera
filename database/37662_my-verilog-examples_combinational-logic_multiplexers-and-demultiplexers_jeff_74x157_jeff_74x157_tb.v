// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in jeff_74x157.vh

module JEFF_74x157_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg  [3:0]      A, B;
    reg             S;
    reg             EN;
    wire [3:0]      Y;

    // FOR TESTING  
    reg             TICK;
    reg  [31:0]     VECTORCOUNT, ERRORS;
    reg  [3:0]      YEXPECTED;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST (behavioral)
    jeff_74x157_behavioral UUT_jeff_74x157_behavioral(
        .a(A), .b(B),
        .s(S),
        .en(EN),
        .y(Y)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("jeff_74x157_tb.vcd");
        $dumpvars(0, JEFF_74x157_TB);
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
        FD=$fopen("jeff_74x157_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b %b %b", COMMENT, EN, S, A, B, YEXPECTED);
        TICK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                 | TIME(ns) | EN | S |  A   |  B   |  Y   |");
        $display("                 ------------------------------------------");
        // $monitor("%4d  %10s | %8d | %1b  | %1b | %1b | %1b | %1b |", VECTORCOUNT, COMMENT, $time, EN, S, A, B, Y);

    end

    // APPLY TEST VECTORS ON NEG EDGE TICK (ADD DELAY)
    always @(negedge TICK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b %b %b", COMMENT, EN, S, A, B, YEXPECTED);

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
        $display("%4d  %10s | %8d | %1b  | %1b | %1b | %1b | %1b |", VECTORCOUNT, COMMENT, $time, EN, S, A, B, Y);

        // CHECK EACH VECTOR RESULT
        if (Y !== YEXPECTED) begin
            $display("***ERROR (behavioral) - Expected Y = %b", YEXPECTED);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
