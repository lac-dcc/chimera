module top_module( 
    input [99:0] in,
    output [99:0] out
);
    integer i;
    always @(*) begin
        for(i=0;i<=99;i=i+1)
            out[7'd99-i] <= in[i];
    end
endmodule


