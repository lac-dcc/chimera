module PLR #(parameter WIDTH =1)
    (Clk,Rst,We,d,q);
    
    input         Clk;
    input         Rst;
    input         We;
    input  [WIDTH-1:0] d;
    output reg [WIDTH-1:0] q;

    always @(posedge Clk ) begin
        if (Rst) begin
            q = { WIDTH{1'b0} };
            //同步清零  sync reset
        end else if( We == 1 ) begin
            q = d ;
        end
    end
  
endmodule
