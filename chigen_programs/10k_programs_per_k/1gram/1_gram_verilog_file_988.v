// Seed: 2577348928
program module_0 (
    input tri1 id_0,
    input uwire id_1,
    input wire id_2,
    output uwire id_3,
    input tri id_4,
    output supply0 id_5,
    input tri0 id_6,
    input supply1 id_7,
    input supply1 id_8,
    input wire id_9,
    output tri0 id_10,
    input wand id_11,
    input wire id_12,
    input supply0 id_13
);
  assign id_3 = -1 - {id_8{-1'b0}};
  assign id_5 = id_9;
  integer id_15;
  assign id_3 = id_6 == id_11;
  assign id_3 = id_1;
endprogram
module module_1 #(
    parameter id_2 = 32'd75,
    parameter id_3 = 32'd23,
    parameter id_6 = 32'd38
) (
    output tri id_0,
    output wand id_1,
    output uwire _id_2,
    input wand _id_3,
    input tri0 id_4,
    output supply0 id_5,
    input tri0 _id_6,
    input wor id_7,
    output uwire id_8,
    output tri id_9[id_6 : id_2]
    , id_13,
    input tri0 id_10,
    input wire id_11
);
  logic [1 : id_3] id_14;
  ;
  module_0 modCall_1 (
      id_11,
      id_7,
      id_7,
      id_9,
      id_7,
      id_1,
      id_10,
      id_11,
      id_10,
      id_10,
      id_1,
      id_4,
      id_7,
      id_11
  );
  assign modCall_1.id_2 = 0;
endmodule
