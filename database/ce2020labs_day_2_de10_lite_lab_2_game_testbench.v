// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module testbench;

    reg       clk;
    reg [1:0] key;
    reg [9:0] sw;

    top
    # (
        .clk_mhz (1),
        .strobe_to_update_xy_counter_width (1)
    )
    i_top
    (
        .clk ( clk ),
        .key ( key ),
        .sw  ( sw  )
    );

    initial
    begin
        clk = 1'b0;

        forever
            # 10 clk = ! clk;
    end

    reg reset;
    
    always @*
        sw [9] = reset;

    initial
    begin
        reset <= 'bx;
        repeat (2) @ (posedge clk);
        reset <= 1;
        repeat (2) @ (posedge clk);
        reset <= 0;
    end

    initial
    begin
        #0
        $dumpvars;

        key       <= 'b0;
        sw  [8:0] <= 'b0;

        @ (negedge reset);

        repeat (1000)
        begin
            @ (posedge clk);

            key       <= $random;
            sw  [8:0] <= $random;
        end

        `ifdef MODEL_TECH  // Mentor ModelSim and Questa
            $stop;
        `else
            $finish;
        `endif
    end

endmodule
