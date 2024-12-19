// Seed: 2793293809
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    input supply1 id_2,
    output supply1 id_3,
    input tri0 id_4,
    output tri id_5,
    input tri1 id_6,
    input tri0 id_7,
    output wor id_8,
    input tri1 id_9
);
  assign id_3 = 1;
  assign module_1.type_18 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output wor id_1,
    input supply1 id_2,
    input supply1 id_3,
    output wand id_4,
    input tri id_5,
    output wand id_6,
    input uwire id_7,
    input tri0 id_8,
    output supply1 id_9,
    input wand id_10,
    input wor id_11,
    input supply0 id_12,
    output tri id_13
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_12,
      id_9,
      id_5,
      id_9,
      id_11,
      id_5,
      id_4,
      id_2
  );
  id_15(
      .id_0(id_1 - 1 + !id_2), .id_1(1), .id_2(1'b0)
  );
endmodule
