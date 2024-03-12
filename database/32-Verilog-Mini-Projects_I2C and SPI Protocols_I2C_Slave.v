module slave(out,sda,scl);
input sda;
input scl;
output reg [7:0]out;
integer j = 0;
reg [6:0]temp;
reg [7:0]add;
reg rw;
reg [7:0]register_address;
reg bitin;
reg [7:0]storage[0:38];
initial
storage[37]=16;
parameter address = 7'b1101001;
always @(posedge scl)begin
//if({sda,scl}==2'b01)begin
bitin = sda;
if(j<8)
temp = {temp,bitin};
if(j==8)
            if(bitin==0)
                        rw = 0;
            else
                        rw = 1;
j = j +1 ;
if(temp==address && (j>15 && j<24) && rw==1)begin
            add = {add,bitin};
end
if(temp==address && rw == 0 && j>15 && j!=24 && j<33)begin
            add = {add,bitin};
end
else if(j==24)
            register_address = add;
if(j==33 && rw==0)
storage[register_address]=add;
out = storage[add];
end
endmodule
