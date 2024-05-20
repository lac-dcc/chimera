// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module clk_div(
    input clk,

    output clk2
);

reg [11:0]cnt = 0;

assign clk2 = cnt[11];

always @(posedge clk) begin
    cnt <= cnt + 12'b1;
end

endmodule
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module clk_div(
    input clk,

    output clk2
);

reg [11:0]cnt = 0;

assign clk2 = cnt[11];

always @(posedge clk) begin
    cnt <= cnt + 12'b1;
end

endmodule
