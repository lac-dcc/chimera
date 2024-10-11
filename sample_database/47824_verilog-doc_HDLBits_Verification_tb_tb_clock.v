// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module();
    reg clk;
    parameter CYCLE = 10;
    always #(CYCLE) begin
        clk = ~clk;
    end
    dut ins (clk);
endmodule


