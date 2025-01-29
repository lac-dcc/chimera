// Seed: 1094993043
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
    id_16
);
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  pulldown (id_3, 1 - id_8 | id_11, id_7, -1, -1, -1, -1'b0, -1, 1'b0 - id_11);
  tri0 id_17, id_18;
  wire id_19;
  id_20 :
  assert property (@* id_9)
    if (-1'b0);
    else id_18.id_17 = -1;
  assign id_8 = id_18 == id_15;
  assign id_2 = id_4;
  uwire id_21, id_22, id_23;
  parameter id_24 = id_15 ? id_18 + 1 - id_7 : !1;
  tri0 id_25, id_26, id_27;
  rpmos (.id_0(-1), .id_1(""), .id_2(id_2));
  assign id_21 = 1;
  wire id_28, id_29;
  wire id_30;
  wire id_31;
  always disable id_32;
  assign id_22 = id_22.id_25;
endmodule
module module_1 (
    input wand id_0,
    input tri0 id_1
);
  wire id_3;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3
  );
  parameter id_5 = -1;
  wire id_6;
endmodule
