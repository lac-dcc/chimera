// Seed: 1867335429
module module_0 (
    input wor id_0,
    output tri id_1,
    input supply1 id_2,
    input supply0 id_3,
    output supply1 id_4,
    input wand id_5,
    input tri1 id_6,
    output tri id_7,
    input wand id_8
);
  id_10(
      .id_0(1), .id_1(""), .id_2(id_2), .id_3(id_5)
  );
  always_comb @(posedge id_2 - 1 or 1) id_7 = 1 % id_0;
endmodule
module module_1 (
    input tri0 id_0,
    output supply0 id_1,
    input wor id_2,
    input wand id_3,
    output uwire id_4,
    output supply1 id_5,
    output tri id_6,
    input supply1 id_7,
    input tri0 id_8
);
  wire id_10;
  wire id_11;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_0,
      id_8,
      id_6,
      id_2,
      id_7,
      id_5,
      id_2
  );
  assign modCall_1.type_12 = 0;
endmodule
