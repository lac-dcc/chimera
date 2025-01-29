// Seed: 3446085816
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = id_4 ? 1 : id_2;
  timeprecision 1ps;
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
    id_11
);
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  id_12(
      .id_0(-1'h0),
      .id_1(id_4[-1]),
      .id_2(id_7),
      .id_3(id_9.sum),
      .id_4(&1),
      .id_5(id_6),
      .id_6(-1),
      .id_7(id_4),
      .id_8(""),
      .id_9(id_1[1'b0]),
      .id_10(1),
      .id_11(id_5),
      .id_12(-1),
      .id_13(-1 >> -1 == id_9),
      .id_14(id_8),
      .id_15(1),
      .id_16(-1 - (id_5) != -1)
  );
  nor primCall (id_10, id_12, id_6, id_11, id_9, id_4);
  module_0 modCall_1 (
      id_11,
      id_11,
      id_9,
      id_11
  );
endmodule
