module clk_div #(parameter X = 12)(
    input clk_in,

    output clk_out
);

reg [X-1:0]cnt = 0;

assign clk_out = cnt[X-1];

always @(posedge clk_in) begin
    cnt <= cnt + 1;
end

endmodule
