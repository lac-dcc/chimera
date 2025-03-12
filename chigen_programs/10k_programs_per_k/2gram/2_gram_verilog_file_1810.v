// Seed: 36098813
module module_0 (
    input supply1 id_0,
    input wor id_1,
    input tri0 id_2,
    input supply0 id_3,
    output tri id_4,
    output wire id_5,
    output wire id_6
);
  assign id_5 = id_0 == 1'd0;
  assign module_1.id_6 = 0;
endmodule
module module_1 #(
    parameter id_11 = 32'd6
) (
    input wand id_0,
    input supply0 id_1,
    input supply0 id_2,
    input wor id_3,
    output tri id_4,
    input wand id_5,
    input supply0 id_6,
    input wor id_7,
    input tri1 id_8,
    output wire id_9,
    input wor id_10,
    input tri1 _id_11,
    output wand id_12,
    input tri1 id_13
);
  wire id_15;
  and primCall (id_12, id_10, id_7, id_5, id_1, id_3, id_13, id_2, id_0, id_8);
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_7,
      id_9,
      id_9,
      id_12
  );
  wire [-1 : id_11] id_16;
endmodule
