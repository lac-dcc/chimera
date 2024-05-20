// This program was cloned from: https://github.com/anik-m/hdlbits_for_verilog
// License: GNU General Public License v3.0

module top_module ( );
    parameter CLK_PERIOD = 10;
    reg clk = 0; // Clock signal
    dut dut_inst (
        .clk(clk) // Connect clk input of DUT
        // Add other DUT ports here
    );
	always #((CLK_PERIOD)/2) clk = ~clk;
    initial begin
        // Initialize clock to zero
        clk = 0;

        // Wait for a small delay before starting simulation
        #(CLK_PERIOD/4);

        // Change clock from 0 to 1 to initialize the DUT
        clk = 1;
        #((CLK_PERIOD)/2);
        clk = 0;
    end

endmodule
