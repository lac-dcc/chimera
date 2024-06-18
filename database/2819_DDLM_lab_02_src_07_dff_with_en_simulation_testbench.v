// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

`timescale 1 ns / 100 ps

module testbench;

    reg  clk, en, d;
    wire q;

    dff_with_en dff_with_en (clk, en, d, q);
    
    initial $dumpvars;

    initial
    begin
        en = 0;
        
        $monitor ("%0d clk %b d %b q %b", $time, clk, d, q);

        # 20;   clk = 0; d = 0; 
        # 20;   clk = 1; d = 0; 
        # 20;   clk = 0; d = 1;
        # 20;   clk = 1; d = 1;
        # 20;   clk = 0; d = 1; en = 1;
        # 20;   clk = 1; d = 1;
        # 20;   clk = 0; d = 0;
        # 20;   clk = 1; d = 0; 
        # 10;   clk = 1; d = 0; 
        # 10;   clk = 0; d = 0;
        # 10;   clk = 0; d = 1; 
        # 10;   clk = 1; d = 1; 
        # 10;   clk = 1; d = 1; en = 0;
        # 10;   clk = 0; d = 1;
        # 10;   clk = 0; d = 1;
        # 10;   clk = 1; d = 1;
        # 10;   clk = 1; d = 0;
        # 20;

        $finish;
    end

endmodule
