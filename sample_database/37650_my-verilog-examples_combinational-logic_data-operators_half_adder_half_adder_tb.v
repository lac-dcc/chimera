// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in half_adder.vh

module HALF_ADDER_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg             A, B;
    wire            SUM_gate, SUM_data, SUM_beh;
    wire            COUT_gate, COUT_data, COUT_beh;

    // FOR TESTING  
    reg             TICK;
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg             COUTEXPECTED, SUMEXPECTED;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST (gate)
    half_adder_gate UUT_half_adder_gate(
        .a(A), .b(B),
        .sum(SUM_gate),
        .cout(COUT_gate)
    );

    // UNIT UNDER TEST (dataflow)
    half_adder_dataflow UUT_half_adder_dataflow(
        .a(A), .b(B),
        .sum(SUM_data),
        .cout(COUT_data)
    );

    // UNIT UNDER TEST (behavioral)
    half_adder_behavioral UUT_half_adder_behavioral(
        .a(A), .b(B),
        .sum(SUM_beh),
        .cout(COUT_beh)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("half_adder_tb.vcd");
        $dumpvars(0, HALF_ADDER_TB);
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
        FD=$fopen("half_adder_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b %b", COMMENT, A, B, SUMEXPECTED, COUTEXPECTED);
        TICK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                                      GATE -----   DATA -----   BEH ------");
        $display("                 | TIME(ns) | A | B | SUM | COUT | SUM | COUT | SUM | COUT |");
        $display("                 -----------------------------------------------------------");
        // $monitor("%4d  %10s | %8d | %1d | %1d |  %1d   |  %1d  |  %1d   |  %1d  |  %1d   |  %1d  |", VECTORCOUNT, COMMENT, $time, A, B, SUM_gate, COUT_gate, SUM_data, COUT_data, SUM_beh, SUM_beh);

    end

    // APPLY TEST VECTORS ON NEG EDGE TICK (ADD DELAY)
    always @(negedge TICK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b %b", COMMENT, A, B, SUMEXPECTED, COUTEXPECTED);

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
        $display("%4d  %10s | %8d | %1d | %1d |  %1d   |  %1d  |  %1d   |  %1d  |  %1d   |  %1d  |", VECTORCOUNT, COMMENT, $time, A, B, SUM_gate, COUT_gate, SUM_data, COUT_data, SUM_beh, SUM_beh);

        // CHECK EACH VECTOR RESULT
        if ((SUM_gate !== SUMEXPECTED) | (COUT_gate !== COUTEXPECTED)) begin
            $display("***ERROR (gate) - Expected SUM=%b COUT=%b", SUMEXPECTED, COUTEXPECTED);
            ERRORS = ERRORS + 1;
        end
        if ((SUM_data !== SUMEXPECTED) | (COUT_data !== COUTEXPECTED)) begin
            $display("***ERROR (dataflow) - Expected SUM=%b COUT=%b", SUMEXPECTED, COUTEXPECTED);
            ERRORS = ERRORS + 1;
        end
        if ((SUM_beh !== SUMEXPECTED) | (COUT_beh !== COUTEXPECTED)) begin
            $display("***ERROR (behavioral) - Expected SUM=%b COUT=%b", SUMEXPECTED, COUTEXPECTED);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
