// Seed: 3441421366
module module_0 #(
    parameter id_16 = 32'd5
) (
    input wire id_0,
    output tri1 id_1,
    output uwire id_2,
    input tri0 id_3
    , id_15,
    output supply0 id_4,
    input wor id_5,
    output wand id_6,
    input supply0 id_7,
    input supply1 id_8,
    input uwire id_9,
    input wand id_10,
    output wor id_11,
    input tri0 id_12,
    output wand id_13
);
  logic _id_16;
  wire  id_17 = id_0 - 1;
  parameter id_18 = 1;
  wire id_19;
  logic [7:0] id_20;
  wire id_21;
  assign id_6  = 1;
  assign id_13 = id_20[1 : (id_16)];
  parameter id_22 = id_18;
endmodule
module module_1 (
    output wand  id_0,
    input  wand  id_1,
    input  uwire id_2,
    input  tri0  id_3,
    output tri0  id_4,
    input  tri   id_5,
    output wor   id_6,
    output tri   id_7,
    output tri1  id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_1,
      id_4,
      id_5,
      id_6,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_2,
      id_0
  );
  assign modCall_1.id_13 = 0;
  assign id_10 = id_2;
  logic id_11;
  ;
  wire id_12;
  wire id_13;
  logic id_14 = -1, id_15;
endmodule
