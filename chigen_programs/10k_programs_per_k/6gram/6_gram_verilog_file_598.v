// Seed: 4138336578
module module_0 (
    output wor id_0,
    output tri1 id_1,
    input wor id_2,
    output wor id_3,
    input tri1 id_4,
    input tri1 id_5,
    output tri id_6,
    input wor id_7,
    input supply1 id_8,
    output supply0 id_9,
    input supply0 id_10,
    output tri1 id_11,
    input wor id_12,
    output tri1 id_13,
    output tri0 id_14,
    input wor id_15,
    output uwire id_16,
    input supply0 id_17,
    input tri id_18,
    input supply1 id_19,
    output wor id_20
);
  assign module_1._id_2 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd44
) (
    input wire id_0,
    input supply0 id_1,
    input tri0 _id_2,
    output tri id_3,
    input tri1 id_4,
    input uwire id_5,
    input wire id_6,
    input wor id_7,
    input wand id_8,
    output tri0 id_9,
    input supply1 id_10
);
  tri1 [(  id_2  ) : -1 'b0] id_12 = id_2;
  and primCall (id_3, id_8, id_7, id_12, id_6, id_1, id_5, id_4);
  assign id_12 = -1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_9,
      id_7,
      id_1,
      id_3,
      id_8,
      id_0,
      id_3,
      id_10,
      id_9,
      id_6,
      id_3,
      id_3,
      id_4,
      id_3,
      id_7,
      id_4,
      id_1,
      id_3
  );
endmodule
