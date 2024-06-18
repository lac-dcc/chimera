// This program was cloned from: https://github.com/quocthinh1511/FloatingPointUnit
// License: MIT License


module tinh_phan_tp(
input wire [22:0]a,
output [22:0]b 
);
wire [23:0] sum [24:0];
wire [23:0] in2 [24:0];
wire [24:0] c;

assign in2[0]=(a[22]==1)?(24'd500_0000):(24'd0);  //0
cong_24bit  cong0(.in1(24'b0),.in2(in2[0]),.sum(sum[0]),.c(c[0]));

assign in2[1]=(a[21]==1)?(24'd250_0000):(24'd0);  //1
cong_24bit  cong1(.in1(sum[0]),.in2(in2[1]),.sum(sum[1]),.c(c[1]));

assign in2[2]=(a[20]==1)?(24'd125_0000):(24'd0);
cong_24bit  cong2(.in1(sum[1]),.in2(in2[2]),.sum(sum[2]),.c(c[2]));

assign in2[3]=(a[19]==1)?(24'd62_5000):(24'd0);//3
cong_24bit  cong3(.in1(sum[2]),.in2(in2[3]),.sum(sum[3]),.c(c[3]));

assign in2[4]=(a[18]==1)?(24'd31_2500):(24'd0);//4
cong_24bit  cong4(.in1(sum[3]),.in2(in2[4]),.sum(sum[4]),.c(c[4]));

assign in2[5]=(a[17]==1)?(24'd15_6250):(24'd0); //5
cong_24bit  cong5(.in1(sum[4]),.in2(in2[5]),.sum(sum[5]),.c(c[5]));

assign in2[6]=(a[16]==1)?(24'd7_8125):(24'd0);//6
cong_24bit  cong6(.in1(sum[5]),.in2(in2[6]),.sum(sum[6]),.c(c[6]));

assign in2[7]=(a[15]==1)?(24'd3_9062):(24'd0);
cong_24bit  cong7(.in1(sum[6]),.in2(in2[7]),.sum(sum[7]),.c(c[7]));

assign in2[8]=(a[14]==1)?(24'd1_9531):(24'd0);//8
cong_24bit  cong8(.in1(sum[7]),.in2(in2[8]),.sum(sum[8]),.c(c[8]));

assign in2[9]=(a[13]==1)?(24'd9765):(24'd0);
cong_24bit  cong9(.in1(sum[8]),.in2(in2[9]),.sum(sum[9]),.c(c[9]));

assign in2[10]=(a[12]==1)?(24'd4882):(24'd0);
cong_24bit  cong10(.in1(sum[9]),.in2(in2[10]),.sum(sum[10]),.c(c[10]));

assign in2[11]=(a[11]==1)?(24'd2441):(24'd0);
cong_24bit  cong11(.in1(sum[10]),.in2(in2[11]),.sum(sum[11]),.c(c[11]));

assign in2[12]=(a[10]==1)?(24'd1220):(24'd0);
cong_24bit  cong12(.in1(sum[11]),.in2(in2[12]),.sum(sum[12]),.c(c[12]));

assign in2[13]=(a[9]==1)?(24'd610):(24'd0);
cong_24bit  cong13(.in1(sum[12]),.in2(in2[13]),.sum(sum[13]),.c(c[13]));

assign in2[14]=(a[8]==1)?(24'd305):(24'd0);
cong_24bit  cong14(.in1(sum[13]),.in2(in2[14]),.sum(sum[14]),.c(c[14]));

assign in2[15]=(a[7]==1)?(24'd152):(24'd0);
cong_24bit  cong15(.in1(sum[14]),.in2(in2[15]),.sum(sum[15]),.c(c[15])); 

assign in2[16]=(a[6]==1)?(24'd76):(24'd0);
cong_24bit  cong16(.in1(sum[15]),.in2(in2[16]),.sum(sum[16]),.c(c[16]));

assign in2[17]=(a[5]==1)?(24'd38):(24'd0);
cong_24bit  cong17(.in1(sum[16]),.in2(in2[17]),.sum(sum[17]),.c(c[17]));

assign in2[18]=(a[4]==1)?(24'd19):(24'd0);
cong_24bit  cong18(.in1(sum[17]),.in2(in2[18]),.sum(sum[18]),.c(c[18]));

assign in2[19]=(a[3]==1)?(24'd9):(24'd0);
cong_24bit  cong19(.in1(sum[18]),.in2(in2[19]),.sum(sum[19]),.c(c[19]));

assign in2[20]=(a[2]==1)?(24'd4):(24'd0);
cong_24bit  cong20(.in1(sum[19]),.in2(in2[20]),.sum(sum[20]),.c(c[20]));

assign in2[21]=(a[1]==1)?(24'd2):(24'd0);
cong_24bit  cong21(.in1(sum[20]),.in2(in2[21]),.sum(sum[21]),.c(c[21]));

assign in2[22]=(a[0]==1)?(24'd1):(24'd0);
cong_24bit  cong22(.in1(sum[21]),.in2(in2[22]),.sum(sum[22]),.c(c[22]));

assign b= sum[22];

endmodule

