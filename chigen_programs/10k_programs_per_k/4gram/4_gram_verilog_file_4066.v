// Seed: 2040783672
module module_0 (
    input uwire id_0,
    input uwire id_1,
    output wor id_2,
    input supply0 id_3,
    input tri id_4,
    input tri id_5,
    input supply1 id_6,
    input uwire id_7,
    input wor id_8,
    output uwire id_9,
    input uwire id_10,
    input tri id_11,
    input wand id_12,
    output wire id_13,
    output wor id_14,
    input supply0 id_15
);
  assign id_14 = id_15;
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1,
    output tri0 id_2,
    input tri0 id_3,
    output tri0 id_4,
    output tri1 id_5,
    input tri0 id_6,
    input tri id_7,
    output supply1 id_8,
    input wire id_9,
    input wire id_10,
    input wor id_11
);
  wire id_13;
  nor primCall (id_4, id_10, id_9, id_11, id_3, id_6);
  module_0 modCall_1 (
      id_11,
      id_11,
      id_8,
      id_3,
      id_11,
      id_9,
      id_7,
      id_10,
      id_10,
      id_8,
      id_11,
      id_0,
      id_6,
      id_8,
      id_8,
      id_7
  );
  assign modCall_1.id_8 = 0;
endmodule
