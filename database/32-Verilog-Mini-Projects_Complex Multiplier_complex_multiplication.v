module compmul(c1,c2,product);
input [15:0]c1,c2;
output [31:0]product;
assign product={((c1[15:8]*c2[15:8])-(c1[7:0]*c2[7:0])),((c1[15:8]*c2[7:0])+(c1[7:0]*c2[15:8]))};
endmodule

module compmul_tb();
 reg [15:0]c1,c2;
 wire [31:0]product;
 compmul a(c1,c2,product);
 initial
 begin
 c1<=16'b0000001000000010;
 c2<=16'b0000011000000010;
 #50
 $display("output for mul %b",product);
 c1<=16'b00001111100001000;
 c2<=16'b00000000000010000;
 #50
 $display("output for mul %b",product);
 c1<=16'b0000101110001000;
 c2<=16'b0000000000001000;
 #50
 $display("output for mul %b",product);
 c1<=16'b0000100000001000;
 c2<=16'b0001111000001000;
 #50
 $display("output for mul %b",product);
 c1<=16'b0000100001101000;
 c2<=16'b0000001000001000;
 #50
 $display("output for mul %b",product);
 c1<=16'b0000100000001000;
 c2<=16'b0001111111101000;
 #50
 $display("output for mul %b",product);
 c1<=16'b1111111111111111;
 c2<=16'b1111111111111111;
 #50
 $display("output for mul %b",product);

 end
endmodule



