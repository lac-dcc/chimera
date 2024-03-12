module adder32_tb;
    reg clk;
    reg[31:0]a,b;
    wire[31:0]sum;
    reg cin;
    wire cout;
Adder32 DUT (.A(a),.B(b),.Ci(cin),.Co(cout),.S(sum));
initial begin
    #10;
    a=0;
    b=0;
    cin=0;
    clk=0;
    #10;
end
always @ (posedge clk)
begin
    #50;
    #10 a=32'b11111111110000000000111111111100;
    #10 b=32'b11111111111111111111000000000011;
end
always # 10 clk=~clk;
always @ (a or b)
#50 $display($time,"clk=%b,a=%b,b=%b,cin=%b",$time,clk,a,b,cin);
initial
#100 $finish;
endmodule
