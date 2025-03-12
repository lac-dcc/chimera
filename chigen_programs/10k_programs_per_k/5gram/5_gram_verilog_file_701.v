// Seed: 951606674
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29
);
  inout wire id_29;
  output wire id_28;
  output wire id_27;
  output wire id_26;
  input wire id_25;
  output wire id_24;
  input wire id_23;
  output wire id_22;
  inout wire id_21;
  output wire id_20;
  output wire id_19;
  inout wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  bit id_30;
  always @(*) id_30 = -1;
  parameter id_31 = 1;
  wire id_32;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output uwire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  reg id_9;
  ;
  wire id_10;
  parameter id_11 = 1;
  assign id_8 = 1'b0;
  assign id_7 = id_3;
  assign id_7 = id_6;
  localparam id_12 = id_11 != -1;
  xor primCall (id_3, id_12, id_6, id_4, id_5, id_7, id_9, id_10, id_11);
  module_0 modCall_1 (
      id_11,
      id_4,
      id_4,
      id_8,
      id_10,
      id_12,
      id_5,
      id_7,
      id_12,
      id_7,
      id_11,
      id_10,
      id_10,
      id_7,
      id_11,
      id_5,
      id_12,
      id_7,
      id_8,
      id_11,
      id_11,
      id_1,
      id_4,
      id_11,
      id_7,
      id_11,
      id_12,
      id_7,
      id_3
  );
  initial id_9 = #1 id_6;
endmodule
