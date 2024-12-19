// Seed: 3626570910
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  supply0 id_7;
  wire id_8;
  id_9(
      .id_0(!id_7),
      .id_1(1),
      .id_2(id_5),
      .id_3({id_7, id_1}),
      .id_4(1),
      .id_5(id_5),
      .id_6(id_7),
      .id_7(id_5 | id_7),
      .id_8(id_7),
      .id_9(1'h0),
      .id_10(id_2 - 1),
      .id_11(1),
      .id_12((1'b0)),
      .id_13(id_6),
      .id_14(),
      .id_15(id_4)
  );
  tri1 id_10 = id_7, id_11;
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
    id_12
);
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge 1) id_4 = 1;
  tri id_13 = 1;
  wor id_14 = id_4;
  assign id_3  = 1'b0;
  assign id_14 = id_11[1] == 1'b0;
  module_0 modCall_1 (
      id_6,
      id_4,
      id_6,
      id_13,
      id_5,
      id_2
  );
  id_15(
      .id_0(1),
      .id_1(1),
      .id_2(id_14),
      .id_3(1'b0),
      .id_4(id_11),
      .id_5(1'h0 == id_1),
      .id_6(1 == id_13),
      .id_7(1'b0),
      .id_8(1'b0 == 1),
      .id_9(id_4)
  );
endmodule
