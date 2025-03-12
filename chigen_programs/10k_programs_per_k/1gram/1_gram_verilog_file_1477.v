// Seed: 982632014
module module_0 (
    output tri0 id_0,
    input wor id_1,
    input tri0 id_2,
    input wand id_3,
    input supply0 id_4,
    output wor id_5,
    output tri1 id_6,
    input uwire id_7
);
  logic id_9;
  ;
endmodule
module module_1 #(
    parameter id_4 = 32'd37
) (
    input tri0 id_0,
    output wand id_1,
    output wand id_2,
    output wire id_3,
    input wire _id_4,
    input tri0 id_5,
    output tri0 id_6,
    input supply0 id_7,
    input tri1 id_8,
    input tri0 id_9,
    output wand id_10,
    input tri0 id_11,
    input tri id_12,
    input wire id_13[id_4 : -1  ^  1]
);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_8,
      id_5,
      id_11,
      id_3,
      id_10,
      id_12
  );
  assign modCall_1.id_2 = 0;
  wire id_15;
  nor primCall (id_10, id_9, id_7, id_5, id_8, id_13, id_11, id_0);
endmodule
