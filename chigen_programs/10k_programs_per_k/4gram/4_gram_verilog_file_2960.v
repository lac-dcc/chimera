// Seed: 1425505264
module module_0 (
    input wire id_0,
    output supply1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    output supply0 id_4,
    input wor id_5,
    input tri1 id_6
    , id_15,
    input uwire id_7,
    input wire id_8,
    input wand id_9,
    input supply1 id_10,
    output wand id_11
    , id_16,
    output tri id_12,
    input uwire id_13
);
  tri1 id_17 = id_9;
  wire id_18;
  id_19(
      .id_0(id_8),
      .id_1(id_13 == !1),
      .id_2(id_13),
      .id_3(1'b0),
      .id_4(id_3),
      .id_5(1),
      .id_6(id_12),
      .id_7(1),
      .id_8(id_1 == id_13)
  );
endmodule
module module_1 (
    input wand id_0,
    output supply0 id_1,
    input wand id_2,
    input tri id_3
);
  assign id_1 = 1;
  not (id_1, id_0);
  module_0(
      id_2, id_1, id_3, id_2, id_1, id_3, id_2, id_3, id_2, id_0, id_0, id_1, id_1, id_3
  );
endmodule
