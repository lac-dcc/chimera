module master(data,address,clk,rw,sda,scl,register,data_wr);
output reg sda;
input [7:0] data;
input [7:0] data_wr;
reg [7:0]data_wr_dup;
input clk;
input rw;
output reg scl;
input [6:0] address;
input [7:0] register;
reg [8:0] temp;
reg [7:0] register2;
reg pstate;
reg scl2x;
reg ack;
reg a;
integer i;
integer n;
initial begin
i = 0;
n = 0;
scl2x = 0;
ack = 1'b1;
sda = 1;
scl = 1;
#5 sda = 0;  //START BIT condition starts here
end
  
always @(negedge sda)
if(scl==1)
n=1;
always @(posedge clk)begin
ack = 0;
temp = {address,rw,ack};
register2 = register;
data_wr_dup = data_wr;
if(n==1 && rw==1)
repeat(50)begin
#2 scl <= !scl;n=0;
#1 scl2x <= !scl2x;n=0;
end
else if(n==1 && rw==0)
repeat(64) begin
#2 scl = !scl;
#1 scl2x = !scl2x;n=0;
end
end
always @(posedge clk)begin
if(i==25 && rw==1)
repeat(2)
#1 scl2x = !scl2x;
else if(i==32 && rw==0)
repeat(2)
#1 scl2x = !scl2x;end
always @(posedge scl2x)begin
if(i<=9)begin
sda = temp[8];
temp = temp<<1;
end
else if(i==12 || i==13)
sda = 1'b0;
else if(i>=14)begin
sda = register2[7];
register2 = register2<<1;
end
if(rw==0 && i>=23)begin
sda = data_wr_dup[7];
data_wr_dup = data_wr_dup<<1;
end
i = i + 1;
if(i>32 && rw ==0)
sda= 1;
else if(i>25 && rw==1)
sda = 1;
end
slave slv(data,sda,scl);
endmodule
