module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always@(posedge clk)
        begin
            if(~resetn) q <= 0;
            else begin
                if(byteena[0]) q[7:0] <= d[7:0];
                else q[7:0] <= q[7:0];
                if(byteena[1]) q[15:8] <= d[15:8];
                else q[15:8] <= q[15:8];
            end
        end
    
endmodule
