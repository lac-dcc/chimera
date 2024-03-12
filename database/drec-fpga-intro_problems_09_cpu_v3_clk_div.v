module clk_div(
    input clk_in,

    output clk_out
);

reg [11:0]cnt = 0;

assign clk_out = cnt[11];

always @(posedge clk_in) begin
    cnt <= cnt + 12'b1;
end

endmodule
