// Seed: 3575959609
module module_0 (
    input wor id_0,
    input tri0 id_1,
    input tri id_2,
    input tri id_3,
    input tri0 id_4,
    input wire id_5,
    output tri1 id_6,
    input uwire id_7,
    output uwire id_8,
    input tri0 id_9,
    input wand id_10,
    input uwire id_11,
    input wand id_12,
    input supply0 id_13,
    input wire id_14
    , id_24,
    output tri1 id_15,
    input wand id_16,
    output supply1 id_17,
    output supply1 id_18,
    input supply0 id_19,
    input supply1 id_20,
    output wor id_21,
    input supply0 id_22
);
  logic id_25;
endmodule
module module_1 #(
    parameter id_5 = 32'd51
) (
    input  tri0 id_0
    , id_9,
    input  tri  id_1,
    input  wor  id_2,
    input  tri  id_3,
    input  wand id_4,
    output tri  _id_5,
    output tri0 id_6,
    input  tri1 id_7
);
  logic [1 : id_5] id_10 = -1;
  wire id_11;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_3,
      id_1,
      id_3,
      id_4,
      id_6,
      id_1,
      id_6,
      id_1,
      id_1,
      id_0,
      id_4,
      id_1,
      id_3,
      id_6,
      id_7,
      id_6,
      id_6,
      id_7,
      id_2,
      id_6,
      id_1
  );
  assign modCall_1.id_22 = 0;
  assign id_6 = -1'b0;
  assign id_10 = id_9 | 1 | id_11 ? -1'b0 : id_10;
  final $unsigned(68);
  ;
endmodule
