// Seed: 3532694223
module module_0 (
    output tri0 id_0,
    input supply0 id_1,
    input uwire id_2,
    input wire id_3,
    output uwire id_4,
    input uwire id_5,
    output supply1 id_6,
    input tri1 id_7,
    input tri id_8,
    input supply0 id_9,
    input tri id_10,
    output wor id_11,
    input wire id_12,
    output tri id_13[1 'd0 : -1 'b0],
    output tri1 id_14
    , id_19,
    input tri1 id_15,
    output wand id_16,
    input tri1 id_17
);
  logic [7:0] id_20;
  always id_0 += 1'b0 ==? 1;
  supply0 id_21 = 1'b0;
  assign id_0  = -1'b0;
  assign id_13 = id_20[1];
endmodule
module module_1 #(
    parameter id_3 = 32'd32
) (
    output wand id_0,
    output wand id_1 [1 : id_3],
    input  wor  id_2,
    input  tri0 _id_3,
    output tri1 id_4
);
  logic id_6;
  ;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_4,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_4,
      id_4,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.id_17 = 0;
endmodule
