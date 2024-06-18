// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

`timescale 1 ns / 100 ps

module testbench;

    reg  clk, d;
    wire q;

    d_latch d_latch (clk, d, q);
    
    initial $dumpvars;

    initial
    begin
        
        
        $monitor ("%0d clk %b d %b q %b", $time, clk, d, q);

        # 20;   clk = 0; d = 0; 
        # 20;   clk = 1; d = 0;
        # 20;   clk = 0; d = 1;
        # 20;   clk = 1; d = 1;
        # 20;   clk = 0; d = 0;
        # 20;   clk = 1; d = 0;
        # 20;   clk = 0; d = 1;
        # 20;   clk = 1; d = 1;
        # 10;   clk = 1; d = 0; 
        # 10;   clk = 0; d = 0;
        # 10;   clk = 0; d = 0;
        # 10;   clk = 1; d = 0;
        # 10;   clk = 1; d = 1;
        # 10;   clk = 0; d = 1;
        # 10;   clk = 0; d = 1;
        # 10;   clk = 1; d = 1;
        # 10;   clk = 1; d = 0;
        # 20;

        $finish;
    end

endmodule
