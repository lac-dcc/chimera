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
// Date: 2016-5-22 Time: 10:36:20

module hdec_8_Verilog (clk, reset, X, Y); 

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

// Radix-2^r odd-multiples
wire signed [word_size_in:0] x1;
wire signed [11:0] x7;
wire signed [14:0] x41;
wire signed [13:0] x19;
wire signed [14:0] x35;

// Hmin set
wire signed  [9:0] x_1;  // coefficients_size = word_size_in + ceil(log2(Ci))
wire signed  [10:0] x3;
wire signed  [12:0] x9;
wire signed  [11:0] x6;
wire signed  [12:0] x_12;
wire signed  [14:0] x_35;
wire signed  [13:0] x_27;
wire signed  [14:0] x39;
wire signed  [16:0] x147;
wire signed  [16:0] x237;
wire signed  [16:0] x249;
wire signed  [16:0] x174;
wire signed  [15:0] x64;
wire signed  [13:0] x_16;
wire signed  [14:0] x_37;
wire signed  [13:0] x_19;
wire signed  [11:0] x4;
wire signed  [9:0] x0;


assign x1 = X;
assign x7 = +(x1<<3)-(x1<<0);
assign x41 = +(x9<<0)+(x1<<5);
assign x19 = -(x_19<<0);
assign x35 = -(x_35<<0);



// Radix-2^r recoding of the Hmin set
assign x_1 = -(x1<<0);
assign x3 = +(x1<<1)+(x1<<0);
assign x9 = +(x1<<3)+(x1<<0);
assign x6 = +(x3<<1);
assign x_12 = -(x3<<2);
assign x_35 = -(x3<<0)-(x1<<5);
assign x_27 = -(x19<<0)-(x1<<3);
assign x39 = +(x7<<0)+(x1<<5);
assign x147 = +(x19<<0)+(x1<<7);
assign x237 = -(x19<<0)+(x1<<8);
assign x249 = -(x7<<0)+(x1<<8);
assign x174 = -(x41<<1)+(x1<<8);
assign x64 = +(x1<<6);
assign x_16 = -(x1<<4);
assign x_37 = -(x35<<0)-(x1<<1);
assign x_19 = -(x3<<0)-(x1<<4);
assign x4 = +(x1<<2);
assign x0 = 0;

// SCM_i = Ci x X
wire signed  [9:0] SCM_0;  //SCM_i_size = word_size_in + ceil(log2(Ci))
wire signed  [10:0] SCM_1;
wire signed  [12:0] SCM_2;
wire signed  [11:0] SCM_3;
wire signed  [12:0] SCM_4;
wire signed  [14:0] SCM_5;
wire signed  [13:0] SCM_6;
wire signed  [14:0] SCM_7;
wire signed  [16:0] SCM_8;
wire signed  [16:0] SCM_9;
wire signed  [16:0] SCM_10;
wire signed  [16:0] SCM_11;
wire signed  [15:0] SCM_12;
wire signed  [13:0] SCM_13;
wire signed  [14:0] SCM_14;
wire signed  [13:0] SCM_15;
wire signed  [10:0] SCM_16;
wire signed  [12:0] SCM_17;
wire signed  [11:0] SCM_18;
wire signed  [9:0] SCM_19;
wire signed  [9:0] SCM_20;

assign SCM_0 = x_1;
assign SCM_1 = x3;
assign SCM_2 = x9;
assign SCM_3 = x6;
assign SCM_4 = x_12;
assign SCM_5 = x_35;
assign SCM_6 = x_27;
assign SCM_7 = x39;
assign SCM_8 = x147;
assign SCM_9 = x237;
assign SCM_10 = x249;
assign SCM_11 = x174;
assign SCM_12 = x64;
assign SCM_13 = x_16;
assign SCM_14 = x_37;
assign SCM_15 = x_19;
assign SCM_16 = x3;
assign SCM_17 = x9;
assign SCM_18 = x4;
assign SCM_19 = x0;
assign SCM_20 = x_1;

// MAC_i is the register i in the adder structure of the filter
reg signed  [19:0] MAC_0; //MAC_i_size = word_size_in + ceil(log2(Sum(Ci)))
reg signed  [19:0] MAC_1;
reg signed  [19:0] MAC_2;
reg signed  [19:0] MAC_3;
reg signed  [19:0] MAC_4;
reg signed  [19:0] MAC_5;
reg signed  [19:0] MAC_6;
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
reg signed  [12:0] MAC_17;
reg signed  [11:0] MAC_18;
reg signed  [9:0] MAC_19;
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
