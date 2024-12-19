// Seed: 2041172515
module module_0 (
    output tri0 id_0,
    output wire id_1,
    output supply1 id_2,
    output uwire id_3,
    input tri1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    input tri1 id_7,
    output wand id_8,
    output uwire id_9,
    input wor id_10
);
  wire id_12;
  tri0 id_13 = 1;
  assign id_0 = id_13 ? 1 : 1;
  wire id_14;
  wire id_15;
  wire id_16;
endmodule
module module_1 (
    output tri   id_0,
    input  wire  id_1,
    output uwire id_2
);
  id_4 :
  assert property (@(posedge 1) id_4 ? (1'b0) : id_4 == 1)
  else $display(1'h0);
  assign id_2 = id_4;
  id_5(
      .id_0(1),
      .id_1(id_4 == 1),
      .id_2(id_2),
      .id_3(1),
      .id_4(1 | 1 / 1'b0 & (1) | id_4),
      .id_5(1),
      .id_6(id_0),
      .id_7(id_1),
      .id_8(id_4 && 1),
      .id_9(id_0),
      .id_10(id_1),
      .id_11(id_2 * id_0 - id_0),
      .id_12(id_2),
      .id_13(1 == 1 & 1),
      .id_14((1)),
      .id_15(1 ** id_4),
      .id_16(id_0),
      .id_17(id_2),
      .id_18(1'b0),
      .id_19(1)
  );
  wor id_6 = id_1;
  integer id_7;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_6,
      id_2,
      id_6,
      id_4,
      id_1,
      id_1,
      id_2,
      id_6,
      id_4
  );
  assign modCall_1.id_8 = 0;
endmodule
