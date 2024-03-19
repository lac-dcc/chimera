`timescale 1 ns / 100 ps

module testbench;

    reg  clk, rst_n;
    reg  [3:0] d;
    wire [3:0] q;

    dff_async_rst_n_param #(.WIDTH(4), .RESET(4'ha)) dff_async_rst_n_param (clk, rst_n, d, q);
    
    initial $dumpvars;

    initial
    begin
        rst_n = 1;
        clk   = 1;
        
        $monitor ("%0d clk %b d %b q %b", $time, clk, d, q);

        # 20;   clk = 0; d = 4'h0; rst_n = 0;
        # 20;   clk = 1; d = 4'h1; 
        # 20;   clk = 0; d = 4'h2;
        # 20;   clk = 1; d = 4'h3;
        # 20;   clk = 0; d = 4'h4; rst_n = 1;
        # 20;   clk = 1; d = 4'h5;
        # 20;   clk = 0; d = 4'h6;
        # 20;   clk = 1; d = 4'h7; 
        # 10;   clk = 1; d = 4'h8; 
        # 10;   clk = 0; d = 4'h9;
        # 10;   clk = 0; d = 4'ha; 
        # 10;   clk = 1; d = 4'hb; 
        # 10;   clk = 1; d = 4'hc; rst_n = 0;
        # 10;   clk = 0; d = 4'hd;
        # 10;   clk = 0; d = 4'he;
        # 10;   clk = 1; d = 4'hf;
        # 10;   clk = 1; d = 4'h0;
        # 20;

        $finish;
    end

endmodule
