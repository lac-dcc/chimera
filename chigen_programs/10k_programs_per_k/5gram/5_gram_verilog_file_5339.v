// Seed: 1017317175
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    input wor id_2,
    input uwire id_3,
    output tri1 id_4,
    input wire id_5,
    output tri0 id_6,
    input tri id_7,
    input supply1 id_8,
    input supply0 id_9,
    output wire id_10,
    input supply0 id_11,
    output wand id_12,
    output supply0 id_13
);
  wire id_15;
  ;
endmodule
module module_1 #(
    parameter id_7 = 32'd82
) (
    output tri id_0,
    inout wire id_1,
    output wand id_2,
    output supply1 id_3,
    output tri1 id_4,
    output tri0 id_5,
    output wire id_6,
    inout wor _id_7
);
  logic [1 : -1] id_9;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_1,
      id_1,
      id_6,
      id_1,
      id_5,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_5,
      id_3
  );
  assign modCall_1.id_12 = 0;
  logic [-1 : ~  id_7] id_10;
  ;
  logic [id_7 : 1] id_11 = id_9 && id_9 < id_7;
endmodule
