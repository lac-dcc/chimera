// Seed: 2606084131
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
    id_12
);
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_10 = id_8 - 1 ? 1 : 1 ? {1, 1, 1, 1} : id_12 - id_7 - id_6;
  assign id_10 = id_2;
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
  input wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_16;
  id_17(
      .id_0(1),
      .id_1(1 - id_8),
      .id_2(id_13),
      .id_3(id_4[1]),
      .id_4(1'b0),
      .id_5(id_11),
      .id_6(1),
      .id_7(id_10[1]),
      .id_8({id_6, !id_14, id_15} <-> 1'b0),
      .id_9(1),
      .id_10(id_2),
      .id_11(1'b0),
      .id_12(id_10)
  );
  always_ff #1 assume (1);
  module_0 modCall_1 (
      id_6,
      id_11,
      id_6,
      id_5,
      id_16,
      id_7,
      id_8,
      id_13,
      id_8,
      id_7,
      id_9,
      id_16
  );
endmodule
