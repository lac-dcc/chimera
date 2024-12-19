// Seed: 3516098167
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  id_6(
      .id_0(1),
      .id_1(1),
      .id_2(1'b0),
      .id_3(1),
      .id_4(1),
      .id_5(1 && 1),
      .id_6(1),
      .id_7(1'b0),
      .id_8(1),
      .sum(1),
      .id_9(1),
      .id_10(1 - 1'b0),
      .id_11(1),
      .id_12(1),
      .id_13(id_5),
      .id_14(id_2)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wand id_7;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7,
      id_1,
      id_7
  );
  wire  id_8;
  uwire id_9;
  assign id_8 = ~id_9;
  wire id_10 = id_10;
  wire id_11;
  assign id_7 = id_9;
  wire id_12;
  assign id_4[1'b0] = id_3;
  assign id_2 = !id_7 & 1;
endmodule
