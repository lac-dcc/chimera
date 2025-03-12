// Seed: 316756851
module module_0 (
    input tri id_0,
    input wor id_1,
    input uwire id_2,
    input supply0 id_3,
    input uwire id_4,
    output tri id_5,
    input wand id_6,
    output supply0 id_7,
    output wor id_8
    , id_15,
    input uwire id_9,
    input uwire id_10,
    input tri id_11,
    input supply1 id_12,
    output tri id_13
);
  assign id_13 = -1;
  wire id_16;
  ;
endmodule
module module_1 #(
    parameter id_12 = 32'd72,
    parameter id_2  = 32'd27,
    parameter id_3  = 32'd34
) (
    input tri id_0,
    output wand id_1,
    input tri1 _id_2,
    input tri _id_3,
    input supply1 id_4,
    input tri0 id_5,
    input uwire id_6,
    input wor id_7,
    input tri1 id_8,
    input tri id_9,
    output uwire id_10,
    input supply0 id_11,
    input wire _id_12
);
  parameter id_14 = 1 & 1;
  logic [7:0] id_15;
  localparam id_16 = 1;
  assign id_15 = id_16;
  assign id_15[id_2 :-1&{id_12?id_2 :-1+id_3, 1}] = id_5;
  assign id_10 = id_16;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_5,
      id_11,
      id_1,
      id_7,
      id_10,
      id_10,
      id_8,
      id_5,
      id_0,
      id_6,
      id_10
  );
  assign modCall_1.id_2 = 0;
endmodule
