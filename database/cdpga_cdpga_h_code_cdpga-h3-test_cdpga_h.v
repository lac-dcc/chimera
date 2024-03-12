
module cdpga_h(
    input clk,
    output reg [20:0] out
);

reg rst_n = 0;

reg [2:0] reset_cnt = 0;
always @(posedge clk) begin
    reset_cnt <= reset_cnt + 1;
    if (reset_cnt == 3'b111)
        rst_n <= 1;
end 

reg [20:0] counter;
//reg [4:0] counter;

always @(posedge clk or negedge rst_n)
    if (!rst_n) begin
        counter <= 0;
        out <= 21'bzzzzzzzzzzzzzzzzzzzz0;
    end
    else begin
        counter <= counter + 1;
        if (counter == 0) begin
            out <= {out[19:0], out[20]};
        end
    end

endmodule
