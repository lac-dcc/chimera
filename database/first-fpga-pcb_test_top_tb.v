module test;

    reg clk = 0;

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,test);
        # 10000
        $finish;
    end

    top top_0(.clk(clk));
    always #1 clk = !clk;

endmodule
