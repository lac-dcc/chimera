// Seed: 596876997
module module_0 (
    output supply0 id_0,
    output tri1 id_1,
    input wor id_2,
    input supply0 id_3,
    input wor id_4,
    input wor id_5,
    output wire id_6,
    output tri0 id_7,
    input supply1 id_8,
    output tri0 id_9,
    input supply0 id_10,
    output tri id_11,
    input tri1 id_12,
    output tri1 id_13,
    input supply1 id_14,
    output uwire id_15
    , id_21,
    input tri1 id_16,
    input wor id_17,
    output wand id_18,
    input wor id_19
);
  wire ["" : -1] id_22;
endmodule
module module_1 #(
    parameter id_2 = 32'd9
) (
    output tri1 id_0,
    input wand id_1,
    input wor _id_2,
    input supply0 id_3,
    input tri0 id_4
    , id_9,
    input tri1 id_5,
    input wor id_6,
    input wire id_7
);
  wire [id_2 : -1] id_10, \id_11 ;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_4,
      id_6,
      id_4,
      id_5,
      id_0,
      id_0,
      id_1,
      id_0,
      id_7,
      id_0,
      id_5,
      id_0,
      id_1,
      id_0,
      id_7,
      id_5,
      id_0,
      id_6
  );
  assign modCall_1.id_6 = 0;
  id_12 :
  assert property (@(posedge 1) id_2 ? id_6 == 1 : 'b0)
  else $unsigned(14);
  ;
endmodule
