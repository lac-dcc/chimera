// Seed: 3404859478
module module_0 (
    output tri1 id_0,
    output wand id_1,
    input uwire id_2,
    input wire id_3,
    input wor id_4,
    output uwire id_5,
    output tri id_6,
    output supply0 id_7,
    input wor id_8,
    input supply0 id_9,
    input supply1 id_10,
    input tri id_11,
    input supply1 id_12,
    input wire id_13,
    input tri0 id_14,
    output wand id_15,
    output wor id_16,
    output wand id_17
);
endmodule
module module_1 #(
    parameter id_1  = 32'd39,
    parameter id_10 = 32'd18
) (
    input tri1 id_0,
    output supply0 _id_1,
    input tri0 id_2,
    input tri id_3,
    input tri0 id_4,
    output supply0 id_5,
    input supply0 id_6,
    input supply1 id_7,
    inout wor id_8,
    input wire id_9,
    output tri0 _id_10,
    input tri1 id_11[id_10 : id_1],
    input supply1 id_12
);
  wire id_14;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_8,
      id_8,
      id_6,
      id_5,
      id_5,
      id_8,
      id_11,
      id_0,
      id_0,
      id_11,
      id_11,
      id_7,
      id_12,
      id_5,
      id_5,
      id_8
  );
  assign modCall_1.id_16 = 0;
  nor primCall (id_8, id_0, id_6, id_7, id_14, id_11, id_2, id_12, id_3, id_4, id_9);
  assign id_8 = 1;
endmodule
