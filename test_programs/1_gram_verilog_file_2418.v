// Seed: 4213751307
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
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_13, id_14;
  assign module_1.type_0 = 0;
  id_15(
      .id_0(id_13),
      .id_1(""),
      .id_2(id_11),
      .id_3(id_12),
      .id_4(id_6),
      .id_5(),
      .id_6(),
      .id_7(1'b0),
      .id_8(),
      .id_9(),
      .id_10(id_14),
      .id_11(-1),
      .id_12(id_13),
      .id_13(1'b0 - id_11),
      .id_14(),
      .id_15(id_13),
      .id_16(""),
      .id_17(-1),
      .id_18(-1),
      .id_19(-1'b0)
  );
  genvar id_16;
endmodule
module module_1 (
    output wire id_0,
    output tri id_1,
    input wor id_2,
    id_9,
    input supply0 id_3,
    input tri0 id_4,
    output supply1 id_5,
    input wor id_6,
    input wand id_7
);
  supply1 id_10 = 1, id_11;
  nand primCall (id_1, id_10, id_7, id_3, id_12, id_2, id_6, id_11, id_4, id_9);
  tri0 id_12 = 1;
  always begin : LABEL_0
    if (1) @('b0 & -1) id_10 = id_3;
    else;
    id_11 = -1;
  end
  assign id_9 = id_12;
  module_0 modCall_1 (
      id_9,
      id_12,
      id_9,
      id_9,
      id_12,
      id_12,
      id_9,
      id_9,
      id_12,
      id_12,
      id_9,
      id_12
  );
  assign id_9 = 1'd0;
endmodule
