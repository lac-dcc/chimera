/*
*   Blinking frequency generator
*/
module blink_gen(
    input clk,

    output clk2
);

reg [25:0]cnt = 0;

assign clk2 = cnt[25];

always @(posedge clk) begin
    cnt <= cnt + 26'b1;
end

endmodule
