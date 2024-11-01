// Seed: 1377841636
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
    id_25
);
  input wire id_25;
  inout wire id_24;
  inout wire id_23;
  inout wire id_22;
  inout wire id_21;
  output wire id_20;
  output wire id_19;
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_26;
  assign id_14 = id_1;
  assign id_19 = id_15;
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
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  wire id_8;
  nand (id_1, id_7, id_5, id_2, id_6);
  module_0(
      id_8,
      id_6,
      id_6,
      id_2,
      id_7,
      id_7,
      id_6,
      id_7,
      id_7,
      id_6,
      id_1,
      id_8,
      id_6,
      id_4,
      id_2,
      id_8,
      id_1,
      id_8,
      id_4,
      id_7,
      id_7,
      id_7,
      id_2,
      id_8,
      id_8
  );
  assign id_2 = id_6 ^ 1;
  id_9(
      .id_0(1),
      .id_1(1),
      .id_2(id_10),
      .id_3(1),
      .id_4(id_5[1'b0]),
      .id_5(id_2),
      .id_6(1),
      .id_7(id_10[1]),
      .id_8(1'b0),
      .id_9(id_6)
  );
  assign #id_11 id_2 = 1;
endmodule
