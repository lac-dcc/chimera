// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// include files in dual_port_ram_synchronous.vh

module DUAL_PORT_RAM_SYNCHRONOUS_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg             CLK;
    reg             WE_A, WE_B;
    reg  [3:0]      ADDR_A, ADDR_B;
    reg  [7:0]      DATA_IN_A, DATA_IN_B;
    wire [7:0]      DATA_OUT_A, DATA_OUT_B;
  
    // FOR TESTING  
    reg [31:0]      VECTORCOUNT, ERRORS;
    reg [7:0]       DATA_OUTEXP_A, DATA_OUTEXP_B;
    integer         FD, COUNT;
    reg [8*32-1:0]  COMMENT;

    // UNIT UNDER TEST
    dual_port_ram_synchronous_behavioral UUT_dual_port_ram_synchronous_behavioral(
        .clk (CLK),
        .we_A (WE_A), .we_B (WE_B),
        .addr_A (ADDR_A), .addr_B (ADDR_B),
        .data_in_A (DATA_IN_A), .data_in_B (DATA_IN_B),
        .data_out_A (DATA_OUT_A), .data_out_B (DATA_OUT_B)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("dual_port_ram_synchronous_tb.vcd");
        $dumpvars(0, DUAL_PORT_RAM_SYNCHRONOUS_TB);
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
        FD=$fopen("dual_port_ram_synchronous_tb.tv","r");
        COUNT = $fscanf(FD, "%s", COMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        COUNT = $fscanf(FD, "%s %b %b %b %b %b %b %b %b", COMMENT, WE_A, ADDR_A, DATA_IN_A, DATA_OUTEXP_A, WE_B, ADDR_B, DATA_IN_B, DATA_OUTEXP_B);
        CLK = 0;
        VECTORCOUNT = 1;
        ERRORS = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                 | TIME(ns) | WE_A | ADDR_A | DATA_IN_A | DATA_OUT_A | WE_B | ADDR_B | DATA_IN_B | DATA_OUT_B |");
        $display("                 ----------------------------------------------------------------------------------------------");
        // $monitor("%4d  %10s | %8d |  %1b   |  %1b  | %1b  |  %1b  |  %1b   |  %1b  | %1b  |  %1b  |", VECTORCOUNT, COMMENT, $time,
        //          WE_A, ADDR_A, DATA_IN_A, DATA_OUT_A, WE_B, ADDR_B, DATA_IN_B, DATA_OUT_B);

    end

    // APPLY TEST VECTORS ON NEG EDGE CLK (ADD DELAY)
    always @(negedge CLK) begin

        // WAIT A BIT (AFTER CHECK)
        #5;

        // GET VECTORS FROM TB FILE
        COUNT = $fscanf(FD, "%s %b %b %b %b %b %b %b %b", COMMENT, WE_A, ADDR_A, DATA_IN_A, DATA_OUTEXP_A, WE_B, ADDR_B, DATA_IN_B, DATA_OUTEXP_B);

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
        $display("%4d  %10s | %8d |  %1b   |  %1b  | %1b  |  %1b  |  %1b   |  %1b  | %1b  |  %1b  |", VECTORCOUNT, COMMENT, $time,
                  WE_A, ADDR_A, DATA_IN_A, DATA_OUT_A, WE_B, ADDR_B, DATA_IN_B, DATA_OUT_B);

        // CHECK EACH VECTOR RESULT
        if ((DATA_OUTEXP_A !== DATA_OUT_A) | (DATA_OUTEXP_B !== DATA_OUT_B)) begin
            $display("***ERROR - Expected DATA_OUT_A=%b DATA_OUT_B=%b", DATA_OUTEXP_A, DATA_OUTEXP_B);
            ERRORS = ERRORS + 1;
        end

    end   

endmodule
