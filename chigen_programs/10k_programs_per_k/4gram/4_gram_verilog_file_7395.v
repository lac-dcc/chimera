// Seed: 3111945324
module module_0 (
    input  tri1  id_0,
    output uwire id_1
    , id_8,
    output uwire id_2,
    input  tri1  id_3,
    input  wor   id_4,
    input  tri   id_5,
    input  wor   id_6
);
endmodule
module module_1 #(
    parameter id_16 = 32'd68
) (
    input supply0 id_0,
    output uwire id_1,
    input wire id_2,
    output tri id_3,
    output wor id_4,
    input supply0 id_5,
    input wor id_6,
    input supply0 id_7,
    input wor id_8,
    input tri id_9,
    input tri id_10,
    input wor id_11,
    input supply0 id_12,
    input supply0 id_13,
    input wand id_14,
    input tri1 id_15,
    input wire _id_16,
    input uwire id_17,
    input tri0 id_18
);
  wire id_20;
  wire [-1 : id_16] id_21;
  wire id_22;
  ;
  and primCall (
      id_4,
      id_17,
      id_11,
      id_12,
      id_15,
      id_22,
      id_21,
      id_7,
      id_8,
      id_10,
      id_9,
      id_0,
      id_2,
      id_18,
      id_5,
      id_13,
      id_20
  );
  module_0 modCall_1 (
      id_0,
      id_1,
      id_4,
      id_8,
      id_0,
      id_2,
      id_14
  );
  assign modCall_1.id_6 = 0;
  assign id_21 = id_5;
endmodule
