// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

// counter from 0x000000 ~ 0xffffff

module counter
#(
    parameter CNT_MAX = 'h1000000, // 0 ~ 0xffffff
    parameter SYS_CLK = 'd50_000_000 // default to 50MHz
)
(
    input clk,
    input rst_n,
    output reg [23:0] cnt
);

    reg [31:0] inc;

    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n) begin
            cnt <= 24'b0;
            inc <= 32'b0;
        end else begin
            if (inc == (SYS_CLK - 1)) begin
                inc <= 32'b0;
                if (cnt == (CNT_MAX -1))
                    cnt <= 24'b0;
                else
                    cnt <= cnt + 1;
            end else begin
                inc <= inc + 1;
            end
        end
    end

endmodule
