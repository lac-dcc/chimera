// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 psPUSHVECTORCOUNT

// include files in fifo_asynchronous.vh

module FIFO_ASYNCHRONOUS_TB;

    // DATA TYPES - DECLARE REGISTERS AND WIRES (PROBES)
    reg             WCLK, RCLK;
    reg             WRST, RRST;
    reg  [7:0]      DATA_IN;
    reg             PUSH;
    wire            FULL;
    wire [7:0]      DATA_OUT;
    reg             POP;
    wire            EMPTY;

    // FOR TESTING  
    reg [31:0]      PUSHVECTORCOUNT, POPVECTORCOUNT, PUSHERRORS, POPERRORS;
    reg             FULLEXP;
    reg [7:0]       DATA_OUTEXP;
    reg             EMPTYEXP;
    integer         PUSHFD, POPFD, PUSHCOUNT, POPCOUNT;
    reg [8*32-1:0]  PUSHCOMMENT, POPCOMMENT;
    integer         PUSHEND, POPEND;

    // UNIT UNDER TEST
    fifo_asynchronous_structural UUT_fifo_asynchronous_structural (
        .wclk(WCLK),
        .rclk(RCLK),
        .wrst(WRST),
        .rrst(RRST),
        .data_in(DATA_IN),
        .push(PUSH),
        .full(FULL),
        .data_out(DATA_OUT),
        .pop(POP),
        .empty(EMPTY)
    );

    // SAVE EVERYTHING FROM TOP TB MODULE IN A DUMP FILE
    initial begin
        $dumpfile("fifo_asynchronous_tb.vcd");
        $dumpvars(0, FIFO_ASYNCHRONOUS_TB);
    end

    // CLK PERIOD
    localparam WCLKPERIOD = 20; // WRITE FASTER THAN READ
    localparam RCLKPERIOD = 18;

    // CLK
    always begin
        #(WCLKPERIOD/2) WCLK = ~WCLK;
    end
    always begin
        #(RCLKPERIOD/2) RCLK = ~RCLK;
    end

    // INITIALIZE TESTBENCH
    initial begin

        // OPEN VECTOR FILE - THROW AWAY FIRST LINE
        PUSHFD=$fopen("fifo_asynchronous_tb_push.tv","r");
        POPFD=$fopen("fifo_asynchronous_tb_pop.tv","r");
        PUSHCOUNT = $fscanf(PUSHFD, "%s", PUSHCOMMENT);
        POPCOUNT = $fscanf(POPFD, "%s", POPCOMMENT);
        // $display ("FIRST LINE IS: %s", COMMENT);

        // INIT TESTBENCH
        PUSHCOUNT = $fscanf(PUSHFD, "%s %b %b %b %b", PUSHCOMMENT, WRST, PUSH, FULLEXP, DATA_IN);
        POPCOUNT = $fscanf(POPFD, "%s %b %b %b %b", POPCOMMENT, RRST, POP, EMPTYEXP, DATA_OUTEXP);
        WCLK = 0;
        RCLK = 0;
        PUSHVECTORCOUNT = 1;
        POPVECTORCOUNT = 1;
        PUSHERRORS = 0;
        POPERRORS = 0;
        PUSHEND = 0;
        POPEND = 0;

        // DISPAY OUTPUT AND MONITOR
        $display();
        $display("TEST START --------------------------------");
        $display();
        $display("                     | TIME(ns) | WRST | RRST | PUSH | FULL | DATA_IN  | POP | EMPTY | DATA_OUT |");
        $display("                     ----------------------------------------------------------------------------");
        // $monitor("    %4d  %10s | %8d |  %1b   |  %1b   |  %1b   |  %1b   | %1b |  %1b  |   %1b   | %1b |",
        //         PUSHVECTORCOUNT, PUSHCOMMENT, $time, WRST, RRST, PUSH, FULL, DATA_IN, POP, EMPTY, DATA_OUT);
    end

    initial begin
        // WAIT FOR TEST TO FINISH
        wait (PUSHEND == 1'b1 && POPEND == 1'b1);
        $display();
        $display(" PUSHVECTORS: %4d", PUSHVECTORCOUNT);
        $display("  PUSHERRORS: %4d", PUSHERRORS);
        $display("  POPVECTORS: %4d", POPVECTORCOUNT);
        $display("   POPERRORS: %4d", POPERRORS);
        $display();
        $display("TEST END ----------------------------------");
        $display();
        $finish;
    end

    // APPLY TEST VECTORS ON NEG EDGE WCLK (ADD DELAY)
    always @(negedge WCLK) begin

        if (!PUSHEND) begin

            // WAIT A BIT (AFTER CHECK)
            #5;

            // GET VECTORS FROM TB FILE
            PUSHCOUNT = $fscanf(PUSHFD, "%s %b %b %b %b", PUSHCOMMENT, WRST, PUSH, FULLEXP, DATA_IN);

            // CHECK IF EOF - PRINT SUMMARY, CLOSE VECTOR FILE AND FINISH TB
            if (PUSHCOUNT == -1) begin
                $fclose(PUSHFD);
                PUSHEND = 1;
            end else begin
                // GET ANOTHER VECTOR
                PUSHVECTORCOUNT = PUSHVECTORCOUNT + 1;
            end

        end

    end

    // APPLY TEST VECTORS ON NEG EDGE RCLK (ADD DELAY)
    always @(negedge RCLK) begin

        if (!POPEND) begin

            // WAIT A BIT (AFTER CHECK)
            #5;

            // GET VECTORS FROM TB FILE
            POPCOUNT = $fscanf(POPFD, "%s %b %b %b %b", POPCOMMENT, RRST, POP, EMPTYEXP, DATA_OUTEXP);

            // CHECK IF EOF - PRINT SUMMARY, CLOSE VECTOR FILE AND FINISH TB
            if (POPCOUNT == -1) begin
                $fclose(POPFD);
                POPEND = 1;
            end else begin
                // GET ANOTHER VECTOR
                POPVECTORCOUNT = POPVECTORCOUNT + 1;
            end
        
        end

    end

    // CHECK TEST VECTORS ON POS EGDE WCLK
    always @(posedge WCLK) begin

        if (!PUSHEND) begin

            // WAIT A BIT
            #5;

            // DISPLAY OUTPUT ON POS EDGE WCLK
            $display ("%4d        %8s | %8d |  %1b   |      |  %1b   |  %1b   | %1b |", PUSHVECTORCOUNT, PUSHCOMMENT, $time,
                        WRST, PUSH, FULL, DATA_IN);

            // CHECK EACH VECTOR POPSULT
            if (FULL !== FULLEXP) begin
                $display("***PUSHERROR - Expected FULL=%b", FULLEXP);
                PUSHERRORS = PUSHERRORS + 1;
            end
        
        end

    end   

    // CHECK TEST VECTORS ON POS EGDE RCLK
    always @(posedge RCLK) begin
      
        if (!POPEND) begin

            // WAIT A BIT
            #5;

            // DISPLAY OUTPUT ON POS EDGE RCLK
            $display("    %4d    %8s | %8d |      |  %1b   |                        |  %1b  |   %1b   | %1b |", POPVECTORCOUNT, POPCOMMENT, $time,
                      RRST, POP, EMPTY, DATA_OUT);

            // CHECK EACH VECTOR RESULT
            if ((DATA_OUT !== DATA_OUTEXP) |(EMPTY !== EMPTYEXP)) begin
                $display("***POPERROR - Expected DATA_OUT=%b, EMPTY=%b", DATA_OUTEXP, EMPTYEXP);
                POPERRORS = POPERRORS + 1;
            end

        end

    end   

endmodule
