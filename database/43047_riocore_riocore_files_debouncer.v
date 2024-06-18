// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module debouncer
    #(parameter WIDTH = 16)
    (
        input clk,
        input din,
        output wire dout
    );

    reg din_state_inv = 0;
    assign dout = ~din_state_inv;

    reg din_sync_0;  always @(posedge clk) din_sync_0 <= ~din;
    reg din_sync_1;  always @(posedge clk) din_sync_1 <= din_sync_0;
    reg [WIDTH-1:0] din_cnt;
    wire din_idle = (din_state_inv == din_sync_1);
    wire din_cnt_max = &din_cnt;

    always @(posedge clk)
    if (din_idle) begin
        din_cnt <= 0;
    end else begin
        din_cnt <= din_cnt + 1;
        if (din_cnt_max) begin
            din_state_inv <= ~din_state_inv;
        end
    end
endmodule
