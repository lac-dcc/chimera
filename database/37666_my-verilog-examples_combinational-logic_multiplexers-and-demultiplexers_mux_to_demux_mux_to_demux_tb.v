// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in mux_to_demux.vh

module MUX_TO_DEMUX_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg             A1, B1, C1, D1;
    reg [1:0]       SEL1;
    reg [1:0]       SEL2;
    wire            A2, B2, C2, D2;

    // FOR TESTING  
    reg             TICK;
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg             A2EXP, B2EXP, C2EXP, D2EXP;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST
    mux_to_demux_structural UUT_mux_to_demux_structural(
        .a1(A1), .b1(B1), .c1(C1), .d1(D1),
        .sel1(SEL1),
        .sel2(SEL2),
        .a2(A2), .b2(B2), .c2(C2), .d2(D2)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("mux_to_demux_tb.vcd");
        $dumpvars(0, MUX_TO_DEMUX_TB);
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
        FD=$fopen("mux_to_demux_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b %b %b %b %b %b %b %b", COMMENT, SEL1, SEL2, A1, B1, C1, D1, A2EXP, B2EXP, C2EXP, D2EXP);
        TICK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                 | TIME(ns) | SEL1 | SEL2 | A1 | B1 | C1 | D1 | A2 | B2 | C2 | D2 |");
        $display("                 ------------------------------------------------------------------");
        // $monitor("%4d  %10s | %8d |  %1b  |  %1b  | %1b  | %1b  | %1b  | %1b  | %1b  | %1b  | %1b  | %1b  |", VECTORCOUNT, COMMENT, $time, SEL1, SEL2, A1, B1, C1, D1, A2, B2, C2, D2);

    end

    // APPLY TEST VECTORS ON NEG EDGE TICK (ADD DELAY)
    always @(negedge TICK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b %b %b %b %b %b %b %b", COMMENT, SEL1, SEL2, A1, B1, C1, D1, A2EXP, B2EXP, C2EXP, D2EXP);

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
        $display("%4d  %10s | %8d |  %1b  |  %1b  | %1b  | %1b  | %1b  | %1b  | %1b  | %1b  | %1b  | %1b  |", VECTORCOUNT, COMMENT, $time, SEL1, SEL2, A1, B1, C1, D1, A2, B2, C2, D2);

        // CHECK EACH VECTOR RESULT
        if ((A2 !== A2EXP) | (B2 !== B2EXP) | (D2 !== D2EXP) | (D2 != D2EXP)) begin
            $display("***ERROR (behavioral) - Expected A=%b, B=%b, C=%b, D=%b", A2EXP, B2EXP, C2EXP, D2EXP);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
