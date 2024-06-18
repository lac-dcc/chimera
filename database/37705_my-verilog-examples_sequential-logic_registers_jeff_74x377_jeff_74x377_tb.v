// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files in jeff-74x377.vh

module JEFF_74x377_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg        CLK;
    reg        EN_BAR;
    reg        D7, D6, D5, D4, D3, D2, D1, D0;
    wire       Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0;

    // FOR TESTING  
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg             Q7EXP, Q6EXP, Q5EXP, Q4EXP, Q3EXP, Q2EXP, Q1EXP, Q0EXP;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST
    jeff_74x377_structural UUT_jeff_74x377_structural(
        .clk(CLK),
        .en_bar(EN_BAR),
        .d7(D7), .d6(D6), .d5(D5), .d4(D4), .d3(D3), .d2(D2), .d1(D1), .d0(D0),   
        .q7(Q7), .q6(Q6), .q5(Q5), .q4(Q4), .q3(Q3), .q2(Q2), .q1(Q1), .q0(Q0)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("jeff_74x377_tb.vcd");
        $dumpvars(0, JEFF_74x377_TB);
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
        FD=$fopen("jeff_74x377_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b",
                        COMMENT, EN_BAR, D7, D6, D5, D4, D3, D2, D1, D0, Q7EXP, Q6EXP, Q5EXP, Q4EXP, Q3EXP, Q2EXP, Q1EXP, Q0EXP);
        CLK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                 | TIME(ns) | EN_BAR | D7 D6 D5 D4 D3 D2 D1 D0 | Q7 Q6 Q5 Q4 Q3 Q2 Q1 Q0 |");
        $display("                 -------------------------------------------------------------------------");
        // $monitor("%4d  %10s | %8d |   %1b    | %1b  %1b  %1b  %1b  %1b  %1b  %1b  %1b  | %1b  %1b  %1b  %1b  %1b  %1b  %1b  %1b  |",
        //           VECTORCOUNT, COMMENT, $time, EN_BAR, D7, D6, D5, D4, D3, D2, D1, D0, Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0);

    end

    // APPLY TEST VECTORS ON NEG EDGE CLK (ADD DELAY)
    always @(negedge CLK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b",
                        COMMENT, EN_BAR, D7, D6, D5, D4, D3, D2, D1, D0, Q7EXP, Q6EXP, Q5EXP, Q4EXP, Q3EXP, Q2EXP, Q1EXP, Q0EXP);

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
        $display("%4d  %10s | %8d |   %1b    | %1b  %1b  %1b  %1b  %1b  %1b  %1b  %1b  | %1b  %1b  %1b  %1b  %1b  %1b  %1b  %1b  |",
                  VECTORCOUNT, COMMENT, $time, EN_BAR, D7, D6, D5, D4, D3, D2, D1, D0, Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0);

        // CHECK EACH VECTOR RESULT
        if ((Q7EXP !== Q7) | (Q6EXP !== Q6) | (Q5EXP !== Q5) | (Q4EXP !== Q4) | (Q3EXP !== Q3) | (Q2EXP !== Q2) | (Q1EXP !== Q1) | (Q0EXP !== Q0)) begin
            $display("***ERROR (behavioral) - Expected Q7=%b, Q6=%b, Q5=%b, Q4=%b, Q3=%b, Q2=%b, Q1=%b, Q0=%b", Q7EXP, Q6EXP, Q5EXP, Q4EXP, Q3EXP, Q2EXP, Q1EXP, Q0EXP);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
