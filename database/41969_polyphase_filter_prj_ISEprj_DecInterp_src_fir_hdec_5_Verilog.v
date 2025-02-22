// This program was cloned from: https://github.com/HeLiangHIT/polyphase_filter_prj
// License: MIT License

/*---------------------------------------------------------------------------*
* This solution is produced by FIR Filter Generator (FFG) based on the       *
* Radix-2^r Multiple-Constant-Multiplication (MCM) algorithm developed       *
* by A.K. Oudjida. The FFG program is writen by M.L. Berrandjia based on     * 
* the FFG specifications given by A. Liacha.                                 *
* Copyright (c) 2015 CDTA (www.cdta.dz). Personal use of this material is    *
* permitted. However, permission to use this material for any other purposes *
* must be obtained from the CDTA by sending an email to a_oudjida@cdta.dz    *
*----------------------------------------------------------------------------*/

// FIR filter generator (release version 1.0.0)
// Date: 2016-5-22 Time: 10:35:51

module hdec_5_Verilog (clk, reset, X, Y); 

//Parameters
parameter word_size_in = 8; // Bit-size of the filter input X 
parameter word_size_out = 20; // Bit-size of the filter output Y, 
                              // word_size_out = word_size_in + ceil(log2(sum(abs(Ci))))+1

//Inputs & Outputs
input clk, reset;
input signed [word_size_in-1:0] X;   // Filter input in two's complement representation
output signed [word_size_out-1:0] Y; // Filter output in two's complement representation

reg  [word_size_out-1:0] Y;

// MCM bloc
// Radix-2^r MCM solution of the reduced set (Hmin set) including positive/odd constants only

wire signed [word_size_in:0] x1;
assign x1 = X;

// Hmin set
wire signed  [9:0] x_1;  // coefficients_size = word_size_in + ceil(log2(Ci))
wire signed  [9:0] x1t;
wire signed  [11:0] x7;
wire signed  [12:0] x9;
wire signed  [11:0] x_4;
wire signed  [13:0] x_28;
wire signed  [14:0] x_36;
wire signed  [15:0] x105;
wire signed  [16:0] x210;
wire signed  [17:0] x256;

// Radix-2^r recoding of the Hmin set
assign x_1 = -(x1<<0);
assign x1t = +(x1<<0);
assign x7 = +(x1<<3)-(x1<<0);
assign x9 = -(x7<<0)+(x1<<4);
assign x_4 = -(x1<<2);
assign x_28 = -(x7<<2);
assign x_36 = -(x9<<2);
assign x105 = -(x7<<0)+(x7<<4);
assign x210 = +(x105<<1);
assign x256 = +(x1<<8);

// SCM_i = Ci x X
wire signed  [9:0] SCM_0;  //SCM_i_size = word_size_in + ceil(log2(Ci))
wire signed  [9:0] SCM_1;
wire signed  [11:0] SCM_2;
wire signed  [12:0] SCM_3;
wire signed  [11:0] SCM_4;
wire signed  [13:0] SCM_5;
wire signed  [14:0] SCM_6;
wire signed  [11:0] SCM_7;
wire signed  [15:0] SCM_8;
wire signed  [16:0] SCM_9;
wire signed  [17:0] SCM_10;
wire signed  [16:0] SCM_11;
wire signed  [15:0] SCM_12;
wire signed  [11:0] SCM_13;
wire signed  [14:0] SCM_14;
wire signed  [13:0] SCM_15;
wire signed  [11:0] SCM_16;
wire signed  [12:0] SCM_17;
wire signed  [11:0] SCM_18;
wire signed  [9:0] SCM_19;
wire signed  [9:0] SCM_20;

assign SCM_0 = x_1;
assign SCM_1 = x1t;
assign SCM_2 = x7;
assign SCM_3 = x9;
assign SCM_4 = x_4;
assign SCM_5 = x_28;
assign SCM_6 = x_36;
assign SCM_7 = x7;
assign SCM_8 = x105;
assign SCM_9 = x210;
assign SCM_10 = x256;
assign SCM_11 = x210;
assign SCM_12 = x105;
assign SCM_13 = x7;
assign SCM_14 = x_36;
assign SCM_15 = x_28;
assign SCM_16 = x_4;
assign SCM_17 = x9;
assign SCM_18 = x7;
assign SCM_19 = x1;
assign SCM_20 = x_1;

// MAC_i is the register i in the adder structure of the filter
reg signed  [19:0] MAC_0; //MAC_i_size = word_size_in + ceil(log2(Sum(Ci)))
reg signed  [19:0] MAC_1;
reg signed  [19:0] MAC_2;
reg signed  [19:0] MAC_3;
reg signed  [19:0] MAC_4;
reg signed  [19:0] MAC_5;
reg signed  [18:0] MAC_6;
reg signed  [18:0] MAC_7;
reg signed  [18:0] MAC_8;
reg signed  [18:0] MAC_9;
reg signed  [18:0] MAC_10;
reg signed  [17:0] MAC_11;
reg signed  [16:0] MAC_12;
reg signed  [15:0] MAC_13;
reg signed  [15:0] MAC_14;
reg signed  [14:0] MAC_15;
reg signed  [13:0] MAC_16;
reg signed  [13:0] MAC_17;
reg signed  [12:0] MAC_18;
reg signed  [10:0] MAC_19;
reg signed  [9:0] MAC_20;

wire signed  [19:0] Y_in;

always @(posedge clk or negedge reset) begin
  if(~reset) begin
    reset_reg;
  end
  else begin
    init_reg;
    Y <= Y_in;
    MAC_0 <=  MAC_1 + SCM_0;
    MAC_1 <=  MAC_2 + SCM_1;
    MAC_2 <=  MAC_3 + SCM_2;
    MAC_3 <=  MAC_4 + SCM_3;
    MAC_4 <=  MAC_5 + SCM_4;
    MAC_5 <=  MAC_6 + SCM_5;
    MAC_6 <=  MAC_7 + SCM_6;
    MAC_7 <=  MAC_8 + SCM_7;
    MAC_8 <=  MAC_9 + SCM_8;
    MAC_9 <=  MAC_10 + SCM_9;
    MAC_10 <=  MAC_11 + SCM_10;
    MAC_11 <=  MAC_12 + SCM_11;
    MAC_12 <=  MAC_13 + SCM_12;
    MAC_13 <=  MAC_14 + SCM_13;
    MAC_14 <=  MAC_15 + SCM_14;
    MAC_15 <=  MAC_16 + SCM_15;
    MAC_16 <=  MAC_17 + SCM_16;
    MAC_17 <=  MAC_18 + SCM_17;
    MAC_18 <=  MAC_19 + SCM_18;
    MAC_19 <=  MAC_20 + SCM_19;
    MAC_20 <=  SCM_20;
  end
end

assign Y_in = MAC_0;

// Tasks

task reset_reg;
  begin
    MAC_0 <=  0;
    MAC_1 <=  0;
    MAC_2 <=  0;
    MAC_3 <=  0;
    MAC_4 <=  0;
    MAC_5 <=  0;
    MAC_6 <=  0;
    MAC_7 <=  0;
    MAC_8 <=  0;
    MAC_9 <=  0;
    MAC_10 <=  0;
    MAC_11 <=  0;
    MAC_12 <=  0;
    MAC_13 <=  0;
    MAC_14 <=  0;
    MAC_15 <=  0;
    MAC_16 <=  0;
    MAC_17 <=  0;
    MAC_18 <=  0;
    MAC_19 <=  0;
    MAC_20 <=  0;
    Y <= 0;
  end
endtask

task init_reg;
  begin
    Y <= Y;
    MAC_0 <=  MAC_0;
    MAC_1 <=  MAC_1;
    MAC_2 <=  MAC_2;
    MAC_3 <=  MAC_3;
    MAC_4 <=  MAC_4;
    MAC_5 <=  MAC_5;
    MAC_6 <=  MAC_6;
    MAC_7 <=  MAC_7;
    MAC_8 <=  MAC_8;
    MAC_9 <=  MAC_9;
    MAC_10 <=  MAC_10;
    MAC_11 <=  MAC_11;
    MAC_12 <=  MAC_12;
    MAC_13 <=  MAC_13;
    MAC_14 <=  MAC_14;
    MAC_15 <=  MAC_15;
    MAC_16 <=  MAC_16;
    MAC_17 <=  MAC_17;
    MAC_18 <=  MAC_18;
    MAC_19 <=  MAC_19;
    MAC_20 <=  MAC_20;
  end
endtask

endmodule
