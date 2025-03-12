// Seed: 250146697
module module_0 (
    input tri0 id_0,
    output uwire id_1,
    output tri1 id_2,
    input tri1 id_3,
    output wire id_4,
    input tri id_5,
    output supply1 id_6,
    input wor id_7,
    input uwire id_8,
    input tri1 id_9,
    input wand id_10,
    input tri id_11,
    output wor id_12
);
  wire id_14;
  localparam id_15 = ~1;
endmodule
module module_1 #(
    parameter id_0 = 32'd42,
    parameter id_5 = 32'd9
) (
    input wire _id_0,
    input tri0 id_1,
    input wand id_2[id_0 : id_5  -  id_5],
    input supply0 id_3,
    output uwire id_4,
    output supply1 _id_5
);
  logic [7:0][id_0  -:  1 'h0] id_7;
  ;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_4,
      id_1,
      id_4,
      id_2,
      id_4,
      id_1,
      id_2,
      id_3,
      id_3,
      id_2,
      id_4
  );
  assign modCall_1.id_6 = 0;
endmodule
