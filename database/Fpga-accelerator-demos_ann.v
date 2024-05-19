// This program was cloned from: https://github.com/YutongChenVictor/Fpga-accelerator-demos
// License: MIT License

module ann (
    input                       clk      ,
    input                       rst_n    ,

    input signed [20:0]         ina      ,
    input signed [20:0]         inb      ,
    input signed [20:0]         inc      ,
    input signed [20:0]         ind      ,
    input valid_in,

    output reg valid_out,
    output reg signed [20:0]    out1     ,
    output reg signed [20:0]    out2     ,
    output reg signed [20:0]    out3
);

parameter  w1_1 = 21'b1_1111_1111_1010_0001_1011;
parameter  w2_1 = 21'b1_1111_1101_1100_0011_1110;
parameter  w3_1 = 21'b1_1111_1111_0100_1011_0010;
parameter  w4_1 = 21'b1_1111_1111_1011_1000_1000;
parameter  w5_1 = 21'b1_1111_1111_1000_0000_0011;
parameter  w6_1 = 21'b1_1111_1101_1100_0000_1001;
parameter  w7_1 = 21'b1_1111_1111_1000_1110_1000;
parameter  w8_1 = 21'b1_1111_1110_1111_1111_1001;

parameter  w1_2 = 21'b1_1111_1111_1011_1011_0101;  
parameter  w2_2 = 21'b1_1111_1101_1010_1100_1001;
parameter  w3_2 = 21'b1_1111_1111_0111_1101_1110;
parameter  w4_2 = 21'b0_0000_0000_0100_0011_0000;
parameter  w5_2 = 21'b1_1111_1111_1001_0101_0001;
parameter  w6_2 = 21'b1_1111_1111_1110_1001_0101;
parameter  w7_2 = 21'b1_1111_1111_0101_0101_0000;
parameter  w8_2 = 21'b1_1111_1111_1111_0101_0010;

parameter  w1_3 = 21'b1_1111_1111_1010_1010_1111;  
parameter  w2_3 = 21'b0_0000_0101_1001_1100_0100;
parameter  w3_3 = 21'b1_1111_1111_0110_1001_1110;
parameter  w4_3 = 21'b1_1111_1111_1001_0010_1100;
parameter  w5_3 = 21'b0_0000_0000_0110_1100_1101;
parameter  w6_3 = 21'b1_1111_1110_1111_1101_0111;
parameter  w7_3 = 21'b1_1111_1111_1011_1100_1000;
parameter  w8_3 = 21'b1_1111_1111_0111_0011_1000;

parameter  w1_4 = 21'b0_0000_0000_0001_1011_1001;  
parameter  w2_4 = 21'b0_0000_1010_0101_1111_1101;
parameter  w3_4 = 21'b1_1111_1111_1101_1011_0101;
parameter  w4_4 = 21'b1_1111_1111_0101_1001_0011;
parameter  w5_4 = 21'b1_1111_1111_1000_1000_1000;
parameter  w6_4 = 21'b1_1111_1111_1110_1001_0010;
parameter  w7_4 = 21'b1_1111_1111_0110_1110_1011;
parameter  w8_4 = 21'b1_1111_1111_1001_0010_1110;

parameter  w1_21 = 21'b0_0000_0000_1001_1011_0000;  
parameter  w2_21 = 21'b0_0000_0000_0100_1101_1100;
parameter  w3_21 = 21'b1_1111_1111_1011_1011_0011;
parameter  w4_21 = 21'b0_0000_0000_0101_1011_0000;
parameter  w5_21 = 21'b1_1111_1111_1000_0011_1011;
parameter  w6_21 = 21'b1_1111_1111_1110_1110_1110;
parameter  w7_21 = 21'b0_0000_0000_1000_0000_0001;
parameter  w8_21 = 21'b1_1111_1111_1011_1111_0101;

parameter  w1_22 = 21'b1_1111_1110_0110_1110_0101;  
parameter  w2_22 = 21'b1_1111_1111_1000_1011_1000;
parameter  w3_22 = 21'b1_1111_1111_0110_1001_0110;
parameter  w4_22 = 21'b0_0000_1010_0010_0011_1000;
parameter  w5_22 = 21'b1_1111_1110_1011_1110_0111;
parameter  w6_22 = 21'b1_1111_1100_1101_0001_1011;
parameter  w7_22 = 21'b1_1111_1111_1111_1101_0110;
parameter  w8_22 = 21'b1_1111_1111_0111_0100_0001;

parameter  w1_23 = 21'b0_0000_0000_0001_0111_0100;  
parameter  w2_23 = 21'b1_1111_1111_1001_0001_0101;
parameter  w3_23 = 21'b0_0000_0000_0001_1100_0000;
parameter  w4_23 = 21'b0_0000_0000_0011_1110_1010;
parameter  w5_23 = 21'b1_1111_1111_1000_0011_0101;
parameter  w6_23 = 21'b1_1111_1111_1110_0101_0001;
parameter  w7_23 = 21'b0_0000_0000_0011_1100_1111;
parameter  w8_23 = 21'b1_1111_1111_1110_0101_0010;

parameter  w1_24 = 21'b1_1111_1111_0111_0010_1111;  
parameter  w2_24 = 21'b0_0000_0000_0000_1011_0100;
parameter  w3_24 = 21'b0_0000_0000_0011_0011_0101;
parameter  w4_24 = 21'b0_0000_0000_0000_0100_1011;
parameter  w5_24 = 21'b0_0000_0000_1000_1011_0101;
parameter  w6_24 = 21'b0_0000_0000_0001_1011_0010;
parameter  w7_24 = 21'b0_0000_0000_0111_1110_0111;
parameter  w8_24 = 21'b1_1111_1111_1000_1110_0110;

parameter  w1_25 = 21'b1_1111_1111_1000_1110_1111;  
parameter  w2_25 = 21'b0_0000_0000_0110_0000_0101;
parameter  w3_25 = 21'b1_1111_1111_1101_1111_1111;
parameter  w4_25 = 21'b1_1111_1111_1001_0111_0010;
parameter  w5_25 = 21'b0_0000_0000_1000_0101_1111;
parameter  w6_25 = 21'b1_1111_1111_1101_0000_0101;
parameter  w7_25 = 21'b0_0000_0000_0100_1110_1010;
parameter  w8_25 = 21'b0_0000_0000_0100_0110_1101;

parameter  w1_26 = 21'b1_1111_1111_1000_1001_0001;  
parameter  w2_26 = 21'b0_0000_0000_0010_0110_1100;
parameter  w3_26 = 21'b0_0000_0000_0100_1110_1010;
parameter  w4_26 = 21'b0_0000_0000_0000_0101_0010;
parameter  w5_26 = 21'b1_1111_1111_1011_0111_1110;
parameter  w6_26 = 21'b1_1111_1111_1001_0000_1010;
parameter  w7_26 = 21'b1_1111_1111_1110_1001_1000;
parameter  w8_26 = 21'b0_0000_0000_1001_0001_1011;

parameter  w1_27 = 21'b0_0000_0000_0011_0011_0011;  
parameter  w2_27 = 21'b0_0000_0000_0010_0110_0010;
parameter  w3_27 = 21'b1_1111_1111_1000_0111_0100;
parameter  w4_27 = 21'b0_0000_0000_1000_1100_1110;
parameter  w5_27 = 21'b1_1111_1111_1111_0000_0101;
parameter  w6_27 = 21'b0_0000_0000_0001_1000_1001;
parameter  w7_27 = 21'b1_1111_1111_1110_0011_0011;
parameter  w8_27 = 21'b1_1111_1111_1010_1101_1010;

parameter  w1_28 = 21'b0_0000_0000_0011_1111_0101;  
parameter  w2_28 = 21'b0_0000_0000_0001_0111_0001;
parameter  w3_28 = 21'b1_1111_1111_0110_0100_0100;
parameter  w4_28 = 21'b0_0000_0000_0011_0010_0000;
parameter  w5_28 = 21'b1_1111_1111_1100_1001_1011;
parameter  w6_28 = 21'b1_1111_1111_1100_0100_1010;
parameter  w7_28 = 21'b0_0000_0000_0111_1000_1111;
parameter  w8_28 = 21'b1_1111_1111_1101_0011_0100;

parameter  w1_31 = 21'b0_0000_0010_1011_0110_1000;  
parameter  w2_31 = 21'b1_1111_1110_1001_1011_0001;
parameter  w3_31 = 21'b1_1111_1110_1111_1000_0100;
parameter  w4_31 = 21'd0;
parameter  w5_31 = 21'd0;
parameter  w6_31 = 21'd0;
parameter  w7_31 = 21'd0;
parameter  w8_31 = 21'd0;

parameter  w1_32 = 21'b0_0000_0001_0011_0000_0000;  
parameter  w2_32 = 21'b1_1111_1111_1100_0100_1110;
parameter  w3_32 = 21'b0_0000_0000_0110_1011_1001;
parameter  w4_32 = 21'd0;
parameter  w5_32 = 21'd0;
parameter  w6_32 = 21'd0;
parameter  w7_32 = 21'd0;
parameter  w8_32 = 21'd0;

parameter  w1_33 = 21'b0_0000_0000_0100_1111_1111;  
parameter  w2_33 = 21'b1_1111_1111_0111_0010_0000;
parameter  w3_33 = 21'b1_1111_1111_0100_1010_1001;
parameter  w4_33 = 21'd0;
parameter  w5_33 = 21'd0;
parameter  w6_33 = 21'd0;
parameter  w7_33 = 21'd0;
parameter  w8_33 = 21'd0;

parameter  w1_34 = 21'b1_1110_1000_0111_1110_0100;  
parameter  w2_34 = 21'b0_0000_1010_1100_1010_0010;
parameter  w3_34 = 21'b0_0000_1010_1111_0010_0010;
parameter  w4_34 = 21'd0;
parameter  w5_34 = 21'd0;
parameter  w6_34 = 21'd0;
parameter  w7_34 = 21'd0;
parameter  w8_34 = 21'd0;

parameter  w1_35 = 21'b0_0000_0001_1101_1000_0001;  
parameter  w2_35 = 21'b1_1111_1111_0001_1100_1011;
parameter  w3_35 = 21'b1_1111_1111_1011_0110_0000;
parameter  w4_35 = 21'd0;
parameter  w5_35 = 21'd0;
parameter  w6_35 = 21'd0;
parameter  w7_35 = 21'd0;
parameter  w8_35 = 21'd0;

parameter  w1_36 = 21'b0_0000_0011_0000_1111_0101;  
parameter  w2_36 = 21'b1_1111_1101_1000_0010_0011;
parameter  w3_36 = 21'b1_1111_1111_0000_1110_0100;
parameter  w4_36 = 21'd0;
parameter  w5_36 = 21'd0;
parameter  w6_36 = 21'd0;
parameter  w7_36 = 21'd0;
parameter  w8_36 = 21'd0;

parameter  w1_37 = 21'b0_0000_0000_0010_0000_0111;  
parameter  w2_37 = 21'b0_0000_0000_1011_0001_1000;
parameter  w3_37 = 21'b0_0000_0000_0001_0111_0001;
parameter  w4_37 = 21'd0;
parameter  w5_37 = 21'd0;
parameter  w6_37 = 21'd0;
parameter  w7_37 = 21'd0;
parameter  w8_37 = 21'd0;

parameter  w1_38 = 21'b1_1111_1111_0100_1010_0001;  
parameter  w2_38 = 21'b0_0000_0000_0111_0001_1010;
parameter  w3_38 = 21'b1_1111_1111_1001_1011_0001;
parameter  w4_38 = 21'd0;
parameter  w5_38 = 21'd0;
parameter  w6_38 = 21'd0;
parameter  w7_38 = 21'd0;
parameter  w8_38 = 21'd0;

parameter  b1_1 = 21'b0_0000_0000_1001_1011_0101;  
parameter  b2_1 = 21'b1_1111_1111_0100_0001_0001;
parameter  b3_1 = 21'b0_0000_0000_0100_0101_0111;
parameter  b4_1 = 21'b1_1111_1111_1011_1101_0100;
parameter  b5_1 = 21'b0_0000_0000_0100_0011_1000;
parameter  b6_1 = 21'b0_0000_0000_0011_1100_1010;
parameter  b7_1 = 21'b1_1111_1111_0101_0001_1010;
parameter  b8_1 = 21'b0_0000_0000_0011_1111_0100;

parameter  b1_2 = 21'b0_0000_0010_0101_0011_1010;  
parameter  b2_2 = 21'b1_1111_1111_1110_0100_0101;
parameter  b3_2 = 21'b1_1111_1111_0110_1000_0100;
parameter  b4_2 = 21'b1_1111_0101_1110_0001_1111;
parameter  b5_2 = 21'b0_0000_0001_1111_1010_1010;
parameter  b6_2 = 21'b0_0000_0011_0111_0010_1011;
parameter  b7_2 = 21'b1_1111_1111_1001_1001_0101;
parameter  b8_2 = 21'b1_1111_1111_1000_1110_0100;

parameter  b1_3 = 21'b0_0001_0011_1110_1111_0010;  
parameter  b2_3 = 21'b0_0000_1000_0011_0000_0101;
parameter  b3_3 = 21'b1_1110_0100_1011_0011_1011;
parameter  b4_3 = 21'd0;
parameter  b5_3 = 21'd0;
parameter  b6_3 = 21'd0;
parameter  b7_3 = 21'd0;
parameter  b8_3 = 21'd0;

reg signed [20:0]         w1      ;
reg signed [20:0]         w2      ;
reg signed [20:0]         w3      ;
reg signed [20:0]         w4      ;
reg signed [20:0]         w5      ;
reg signed [20:0]         w6      ;
reg signed [20:0]         w7      ;
reg signed [20:0]         w8      ;
reg signed [20:0]         b1      ;
reg signed [20:0]         b2      ;
reg signed [20:0]         b3      ;
reg signed [20:0]         b4      ;
reg signed [20:0]         b5      ;
reg signed [20:0]         b6      ;
reg signed [20:0]         b7      ;
reg signed [20:0]         b8      ;


reg signed   [20:0]         in1 ;

reg signed   [40:0]         sum1_1 ;
reg signed   [20:0]         sum_1 ;
reg signed   [40:0]         sum1_2 ;
reg signed   [20:0]         sum_2 ;
reg signed   [40:0]         sum1_3 ;
reg signed   [20:0]         sum_3 ;
reg signed   [40:0]         sum1_4 ;
reg signed   [20:0]         sum_4 ;
reg signed   [40:0]         sum1_5 ;
reg signed   [20:0]         sum_5 ;
reg signed   [40:0]         sum1_6 ;
reg signed   [20:0]         sum_6 ;
reg signed   [40:0]         sum1_7 ;
reg signed   [20:0]         sum_7 ;
reg signed   [40:0]         sum1_8 ;
reg signed   [20:0]         sum_8 ;

reg signed   [20:0]         sum2_1 ;
reg signed   [20:0]         sum2_2 ;
reg signed   [20:0]         sum2_3 ;
reg signed   [20:0]         sum2_4 ;
reg signed   [20:0]         sum2_5 ;
reg signed   [20:0]         sum2_6 ;
reg signed   [20:0]         sum2_7 ;
reg signed   [20:0]         sum2_8 ;

reg [7:0]cnt_1;
reg [7:0] cnt_2;
reg [7:0] cnt_3;

reg signed   [20:0]         suma ;
reg signed   [20:0]         sumb ;
reg signed   [20:0]         sumc ;
reg signed   [20:0]         sumd ;
reg signed   [20:0]         sume ;
reg signed   [20:0]         sumf ;
reg signed   [20:0]         sumg ;
reg signed   [20:0]         sumh ;
reg signed   [20:0]         suma_1 ;
reg signed   [20:0]         sumb_1 ;
reg signed   [20:0]         sumc_1 ;
reg signed   [20:0]         sumd_1 ;
reg signed   [20:0]         sume_1 ;
reg signed   [20:0]         sumf_1 ;
reg signed   [20:0]         sumg_1 ;
reg signed   [20:0]         sumh_1 ;

wire signed   [20:0] suma1  ;
wire signed   [20:0] sumb1  ;
wire signed   [20:0] sumc1  ;
wire signed   [20:0] sumd1  ;
wire signed   [20:0] sume1  ;
wire signed   [20:0] sumf1  ;
wire signed   [20:0] sumg1  ;
wire signed   [20:0] sumh1  ;
wire signed   [20:0] suma_11 ;
wire signed   [20:0] sumb_11 ;
wire signed   [20:0] sumc_11 ;
wire signed   [20:0] sumd_11 ;
wire signed   [20:0] sume_11 ;
wire signed   [20:0] sumf_11 ;
wire signed   [20:0] sumg_11 ;
wire signed   [20:0] sumh_11 ;



always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
    sum1_1 = 41'd0;
    sum_1  = 21'd0;
    sum2_1  = 21'd0;
    end
    else if (cnt_2 == 8'd1) begin
          sum_1 =  21'd0;
    end
    else if (cnt_3 == 8'd1) begin
     sum_1 =  21'd0;
   end
   else begin
    sum1_1 = in1 * w1;
    sum2_1 = {sum1_1[40],sum1_1[31:24],sum1_1[23:12]}; 
    sum_1 =sum_1 +sum2_1;
   end 
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
    sum1_2 = 41'd0;
    sum_2  = 21'd0;
    sum2_2  = 21'd0;
    end
   else if (cnt_2 == 8'd1) begin
          sum_2 =  21'd0;
    end
    else if (cnt_3 == 8'd1) begin
     sum_2 =  21'd0;
   end
   else begin
    sum1_2 = in1 * w2;
    sum2_2 = {sum1_2[40],sum1_2[31:24],sum1_2[23:12]}; 
    sum_2 =sum_2 +sum2_2;
   end 
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
    sum1_3 = 41'd0;
    sum_3  = 21'd0;
    sum2_3  = 21'd0;
    end
  else if (cnt_2 == 8'd1) begin
          sum_3 =  21'd0;
    end
    else  if (cnt_3 == 8'd1) begin
     sum_3 =  21'd0;
   end
   else begin
    sum1_3 = in1 * w3;
    sum2_3 = {sum1_3[40],sum1_3[31:24],sum1_3[23:12]}; 
    sum_3 =sum_3 +sum2_3;
   end 
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
    sum1_4 = 41'd0;
    sum_4  = 21'd0;
    sum2_4  = 21'd0;
    end
   else if (cnt_2 == 8'd1) begin
          sum_4 =  21'd0;
    end
    else  if (cnt_3 == 8'd1) begin
     sum_4 =  21'd0;
   end
   else begin
    sum1_4 = in1 * w4;
    sum2_4 = {sum1_4[40],sum1_4[31:24],sum1_4[23:12]}; 
    sum_4 =sum_4 +sum2_4;
   end 
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
    sum1_5 = 41'd0;
    sum_5  = 21'd0;
    sum2_5  = 21'd0;
    end
   else if (cnt_2 == 8'd1) begin
          sum_5 =  21'd0;
    end
    else if (cnt_3 == 8'd1) begin
     sum_5 =  21'd0;
   end
   else begin
    sum1_5 = in1 * w5;
    sum2_5 = {sum1_5[40],sum1_5[31:24],sum1_5[23:12]}; 
    sum_5 =sum_5 +sum2_5;
   end 
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
    sum1_6 = 41'd0;
    sum_6  = 21'd0;
    sum2_6  = 21'd0;
    end
   else if (cnt_2 == 8'd1) begin
          sum_6 =  21'd0;
    end
    else if (cnt_3 == 8'd1) begin
     sum_6 =  21'd0;
   end
   else begin
    sum1_6 = in1 * w6;
    sum2_6= {sum1_6[40],sum1_6[31:24],sum1_6[23:12]}; 
    sum_6 =sum_6 +sum2_6;
   end 
end


always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
    sum1_7 = 41'd0;
    sum_7  = 21'd0;
    sum2_7  = 21'd0;
    end
   else if (cnt_2 == 8'd1) begin
          sum_7 =  21'd0;
    end
    else if (cnt_3 == 8'd1) begin
     sum_7 =  21'd0;
   end
   else begin
    sum1_7 = in1 * w7;
    sum2_7 = {sum1_7[40],sum1_7[31:24],sum1_7[23:12]}; 
    sum_7 =sum_7+sum2_7;
   end 
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
    sum1_8 = 41'd0;
    sum_8  = 21'd0;
    sum2_8 = 21'd0;
    end
   else if (cnt_2 == 8'd1) begin
          sum_8 =  21'd0;
    end
    else  if (cnt_3 == 8'd1) begin
     sum_8 =  21'd0;
   end
   else begin
    sum1_8 = in1 * w8;
    sum2_8 = {sum1_8[40],sum1_8[31:24],sum1_8[23:12]}; 
    sum_8 =sum_8 +sum2_8;
   end 
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
	
        cnt_1<= 8'd0;
        cnt_2<= 8'd0;
        cnt_3<= 8'd0;
    end
    else if(valid_in == 1'd1) begin
        cnt_1 <= cnt_1 + 1'd1;
        if(cnt_1>=8'd6 && cnt_3 <=8'd20)
          cnt_2 <=cnt_2 + 1'd1;
        if(cnt_2 >= 8'd10 && cnt_3 <=8'd20)
        cnt_3<=cnt_3 + 1'd1;
        if(cnt_3 ==8'd20)begin
        cnt_1<= cnt_1;
        cnt_2<=cnt_2 ;
        cnt_3<= cnt_3;
     end
end
   

	else begin
	    cnt_1<= 8'd0;
        cnt_2<= 8'd0;
        cnt_3<= 8'd0;
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)begin
	 valid_out<=1'd0;
       suma<= 21'd0;
       sumb<= 21'd0;
       sumc<= 21'd0;
       sumd<= 21'd0;
       sume<= 21'd0;
       sumf<= 21'd0;
       sumg<= 21'd0;
       sumh<= 21'd0;

       suma_1<= 21'd0;
       sumb_1<= 21'd0;
       sumc_1<= 21'd0;
       sumd_1<= 21'd0;
       sume_1<= 21'd0;
       sumf_1<= 21'd0;
       sumg_1<= 21'd0;
       sumh_1<= 21'd0;

       out1<= 21'd0;
       out2<= 21'd0;
       out3<= 21'd0;
    end
    else if (cnt_1 == 8'd6) begin
         suma<= sum_1+b1;
         sumb<= sum_2+b2;
         sumc<= sum_3+b3;
         sumd<= sum_4+b4;
         sume<= sum_5+b5;
         sumf<= sum_6+b6;
         sumg<= sum_7+b7;
         sumh<= sum_8+b8;
    end
    else if (cnt_2 == 8'd10) begin
        suma_1<= sum_1+b1;
        sumb_1<= sum_2+b2;
        sumc_1<= sum_3+b3;
        sumd_1<= sum_4+b4;
        sume_1<= sum_5+b5;
        sumf_1<= sum_6+b6;
        sumg_1<= sum_7+b7;
        sumh_1<= sum_8+b8;
     end
   else if (cnt_3 == 8'd10) begin
     out1<= sum_1+b1;
     out2<= sum_2+b2;
     out3<= sum_3+b3;
    end
    else if(cnt_3 == 8'd15)
      valid_out<=1'd1;
end



 assign suma1   = (suma[20] == 1'd0 )? suma: 21'b0;
 assign sumb1   = (sumb[20] == 1'd0 )? sumb: 21'b0;
 assign sumc1   = (sumc[20] == 1'd0 )? sumc: 21'b0;
 assign sumd1   = (sumd[20] == 1'd0 )? sumd: 21'b0;
 assign sume1   = (sume[20] == 1'd0 )? sume: 21'b0;
 assign sumf1   = (sumf[20] == 1'd0 )? sumf: 21'b0;
 assign sumg1   = (sumg[20] == 1'd0 )? sumg: 21'b0;
 assign sumh1   = (sumh[20] == 1'd0 )? sumh: 21'b0;
 assign suma_11 = (suma_1[20] == 1'd0 )? suma_1: 21'b0;
 assign sumb_11 = (sumb_1[20] == 1'd0 )? sumb_1: 21'b0;
 assign sumc_11 = (sumc_1[20] == 1'd0 )? sumc_1: 21'b0;
 assign sumd_11 = (sumd_1[20] == 1'd0 )? sumd_1: 21'b0;
 assign sume_11 = (sume_1[20] == 1'd0 )? sume_1: 21'b0;
 assign sumf_11 = (sumf_1[20] == 1'd0 )? sumf_1: 21'b0;
 assign sumg_11 = (sumg_1[20] == 1'd0 )? sumg_1: 21'b0;
 assign sumh_11 = (sumh_1[20] == 1'd0 )? sumh_1: 21'b0;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        in1<=21'd0;
		  b1 <=  0;
	      b2 <=  0;
	      b3 <=  0;
	      b4 <=  0;
	      b5 <=  0;
	      b6 <=  0;
	      b7 <=  0;
	      b8 <=  0;
		  w1 <= 0  ;
		  w2 <= 0  ;
		  w3 <= 0  ;
		  w4 <= 0  ;
		  w5 <= 0  ;
		  w6 <= 0  ;
		  w7 <= 0  ;
		  w8 <= 0  ;
		  
    end
    else if (cnt_1 > 8'd0&&cnt_1 <= 8'd4)begin
	      b1 <=  b1_1;
	      b2 <=  b2_1;
	      b3 <=  b3_1;
	      b4 <=  b4_1;
	      b5 <=  b5_1;
	      b6 <=  b6_1;
	      b7 <=  b7_1;
	      b8 <=  b8_1;
	
        case(cnt_1)
         8'd1: begin  
		        in1 <= ina;
		        w1 <= w1_1  ;
				w2 <= w2_1  ;
				w3 <= w3_1  ;
				w4 <= w4_1  ;
				w5 <= w5_1  ;
				w6 <= w6_1  ;
				w7 <= w7_1  ;
				w8 <= w8_1  ;
				end		
         8'd2:  begin
		        in1 <= inb;
		        w1 <= w1_2  ;
				w2 <= w2_2  ;
				w3 <= w3_2  ;
				w4 <= w4_2  ;
				w5 <= w5_2  ;
				w6 <= w6_2  ;
				w7 <= w7_2  ;
				w8 <= w8_2  ;
				end
         8'd3:  begin
		        in1 <= inc;
		        w1 <= w1_3  ;
				w2 <= w2_3  ;
				w3 <= w3_3  ;
				w4 <= w4_3  ;
				w5 <= w5_3  ;
				w6 <= w6_3  ;
				w7 <= w7_3  ;
				w8 <= w8_3  ;
				end
         8'd4:  begin
		        in1 <= ind;
		        w1 <= w1_4  ;
				w2 <= w2_4  ;
				w3 <= w3_4  ;
				w4 <= w4_4  ;
				w5 <= w5_4  ;
				w6 <= w6_4  ;
				w7 <= w7_4  ;
				w8 <= w8_4  ;
		        end
         default: begin
		        in1<=0;
		        w1 <= 0  ;
				w2 <= 0  ;
				w3 <= 0  ;
				w4 <= 0  ;
				w5 <= 0  ;
				w6 <= 0  ;
				w7 <= 0  ;
				w8 <= 0  ;
				end
        endcase          
    end
    else if (cnt_2 > 8'd0&&cnt_2 <= 8'd8) begin
	      b1 <=  b1_2;
	      b2 <=  b2_2;
	      b3 <=  b3_2;
	      b4 <=  b4_2;
	      b5 <=  b5_2;
	      b6 <=  b6_2;
	      b7 <=  b7_2;
	      b8 <=  b8_2;
         case(cnt_2)
          8'd1: begin
		        in1 <= suma1;
		        w1 <= w1_21  ;
				w2 <= w2_21  ;
				w3 <= w3_21  ;
				w4 <= w4_21  ;
				w5 <= w5_21  ;
				w6 <= w6_21  ;
				w7 <= w7_21  ;
				w8 <= w8_21  ;
				end
          8'd2: begin 
		        in1 <= sumb1;
		        w1 <= w1_22  ;
				w2 <= w2_22  ;
				w3 <= w3_22  ;
				w4 <= w4_22  ;
				w5 <= w5_22  ;
				w6 <= w6_22  ;
				w7 <= w7_22  ;
				w8 <= w8_22  ; 
                end				
          8'd3:  begin
				in1 <= sumc1;
		        w1 <= w1_23  ;
				w2 <= w2_23  ;
				w3 <= w3_23  ;
				w4 <= w4_23  ;
				w5 <= w5_23  ;
				w6 <= w6_23  ;
				w7 <= w7_23  ;
				w8 <= w8_23  ;
				end
          8'd4: begin
		        in1 <= sumd1;
		        w1 <= w1_24  ;
				w2 <= w2_24  ;
				w3 <= w3_24  ;
				w4 <= w4_24  ;
				w5 <= w5_24  ;
				w6 <= w6_24  ;
				w7 <= w7_24  ;
				w8 <= w8_24  ;
				end
          8'd5:  begin
		        in1 <= sume1;
		        w1 <= w1_25  ;
				w2 <= w2_25  ;
				w3 <= w3_25  ;
				w4 <= w4_25  ;
				w5 <= w5_25  ;
				w6 <= w6_25  ;
				w7 <= w7_25  ;
				w8 <= w8_25  ;
				end
          8'd6:  begin
		        in1 <= sumf1;
		        w1 <= w1_26  ;
				w2 <= w2_26  ;
				w3 <= w3_26  ;
				w4 <= w4_26  ;
				w5 <= w5_26  ;
				w6 <= w6_26  ;
				w7 <= w7_26  ;
				w8 <= w8_26  ;
				end
          8'd7:  begin
		        in1 <= sumg1;
		        w1 <= w1_27 ;
				w2 <= w2_27 ;
				w3 <= w3_27 ;
				w4 <= w4_27 ;
				w5 <= w5_27 ;
				w6 <= w6_27 ;
				w7 <= w7_27 ;
				w8 <= w8_27 ;
				end
          8'd8:  begin
		        in1 <= sumh1;
		        w1 <= w1_28  ;
				w2 <= w2_28  ;
				w3 <= w3_28  ;
				w4 <= w4_28  ;
				w5 <= w5_28  ;
				w6 <= w6_28  ;
				w7 <= w7_28  ;
				w8 <= w8_28  ;
				end
          default:begin
		        in1<=0;
		        w1 <= 0  ;
				w2 <= 0  ;
				w3 <= 0  ;
				w4 <= 0  ;
				w5 <= 0  ;
				w6 <= 0  ;
				w7 <= 0  ;
				w8 <= 0  ;
				end
        endcase         
    end
    else if (cnt_3 > 8'd0 && cnt_3 <= 8'd8) begin
	      b1 <=  b1_3;
	      b2 <=  b2_3;
	      b3 <=  b3_3;
	      b4 <=  b4_3;
	      b5 <=  b5_3;
	      b6 <=  b6_3;
	      b7 <=  b7_3;
	      b8 <=  b8_3;
     case(cnt_3)
      8'd1:  begin
	            in1 <= suma_11;
	            w1 <= w1_31  ;
				w2 <= w2_31  ;
				w3 <= w3_31  ;
				w4 <= w4_31  ;
				w5 <= w5_31  ;
				w6 <= w6_31  ;
				w7 <= w7_31  ;
				w8 <= w8_31  ;
				end
      8'd2:  begin
	            in1 <= sumb_11;
	            w1 <= w1_32  ;
				w2 <= w2_32  ;
				w3 <= w3_32  ;
				w4 <= w4_32  ;
				w5 <= w5_32  ;
				w6 <= w6_32  ;
				w7 <= w7_32  ;
				w8 <= w8_32  ;
				end
      8'd3:    begin
             	in1 <= sumc_11;
	            w1 <= w1_33  ;
				w2 <= w2_33  ;
				w3 <= w3_33  ;
				w4 <= w4_33  ;
				w5 <= w5_33  ;
				w6 <= w6_33  ;
				w7 <= w7_33  ;
				w8 <= w8_33  ;
				end
      8'd4:   begin
	            in1 <= sumd_11;
	            w1 <= w1_34  ;
				w2 <= w2_34  ;
				w3 <= w3_34  ;
				w4 <= w4_34  ;
				w5 <= w5_34  ;
				w6 <= w6_34  ;
				w7 <= w7_34  ;
				w8 <= w8_34  ;
				end
      8'd5:  begin
	            in1 <= sume_11;
	            w1 <= w1_35  ;
				w2 <= w2_35  ;
				w3 <= w3_35  ;
				w4 <= w4_35  ;
				w5 <= w5_35  ;
				w6 <= w6_35  ;
				w7 <= w7_35  ;
				w8 <= w8_35  ;
				end
      8'd6:  begin
	            in1 <= sumf_11;
	            w1 <= w1_36  ;
				w2 <= w2_36  ;
				w3 <= w3_36  ;
				w4 <= w4_36  ;
				w5 <= w5_36  ;
				w6 <= w6_36  ;
				w7 <= w7_36  ;
				w8 <= w8_36  ;
				end
      8'd7:  begin
	            in1 <= sumg_11;
	            w1 <= w1_37  ;
				w2 <= w2_37  ;
				w3 <= w3_37  ;
				w4 <= w4_37  ;
				w5 <= w5_37  ;
				w6 <= w6_37  ;
				w7 <= w7_37  ;
				w8 <= w8_37  ;
				end
      8'd8:  begin
	            in1 <= sumh_11;
	            w1 <= w1_38  ;
				w2 <= w2_38  ;
				w3 <= w3_38  ;
				w4 <= w4_38  ;
				w5 <= w5_38  ;
				w6 <= w6_38  ;
				w7 <= w7_38  ;
				w8 <= w8_38  ;
				end
      default:begin
	            in1<=0;
	            w1 <= 0  ;
				w2 <= 0  ;
				w3 <= 0  ;
				w4 <= 0  ;
				w5 <= 0  ;
				w6 <= 0  ;
				w7 <= 0  ;
				w8 <= 0  ;
				end
    endcase          
   end
   else
       in1<=21'd0;
end




endmodule
