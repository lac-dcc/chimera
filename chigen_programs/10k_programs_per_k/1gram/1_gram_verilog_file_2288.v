// Seed: 2206246912
module module_0 (
    output wire id_0,
    input supply1 id_1,
    output tri id_2,
    input tri id_3,
    input supply1 id_4,
    input tri0 id_5,
    input wire id_6,
    output wand id_7,
    input wire id_8,
    input wire id_9,
    output wor id_10,
    input tri1 id_11,
    input uwire id_12,
    output tri id_13,
    input wand id_14
);
  assign id_2 = id_12;
endmodule
module module_1 #(
    parameter id_11 = 32'd86,
    parameter id_12 = 32'd70,
    parameter id_17 = 32'd94,
    parameter id_5  = 32'd45
) (
    input tri1 id_0,
    output tri0 id_1,
    output uwire id_2,
    input uwire id_3,
    input tri0 id_4,
    input tri _id_5,
    input tri id_6,
    output wire id_7,
    input wire id_8,
    input tri id_9,
    output supply0 id_10,
    input tri0 _id_11,
    input supply1 _id_12,
    input wor id_13
);
  wire id_15, id_16;
  supply0 [id_12  *  1 : id_11] _id_17 = -1;
  wire id_18[id_17 : !  id_5];
  xor primCall (id_2, id_6, id_16, id_4, id_8);
  module_0 modCall_1 (
      id_2,
      id_3,
      id_1,
      id_9,
      id_4,
      id_9,
      id_6,
      id_1,
      id_3,
      id_6,
      id_10,
      id_9,
      id_3,
      id_2,
      id_13
  );
  assign modCall_1.id_10 = 0;
endmodule
