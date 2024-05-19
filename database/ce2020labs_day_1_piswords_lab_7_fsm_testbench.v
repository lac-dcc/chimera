// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module testbench;

    reg       clk;
    reg [3:0] key;
    reg [3:0] sw;

    top
    # (
        .debounce_depth             ( 1 ),
        .shift_strobe_width         ( 1 ),
        .seven_segment_strobe_width ( 1 )
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
        key [3] = ~ reset;

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

        key [2:0] <= 'b0;
        sw        <= 'b0;

        @ (negedge reset);

        repeat (1000)
        begin
            @ (posedge clk);

            key [2:0] <= $random;
            sw        <= $random;
        end

        `ifdef MODEL_TECH  // Mentor ModelSim and Questa
            $stop;
        `else
            $finish;
        `endif
    end

endmodule
