// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files in jeff-74x161.vh

module JEFF_74x161_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg        CLR_BAR, LD_BAR;
    reg        ENT, ENP;
    reg        CLK;
    reg        A, B, C, D;
    wire       QA, QB, QC, QD;
    wire       RCO;

    // FOR TESTING  
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg             QAEXP, QBEXP, QCEXP, QDEXP, RCOEXP;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST
    jeff_74x161 UUT_jeff_74x161(
        .clr_bar(CLR_BAR), .ld_bar(LD_BAR),
        .ent(ENT), .enp(ENP),
        .clk(CLK),
        .a(A), .b(B), .c(C), .d(D),
        .qa(QA), .qb(QB), .qc(QC), .qd(QD),
        .rco(RCO)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("jeff_74x161_tb.vcd");
        $dumpvars(0, JEFF_74x161_TB);
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
        FD=$fopen("jeff_74x161_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b %b %b %b %b %b %b %b %b %b %b", COMMENT, CLR_BAR, LD_BAR, ENT, ENP, D, C, B, A, QDEXP, QCEXP, QBEXP, QAEXP, RCOEXP);
        CLK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                 | TIME(ns) | CLR_BAR | LD_BAR | ENT | ENP | D | C | B | A | QD | QC | QB | QA | RCO |");
        $display("                 -------------------------------------------------------------------------------------");
        // $monitor("%4d  %10s | %8d |    %1d    |   %1d    |  %1d  | %1d  | %1d  | %1d | %1d | %1d | %1d  | %1d  | %1d  | %1d  | %1d   |",
        //          VECTORCOUNT, COMMENT, $time, CLR_BAR, LD_BAR, ENT, ENP, D, C, B, A, QD, QC, QB, QA, RCO);

    end

    // APPLY TEST VECTORS ON NEG EDGE CLK (ADD DELAY)
    always @(negedge CLK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b %b %b %b %b %b %b %b %b %b %b", COMMENT, CLR_BAR, LD_BAR, ENT, ENP, D, C, B, A, QDEXP, QCEXP, QBEXP, QAEXP, RCOEXP);

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
        $display("%4d  %10s | %8d |    %1d    |   %1d    |  %1d  | %1d  | %1d  | %1d | %1d | %1d | %1d  | %1d  | %1d  | %1d  | %1d   |",
                  VECTORCOUNT, COMMENT, $time, CLR_BAR, LD_BAR, ENT, ENP, D, C, B, A, QD, QC, QB, QA, RCO);

        // CHECK EACH VECTOR RESULT
        if ((QDEXP !== QD) | (QCEXP !== QC) | (QBEXP !== QB) | (QAEXP !== QA) | (RCOEXP !== RCO)) begin
            $display("***ERROR (behavioral) - Expected QD=%b QC=%b QB=%b QA=%b RCO=%b", QDEXP, QCEXP, QBEXP, QAEXP, RCOEXP);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
