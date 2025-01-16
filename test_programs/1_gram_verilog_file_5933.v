// Seed: 1649797026
module module_0 (
    input supply0 id_0,
    input tri1 id_1,
    input uwire id_2,
    input tri0 id_3,
    input wand id_4,
    input supply0 id_5,
    input uwire id_6,
    input wire id_7,
    input wor id_8,
    input tri1 id_9,
    output wire id_10,
    input tri0 id_11,
    input uwire id_12,
    output tri id_13,
    output supply1 id_14,
    output supply1 id_15,
    output wand id_16,
    input uwire id_17,
    input wire id_18
);
endmodule
module module_1 (
    output tri0 id_0,
    input wor id_1,
    output tri1 id_2,
    input uwire id_3,
    input wire id_4,
    input wand id_5,
    output supply1 id_6,
    output supply1 id_7,
    input uwire id_8,
    output uwire id_9,
    output uwire id_10,
    input tri id_11,
    input wand id_12
);
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_5,
      id_11,
      id_12,
      id_4,
      id_12,
      id_11,
      id_8,
      id_2,
      id_1,
      id_12,
      id_2,
      id_2,
      id_7,
      id_7,
      id_8,
      id_11
  );
  assign modCall_1.id_12 = 0;
endmodule
