// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module counter
    (
        input clk,
        input up,
        input down,
        input reset,
        output [31:0] counter
    );
    reg [31:0] cnt = 0;
    assign counter = cnt;

    reg[2:0] upr;  always @(posedge clk) upr <= {upr[1:0], up};
    reg[2:0] downr;  always @(posedge clk) downr <= {downr[1:0], down};
    wire up_risingedge = (upr[2:1]==2'b01);
    wire down_risingedge = (downr[2:1]==2'b01);

    always @(posedge clk) begin
        if (reset) begin
            cnt <= 0;
        end
        if (up_risingedge) begin
            cnt <= cnt + 1;
        end
        if (down_risingedge) begin
            cnt <= cnt - 1;
        end
    end
endmodule
