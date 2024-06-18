// This program was cloned from: https://github.com/quocthinh1511/FloatingPointUnit
// License: MIT License

module tinh_mu(a,b,c,mu,d,mu1);
input wire[23:0]a;   // gia tri nguyen 
output reg [7:0]mu;  // mu 
output reg [22:0]b;  // phan nguyen 
output reg [49:0]c;  // 
input wire[22:0]d;  // gia tri tp cu 
output reg mu1;
always @(*)
if ((a>=24'd10)&&(a<=24'd99))
begin 
 b<=a/(4'b1010); mu1<=8'h2B;
c<=(a%(4'b1010))*(10000000)+d;
mu<=8'd1;
 end 
else if((a>=24'd100)&&(a<=24'd999))
begin 
 b<=a/(6'd100);mu1<=8'h2B;
c<=(a%(6'd100))*(10000000)+d;
mu<=8'd2;
 end 
else if((a>=24'd1000)&&(a<=24'd9999))
begin 
 b<=a/(1000);mu1<=8'h2B;
c<=(a%(1000))*(10000000)+d;
mu<=8'd3;
 end 
else if((a>=24'd10000)&&(a<=24'd99999))
begin 
 b<=a/(10000);mu1<=8'h2B;
c<=(a%(10000))*(10000000)+d;
mu<=8'd4;
 end 
else if((a>=24'd100000)&&(a<=24'd999999))
begin 
 b<=a/(14'd100000);mu1<=8'h2B;
c<=(a%(14'd100000))*(10000000)+d;
mu<=8'd5;
 end
 else if((a>=24'd1000000)&&(a<=24'd9999999))
begin 
 b<=a/(20'd1000000);mu1<=8'h2B;
c<=a%(20'd1000000);
mu<=8'd6;
 end
else if( (a==24'b0)&&(d<=9999999)&&(d>=100000))
begin 
 b<=d/(1000000);mu1<=8'h2D;
c<=d%(1000000);
mu<=8'd1;
 end
else if( (a==24'b0)&&(d<=9999999)&&(d>=100000))
begin 
 b<=d/(100000);mu1<=8'h2D;
c<=d%(100000);
mu<=8'd2;

 end
endmodule 
module t_tinh_mu;
	reg [23:0]a;reg[22:0]d;  
	wire [22:0]b;
        wire [49:0]c;
        wire [7:0]mu;
        wire [7:0]mu1;
parameter time_out = 100;
	tinh_mu da(.a(a),.d(d),.b(b),.c(c),.mu(mu));
      
initial $monitor($time," so a %b %b la %d,%d 10^ %c %d   ", a,d,b,c,mu1,mu );
	initial begin

	#0 a=24'b0000_0000_0000_0000_0000_1010; d=23'd5000000;
        #10 a=24'b0000_0000_0000_0000_0010_0100;
        #10 a=24'b0000_0000_0000_0100_0010_0110;
        #10 a=24'b0000_0000_0000_0010_1000_0000;  d=23'd5000000;
        //#10 in1=8'b0111_1111;  in1=8'b1000_0000;
	
end 
endmodule
