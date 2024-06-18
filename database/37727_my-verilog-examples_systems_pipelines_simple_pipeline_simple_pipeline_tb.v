// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files in simple_pipeline.vh

module SIMPLE_PIPELINE_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg  [7:0]      A, B, C, D;
    reg             CLK;
    wire [7:0]      F;

    // FOR TESTING  
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg [7:0]       FEXP;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST (behavioral)
    simple_pipeline_behavioral UUT_simple_pipeline_behavioral(
        .clk(CLK),
        .a (A),
        .b (B),
        .c (C),
        .d (D),
        .f (F)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("simple_pipeline_tb.vcd");
        $dumpvars(0, SIMPLE_PIPELINE_TB);
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
        FD=$fopen("simple_pipeline_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b %b %b", COMMENT, A, B, C, D, FEXP);
        CLK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                 | TIME(ns) |    A     |    B     |    C     |    D     |    F     |");
        $display("                 -------------------------------------------------------------------");
        // $monitor("%4d  %10s | %8d | %1b | %1b | %1b | %1b | %1b |", VECTORCOUNT, COMMENT, $time, A, B, C, D, F);

    end

    // APPLY TEST VECTORS ON NEG EDGE CLK (ADD DELAY)
    always @(negedge CLK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b %b %b", COMMENT, A, B, C, D, FEXP);

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
        $display("%4d  %10s | %8d | %1b | %1b | %1b | %1b | %1b |", VECTORCOUNT, COMMENT, $time, A, B, C, D, F);

        // CHECK EACH VECTOR RESULT
        if (F !== FEXP) begin
            $display("***ERROR (behavioral) - Expected F = %b", FEXP);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
