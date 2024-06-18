// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License


module tb;

    localparam n = 50;

    reg         clk;
    reg         rst;
    wire  [3:0] data;
    wire        en;
    reg   [7:0] gap_from;
    reg   [7:0] gap_to;

    reg         f_clk;
    wire  [3:0] f_expected;
    wire        f_failure;

    reg         s_clk;
    wire  [3:0] s_expected;
    wire        s_failure;

    tb_sender   sender        (clk, rst, data, en, gap_from, gap_to);
    tb_receiver fast_receiver (f_clk, rst, en, data, f_expected, f_failure);
    tb_receiver slow_receiver (s_clk, rst, en, data, s_expected, s_failure);

    initial
    begin
        clk = 0;

        forever
            # 10 clk = ! clk;
    end

    initial
    begin
        f_clk = 0;

        forever
            # 9 f_clk = ! f_clk;
    end

    initial
    begin
        s_clk = 0;

        forever
            # 11 s_clk = ! s_clk;
    end

    initial
    begin
        rst <= 1;
        repeat (2) @ (posedge clk);
        rst <= 0;
    end

    initial
    begin
        $dumpvars;

        gap_from <= 0;
        gap_to   <= 0;

        @ (negedge rst);

        // Slow sender

        gap_from <= 5;
        gap_to   <= 5;

        repeat (n) @ (posedge clk);

        // Fast sender

        gap_from <= 0;
        gap_to   <= 0;

        repeat (n) @ (posedge clk);

        // Random sender

        gap_from <= 0;
        gap_to   <= 10;

        repeat (n) @ (posedge clk);

        `ifdef MODEL_TECH  // Mentor ModelSim and Questa
            $stop;
        `else
            $finish;
        `endif
    end

endmodule
