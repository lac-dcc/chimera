// Seed: 839420043
module module_0 (
    output supply0 id_0,
    input supply1 id_1,
    input wand id_2,
    input wor id_3,
    input wire id_4,
    input wand id_5,
    input tri id_6,
    input uwire id_7
    , id_10,
    input supply1 id_8
);
  assign id_0 = 1;
  wire [1 : -1] id_11;
endmodule
module module_1 (
    input  tri0  id_0,
    input  wor   id_1,
    input  uwire id_2,
    input  tri   id_3,
    output tri0  id_4,
    input  wand  id_5,
    input  uwire id_6
    , id_9,
    input  wand  id_7
);
  assign id_4 = -1 ? id_7 : id_0;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_0,
      id_5,
      id_3,
      id_6,
      id_1,
      id_3
  );
  assign modCall_1.id_1 = 0;
  wire [1 'b0 : 1] id_10;
  wire id_11;
endmodule
