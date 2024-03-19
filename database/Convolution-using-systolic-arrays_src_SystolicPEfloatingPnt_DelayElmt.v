//Delay

module De(a,b,o1,o2,clk);
    input clk;
    input [7:0]a,b;
    output reg[7:0]o1,o2;

    always@(posedge clk)
        begin
            o1 = a;
            o2 = b;
        end
    endmodule