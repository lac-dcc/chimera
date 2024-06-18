// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module testbench;

    reg [1:0] key;
    reg [9:0] sw;

    top i_top (.key (key), .sw (sw));

    initial
    begin
        #0
        $dumpvars;

        repeat (8) #10 { key, sw } <= $random;

        `ifdef MODEL_TECH  // Mentor ModelSim and Questa
            $stop;
        `else
            $finish;
        `endif
    end

endmodule
