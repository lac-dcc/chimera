// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files in jeff_74x181.vh

module JEFF_74x181_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg  [3:0]  A, B, S;
    reg         M, CI_BAR;
    wire [3:0]  F;
    wire        CO_BAR, AEQB, X, Y;

    // FOR TESTING  
    reg             TICK;
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg [3:0]       FEXPECTED;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST (dataflow)
    jeff_74x181 UUT_jeff_74x181(
        .a3(A[3]), .a2(A[2]), .a1(A[1]), .a0(A[0]),
        .b3(B[3]), .b2(B[2]), .b1(B[1]), .b0(B[0]),
        .s3(S[3]), .s2(S[2]), .s1(S[1]), .s0(S[0]),
        .m(M), .ci_bar(CI_BAR),
        .f3(F[3]), .f2(F[2]), .f1(F[1]), .f0(F[0]),
        .co_bar(CO_BAR), .aeqb(AEQB), .x(X), .y(Y)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("jeff_74x181_tb.vcd");
        $dumpvars(0, JEFF_74x181_TB);
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
        FD=$fopen("jeff_74x181_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %4b %4b %4b %4b", COMMENT, M, CI_BAR, S, A, B, FEXPECTED);
        TICK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                       | TIME(ns) | M | CI_BAR |  S   |  A   |  B   |  F   |");
        $display("                       -----------------------------------------------------");
        // $monitor("%4d  %16s | %8d | %1b |   %1b    | %4b | %4b | %4b | %4b |", VECTORCOUNT, COMMENT, $time, M, CI_BAR, S, A, B, F);

    end

    // APPLY TEST VECTORS ON NEG EDGE TICK (ADD DELAY)
    always @(negedge TICK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %4b %4b %4b %4b", COMMENT, M, CI_BAR, S, A, B, FEXPECTED);

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
        $display("%4d  %16s | %8d | %1b |   %1b    | %4b | %4b | %4b | %4b |", VECTORCOUNT, COMMENT, $time, M, CI_BAR, S, A, B, F);

        // CHECK EACH VECTOR RESULT
        if (F !== FEXPECTED) begin
            $display("***ERROR (gate) - Expected F = %b", FEXPECTED);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule

/*

// LOGIC MODE 
// MODE = 1, CI_BAR = X 
M = 1'b1; CI_BAR = 1'b0;
      S = 4'b0000; A = 4'b1011; B= 4'b0100; // F = 0100 (4) !A
#20;  S = 4'b0001; A = 4'b1110; B= 4'b0110; // F = 0001 (1) !(A+B)
#20;  S = 4'b0010; A = 4'b0111; B= 4'b1001; // F = 1000 (8) (!A)B
#20;  S = 4'b0011; A = 4'b1010; B= 4'b0011; // F = 0000 (0) 0
#20;  S = 4'b0100; A = 4'b0100; B= 4'b1100; // F = 1011 (B) !(AB)
#20;  S = 4'b0101; A = 4'b0000; B= 4'b1011; // F = 0100 (4) !B
#20;  S = 4'b0110; A = 4'b0101; B= 4'b1000; // F = 1101 (D) A^B
#20;  S = 4'b0111; A = 4'b1001; B= 4'b0111; // F = 1000 (8) A(!B)
#20;  S = 4'b1000; A = 4'b0110; B= 4'b1000; // F = 1001 (9) !A+B
#20;  S = 4'b1001; A = 4'b0101; B= 4'b1000; // F = 0010 (2) !(A^B)
#20;  S = 4'b1010; A = 4'b1111; B= 4'b1100; // F = 1100 (C) B
#20;  S = 4'b1011; A = 4'b0011; B= 4'b0101; // F = 0001 (1) AB
#20;  S = 4'b1100; A = 4'b0011; B= 4'b0100; // F = 1111 (F) 1
#20;  S = 4'b1101; A = 4'b0001; B= 4'b0110; // F = 1001 (9) A+!B
#20;  S = 4'b1110; A = 4'b0010; B= 4'b0001; // F = 0011 (3) A+B
#20;  S = 4'b1111; A = 4'b0010; B= 4'b1010; // F = 0010 (2) A

// ARITHMETIC MODE - NO CARRY 
// MODE = 0, CI_BAR = 1
M = 1'b0; CI_BAR = 1'b1;
      S = 4'b0000; A = 4'b1001; B= 4'b0100; // F = 1001 (9) A
#20;  S = 4'b0001; A = 4'b0011; B= 4'b0110; // F = 0111 (7) A+B
#20;  S = 4'b0010; A = 4'b0011; B= 4'b1001; // F = 0111 (7) A+!B
#20;  S = 4'b0011; A = 4'b1000; B= 4'b0100; // F = 1111 (F) MINUS 1 (2's compliment)
#20;  S = 4'b0100; A = 4'b0011; B= 4'b1100; // F = 0110 (6) A PLUS A(!B)
#20;  S = 4'b0101; A = 4'b0011; B= 4'b1100; // F = 0010 (2+co_bar) (A+B) PLUS A(!B)  
#20;  S = 4'b0110; A = 4'b1011; B= 4'b0111; // F = 0011 (3+co_bar) A MINUS B MINUS 1
#20;  S = 4'b0111; A = 4'b0111; B= 4'b1011; // F = 0011 (3+co_bar) A(!B) MINUS 1
#20;  S = 4'b1000; A = 4'b0011; B= 4'b0010; // F = 0101 (5) A PLUS AB
#20;  S = 4'b1001; A = 4'b0011; B= 4'b0011; // F = 0110 (6) A PLUS B
#20;  S = 4'b1010; A = 4'b0010; B= 4'b0010; // F = 0001 (1+co_bar) (A+!B) PLUS AB
#20;  S = 4'b1011; A = 4'b1000; B= 4'b1000; // F = 0111 (7+co_bar) AB MINUS 1
#20;  S = 4'b1100; A = 4'b0011; B= 4'b0011; // F = 0110 (6) A PLUS A (each bit shifted)
#20;  S = 4'b1101; A = 4'b0100; B= 4'b0100; // F = 1000 (8) (A+B) PLUS A
#20;  S = 4'b1110; A = 4'b0101; B= 4'b1110; // F = 1010 (A) (A+!B) PLUS A
#20;  S = 4'b1111; A = 4'b1111; B= 4'b0101; // F = 1110 (E+co_bar) A MINUS 1

// ARITHMETIC MODE - WITH CARRY 
// MODE = 0, CI_BAR = 0
M = 1'b0; CI_BAR = 1'b0;
      S = 4'b0000; A = 4'b1001; B= 4'b0100; // F = 1010 (A) A PLUS 1
#20;  S = 4'b0001; A = 4'b0011; B= 4'b0110; // F = 1000 (8) A+B PLUS 1
#20;  S = 4'b0010; A = 4'b0011; B= 4'b1001; // F = 1000 (8) A+!B PLUS 1
#20;  S = 4'b0011; A = 4'b1000; B= 4'b0100; // F = 0000 (0+co_bar) ZERO
#20;  S = 4'b0100; A = 4'b0011; B= 4'b1100; // F = 0111 (7) A PLUS A(!B) PLUS 1
#20;  S = 4'b0101; A = 4'b0011; B= 4'b1100; // F = 0011 (3+co_bar) (A+B) PLUS A(!B) PLUS 1 
#20;  S = 4'b0110; A = 4'b1011; B= 4'b0111; // F = 0100 (4+co_bar) A MINUS B
#20;  S = 4'b0111; A = 4'b0111; B= 4'b1011; // F = 0100 (4+co_bar) A(!B)
#20;  S = 4'b1000; A = 4'b0011; B= 4'b0010; // F = 0110 (6) A PLUS AB PLUS 1
#20;  S = 4'b1001; A = 4'b0011; B= 4'b0011; // F = 0111 (7) A PLUS B PLUS 1
#20;  S = 4'b1010; A = 4'b0010; B= 4'b0010; // F = 0010 (2+co_bar) (A+!B) PLUS AB PLUS 1
#20;  S = 4'b1011; A = 4'b1000; B= 4'b1000; // F = 1000 (8+co_bar) AB
#20;  S = 4'b1100; A = 4'b0011; B= 4'b0011; // F = 0111 (7) A PLUS A PLUS 1 (each bit shifted)
#20;  S = 4'b1101; A = 4'b0100; B= 4'b0100; // F = 1001 (9) (A+B) PLUS A PLUS 1
#20;  S = 4'b1110; A = 4'b0101; B= 4'b1110; // F = 1011 (B) (A+!B) PLUS A PLUS 1
#20;  S = 4'b1111; A = 4'b1111; B= 4'b0101; // F = 1111 (F+co_bar) A

*/