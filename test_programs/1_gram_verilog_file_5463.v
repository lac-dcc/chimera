// Seed: 697957091
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wand id_5;
  wire id_6;
  assign id_5 = 1;
  assign (strong1, strong0) id_4 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7#(
        .id_8 (id_9[1]),
        .id_10(id_11),
        .id_12(1'b0),
        .id_13(1),
        .id_14(id_1),
        .id_15(1),
        .id_16(id_7),
        .id_17(-1)
    ),
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23
);
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  id_24 :
  assert property (@(posedge 1) id_8) id_10 <= id_13;
  parameter id_25 = 1;
  module_0 modCall_1 (
      id_22,
      id_24,
      id_20,
      id_5
  );
  assign modCall_1.id_1 = 0;
  assign id_14 = 1;
  parameter id_26 = -1;
endmodule
