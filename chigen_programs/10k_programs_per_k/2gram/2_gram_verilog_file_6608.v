// Seed: 1587323713
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    output uwire id_2,
    output wor id_3,
    input supply0 id_4,
    input tri id_5,
    input tri0 id_6,
    output tri0 id_7,
    output wor id_8
);
  logic id_10;
  ;
endmodule
module module_1 #(
    parameter id_7 = 32'd45
) (
    input supply0 id_0,
    output wire id_1,
    output wire id_2,
    input tri1 id_3,
    input supply0 id_4,
    output supply0 id_5,
    output wire id_6,
    input wor _id_7,
    input supply1 id_8,
    output uwire id_9,
    output supply1 id_10,
    input wand id_11,
    input tri1 id_12
);
  wire [-1 : id_7] id_14;
  xnor primCall (id_10, id_11, id_3, id_14, id_12, id_4, id_8, id_0);
  module_0 modCall_1 (
      id_11,
      id_6,
      id_1,
      id_2,
      id_11,
      id_12,
      id_3,
      id_10,
      id_10
  );
  assign modCall_1.id_3 = 0;
endmodule
