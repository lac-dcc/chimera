// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files in single_port_ram_synchronous.vh

module SINGLE_PORT_RAM_SYNCHRONOUS_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg             CLK;
    reg             WE;
    reg  [3:0]      ADDR;
    reg  [7:0]      DATA_IN;
    wire [7:0]      DATA_OUT;
  
    // FOR TESTING  
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg [7:0]       DATA_OUTEXP;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST
    single_port_ram_synchronous_behavioral UUT_single_port_ram_synchronous_behavioral(
        .clk (CLK),
        .we (WE),
        .addr (ADDR),
        .data_in (DATA_IN),
        .data_out (DATA_OUT)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("single_port_ram_synchronous_tb.vcd");
        $dumpvars(0, SINGLE_PORT_RAM_SYNCHRONOUS_TB);
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
        FD=$fopen("single_port_ram_synchronous_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b %b", COMMENT, WE, ADDR, DATA_IN, DATA_OUTEXP);
        CLK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                 | TIME(ns) | WE | ADDR | DATA_IN  | DATA_OUT |");
        $display("                 ----------------------------------------------");
        // $monitor("%4d  %10s | %8d | %1b | %1b  | %1b | %1b |", VECTORCOUNT, COMMENT, $time, WE, ADDR, DATA_IN, DATA_OUT);

    end

    // APPLY TEST VECTORS ON NEG EDGE CLK (ADD DELAY)
    always @(negedge CLK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b %b", COMMENT, WE, ADDR, DATA_IN, DATA_OUTEXP);

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
        $display("%4d  %10s | %8d | %1b | %1b  | %1b | %1b |", VECTORCOUNT, COMMENT, $time, WE, ADDR, DATA_IN, DATA_OUT);

        // CHECK EACH VECTOR RESULT
        if (DATA_OUTEXP !== DATA_OUT) begin
            $display("***ERROR - Expected DATA_OUT=%b", DATA_OUTEXP);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
