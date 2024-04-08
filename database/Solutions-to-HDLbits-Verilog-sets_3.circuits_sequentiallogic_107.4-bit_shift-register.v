module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
    
    always @(posedge clk or posedge areset) begin
        if(areset) begin
            q <= 0;
        end
        else begin
            if(load) begin
                q <= data;  
            end
            else begin
                if(ena) begin
                    q <= (q >> 1);
                end
            end
        end
    end
    
endmodule