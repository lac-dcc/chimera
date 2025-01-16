// Seed: 330500361
module module_0 (
    input wand id_0,
    input wand id_1,
    output tri id_2,
    output tri0 id_3,
    input supply1 id_4,
    output wand id_5,
    input wand id_6,
    input supply0 id_7,
    output uwire id_8,
    input tri0 id_9,
    input wire id_10,
    input wor id_11
);
endmodule
module module_1 (
    output uwire id_0,
    input uwire id_1,
    input uwire id_2,
    output uwire id_3,
    input uwire id_4,
    input wire id_5,
    output supply0 id_6,
    input wand id_7,
    id_12,
    input tri id_8,
    input wand id_9,
    input tri1 id_10
);
  always_ff id_3 = id_5;
  wire id_13, id_14, id_15;
  always_latch #1 id_13 = -1;
  wire id_16;
  generate
    assign id_6 = 1;
  endgenerate
  assign id_3 = -1;
  for (id_17 = id_4; -1 * -1; id_6 += id_14) tri id_18;
  module_0 modCall_1 (
      id_4,
      id_17,
      id_6,
      id_3,
      id_2,
      id_3,
      id_4,
      id_10,
      id_6,
      id_10,
      id_5,
      id_4
  );
  assign modCall_1.id_5 = 0;
  id_19(
      .id_0(id_1),
      .id_1(id_9),
      .id_2((id_0) + id_5),
      .id_3(-1'b0 && id_0),
      .id_4(($display(-1, -1 - 1)) * id_18),
      .id_5(1),
      .id_6(-1'b0),
      .product(1 - id_10),
      .id_7(-1),
      .id_8(id_0)
  );
  wire id_20, id_21, id_22;
  wire id_23;
endmodule
