// Seed: 4231657319
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
    id_10
);
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_11, id_12;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  reg id_5;
  nor primCall (id_4, id_3, id_5);
  assign id_1 = id_2;
  always_latch id_5 <= id_3;
  tri0 id_6;
  assign id_6 = 1;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_6,
      id_2,
      id_2,
      id_2,
      id_4,
      id_6,
      id_4,
      id_6
  );
  id_7(
      .id_0(id_4),
      .id_1(),
      .id_2(id_3),
      .id_3(id_8),
      .id_4(1),
      .id_5(1),
      .id_6(id_8),
      .id_7(id_2),
      .id_8(id_3),
      .id_9(1),
      .id_10(1),
      .id_11(1),
      .id_12(1),
      .id_13(1'b0),
      .id_14(1),
      .id_15(1),
      .id_16(id_6),
      .id_17()
  );
endmodule
