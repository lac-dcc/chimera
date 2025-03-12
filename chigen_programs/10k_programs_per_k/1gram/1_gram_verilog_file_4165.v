// Seed: 902495965
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    output tri id_2,
    input wor id_3,
    input wor id_4,
    output uwire id_5,
    input wor id_6,
    input tri1 id_7,
    input supply1 id_8
);
  assign id_5 = -1;
  assign module_1.id_12 = 0;
  parameter id_10 = 1;
endmodule
program module_1 #(
    parameter id_4 = 32'd42
) (
    input  wand  id_0
    , id_15,
    input  tri0  id_1,
    input  tri   id_2,
    input  tri0  id_3 [(  id_4  ) : 1],
    input  wor   _id_4,
    input  tri0  id_5,
    output tri0  id_6,
    input  tri   id_7,
    input  uwire id_8,
    input  uwire id_9,
    output tri   id_10,
    input  tri1  id_11,
    input  uwire id_12,
    input  tri0  id_13
);
  wire id_16;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_10,
      id_3,
      id_9,
      id_6,
      id_7,
      id_3,
      id_1
  );
  assign id_15 = -1;
  and primCall (id_10, id_2, id_16, id_0, id_9, id_8, id_13, id_7, id_15, id_5, id_12);
endprogram
