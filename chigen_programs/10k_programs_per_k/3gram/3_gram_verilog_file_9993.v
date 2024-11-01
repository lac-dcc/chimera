// Seed: 1196708722
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_4;
endmodule
module module_1 (
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
    id_15
);
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_16;
  id_17(
      .id_0(1), .id_1(), .id_2(1)
  );
  always_latch @(posedge id_17) id_15 <= 1;
  always #1;
  module_0(
      id_6, id_12
  );
  assign id_8 = (1 - id_9);
  id_18(
      .id_0(1),
      .id_1(id_10),
      .id_2(id_13 ^ 1),
      .id_3(id_13),
      .id_4(id_14),
      .id_5(""),
      .id_6(id_3),
      .id_7(1),
      .id_8(id_12),
      .id_9(1)
  );
endmodule
