module  binary_encoder
(
input wire [1:0] x,
input wire enable,
output reg  [3:0] y 
);
 
always  @(enable, x[1],x[0])
begin
    if (enable == 1'b0) 
        y=4'b0000;
    else if (x == 0)
        y = 4'b0001;
    else if (x == 1)
        y = 4'b0010;
    else if (x == 2'b10)
        y = 4'b0100;
    else if (x == 2'b11)
    	y = 4'b1000;
end
endmodule

module tb_test();
    reg [1:0] x;
    reg enable;
    wire [3:0] y;
    binary_encoder t1(x, enable, y);
    initial
        begin
            #0 enable = 1'b0;
            #5 enable = 1'b1; x = 2'b00;
            #10 x = 2'b01;
            #15 x = 2'b10;
            #20 x = 2'b11;
            #25 $finish;
        end
    
    initial
        $monitor("enable = %b, x = %b, y = %b", enable, x, y);
endmodule