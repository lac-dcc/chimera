// Seed: 2396639932
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    output supply1 id_2,
    input wire id_3,
    output tri1 id_4,
    output wand id_5,
    output uwire id_6,
    input wor id_7,
    output uwire id_8,
    output tri1 id_9,
    input supply1 id_10,
    input tri1 id_11,
    input supply0 id_12,
    output supply1 id_13,
    output supply0 id_14,
    output supply0 id_15,
    input uwire id_16,
    output tri id_17
);
  tri0 id_19 = (1);
endmodule
module module_1 (
    input tri1 id_0,
    input wand id_1,
    input tri0 id_2,
    input tri0 id_3
);
  assign id_5 = 1 && id_1;
  always_comb id_5 = 1;
  assign id_5 = id_3;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_5,
      id_3,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_2,
      id_1,
      id_3,
      id_5,
      id_5,
      id_5,
      id_3,
      id_5
  );
  assign modCall_1.id_0 = 0;
  id_6(
      1, 1 == !1'b0, 1, 1 & id_3, id_2, id_3, id_2 - id_3 < 1
  );
endmodule
