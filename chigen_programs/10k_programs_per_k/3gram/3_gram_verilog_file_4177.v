// Seed: 1946256047
module module_0 (
    output tri0 id_0,
    input tri0 id_1,
    input supply1 id_2,
    input supply1 id_3,
    input supply0 id_4,
    input tri1 id_5,
    input tri id_6,
    input supply0 id_7,
    input uwire id_8,
    output supply1 id_9,
    input wor id_10,
    input wand id_11,
    output supply0 id_12,
    output tri1 id_13,
    input wor id_14,
    input tri0 id_15,
    input supply0 id_16,
    input uwire id_17,
    input tri id_18,
    input supply0 id_19,
    output tri0 id_20,
    input tri0 id_21,
    output tri1 id_22
);
  assign id_13 = -1;
endmodule
module module_1 #(
    parameter id_1 = 32'd75,
    parameter id_3 = 32'd7
) (
    output wand  id_0,
    input  uwire _id_1,
    input  tri   id_2,
    input  tri1  _id_3,
    input  uwire id_4
);
  logic [~  1 : id_1] id_6;
  ;
  assign id_0 = id_6[""] - -1 == id_4;
  wire id_7;
  and primCall (id_0, id_8, id_6, id_7, id_2, id_4);
  wand [1 : id_3] id_8 = id_6 - (id_2);
  module_0 modCall_1 (
      id_0,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_4,
      id_2,
      id_4,
      id_4,
      id_2,
      id_0,
      id_4,
      id_0
  );
  assign modCall_1.id_20 = 0;
  tri1 id_9 = id_2 - id_1;
endmodule
