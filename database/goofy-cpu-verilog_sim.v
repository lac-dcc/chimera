// This program was cloned from: https://github.com/marceldobehere/goofy-cpu-verilog
// License: GNU Affero General Public License v3.0

module GoofySim;
    reg 	 clk = 0;
    reg      res = 1;
    wire hlt;
    always #2 clk = hlt ? clk : !clk;
    
    // Core
    GoofyCore core (
        clk,
        res,
        hlt
    );

    initial begin
    $dumpfile("dump.lxt");
    $dumpvars(0, GoofySim);
    $display("Starting simulation");

    $monitor("clk: %h, state: %h, rip:%h [%h %h %h], db: %h, mc: %h, alu: %h [%h %h], eq: %h", 
        clk, core.state, 
        core.rip, core.iop, core.op0, core.op1, 
        core.data_bus, core.mc_out, 
        core.alu_out, core.alu0o, core.alu1o, core.alu_flag_eq_o
    );

    #4 res = 0;

    #10000 $finish;
    end

endmodule