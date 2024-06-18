// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in jeff_74x151.vh

module JEFF_74x151_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg  [7:0]      D;
    reg  [2:0]      SEL;
    reg             EN;
    wire            Y;
    wire            W;

    // FOR TESTING  
    reg             TICK;
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg             YEXPECTED;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST (behavioral)
    jeff_74x151_behavioral UUT_jeff_74x151_behavioral(
        .d0(D[0]), .d1(D[1]), .d2(D[2]), .d3(D[3]), .d4(D[4]), .d5(D[5]), .d6(D[6]), .d7(D[7]),
        .a(SEL[0]), .b(SEL[1]), .c(SEL[2]),
        .en(EN),
        .y(Y), .w(W)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("jeff_74x151_tb.vcd");
        $dumpvars(0, JEFF_74x151_TB);
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
        FD=$fopen("jeff_74x151_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b %b", COMMENT, EN, SEL, D, YEXPECTED);
        TICK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                 | TIME(ns) | EN | SEL | D        | Y |");
        $display("                 --------------------------------------");
        // $monitor("%4d  %10s | %8d | %1b  | %1b | %1b | %1b |", VECTORCOUNT, COMMENT, $time, EN, SEL, D, Y);

    end

    // APPLY TEST VECTORS ON NEG EDGE TICK (ADD DELAY)
    always @(negedge TICK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b %b", COMMENT, EN, SEL, D, YEXPECTED);

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
        $display("%4d  %10s | %8d | %1b  | %1b | %1b | %1b |", VECTORCOUNT, COMMENT, $time, EN, SEL, D, Y);

        // CHECK EACH VECTOR RESULT
        if (Y !== YEXPECTED) begin
            $display("***ERROR (behavioral) - Expected Y = %b", YEXPECTED);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
