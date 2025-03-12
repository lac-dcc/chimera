// Seed: 1924328779
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    input tri0 id_2,
    input tri1 id_3,
    output supply0 id_4,
    input supply1 id_5
    , id_16,
    input uwire id_6,
    output tri0 id_7,
    input tri0 id_8,
    input wor id_9,
    output supply0 id_10,
    output supply0 id_11,
    output tri id_12
    , id_17,
    input supply0 id_13,
    input wor id_14
);
  assign id_16[-1] = id_6;
endmodule
module module_1 #(
    parameter id_10 = 32'd84,
    parameter id_11 = 32'd21
) (
    output tri1 id_0,
    input wire id_1,
    input tri id_2,
    output tri0 id_3,
    input wor id_4,
    input tri1 id_5,
    output tri id_6,
    input wor id_7,
    input wor id_8,
    input supply0 id_9,
    output wand _id_10,
    input wor _id_11,
    output tri1 id_12,
    output tri1 id_13
);
  logic [id_11 : id_10] id_15;
  ;
  or primCall (id_6, id_9, id_15, id_1, id_7);
  module_0 modCall_1 (
      id_8,
      id_13,
      id_8,
      id_5,
      id_13,
      id_9,
      id_7,
      id_12,
      id_4,
      id_8,
      id_13,
      id_0,
      id_6,
      id_8,
      id_8
  );
  assign modCall_1.id_1 = 0;
endmodule
