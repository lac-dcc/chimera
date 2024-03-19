`include "reg_32bit.v"
module tb_reg32bit();

    wire [31:0] q;
    reg [31:0] d;
    reg clk, reset;
    reg_32bit register( q, d, clk, reset);

    always @(clk)
        #5 clk <= ~clk;
    
    initial
        $monitor("clk: ",clk," Reset = ", reset, " D = %b ", d, "Q = %b ",q," time = ", $time);

    initial begin
        clk = 1'b1;
        reset = 1'b0;
        #20 reset = 1'b1;
        #20 d = 32'hAFAFAFAF;
        #200 $finish;
    end

endmodule