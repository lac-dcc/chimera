module mem_ctrl(
    input clk,
    input [31:0]addr,
    input [31:0]data,
    input we,

    output reg [15:0]data_out = 16'b0
);

always @(posedge clk) begin
    if (we) begin
        $display("[%h] <- %h", addr, data);
        if (addr == 32'h20)
            data_out <= data[15:0];
    end
end

endmodule
