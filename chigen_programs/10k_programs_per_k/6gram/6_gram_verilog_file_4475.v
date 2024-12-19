// Seed: 3159133235
module module_0 (
    input tri1 id_0,
    output wand id_1,
    input wor id_2,
    input tri1 id_3,
    input wand id_4,
    input tri id_5,
    input wand id_6,
    input tri0 id_7,
    output supply0 id_8
);
  assign id_8 = {id_6, id_2, id_7, 1};
  tri0 id_10;
  wire id_11;
  wire id_12;
  id_13(
      .id_0(1'b0), .id_1(1), .id_2(~{id_10}), .id_3(id_2), .id_4(1)
  );
endmodule
module module_0 (
    input tri id_0,
    input uwire id_1,
    input uwire id_2,
    input tri0 id_3,
    input tri id_4,
    input uwire id_5,
    input wand id_6,
    input wand id_7,
    input uwire id_8,
    output tri id_9,
    output tri0 id_10,
    output wand id_11,
    output wor id_12,
    input tri0 id_13,
    output tri module_1,
    output tri0 id_15,
    input tri0 id_16,
    input uwire id_17,
    input tri1 id_18,
    output supply1 id_19,
    input supply0 id_20,
    output wor id_21,
    output wor id_22,
    input wand id_23,
    output wire id_24
);
  wire id_26;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_3,
      id_2,
      id_23,
      id_18,
      id_20,
      id_18,
      id_24
  );
  assign modCall_1.type_15 = 0;
endmodule
