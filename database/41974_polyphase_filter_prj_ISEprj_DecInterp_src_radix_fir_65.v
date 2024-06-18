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
// Date: 2016-5-22 Time: 7:47:10

module radix_fir_65 (clk, reset, X, Y); 

//Parameters
parameter word_size_in = 8; // Bit-size of the filter input X 
parameter word_size_out = 23; // Bit-size of the filter output Y, 
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
wire signed [10:0] x3;
wire signed [11:0] x5;
wire signed [11:0] x7;
assign x1 = X;
assign x3 = +(x1<<1)+(x1<<0);
assign x5 = +(x1<<2)+(x1<<0);
assign x7 = +(x1<<3)-(x1<<0);

// Hmin set
wire signed  [14:0] x_58;  // coefficients_size = word_size_in + ceil(log2(Ci))
wire signed  [17:0] x256;
wire signed  [15:0] x95;
wire signed  [15:0] x66;
wire signed  [15:0] x64;
wire signed  [15:0] x67;
wire signed  [15:0] x73;
wire signed  [15:0] x78;
wire signed  [15:0] x83;
wire signed  [15:0] x89;
wire signed  [15:0] x94;
wire signed  [15:0] x99;
wire signed  [15:0] x105;
wire signed  [15:0] x110;
wire signed  [15:0] x116;
wire signed  [15:0] x121;
wire signed  [15:0] x126;
wire signed  [16:0] x130;
wire signed  [16:0] x135;
wire signed  [16:0] x139;
wire signed  [16:0] x144;
wire signed  [16:0] x148;
wire signed  [16:0] x151;
wire signed  [16:0] x155;
wire signed  [16:0] x158;
wire signed  [16:0] x161;
wire signed  [16:0] x163;
wire signed  [16:0] x165;
wire signed  [16:0] x167;
wire signed  [16:0] x168;
wire signed  [16:0] x169;
wire signed  [16:0] x170;

// Radix-2^r recoding of the Hmin set
assign x_58 = +(x3<<1)-(x1<<6);
assign x256 = +(x1<<8);
assign x95 = -(x1<<0)+(x3<<5);
assign x66 = +(x1<<1)+(x1<<6);
assign x64 = +(x1<<6);
assign x67 = +(x3<<0)+(x1<<6);
assign x73 = -(x7<<0)+(x5<<4);
assign x78 = +(x7<<1)+(x1<<6);
assign x83 = +(x3<<0)+(x5<<4);
assign x89 = -(x7<<0)+(x3<<5);
assign x94 = -(x1<<1)+(x3<<5);
assign x99 = +(x3<<0)+(x3<<5);
assign x105 = -(x7<<0)+(x7<<4);
assign x110 = +(x7<<1)+(x3<<5);
assign x116 = -(x3<<2)+(x1<<7);
assign x121 = -(x7<<0)+(x1<<7);
assign x126 = -(x1<<1)+(x1<<7);
assign x130 = +(x1<<1)+(x1<<7);
assign x135 = +(x7<<0)+(x1<<7);
assign x139 = -(x5<<0)-(x7<<4)+(x1<<8);
assign x144 = -(x7<<4)+(x1<<8);
assign x148 = +(x5<<2)+(x1<<7);
assign x151 = +(x7<<0)-(x7<<4)+(x1<<8);
assign x155 = -(x5<<0)+(x5<<5);
assign x158 = -(x1<<1)+(x5<<5);
assign x161 = +(x1<<0)+(x5<<5);
assign x163 = +(x3<<0)+(x5<<5);
assign x165 = +(x5<<0)+(x5<<5);
assign x167 = +(x7<<0)+(x5<<5);
assign x168 = +(x5<<3)+(x1<<7);
assign x169 = -(x7<<0)-(x5<<4)+(x1<<8);
assign x170 = +(x5<<1)+(x5<<5);

// SCM_i = Ci x X
wire signed  [14:0] SCM_0;  //SCM_i_size = word_size_in + ceil(log2(Ci))
wire signed  [17:0] SCM_1;
wire signed  [15:0] SCM_2;
wire signed  [15:0] SCM_3;
wire signed  [15:0] SCM_4;
wire signed  [15:0] SCM_5;
wire signed  [15:0] SCM_6;
wire signed  [15:0] SCM_7;
wire signed  [15:0] SCM_8;
wire signed  [15:0] SCM_9;
wire signed  [15:0] SCM_10;
wire signed  [15:0] SCM_11;
wire signed  [15:0] SCM_12;
wire signed  [15:0] SCM_13;
wire signed  [15:0] SCM_14;
wire signed  [15:0] SCM_15;
wire signed  [15:0] SCM_16;
wire signed  [16:0] SCM_17;
wire signed  [16:0] SCM_18;
wire signed  [16:0] SCM_19;
wire signed  [16:0] SCM_20;
wire signed  [16:0] SCM_21;
wire signed  [16:0] SCM_22;
wire signed  [16:0] SCM_23;
wire signed  [16:0] SCM_24;
wire signed  [16:0] SCM_25;
wire signed  [16:0] SCM_26;
wire signed  [16:0] SCM_27;
wire signed  [16:0] SCM_28;
wire signed  [16:0] SCM_29;
wire signed  [16:0] SCM_30;
wire signed  [16:0] SCM_31;
wire signed  [16:0] SCM_32;
wire signed  [16:0] SCM_33;
wire signed  [16:0] SCM_34;
wire signed  [16:0] SCM_35;
wire signed  [16:0] SCM_36;
wire signed  [16:0] SCM_37;
wire signed  [16:0] SCM_38;
wire signed  [16:0] SCM_39;
wire signed  [16:0] SCM_40;
wire signed  [16:0] SCM_41;
wire signed  [16:0] SCM_42;
wire signed  [16:0] SCM_43;
wire signed  [16:0] SCM_44;
wire signed  [16:0] SCM_45;
wire signed  [16:0] SCM_46;
wire signed  [16:0] SCM_47;
wire signed  [15:0] SCM_48;
wire signed  [15:0] SCM_49;
wire signed  [15:0] SCM_50;
wire signed  [15:0] SCM_51;
wire signed  [15:0] SCM_52;
wire signed  [15:0] SCM_53;
wire signed  [15:0] SCM_54;
wire signed  [15:0] SCM_55;
wire signed  [15:0] SCM_56;
wire signed  [15:0] SCM_57;
wire signed  [15:0] SCM_58;
wire signed  [15:0] SCM_59;
wire signed  [15:0] SCM_60;
wire signed  [15:0] SCM_61;
wire signed  [15:0] SCM_62;
wire signed  [17:0] SCM_63;
wire signed  [14:0] SCM_64;

assign SCM_0 = x_58;
assign SCM_1 = x256;
assign SCM_2 = x95;
assign SCM_3 = x66;
assign SCM_4 = x64;
assign SCM_5 = x67;
assign SCM_6 = x73;
assign SCM_7 = x78;
assign SCM_8 = x83;
assign SCM_9 = x89;
assign SCM_10 = x94;
assign SCM_11 = x99;
assign SCM_12 = x105;
assign SCM_13 = x110;
assign SCM_14 = x116;
assign SCM_15 = x121;
assign SCM_16 = x126;
assign SCM_17 = x130;
assign SCM_18 = x135;
assign SCM_19 = x139;
assign SCM_20 = x144;
assign SCM_21 = x148;
assign SCM_22 = x151;
assign SCM_23 = x155;
assign SCM_24 = x158;
assign SCM_25 = x161;
assign SCM_26 = x163;
assign SCM_27 = x165;
assign SCM_28 = x167;
assign SCM_29 = x168;
assign SCM_30 = x169;
assign SCM_31 = x170;
assign SCM_32 = x170;
assign SCM_33 = x170;
assign SCM_34 = x169;
assign SCM_35 = x168;
assign SCM_36 = x167;
assign SCM_37 = x165;
assign SCM_38 = x163;
assign SCM_39 = x161;
assign SCM_40 = x158;
assign SCM_41 = x155;
assign SCM_42 = x151;
assign SCM_43 = x148;
assign SCM_44 = x144;
assign SCM_45 = x139;
assign SCM_46 = x135;
assign SCM_47 = x130;
assign SCM_48 = x126;
assign SCM_49 = x121;
assign SCM_50 = x116;
assign SCM_51 = x110;
assign SCM_52 = x105;
assign SCM_53 = x99;
assign SCM_54 = x94;
assign SCM_55 = x89;
assign SCM_56 = x83;
assign SCM_57 = x78;
assign SCM_58 = x73;
assign SCM_59 = x67;
assign SCM_60 = x64;
assign SCM_61 = x66;
assign SCM_62 = x95;
assign SCM_63 = x256;
assign SCM_64 = x_58;

// MAC_i is the register i in the adder structure of the filter
reg signed  [22:0] MAC_0; //MAC_i_size = word_size_in + ceil(log2(Sum(Ci)))
reg signed  [21:0] MAC_1;
reg signed  [21:0] MAC_2;
reg signed  [21:0] MAC_3;
reg signed  [21:0] MAC_4;
reg signed  [21:0] MAC_5;
reg signed  [21:0] MAC_6;
reg signed  [21:0] MAC_7;
reg signed  [21:0] MAC_8;
reg signed  [21:0] MAC_9;
reg signed  [21:0] MAC_10;
reg signed  [21:0] MAC_11;
reg signed  [21:0] MAC_12;
reg signed  [21:0] MAC_13;
reg signed  [21:0] MAC_14;
reg signed  [21:0] MAC_15;
reg signed  [21:0] MAC_16;
reg signed  [21:0] MAC_17;
reg signed  [21:0] MAC_18;
reg signed  [21:0] MAC_19;
reg signed  [21:0] MAC_20;
reg signed  [21:0] MAC_21;
reg signed  [21:0] MAC_22;
reg signed  [21:0] MAC_23;
reg signed  [21:0] MAC_24;
reg signed  [21:0] MAC_25;
reg signed  [21:0] MAC_26;
reg signed  [21:0] MAC_27;
reg signed  [21:0] MAC_28;
reg signed  [21:0] MAC_29;
reg signed  [21:0] MAC_30;
reg signed  [21:0] MAC_31;
reg signed  [21:0] MAC_32;
reg signed  [20:0] MAC_33;
reg signed  [20:0] MAC_34;
reg signed  [20:0] MAC_35;
reg signed  [20:0] MAC_36;
reg signed  [20:0] MAC_37;
reg signed  [20:0] MAC_38;
reg signed  [20:0] MAC_39;
reg signed  [20:0] MAC_40;
reg signed  [20:0] MAC_41;
reg signed  [20:0] MAC_42;
reg signed  [20:0] MAC_43;
reg signed  [20:0] MAC_44;
reg signed  [20:0] MAC_45;
reg signed  [19:0] MAC_46;
reg signed  [19:0] MAC_47;
reg signed  [19:0] MAC_48;
reg signed  [19:0] MAC_49;
reg signed  [19:0] MAC_50;
reg signed  [19:0] MAC_51;
reg signed  [19:0] MAC_52;
reg signed  [19:0] MAC_53;
reg signed  [18:0] MAC_54;
reg signed  [18:0] MAC_55;
reg signed  [18:0] MAC_56;
reg signed  [18:0] MAC_57;
reg signed  [18:0] MAC_58;
reg signed  [18:0] MAC_59;
reg signed  [18:0] MAC_60;
reg signed  [17:0] MAC_61;
reg signed  [17:0] MAC_62;
reg signed  [17:0] MAC_63;
reg signed  [14:0] MAC_64;

wire signed  [22:0] Y_in;

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
    MAC_20 <=  MAC_21 + SCM_20;
    MAC_21 <=  MAC_22 + SCM_21;
    MAC_22 <=  MAC_23 + SCM_22;
    MAC_23 <=  MAC_24 + SCM_23;
    MAC_24 <=  MAC_25 + SCM_24;
    MAC_25 <=  MAC_26 + SCM_25;
    MAC_26 <=  MAC_27 + SCM_26;
    MAC_27 <=  MAC_28 + SCM_27;
    MAC_28 <=  MAC_29 + SCM_28;
    MAC_29 <=  MAC_30 + SCM_29;
    MAC_30 <=  MAC_31 + SCM_30;
    MAC_31 <=  MAC_32 + SCM_31;
    MAC_32 <=  MAC_33 + SCM_32;
    MAC_33 <=  MAC_34 + SCM_33;
    MAC_34 <=  MAC_35 + SCM_34;
    MAC_35 <=  MAC_36 + SCM_35;
    MAC_36 <=  MAC_37 + SCM_36;
    MAC_37 <=  MAC_38 + SCM_37;
    MAC_38 <=  MAC_39 + SCM_38;
    MAC_39 <=  MAC_40 + SCM_39;
    MAC_40 <=  MAC_41 + SCM_40;
    MAC_41 <=  MAC_42 + SCM_41;
    MAC_42 <=  MAC_43 + SCM_42;
    MAC_43 <=  MAC_44 + SCM_43;
    MAC_44 <=  MAC_45 + SCM_44;
    MAC_45 <=  MAC_46 + SCM_45;
    MAC_46 <=  MAC_47 + SCM_46;
    MAC_47 <=  MAC_48 + SCM_47;
    MAC_48 <=  MAC_49 + SCM_48;
    MAC_49 <=  MAC_50 + SCM_49;
    MAC_50 <=  MAC_51 + SCM_50;
    MAC_51 <=  MAC_52 + SCM_51;
    MAC_52 <=  MAC_53 + SCM_52;
    MAC_53 <=  MAC_54 + SCM_53;
    MAC_54 <=  MAC_55 + SCM_54;
    MAC_55 <=  MAC_56 + SCM_55;
    MAC_56 <=  MAC_57 + SCM_56;
    MAC_57 <=  MAC_58 + SCM_57;
    MAC_58 <=  MAC_59 + SCM_58;
    MAC_59 <=  MAC_60 + SCM_59;
    MAC_60 <=  MAC_61 + SCM_60;
    MAC_61 <=  MAC_62 + SCM_61;
    MAC_62 <=  MAC_63 + SCM_62;
    MAC_63 <=  MAC_64 + SCM_63;
    MAC_64 <=  SCM_64;
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
    MAC_21 <=  0;
    MAC_22 <=  0;
    MAC_23 <=  0;
    MAC_24 <=  0;
    MAC_25 <=  0;
    MAC_26 <=  0;
    MAC_27 <=  0;
    MAC_28 <=  0;
    MAC_29 <=  0;
    MAC_30 <=  0;
    MAC_31 <=  0;
    MAC_32 <=  0;
    MAC_33 <=  0;
    MAC_34 <=  0;
    MAC_35 <=  0;
    MAC_36 <=  0;
    MAC_37 <=  0;
    MAC_38 <=  0;
    MAC_39 <=  0;
    MAC_40 <=  0;
    MAC_41 <=  0;
    MAC_42 <=  0;
    MAC_43 <=  0;
    MAC_44 <=  0;
    MAC_45 <=  0;
    MAC_46 <=  0;
    MAC_47 <=  0;
    MAC_48 <=  0;
    MAC_49 <=  0;
    MAC_50 <=  0;
    MAC_51 <=  0;
    MAC_52 <=  0;
    MAC_53 <=  0;
    MAC_54 <=  0;
    MAC_55 <=  0;
    MAC_56 <=  0;
    MAC_57 <=  0;
    MAC_58 <=  0;
    MAC_59 <=  0;
    MAC_60 <=  0;
    MAC_61 <=  0;
    MAC_62 <=  0;
    MAC_63 <=  0;
    MAC_64 <=  0;
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
    MAC_21 <=  MAC_21;
    MAC_22 <=  MAC_22;
    MAC_23 <=  MAC_23;
    MAC_24 <=  MAC_24;
    MAC_25 <=  MAC_25;
    MAC_26 <=  MAC_26;
    MAC_27 <=  MAC_27;
    MAC_28 <=  MAC_28;
    MAC_29 <=  MAC_29;
    MAC_30 <=  MAC_30;
    MAC_31 <=  MAC_31;
    MAC_32 <=  MAC_32;
    MAC_33 <=  MAC_33;
    MAC_34 <=  MAC_34;
    MAC_35 <=  MAC_35;
    MAC_36 <=  MAC_36;
    MAC_37 <=  MAC_37;
    MAC_38 <=  MAC_38;
    MAC_39 <=  MAC_39;
    MAC_40 <=  MAC_40;
    MAC_41 <=  MAC_41;
    MAC_42 <=  MAC_42;
    MAC_43 <=  MAC_43;
    MAC_44 <=  MAC_44;
    MAC_45 <=  MAC_45;
    MAC_46 <=  MAC_46;
    MAC_47 <=  MAC_47;
    MAC_48 <=  MAC_48;
    MAC_49 <=  MAC_49;
    MAC_50 <=  MAC_50;
    MAC_51 <=  MAC_51;
    MAC_52 <=  MAC_52;
    MAC_53 <=  MAC_53;
    MAC_54 <=  MAC_54;
    MAC_55 <=  MAC_55;
    MAC_56 <=  MAC_56;
    MAC_57 <=  MAC_57;
    MAC_58 <=  MAC_58;
    MAC_59 <=  MAC_59;
    MAC_60 <=  MAC_60;
    MAC_61 <=  MAC_61;
    MAC_62 <=  MAC_62;
    MAC_63 <=  MAC_63;
    MAC_64 <=  MAC_64;
  end
endtask

endmodule
