// Seed: 3522428346
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
    id_21
);
  input wire id_21;
  inout wire id_20;
  input wire id_19;
  input wire id_18;
  inout wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_12 = id_8;
  tri id_22 = $realtime;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_7,
      id_3,
      id_6,
      id_4,
      id_6,
      id_1,
      id_3,
      id_5,
      id_4,
      id_3,
      id_7,
      id_7,
      id_3,
      id_7,
      id_3,
      id_4,
      id_3,
      id_7,
      id_4
  );
  id_8(
      .id_0(-1),
      .id_1(),
      .id_2(),
      .id_3(1),
      .id_4(id_2),
      .id_5(1 & -1),
      .id_6(),
      .id_7($realtime),
      .id_8(-1),
      .id_9(id_4),
      .id_10(),
      .id_11(-1),
      .id_12(id_5),
      .id_13(id_2),
      .id_14({id_6, (-1), 1})
  );
endmodule
