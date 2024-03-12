module top_module (
    input clk,
    input a,
    output [3:0] q );
    
    always @(posedge clk) begin
        if (a) q <= 4;
        else begin
            if (q < 6) q <= q + 1;
            else q <= 0;
        end
    end

endmodule
