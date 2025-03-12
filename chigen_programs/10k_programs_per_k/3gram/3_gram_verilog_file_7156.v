// Seed: 4287669314
module module_0 (
    output uwire id_0,
    input uwire id_1,
    inout wand id_2,
    input tri id_3,
    output supply0 id_4,
    input tri0 id_5,
    input tri1 id_6,
    input tri0 id_7,
    input wor id_8,
    input supply1 id_9,
    input tri0 id_10
);
  wire id_12, id_13;
  assign id_0 = 1;
endmodule
module module_1 (
    output wor id_0,
    output tri id_1,
    output supply1 id_2,
    input supply1 id_3,
    output wand id_4,
    input wor id_5,
    output wor id_6,
    input uwire id_7,
    output tri id_8,
    output tri1 id_9,
    input tri0 id_10,
    input wand id_11,
    input wire id_12,
    output wor id_13,
    inout wire id_14
);
  assign id_4 = id_14;
  nor primCall (id_9, id_14, id_12, id_3, id_10, id_5, id_7, id_11);
  module_0 modCall_1 (
      id_8,
      id_11,
      id_14,
      id_11,
      id_9,
      id_11,
      id_7,
      id_5,
      id_11,
      id_12,
      id_14
  );
  assign modCall_1.id_1 = 0;
endmodule
