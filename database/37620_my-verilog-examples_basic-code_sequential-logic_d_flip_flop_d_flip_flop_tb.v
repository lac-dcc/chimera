// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in d_flip_flop.vh

module D_FLIP_FLOP_TB ();

    // INPUT PROBES
    reg             D;

    // OUTPUT PROBES
    wire            Q_gate, QBAR_gate;
    wire            Q_data, QBAR_data;
    wire            Q_beh, QBAR_beh;

    // FOR TESTING  
    reg             CLK;
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg             QEXPECTED;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST (gate)
    d_flip_flop_gate UUT_d_flip_flop_gate(
        .clk(CLK),
        .d(D),
        .q(Q_gate), .qbar(QBAR_gate)
    );

    // UNIT UNDER TEST (dataflow)
    d_flip_flop_dataflow UUT_d_flip_flop_dataflow(
        .clk(CLK),
        .d(D),
        .q(Q_data), .qbar(QBAR_data)
    );

        // UNIT UNDER TEST (behavioral)
    d_flip_flop_behavioral UUT_d_flip_flop_behavioral(
        .clk(CLK),
        .d(D),
        .q(Q_beh), .qbar(QBAR_beh)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("d_flip_flop_tb.vcd");
        $dumpvars(0, D_FLIP_FLOP_TB);
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
        FD=$fopen("d_flip_flop_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b", COMMENT, D, QEXPECTED);
        CLK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                                 GATE  DATA   BEH");
        $display("                 | TIME(ns) | D |  Q  |  Q  |  Q  |");
        $display("                 ----------------------------------");
        // $monitor("%4d  %10s | %8d | %1d |  %1d  |  %1d  |  %1d  |", VECTORCOUNT, COMMENT, $time, D, Q_gate, Q_data, Q_beh);

    end

    // APPLY TEST VECTORS ON NEG EDGE CLK (ADD DELAY)
    always @(negedge CLK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b", COMMENT, D, QEXPECTED);

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
        $display("%4d  %10s | %8d | %1d |  %1d  |  %1d  |  %1d  |", VECTORCOUNT, COMMENT, $time, D, Q_gate, Q_data, Q_beh);

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
