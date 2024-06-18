// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module ( );
    parameter time_period = 10;
    reg clock;
    initial begin
        clock = 0;
    end
    always begin
        #(time_period / 2) clock = ~clock;
    end
    dut dut1(clock);
endmodule