// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files are in jk_flip_flop_pos_edge_sync_clear.vh

module JK_FLIP_FLOP_POS_EDGE_SYNC_CLEAR_TB ();

    // INPUT PROBES
    reg             CLRBAR;
    reg             J, K;

    // OUTPUT PROBES
    wire            Q_beh, QBAR_beh;

    // FOR TESTING  
    reg             CLK;
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg             QEXPECTED;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

        // UNIT UNDER TEST (behavioral)
    jk_flip_flop_pos_edge_sync_clear_behavioral UUT_jk_flip_flop_pos_edge_sync_clear_behavioral(
        .clk(CLK),
        .clrbar(CLRBAR),
        .j(J), .k(K),
        .q(Q_beh), .qbar(QBAR_beh)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("jk_flip_flop_pos_edge_sync_clear_tb.vcd");
        $dumpvars(0, JK_FLIP_FLOP_POS_EDGE_SYNC_CLEAR_TB);
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
        FD=$fopen("jk_flip_flop_pos_edge_sync_clear_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b %b", COMMENT, CLRBAR, J, K, QEXPECTED);
        CLK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                 | TIME(ns) | CLRBAR | J | K |  Q  |");
        $display("                 -----------------------------------");
        // $monitor("%4d  %10s | %8d |   %1d    | %1d | %1d |  %1d  |", VECTORCOUNT, COMMENT, $time, CLRBAR, J, K, Q_beh);

        // INIT - PUT OUTPUT IN KNOWN STATE
        // TO AVOID THE RACE CONDITION
        // NOTE: The beh model will still have X
        //#5
        //force Q_beh = 1'b0;
        //force QBAR_beh = 1'b1;
        //#26

        //release Q_beh;
        //release QBAR_beh;

    end

    // APPLY TEST VECTORS ON NEG EDGE CLK (ADD DELAY)
    always @(negedge CLK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b %b", COMMENT, CLRBAR, J, K, QEXPECTED);

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
        
        // WAIT A BIT FOR OUTPUT TO SETTLE
        #12;

        // DISPLAY OUTPUT ON POS EDGE CLK
        $display("%4d  %10s | %8d |   %1d    | %1d | %1d |  %1d  |", VECTORCOUNT, COMMENT, $time, CLRBAR, J, K, Q_beh);

        // CHECK EACH VECTOR RESULT
        if (Q_beh !== QEXPECTED) begin
            $display("***ERROR (behavioral) - Expected Q = %b", QEXPECTED);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
