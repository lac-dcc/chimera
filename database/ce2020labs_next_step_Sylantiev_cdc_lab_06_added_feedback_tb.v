// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module tb;

    localparam n_cycles_in_series = 1000;

    integer s_clk_period;
    integer r_clk_period;

    reg         s_clk;
    reg         rst;
    wire  [3:0] data;
    wire        s_en;
    wire        s_ack;
    reg   [7:0] s_gap_from;
    reg   [7:0] s_gap_to;

    reg         r_clk;
    wire        r_en;
    wire  [3:0] r_expected;
    wire        r_failure;

    tb_sender   sender   (s_clk, rst, data, s_en, s_ack, s_gap_from, s_gap_to);
    tb_receiver receiver (r_clk, rst, r_en, data, r_expected, r_failure);

    wire s_toggle, r_toggle;

    pulse_to_toggle       i_pulse_to_toggle         (s_clk, rst, s_en, s_toggle);
    sync2_toggle_to_pulse i_r_sync2_toggle_to_pulse (r_clk, rst, s_toggle, r_en, r_toggle);
    sync2_toggle_to_pulse i_s_sync2_toggle_to_pulse (s_clk, rst, r_toggle, s_ack, );

    initial
    begin
        s_clk = 0;

        forever
            # (s_clk_period / 2) s_clk = ! s_clk;
    end

    initial
    begin
        r_clk = 0;

        forever
            # (r_clk_period / 2) r_clk = ! r_clk;
    end

    task run_series;
    begin
        rst <= 1;
        repeat (10) @ (posedge s_clk);
        rst <= 0;
        repeat (n_cycles_in_series) @ (posedge s_clk);
    end
    endtask

    task test_for_receiver_clock_period (input [31:0] period);
    begin
        r_clk_period = period;

        // Slow sender

        s_gap_from <= 5;
        s_gap_to   <= 5;

        run_series;

        // Fast sender

        s_gap_from <= 0;
        s_gap_to   <= 0;

        run_series;

        // Random sender

        s_gap_from <= 0;
        s_gap_to   <= 10;

        run_series;
    end
    endtask

    initial
    begin
        $dumpvars;

        s_clk_period = 20;

        test_for_receiver_clock_period (20);
        test_for_receiver_clock_period (18);
        test_for_receiver_clock_period (22);

        `ifdef MODEL_TECH  // Mentor ModelSim and Questa
            $stop;
        `else
            $finish;
        `endif
    end

endmodule
