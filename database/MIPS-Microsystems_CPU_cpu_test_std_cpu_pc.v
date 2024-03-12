module pc(
    input clk,
    input reset,
    input WE,
    input [31:0] npc,
    output reg [31:0] pc
);

    initial pc = 32'h0000_3000;

    always @(posedge clk) begin
        if(reset) begin
            pc <= 32'h0000_3000;
        end
        else if(WE) begin
            pc <= npc;
        end
    end

endmodule // pc