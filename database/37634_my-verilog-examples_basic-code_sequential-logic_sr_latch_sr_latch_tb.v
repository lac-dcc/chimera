// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in sr_latch.vh

module SR_LATCH_TB ();

    // INPUT PROBES
    reg             S, R;

    // OUTPUT PROBES
    wire            Q_gate, QBAR_gate;
    wire            Q_data, QBAR_data;
    wire            Q_beh, QBAR_beh;

    // FOR TESTING  
    reg             TICK;
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg             QEXPECTED;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST (gate)
    sr_latch_gate UUT_sr_latch_gate(
        .s(S), .r(R),
        .q(Q_gate), .qbar(QBAR_gate)
    );

    // UNIT UNDER TEST (dataflow)
    sr_latch_dataflow UUT_sr_latch_dataflow(
        .s(S), .r(R),
        .q(Q_data), .qbar(QBAR_data)
    );

        // UNIT UNDER TEST (behavioral)
    sr_latch_behavioral UUT_sr_latch_behavioral(
        .s(S), .r(R),
        .q(Q_beh), .qbar(QBAR_beh)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("sr_latch_tb.vcd");
        $dumpvars(0, SR_LATCH_TB);
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
        FD=$fopen("sr_latch_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b", COMMENT, S, R, QEXPECTED);
        TICK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                                     GATE  DATA   BEH");
        $display("                 | TIME(ns) | S | R |  Q  |  Q  |  Q  |");
        $display("                 --------------------------------------");
        // $monitor("%4d  %10s | %8d | %1d | %1d |  %1d  |  %1d  |  %1d  |", VECTORCOUNT, COMMENT, $time, S, R, Q_gate, Q_data, Q_beh);

    end

    // APPLY TEST VECTORS ON NEG EDGE TICK (ADD DELAY)
    always @(negedge TICK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b", COMMENT, S, R, QEXPECTED);

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

        // DISPLAY OUTPUT ON POS EDGE CLK
        $display("%4d  %10s | %8d | %1d | %1d |  %1d  |  %1d  |  %1d  |", VECTORCOUNT, COMMENT, $time, S, R, Q_gate, Q_data, Q_beh);

        // CHECK EACH VECTOR RESULT
        if (Q_gate !== QEXPECTED) begin
            $display("***ERROR (gate) - Expected Q = %b", QEXPECTED);
            ERRORS = ERRORS + 1;
        end
        if (Q_data !== QEXPECTED) begin
            $display("***ERROR (dataflow) - Expected Q = %b", QEXPECTED);
            ERRORS = ERRORS + 1;
        end
        if (Q_beh !== QEXPECTED) begin
            $display("***ERROR (behavioral) - Expected Q = %b", QEXPECTED);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
