module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    always @(posedge clk) begin
        if(reset | (slowena & (q == 9))) q <= 0;
        else q <= (slowena) ? q + 1 : q; 
    end

endmodule
