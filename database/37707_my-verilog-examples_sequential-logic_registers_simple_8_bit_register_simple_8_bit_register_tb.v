// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files in simple_8_bit_register.vh

module SIMPLE_8_BIT_REGISTER_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg  [7:0]      DATA_IN;
    reg             CLK;
    reg             LD_BAR;
    reg             CLR_BAR;
    wire [7:0]      DATA_OUT;

    // FOR TESTING  
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg [7:0]       DATA_OUTEXP;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;


    // UNIT UNDER TEST
    simple_8_bit_register_behavioral uut(
        .data_in (DATA_IN),
        .clk(CLK),
        .ld_bar(LD_BAR),
        .clr_bar(CLR_BAR),
        .data_out(DATA_OUT)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("simple_8_bit_register_tb.vcd");
        $dumpvars(0, SIMPLE_8_BIT_REGISTER_TB);
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
        FD=$fopen("simple_8_bit_register_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b %b", COMMENT, LD_BAR, CLR_BAR, DATA_IN, DATA_OUTEXP);
        CLK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                 | TIME(ns) | LD_BAR | CLR_BAR | DATA_IN  | DATA_OUT |");
        $display("                 -----------------------------------------------------");
        // $monitor("%4d  %10s | %8d |   %1b    |    %1b    | %1b | %1b |", VECTORCOUNT, COMMENT, $time, LD_BAR, CLR_BAR, DATA_IN, DATA_OUT);

    end

    // APPLY TEST VECTORS ON NEG EDGE CLK (ADD DELAY)
    always @(negedge CLK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b %b", COMMENT, LD_BAR, CLR_BAR, DATA_IN, DATA_OUTEXP);

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
        $display("%4d  %10s | %8d |   %1b    |    %1b    | %1b | %1b |", VECTORCOUNT, COMMENT, $time, LD_BAR, CLR_BAR, DATA_IN, DATA_OUT);

        // CHECK EACH VECTOR RESULT
        if (DATA_OUTEXP !== DATA_OUT) begin
            $display("***ERROR (behavioral) - Expected DATA_OUT=%b", DATA_OUTEXP);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
