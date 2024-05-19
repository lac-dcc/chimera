// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files in buttons.vh

module BUTTONS_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg             CLK;
    reg             PRESSED;
    wire            BUTTON1_SYNC_PUSH_RELEASE;
    wire            BUTTON2_SYNC_CLOCK_PULSE_OUT;
    wire            BUTTON3_SYNC_TWO_PRESSES_OUT;
    wire            BUTTON4_ASYNC_CLOCK_PULSE_OUT;
    wire            BUTTON5_ASYNC_TWO_PRESSES_OUT;

    // FOR TESTING  
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg             OUT1EXP, OUT2EXP, OUT3EXP, OUT4EXP, OUT5EXP;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // BUTTON 1 - UNIT UNDER TEST
    button1_sync_push_release_behavioral SYNC_PUSH_RELEASE (
        .clk(CLK),
        .pressed(PRESSED),
        .out(BUTTON1_SYNC_PUSH_RELEASE)
    );

    // BUTTON 2 - UNIT UNDER TEST
    button2_sync_clock_pulse_behavioral SYNC_CLOCK_PULSE (
        .clk(CLK),
        .pressed(PRESSED),
        .out(BUTTON2_SYNC_CLOCK_PULSE_OUT)
    );

    // BUTTON 3 - UNIT UNDER TEST
    button3_sync_two_presses_behavioral SYNC_TWO_PRESSES (
        .clk(CLK),
        .pressed(PRESSED),
        .out(BUTTON3_SYNC_TWO_PRESSES_OUT)
    );

    // BUTTON 4 - UNIT UNDER TEST
    button4_async_clock_pulse_behavioral ASYNC_CLOCK_PULSE (
        .clk(CLK),
        .pressed(PRESSED),
        .out(BUTTON4_ASYNC_CLOCK_PULSE_OUT)
    );

    // BUTTON 5 - UNIT UNDER TEST
    button5_async_two_presses_behavioral ASYNC_TWO_PRESSES (
        .clk(CLK),
        .pressed(PRESSED),
        .out(BUTTON5_ASYNC_TWO_PRESSES_OUT)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("buttons_tb.vcd");
        $dumpvars(0, BUTTONS_TB);
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
        FD=$fopen("buttons_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b %b %b %b", COMMENT, PRESSED, OUT1EXP, OUT2EXP, OUT3EXP, OUT4EXP, OUT5EXP);
        CLK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                                         1     2     3     4     5");
        $display("                 | TIME(ns) | PRESSED | OUT | OUT | OUT | OUT | OUT |");
        $display("                 ----------------------------------------------------");
        // $monitor("%4d  %10s | %8d |    %1d    |  %1d  |  %1d  |  %1d  |  %1d  |  %1d  |", VECTORCOUNT, COMMENT, $time, PRESSED,
        //           BUTTON1_SYNC_PUSH_RELEASE, BUTTON2_SYNC_CLOCK_PULSE_OUT, BUTTON3_SYNC_TWO_PRESSES_OUT, BUTTON4_ASYNC_CLOCK_PULSE_OUT, BUTTON5_ASYNC_TWO_PRESSES_OUT);

    end

    // APPLY TEST VECTORS ON NEG EDGE CLK (ADD DELAY)
    always @(negedge CLK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b %b %b %b", COMMENT, PRESSED, OUT1EXP, OUT2EXP, OUT3EXP, OUT4EXP, OUT5EXP);

        // SPECIAL QUICK PULSE TEST
        // I COULD OF DONE THIS BETTER - BUT IT'S FINE FOR NOW
        if (COMMENT == "ASYNC") begin
            PRESSED = 1;
            #5
            PRESSED = 0;
        end

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
        $display("%4d  %10s | %8d |    %1d    |  %1d  |  %1d  |  %1d  |  %1d  |  %1d  |", VECTORCOUNT, COMMENT, $time, PRESSED,
                  BUTTON1_SYNC_PUSH_RELEASE, BUTTON2_SYNC_CLOCK_PULSE_OUT, BUTTON3_SYNC_TWO_PRESSES_OUT, BUTTON4_ASYNC_CLOCK_PULSE_OUT, BUTTON5_ASYNC_TWO_PRESSES_OUT);

        // CHECK EACH VECTOR RESULT
        if (BUTTON1_SYNC_PUSH_RELEASE !== OUT1EXP) begin
            $display("***ERROR - Expected BUTTON1 = %b", OUT1EXP);
            ERRORS = ERRORS + 1;
        end
        if (BUTTON2_SYNC_CLOCK_PULSE_OUT !== OUT2EXP) begin
            $display("***ERROR - Expected BUTTON2 = %b", OUT2EXP);
            ERRORS = ERRORS + 1;
        end
        if (BUTTON3_SYNC_TWO_PRESSES_OUT !== OUT3EXP) begin
            $display("***ERROR - Expected BUTTON3 = %b", OUT3EXP);
            ERRORS = ERRORS + 1;
        end
        if (BUTTON4_ASYNC_CLOCK_PULSE_OUT !== OUT4EXP) begin
            $display("***ERROR - Expected BUTTON4 = %b", OUT4EXP);
            ERRORS = ERRORS + 1;
        end
        if (BUTTON5_ASYNC_TWO_PRESSES_OUT !== OUT5EXP) begin
            $display("***ERROR - Expected BUTTON5 = %b", OUT5EXP);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
