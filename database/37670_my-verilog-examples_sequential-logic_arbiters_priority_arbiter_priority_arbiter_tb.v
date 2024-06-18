// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 1ns

// include files in priority-arbiter.vh

module PRIORITY_ARBITER_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg             CLK, RST;
    reg             REQ_0, REQ_1, REQ_2;
    wire            GNT_0, GNT_1, GNT_2;

    // FOR TESTING  
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg             GNT_2EXP, GNT_1EXP, GNT_0EXP;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;


        // UNIT UNDER TEST (behavioral)
    priority_arbiter_behavioral UUT_priority_arbiter_behavioral(
        .clk(CLK),
        .rst(RST),
        .req_0(REQ_0),
        .req_1(REQ_1),
        .req_2(REQ_2),
        .gnt_0(GNT_0),
        .gnt_1(GNT_1),
        .gnt_2(GNT_2)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("priority_arbiter_tb.vcd");
        $dumpvars(0, PRIORITY_ARBITER_TB);
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
        FD=$fopen("priority_arbiter_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b %b %b %b %b", COMMENT, RST, REQ_2, REQ_1, REQ_0, GNT_2EXP, GNT_1EXP, GNT_0EXP);
        CLK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                 | TIME(ns) | RST | REQ_2 | REQ_1 | REQ_0 | GNT_2EXP | GNT_1EXP | GNT_0EXP |");
        $display("                 ---------------------------------------------------------------------------");
        // $monitor("%4d  %10s | %8d |  %1d  |   %1d   |   %1d   |   %1d   |    %1d     |    %1d     |    %1d     |",
        //           VECTORCOUNT, COMMENT, $time, RST, REQ_2, REQ_1, REQ_0, GNT_2, GNT_1, GNT_0);

    end

    // APPLY TEST VECTORS ON NEG EDGE CLK (ADD DELAY)
    always @(negedge CLK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b %b %b %b %b", COMMENT, RST, REQ_2, REQ_1, REQ_0, GNT_2EXP, GNT_1EXP, GNT_0EXP);

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
        $display("%4d  %10s | %8d |  %1d  |   %1d   |   %1d   |   %1d   |    %1d     |    %1d     |    %1d     |",
                  VECTORCOUNT, COMMENT, $time, RST, REQ_2, REQ_1, REQ_0, GNT_2, GNT_1, GNT_0);

        // CHECK EACH VECTOR RESULT
        if ((GNT_2 !== GNT_2EXP) | (GNT_1 !== GNT_1EXP) | (GNT_0 !== GNT_0EXP)) begin
            $display("***ERROR (behavioral) - Expected GNT_2=%1b, GNT_1=%1b, GNT_0=%1b", GNT_2EXP, GNT_1EXP, GNT_0EXP);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
