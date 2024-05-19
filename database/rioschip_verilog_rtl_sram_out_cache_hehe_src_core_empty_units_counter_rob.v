// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

module counter_rob#(
    parameter CNT_SIZE = 32 + 8,
    parameter CNT_SIZE_WIDTH = 6
) (
    input clk,
    input reset,
    input cnt_reset,
    input cnt_add_flag,
    input [CNT_SIZE_WIDTH-1:0] cnt_vector,
    output [CNT_SIZE_WIDTH-1:0] cnt,
    output cnt_end
);
reg [CNT_SIZE_WIDTH-1:0] cnt_r;
assign cnt = cnt_r;

always @(posedge clk) begin
    if (reset) begin
        cnt_r <= 0;
    end if (cnt_reset) begin
        cnt_r <= cnt_vector;
    end else if (cnt_add_flag) begin
        if (cnt_end) begin
            cnt_r <= 0;
        end else begin
            cnt_r <= cnt_r + 1;
        end
    end
end
/* verilator lint_off WIDTH */
assign cnt_end = cnt == CNT_SIZE - 1;
/* verilator lint_on WIDTH */
endmodule
