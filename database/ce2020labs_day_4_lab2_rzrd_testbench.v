// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module testbench;

    reg       clk;
    reg       reset_n;
    reg [3:0] key_sw;

    top
    # (
        .clk_mhz (50),
        .strobe_to_update_xy_counter_width (1)
    )
    i_top
    (
        .clk     ( clk     ),
        .reset_n ( reset_n ),
        .key_sw  ( key_sw  )
    );

    initial
    begin
        clk = 1'b0;

        forever
            # 10 clk = ! clk;
    end

    initial
    begin
        reset_n <= 1'bx;
        repeat (2) @ (posedge clk);
        reset_n <= 1'b0;
        repeat (2) @ (posedge clk);
        reset_n <= 1'b1;
    end

    initial
    begin
        #0
        $dumpvars(6);

        key_sw <= 4'b0;

        @ (posedge reset_n);

        // repeat (1000)
        // begin
        //     @ (posedge clk);

        //     key_sw <= $random;
        // end

        #120000000

        `ifdef MODEL_TECH  // Mentor ModelSim and Questa
            $stop;
        `else
            $finish;
        `endif
    end

endmodule
