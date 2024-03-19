module counter (input reset,input clk,input up,output reg [4: 0] count);

always @(posedge up or negedge reset)
begin
if(!reset) count = {4{1'b0}};
else if (up) count = count + 1'b1;
else count = count;
end

endmodule

