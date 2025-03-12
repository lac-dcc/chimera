// Seed: 520849326
module module_0 (
    input uwire id_0,
    output wire id_1,
    input tri id_2,
    input supply1 id_3,
    input tri1 id_4,
    input wand id_5,
    input tri1 id_6,
    input wand id_7,
    input wor id_8,
    input wire id_9,
    input supply0 id_10
    , id_22,
    output wand id_11,
    input wire id_12,
    output wand id_13,
    output supply0 id_14,
    input supply0 id_15,
    output supply0 id_16,
    input supply1 id_17,
    input wand id_18,
    input tri0 id_19,
    output wand id_20
);
  logic id_23;
endmodule
module module_1 #(
    parameter id_3 = 32'd3
) (
    input tri id_0,
    input supply0 id_1,
    output supply0 id_2,
    input tri0 _id_3,
    output tri0 id_4,
    input uwire id_5,
    input uwire id_6,
    input wor id_7,
    input tri1 id_8,
    input tri id_9,
    input supply1 id_10
);
  assign id_2 = id_6;
  module_0 modCall_1 (
      id_10,
      id_2,
      id_5,
      id_9,
      id_5,
      id_6,
      id_7,
      id_1,
      id_10,
      id_1,
      id_1,
      id_2,
      id_6,
      id_2,
      id_4,
      id_7,
      id_4,
      id_6,
      id_8,
      id_7,
      id_4
  );
  assign modCall_1.id_6 = 0;
  logic [1 : id_3] id_12[1  ?  -1 : -1 'b0 : 1 'b0];
  ;
endmodule
