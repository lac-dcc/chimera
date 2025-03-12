// Seed: 2247342266
module module_0 #(
    parameter id_11 = 32'd34
) (
    input uwire id_0,
    input supply1 id_1,
    input wire id_2,
    output uwire id_3,
    input supply0 id_4,
    input wor id_5,
    input wire id_6,
    output wand id_7,
    input wor id_8,
    output supply0 id_9
);
  logic _id_11;
  ;
  wire id_12;
  wire id_13;
  ;
  logic [-1 'b0 : id_11] id_14 = id_6;
endmodule
module module_1 (
    output tri0 id_0
    , id_13,
    output supply1 id_1,
    input supply1 id_2,
    input tri id_3,
    input supply0 id_4,
    input uwire id_5,
    output tri0 id_6,
    output wand id_7,
    output tri0 id_8,
    input uwire id_9,
    output supply0 id_10,
    input uwire id_11
);
  assign id_1 = -1'b0;
  nor primCall (id_8, id_5, id_9, id_3, id_11, id_2, id_4, id_13);
  module_0 modCall_1 (
      id_11,
      id_5,
      id_5,
      id_7,
      id_11,
      id_9,
      id_9,
      id_10,
      id_11,
      id_8
  );
  assign modCall_1.id_9 = 0;
endmodule
