// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module tb;

    localparam n = 30;

    reg         clk;
    reg         rst;
    wire  [3:0] data;
    wire        en;

    reg   [7:0] gap_from;
    reg   [7:0] gap_to;

    wire  [3:0] expected;
    wire        failure;

    tb_sender sender (clk, rst, data, en, gap_from, gap_to);
    tb_receiver receiver (clk, rst, en, data, expected, failure);

    initial
    begin
        clk = 0;

        forever
            # 10 clk = ! clk;
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
