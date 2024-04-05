module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] in_temp;
    integer i;
    always @(posedge clk) begin
    	in_temp <= in;
        for(i=0; i<8; i++) begin
            if((in_temp[i] == 0) & (in[i] == 1))	pedge[i] <= 1;
            else pedge[i] <= 0;
        end
    end
endmodule
