// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files in left_shift_register.vh

module LEFT_SHIFT_REGISTER_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg             CLK;
    reg             RST;
    reg             D;
    wire [3:0]      OUT;

    // FOR TESTING  
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg [3:0]       OUTEXP;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST (behavioral)
    left_shift_register_behavioral UUT_left_shift_register_behavioral(
        .clk(CLK),
        .rst(RST),
        .d(D),
        .out(OUT)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("left_shift_register_tb.vcd");
        $dumpvars(0, LEFT_SHIFT_REGISTER_TB);
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
        FD=$fopen("left_shift_register_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b", COMMENT, RST, D, OUTEXP);
        CLK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                 | TIME(ns) | RST | D | OUT  |");
        $display("                 -----------------------------");
        // $monitor("%4d  %10s | %8d | %b   | %1b | %1b |", VECTORCOUNT, COMMENT, $time, RST, D, OUT);

    end

    // APPLY TEST VECTORS ON NEG EDGE CLK (ADD DELAY)
    always @(negedge CLK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b", COMMENT, RST, D, OUTEXP);

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
        $display("%4d  %10s | %8d | %b   | %1b | %1b |", VECTORCOUNT, COMMENT, $time, RST, D, OUT);

        // CHECK EACH VECTOR RESULT
        if (OUT !== OUTEXP) begin
            $display("***ERROR (behavioral) - Expected OUT = %b", OUTEXP);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
