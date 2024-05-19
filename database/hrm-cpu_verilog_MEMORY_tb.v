// This program was cloned from: https://github.com/adumont/hrm-cpu
// License: GNU General Public License v3.0

`default_nettype none

`ifndef ROMFILE
`define ROMFILE "dummy_ram.hex"
`endif

module MEMORY_tb;

    reg  [7:0] ADDR = 8'b00000000;
    reg        clk  = 0;
    reg  [7:0] R    = 8'b00000000;
    reg        srcA = 0;
    reg        wM   = 0;
    reg        wAR  = 0;

    wire [7:0] M;

    // Instanciate UUT
    MEMORY MEMORY0 (
        .ADDR(ADDR),
        .clk(clk),
        .R(R),
        .srcA(srcA),
        .wM(wM),
        .wAR(wAR),
        .M(M)
    );
    defparam MEMORY0.ROMFILE = `ROMFILE;


    // Simulate clock
    //always #1 clk = ~clk;

    // Start simulation
    initial begin

        $dumpfile("MEMORY_tb.vcd");
        $dumpvars(0, MEMORY_tb);

        #1  ADDR = 8'h01;
            R    = 8'h02;
            wAR  = 1;
        #1  clk  = 1; // posedge clk
        #1  clk  = 0; 
            wAR  = 0;
            wM   = 1;
        #1  clk  = 1; // posedge clk
        #1  clk  = 0; 
            wM   = 0;

        #1  ADDR = 8'h02;
            R    = 8'h0a;
            wAR  = 1;
            wM   = 0;
        #1  clk  = 1; // posedge clk
        #1  clk  = 0; 
            wAR  = 0;
            wM   = 1;
        #1  clk  = 1; // posedge clk
        #1  clk  = 0; 
            wM   = 0;


        #1  ADDR = 8'h01;
            R    = 8'h00;
            wAR  = 1;
        #1  clk  = 1; // posedge clk
        #1  clk  = 0; 
            wAR  = 0;
            wM   = 0;
        #1  clk  = 1; // posedge clk
        #1  clk  = 0; 
        #1  srcA = 1;
        #1  wAR  = 1;
            wM   = 0;
        #1  clk  = 1; // posedge clk
        #1  clk  = 0; 
            wAR  = 0;
            wM   = 0;


        #1  clk  = 1; // posedge clk
        #1  clk  = 0; 

        #10 $finish;
    end


endmodule
