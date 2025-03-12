// Seed: 2661624200
module module_0 #(
    parameter id_8 = 32'd1
) (
    output uwire id_0,
    input tri0 id_1,
    output wor id_2,
    output supply1 id_3,
    input tri id_4
);
  logic module_0;
  tri   id_6;
  wire  id_7;
  wire  _id_8;
  logic id_9;
  wire  id_10;
  ;
  wire [1 : id_8] id_11;
  logic id_12;
  ;
  assign id_6 = -1;
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1
    , id_18,
    input tri1 id_2,
    input tri1 id_3,
    output wor id_4,
    input supply1 id_5,
    input supply0 id_6,
    input tri0 id_7,
    output supply0 id_8,
    input wire id_9
    , id_19,
    output tri0 id_10,
    input tri1 id_11,
    input tri0 id_12,
    input wor id_13,
    input supply0 module_1,
    input wire id_15,
    input wor id_16
);
  assign id_1 = id_2;
  nand primCall (
      id_8, id_16, id_11, id_3, id_19, id_9, id_0, id_7, id_18, id_12, id_6, id_5, id_15
  );
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_4,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
