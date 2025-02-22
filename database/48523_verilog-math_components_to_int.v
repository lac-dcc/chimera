// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module dq (clk, q, d);
  input  clk;
  input  [width-1:0] d;
  output [width-1:0] q;
  parameter width=8;
  parameter depth=2;
  integer i;
  reg [width-1:0] delay_line [depth-1:0];
  always @(posedge clk) begin
    delay_line[0] <= d;
    for(i=1; i<depth; i=i+1) begin
      delay_line[i] <= delay_line[i-1];
    end
  end
  assign q = delay_line[depth-1];
endmodule

module to_int(clk, to_int_a, to_int_z);
  input clk;
  input [31:0] to_int_a;
  output [31:0] to_int_z;
  wire [31:0] s_0;
  wire [31:0] s_1;
  wire [31:0] s_2;
  wire [31:0] s_3;
  wire [31:0] s_4;
  wire [31:0] s_5;
  wire [31:0] s_6;
  wire [31:0] s_7;
  wire [31:0] s_8;
  wire [31:0] s_9;
  wire [23:0] s_10;
  wire [0:0] s_11;
  wire [0:0] s_12;
  wire [0:0] s_13;
  wire [0:0] s_14;
  wire [7:0] s_15;
  wire [7:0] s_16;
  wire [31:0] s_17;
  wire [6:0] s_18;
  wire [7:0] s_19;
  wire [22:0] s_20;
  wire [7:0] s_21;
  wire [7:0] s_22;
  wire [7:0] s_23;
  wire [7:0] s_24;
  wire [7:0] s_25;
  wire [7:0] s_26;
  wire [0:0] s_27;
  wire [31:0] s_28;
  wire [0:0] s_29;
  wire [0:0] s_30;
  wire [0:0] s_31;
  wire [0:0] s_32;
  wire [0:0] s_33;
  wire [0:0] s_34;
  wire [0:0] s_35;
  wire [0:0] s_36;
  wire [0:0] s_37;
  wire [0:0] s_38;
  wire [0:0] s_39;
  wire [0:0] s_40;
  wire [7:0] s_41;
  wire [0:0] s_42;
  wire [0:0] s_43;
  wire [7:0] s_44;
  wire [0:0] s_45;
  wire [22:0] s_46;
  wire [0:0] s_47;
  wire [0:0] s_48;
  wire [7:0] s_49;
  wire [0:0] s_50;
  wire [22:0] s_51;

  assign s_0 = s_37?s_1:s_2;
  assign s_1 = 32'd2147483648;
  assign s_2 = s_31?s_3:s_4;
  assign s_3 = 32'd0;
  assign s_4 = s_29?s_5:s_28;
  dq #(32, 1) dq_s_5 (clk, s_5, s_6);
  assign s_6 = -s_7;
  dq #(32, 1) dq_s_7 (clk, s_7, s_8);
  assign s_8 = s_9 >> s_22;
  assign s_9 = {s_10,s_21};
  assign s_10 = {s_11,s_20};
  assign s_11 = s_14?s_12:s_13;
  assign s_12 = 1'd0;
  assign s_13 = 1'd1;
  assign s_14 = s_15 == s_19;
  assign s_15 = s_16 - s_18;
  assign s_16 = s_17[30:23];
  assign s_17 = to_int_a;
  assign s_18 = 7'd127;
  assign s_19 = -8'd127;
  assign s_20 = s_17[22:0];
  assign s_21 = 8'd0;
  assign s_22 = s_23 - s_27;
  assign s_23 = s_24 - s_25;
  assign s_24 = 8'd32;
  assign s_25 = s_14?s_26:s_15;
  assign s_26 = -8'd126;
  assign s_27 = 1'd1;
  dq #(32, 1) dq_s_28 (clk, s_28, s_7);
  dq #(1, 2) dq_s_29 (clk, s_29, s_30);
  assign s_30 = s_17[31];
  dq #(1, 2) dq_s_31 (clk, s_31, s_32);
  assign s_32 = s_33 | s_35;
  assign s_33 = $signed(s_25) < $signed(s_34);
  assign s_34 = 1'd0;
  assign s_35 = s_10 == s_36;
  assign s_36 = 1'd0;
  dq #(1, 2) dq_s_37 (clk, s_37, s_38);
  assign s_38 = s_39 | s_47;
  assign s_39 = s_40 | s_42;
  assign s_40 = $signed(s_25) >= $signed(s_41);
  assign s_41 = 8'd31;
  assign s_42 = s_43 & s_45;
  assign s_43 = s_15 == s_44;
  assign s_44 = 8'd128;
  assign s_45 = s_20 == s_46;
  assign s_46 = 23'd0;
  assign s_47 = s_48 & s_50;
  assign s_48 = s_15 == s_49;
  assign s_49 = 8'd128;
  assign s_50 = s_20 != s_51;
  assign s_51 = 23'd0;
  assign to_int_z = s_0;
endmodule
