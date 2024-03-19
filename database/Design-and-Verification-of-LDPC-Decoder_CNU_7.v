module CNU_7(
output reg signed [31:0] R1,
output reg signed [31:0] R2,
output reg signed [31:0] R3,
output reg signed [31:0] R4,
output reg signed [31:0] R5,
output reg signed [31:0] R6,
output reg signed [31:0] R7,
input signed [31:0] Q1,
input signed [31:0] Q2,
input signed [31:0] Q3,
input signed [31:0] Q4,
input signed [31:0] Q5,
input signed [31:0] Q6,
input signed [31:0] Q7,
input clk);

reg signed [31:0] min_sum_1;
reg signed [31:0] min_sum_2;
reg signed [31:0] min_sum_3;
reg signed [31:0] min_sum_4;
reg signed [31:0] min_sum_5;
reg signed [31:0] min_sum_6;
reg signed [31:0] min_sum_7;
wire [6:0] Q_signs;
wire final_sign_1;
wire final_sign_2;
wire final_sign_3;
wire final_sign_4;
wire final_sign_5;
wire final_sign_6;
wire final_sign_7;
wire [31:0] Q1_abs;
wire [31:0] Q2_abs;
wire [31:0] Q3_abs;
wire [31:0] Q4_abs;
wire [31:0] Q5_abs;
wire [31:0] Q6_abs;
wire [31:0] Q7_abs;

assign Q1_abs = (Q1[31]==1) ? ~Q1+1'b1 : Q1;
assign Q2_abs = (Q2[31]==1) ? ~Q2+1'b1 : Q2;
assign Q3_abs = (Q3[31]==1) ? ~Q3+1'b1 : Q3;
assign Q4_abs = (Q4[31]==1) ? ~Q4+1'b1 : Q4;
assign Q5_abs = (Q5[31]==1) ? ~Q5+1'b1 : Q5;
assign Q6_abs = (Q6[31]==1) ? ~Q6+1'b1 : Q6;
assign Q7_abs = (Q7[31]==1) ? ~Q7+1'b1 : Q7;


assign Q_signs[0] = (Q1[31]==1) ? 1'b1 : 1'b0;
assign Q_signs[1] = (Q2[31]==1) ? 1'b1 : 1'b0;
assign Q_signs[2] = (Q3[31]==1) ? 1'b1 : 1'b0;
assign Q_signs[3] = (Q4[31]==1) ? 1'b1 : 1'b0;
assign Q_signs[4] = (Q5[31]==1) ? 1'b1 : 1'b0;
assign Q_signs[5] = (Q6[31]==1) ? 1'b1 : 1'b0;
assign Q_signs[6] = (Q7[31]==1) ? 1'b1 : 1'b0;

assign final_sign_1 = Q_signs[1]^Q_signs[2]^Q_signs[3]^Q_signs[4]^Q_signs[5]^Q_signs[6];
assign final_sign_2 = Q_signs[0]^Q_signs[2]^Q_signs[3]^Q_signs[4]^Q_signs[5]^Q_signs[6];
assign final_sign_3 = Q_signs[1]^Q_signs[0]^Q_signs[3]^Q_signs[4]^Q_signs[5]^Q_signs[6];
assign final_sign_4 = Q_signs[1]^Q_signs[2]^Q_signs[0]^Q_signs[4]^Q_signs[5]^Q_signs[6];
assign final_sign_5 = Q_signs[1]^Q_signs[2]^Q_signs[3]^Q_signs[0]^Q_signs[5]^Q_signs[6];
assign final_sign_6 = Q_signs[1]^Q_signs[2]^Q_signs[3]^Q_signs[4]^Q_signs[0]^Q_signs[6];
assign final_sign_7 = Q_signs[1]^Q_signs[2]^Q_signs[3]^Q_signs[4]^Q_signs[5]^Q_signs[0];


always@(negedge clk)
begin

if (Q2_abs<=Q3_abs && Q2_abs<=Q4_abs && Q2_abs<=Q5_abs && Q2_abs<=Q6_abs && Q2_abs<=Q7_abs) begin min_sum_1 = Q2_abs;  end 
if (Q3_abs<Q2_abs  && Q3_abs<=Q4_abs && Q3_abs<=Q5_abs && Q3_abs<=Q6_abs && Q3_abs<=Q7_abs) begin min_sum_1 = Q3_abs;  end 
if (Q4_abs<Q2_abs  && Q4_abs<Q3_abs && Q4_abs<=Q5_abs && Q4_abs<=Q6_abs && Q4_abs<=Q7_abs)  begin min_sum_1 = Q4_abs;  end
if (Q5_abs<Q2_abs  && Q5_abs<Q3_abs && Q5_abs<Q4_abs && Q5_abs<=Q6_abs && Q5_abs<=Q7_abs)   begin min_sum_1 = Q5_abs;  end 
if (Q6_abs<Q2_abs  && Q6_abs<Q3_abs && Q6_abs<Q4_abs && Q6_abs<Q5_abs  && Q6_abs<=Q7_abs)   begin min_sum_1 = Q6_abs;  end 
if (Q7_abs<Q2_abs  && Q7_abs<Q3_abs && Q7_abs<Q4_abs && Q7_abs<Q5_abs  && Q7_abs<=Q6_abs)   begin min_sum_1 = Q7_abs;  end 

if (Q1_abs<=Q3_abs && Q1_abs<=Q4_abs && Q1_abs<=Q5_abs && Q1_abs<=Q6_abs && Q1_abs<=Q7_abs) begin min_sum_2 = Q1_abs;  end 
if (Q3_abs<Q1_abs  && Q3_abs<=Q4_abs && Q3_abs<=Q5_abs && Q3_abs<=Q6_abs && Q3_abs<=Q7_abs) begin min_sum_2 = Q3_abs;  end 
if (Q4_abs<Q1_abs  && Q4_abs<Q3_abs && Q4_abs<=Q5_abs && Q4_abs<=Q6_abs && Q4_abs<=Q7_abs)  begin min_sum_2 = Q4_abs;  end
if (Q5_abs<Q1_abs  && Q5_abs<Q3_abs && Q5_abs<Q4_abs && Q5_abs<=Q6_abs && Q5_abs<=Q7_abs)   begin min_sum_2 = Q5_abs;  end 
if (Q6_abs<Q1_abs  && Q6_abs<Q3_abs && Q6_abs<Q4_abs && Q6_abs<Q5_abs  && Q6_abs<=Q7_abs)   begin min_sum_2 = Q6_abs;  end 
if (Q7_abs<Q1_abs  && Q7_abs<Q3_abs && Q7_abs<Q4_abs && Q7_abs<Q5_abs  && Q7_abs<=Q6_abs)   begin min_sum_2 = Q7_abs;  end 

if (Q2_abs<=Q1_abs && Q2_abs<=Q4_abs && Q2_abs<=Q5_abs && Q2_abs<=Q6_abs && Q2_abs<=Q7_abs) begin min_sum_3 = Q2_abs;  end 
if (Q1_abs<Q2_abs  && Q1_abs<=Q4_abs && Q1_abs<=Q5_abs && Q1_abs<=Q6_abs && Q1_abs<=Q7_abs) begin min_sum_3 = Q1_abs;  end 
if (Q4_abs<Q2_abs  && Q4_abs<Q1_abs && Q4_abs<=Q5_abs && Q4_abs<=Q6_abs && Q4_abs<=Q7_abs)  begin min_sum_3 = Q4_abs;  end
if (Q5_abs<Q2_abs  && Q5_abs<Q1_abs && Q5_abs<Q4_abs && Q5_abs<=Q6_abs && Q5_abs<=Q7_abs)   begin min_sum_3 = Q5_abs;  end 
if (Q6_abs<Q2_abs  && Q6_abs<Q1_abs && Q6_abs<Q4_abs && Q6_abs<Q5_abs  && Q6_abs<=Q7_abs)   begin min_sum_3 = Q6_abs;  end 
if (Q7_abs<Q2_abs  && Q7_abs<Q1_abs && Q7_abs<Q4_abs && Q7_abs<Q5_abs  && Q7_abs<=Q6_abs)   begin min_sum_3 = Q7_abs;  end 

if (Q2_abs<=Q3_abs && Q2_abs<=Q1_abs && Q2_abs<=Q5_abs && Q2_abs<=Q6_abs && Q2_abs<=Q7_abs) begin min_sum_4 = Q2_abs;  end 
if (Q3_abs<Q2_abs  && Q3_abs<=Q1_abs && Q3_abs<=Q5_abs && Q3_abs<=Q6_abs && Q3_abs<=Q7_abs) begin min_sum_4 = Q3_abs;  end 
if (Q1_abs<Q2_abs  && Q1_abs<Q3_abs && Q1_abs<=Q5_abs && Q1_abs<=Q6_abs && Q1_abs<=Q7_abs)  begin min_sum_4 = Q1_abs;  end
if (Q5_abs<Q2_abs  && Q5_abs<Q3_abs && Q5_abs<Q1_abs && Q5_abs<=Q6_abs && Q5_abs<=Q7_abs)   begin min_sum_4 = Q5_abs;  end 
if (Q6_abs<Q2_abs  && Q6_abs<Q3_abs && Q6_abs<Q1_abs && Q6_abs<Q5_abs && Q6_abs<=Q7_abs )   begin min_sum_4 = Q6_abs;  end 
if (Q7_abs<Q2_abs  && Q7_abs<Q3_abs && Q7_abs<Q1_abs && Q7_abs<Q5_abs  && Q7_abs<=Q6_abs)   begin min_sum_4 = Q7_abs;  end 

if (Q2_abs<=Q3_abs && Q2_abs<=Q4_abs && Q2_abs<=Q1_abs && Q2_abs<=Q6_abs && Q2_abs<=Q7_abs) begin min_sum_5 = Q2_abs;  end 
if (Q3_abs<Q2_abs  && Q3_abs<=Q4_abs && Q3_abs<=Q1_abs && Q3_abs<=Q6_abs && Q3_abs<=Q7_abs) begin min_sum_5 = Q3_abs;  end 
if (Q4_abs<Q2_abs  && Q4_abs<Q3_abs && Q4_abs<=Q1_abs && Q4_abs<=Q6_abs && Q4_abs<=Q7_abs)  begin min_sum_5 = Q4_abs;  end
if (Q1_abs<Q2_abs  && Q1_abs<Q3_abs && Q1_abs<Q4_abs && Q1_abs<=Q6_abs && Q1_abs<=Q7_abs)   begin min_sum_5 = Q1_abs;  end 
if (Q6_abs<Q2_abs  && Q6_abs<Q3_abs && Q6_abs<Q4_abs && Q6_abs<Q1_abs  && Q6_abs<=Q7_abs)   begin min_sum_5 = Q6_abs;  end 
if (Q7_abs<Q2_abs  && Q7_abs<Q3_abs && Q7_abs<Q4_abs && Q7_abs<Q1_abs  && Q7_abs<=Q6_abs)   begin min_sum_5 = Q7_abs;  end 

if (Q2_abs<=Q3_abs && Q2_abs<=Q4_abs && Q2_abs<=Q5_abs && Q2_abs<=Q1_abs && Q2_abs<=Q7_abs) begin min_sum_6 = Q2_abs;  end 
if (Q3_abs<Q2_abs  && Q3_abs<=Q4_abs && Q3_abs<=Q5_abs && Q3_abs<=Q1_abs && Q3_abs<=Q7_abs) begin min_sum_6 = Q3_abs;  end 
if (Q4_abs<Q2_abs  && Q4_abs<Q3_abs && Q4_abs<=Q5_abs && Q4_abs<=Q1_abs && Q4_abs<=Q7_abs)  begin min_sum_6 = Q4_abs;  end
if (Q5_abs<Q2_abs  && Q5_abs<Q3_abs && Q5_abs<Q4_abs && Q5_abs<=Q1_abs && Q5_abs<=Q7_abs)   begin min_sum_6 = Q5_abs;  end 
if (Q1_abs<Q2_abs  && Q1_abs<Q3_abs && Q1_abs<Q4_abs && Q1_abs<Q5_abs  && Q1_abs<=Q7_abs)   begin min_sum_6 = Q1_abs;  end 
if (Q7_abs<Q2_abs  && Q7_abs<Q3_abs && Q7_abs<Q4_abs && Q7_abs<Q5_abs  && Q7_abs<=Q1_abs)   begin min_sum_6 = Q7_abs;  end 

if (Q2_abs<=Q3_abs && Q2_abs<=Q4_abs && Q2_abs<=Q5_abs && Q2_abs<=Q1_abs && Q2_abs<=Q6_abs) begin min_sum_7 = Q2_abs;  end 
if (Q3_abs<Q2_abs  && Q3_abs<=Q4_abs && Q3_abs<=Q5_abs && Q3_abs<=Q1_abs && Q3_abs<=Q6_abs) begin min_sum_7 = Q3_abs;  end 
if (Q4_abs<Q2_abs  && Q4_abs<Q3_abs && Q4_abs<=Q5_abs && Q4_abs<=Q1_abs && Q4_abs<=Q6_abs)  begin min_sum_7 = Q4_abs;  end
if (Q5_abs<Q2_abs  && Q5_abs<Q3_abs && Q5_abs<Q4_abs && Q5_abs<=Q1_abs && Q5_abs<=Q6_abs)   begin min_sum_7 = Q5_abs;  end 
if (Q1_abs<Q2_abs  && Q1_abs<Q3_abs && Q1_abs<Q4_abs && Q1_abs<Q5_abs  && Q1_abs<=Q6_abs)   begin min_sum_7 = Q1_abs;  end 
if (Q6_abs<Q2_abs  && Q6_abs<Q3_abs && Q6_abs<Q4_abs && Q6_abs<Q5_abs  && Q6_abs<=Q1_abs)   begin min_sum_7 = Q6_abs;  end 

R1 = final_sign_1 ? ~min_sum_1 + 1'b1 : min_sum_1;
R2 = final_sign_2 ? ~min_sum_2 + 1'b1 : min_sum_2;
R3 = final_sign_3 ? ~min_sum_3 + 1'b1 : min_sum_3;
R4 = final_sign_4 ? ~min_sum_4 + 1'b1 : min_sum_4;
R5 = final_sign_5 ? ~min_sum_5 + 1'b1 : min_sum_5;
R6 = final_sign_6 ? ~min_sum_6 + 1'b1 : min_sum_6;
R7 = final_sign_7 ? ~min_sum_7 + 1'b1 : min_sum_7;

end

endmodule

