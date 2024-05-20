// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_t_flip_flop();

    reg clk, reset, t;
    wire q;

    t_flip_flop flipflop_tb (.clk(clk), .reset(reset), .t(t), .q(q));

    initial begin
        $dumpfile("tb_t_flip_flop.vcd");
        $dumpvars(0, tb_t_flip_flop);

        clk = 0;
        reset = 1;
        t = 0;
        #10 reset = 0;

        // Test case 1: T=0
        #10 t = 0;
        #5;
        // Expected output: 0

        // Test case 2: T=1
        #10 t = 1;
        #5;
        // Expected output: 1

        // Test case 3: T=0
        #10 t = 0;
        #5;
        // Expected output: 1 (unchanged)

        // Test case 4: T=1
        #10 t = 1;
        #5;
        // Expected output: 0 (flipped)

        // Test case 5: T=1
        #10 t = 1;
        #5;
        // Expected output: 1 (flipped again)

        $finish;
    end

    always #5 clk = ~clk;

endmodule