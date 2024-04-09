module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] in_last;	//the input in last clk
    
    always @(posedge clk) begin
        in_last <= in;
        if(reset) out <= 0;
        else begin
            out <= out | (in_last & ~in);
        end
    end
    
endmodule
