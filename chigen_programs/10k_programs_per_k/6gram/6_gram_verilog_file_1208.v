// Seed: 1526754961
module module_0 (
    output tri1 id_0,
    output wor id_1,
    input supply0 id_2,
    input supply0 id_3,
    output wand id_4,
    output wand id_5,
    output wor id_6
    , id_19,
    output tri0 id_7,
    input supply1 id_8,
    input wire id_9,
    input supply1 id_10,
    output supply0 id_11,
    input tri1 id_12,
    output uwire id_13,
    output wire id_14,
    input wand id_15,
    input supply1 id_16,
    output wand id_17
);
  logic id_20;
  assign id_17 = 1'b0 == 1;
  wire id_21;
  ;
endmodule
module module_1 #(
    parameter id_0 = 32'd49
) (
    input  tri0 _id_0,
    input  tri1 id_1,
    output wire id_2,
    input  wire id_3,
    output tri  id_4,
    input  tri  id_5
);
  integer [1 : id_0] id_7 = id_3;
  supply1 id_8 = 1;
  always @(*) id_7 = #1 -1;
  and primCall (id_4, id_9, id_7, id_1, id_8, id_10, id_5, id_3);
  wire id_9, id_10;
  assign id_4 = -1'b0;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_1,
      id_1,
      id_4,
      id_4,
      id_2,
      id_2,
      id_3,
      id_1,
      id_5,
      id_4,
      id_5,
      id_4,
      id_2,
      id_1,
      id_5,
      id_4
  );
  assign modCall_1.id_15 = 0;
endmodule
