// Seed: 1463976033
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  supply1 id_8;
  id_9(
      .id_0(id_8),
      .id_1(id_6),
      .id_2(1'b0),
      .id_3(id_4),
      .id_4(id_4),
      .id_5(""),
      .id_6(),
      .id_7(1),
      .id_8(id_3[1]),
      .id_9(id_4),
      .id_10(id_8),
      .id_11(1)
  ); id_10(
      1, 1'b0 !== id_1, id_8 - (id_6)
  );
  wire id_11;
  logic [7:0] id_12 = id_3;
  assign id_7 = id_11 - id_4;
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
    id_9
);
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4[1'b0] = 1'b0;
  wire id_10 = id_8;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_4,
      id_10,
      id_6,
      id_6,
      id_7
  );
  assign modCall_1.id_7 = 0;
endmodule
