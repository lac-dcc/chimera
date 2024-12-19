// Seed: 1686739858
module module_0 (
    input tri0 id_0,
    output wand id_1,
    input wire id_2,
    output wand id_3,
    input tri0 id_4,
    output uwire id_5,
    output tri id_6,
    input wor id_7,
    output supply1 id_8,
    output tri id_9,
    output supply1 id_10,
    output wor id_11
);
  id_13(
      .id_0(id_0),
      .id_1(id_0),
      .id_2(1),
      .id_3(1'b0),
      .id_4(id_6),
      .id_5(1),
      .id_6(id_2),
      .id_7(1 == 1'b0),
      .id_8(1),
      .id_9(1),
      .id_10((id_1)),
      .id_11(id_10),
      .id_12(1),
      .id_13(1),
      .id_14(id_7),
      .id_15(id_7),
      .id_16({1 + 1{id_8}}),
      .id_17(1),
      .id_18(1)
  );
endmodule
module module_1 (
    output tri   id_0,
    output wand  id_1,
    output tri   id_2,
    output wire  id_3,
    input  uwire id_4,
    output logic id_5,
    input  wor   id_6
);
  reg id_8;
  final $display(1);
  id_9(
      .id_0(1),
      .id_1(id_4),
      .id_2(id_3),
      .id_3(id_5),
      .id_4(1),
      .id_5(1),
      .id_6(1),
      .id_7(id_4),
      .id_8(id_4),
      .id_9(({id_6{id_3}})),
      .id_10(1'b0),
      .id_11(),
      .id_12(1)
  ); id_10(
      .id_0(""), .id_1(1), .id_2(1'b0), .id_3(id_1), .id_4(id_0), .id_5((1)), .id_6(id_9)
  );
  always @(id_6) id_5 <= #1 id_8;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_4,
      id_1,
      id_4,
      id_0,
      id_1,
      id_4,
      id_1,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.type_2 = 0;
endmodule
