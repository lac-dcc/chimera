// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0


module clk_divider (
    input clk,
    input rst,
    output clk2,
    output clk4,
    output clk8
);

   reg [3:0] cnt;

    always @ (posedge clk) begin
        if (rst == 1'b1)
            cnt <= 4'b0;
        else
            cnt <= cnt + 1'b1;
    end

    assign clk2 = ~cnt[1];
    assign clk4 = ~cnt[2];
    assign clk8 = cnt[3];

endmodule
