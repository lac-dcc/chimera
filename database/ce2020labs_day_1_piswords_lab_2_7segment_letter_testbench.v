// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module testbench;

    reg [3:0] key;

    top i_top (.key (key));

    initial
    begin
        #0
        $dumpvars;

        repeat (8) #10 key <= $random;

        `ifdef MODEL_TECH  // Mentor ModelSim and Questa
            $stop;
        `else
            $finish;
        `endif
    end

endmodule
