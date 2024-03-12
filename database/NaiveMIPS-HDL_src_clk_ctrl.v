module clk_ctrl(/*autoport*/
//output
            rst_out_n,
//input
            clk,
            rst_in_n);

input wire clk;
input wire rst_in_n;
output wire rst_out_n;

reg[2:0] shifter;
assign rst_out_n = shifter[2];
always @(posedge clk or negedge rst_in_n) begin
    if (!rst_in_n) begin
        shifter <= 3'b000;
    end
    else begin
        shifter <= {shifter[1:0], 1'b1};
    end
end

endmodule