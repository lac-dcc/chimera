// Seed: 3875091839
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
    id_13
);
  output wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_7 = id_1;
endmodule
module module_1 #(
    parameter id_15 = 32'd42,
    parameter id_8  = 32'd36
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    _id_15,
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
    id_29,
    id_30,
    id_31,
    id_32,
    id_33,
    id_34,
    id_35,
    id_36,
    id_37,
    id_38
);
  output wire id_38;
  output wire id_37;
  input wire id_36;
  input logic [7:0] id_35;
  inout wire id_34;
  input wire id_33;
  inout wire id_32;
  output wire id_31;
  inout wire id_30;
  inout wire id_29;
  output supply0 id_28;
  input wire id_27;
  output wire id_26;
  output wire id_25;
  output wire id_24;
  output wire id_23;
  output wire id_22;
  inout wire id_21;
  input wire id_20;
  output wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  input wire _id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire _id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  logic id_39;
  module_0 modCall_1 (
      id_20,
      id_36,
      id_32,
      id_29,
      id_36,
      id_14,
      id_17,
      id_32,
      id_30,
      id_10,
      id_1,
      id_13,
      id_37
  );
  wire id_40;
  always @(posedge -1 << 1) @(posedge -1 or posedge id_35[id_8 : id_8?1 : id_15] - -1'b0) #1;
  id_41 :
  assert property (@(posedge -1) -1)
  else;
  wire id_42;
  assign id_28 = 1;
  assign id_25 = id_41;
  parameter id_43 = 1;
endmodule
