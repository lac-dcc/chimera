// Seed: 441074410
module module_0 (
    output wire id_0
    , id_16,
    input wire id_1,
    output wire id_2,
    output uwire id_3,
    output tri0 id_4,
    output supply1 id_5,
    input wor id_6,
    output supply1 id_7,
    output tri1 id_8
    , id_17,
    output tri1 id_9,
    output wor id_10,
    output wor id_11,
    input uwire id_12,
    input tri1 id_13,
    output tri1 id_14
);
  supply1 id_18;
  assign id_2 = id_16;
  assign id_3 = id_18 == id_6;
  wire id_19, id_20;
endmodule
module module_1 (
    output supply0 id_0,
    output wire id_1,
    input wor id_2,
    input wand id_3
    , id_10,
    input tri id_4,
    input uwire id_5,
    output supply1 id_6,
    input wand id_7,
    output supply1 id_8
);
  id_11(
      .id_0(1), .id_1(1'h0)
  );
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_8,
      id_6,
      id_1,
      id_7,
      id_0,
      id_0,
      id_0,
      id_1,
      id_8,
      id_5,
      id_2,
      id_1
  );
  assign modCall_1.id_4 = 0;
  assign id_10[1] = 1;
endmodule
