// Seed: 117385244
module module_0 (
    output wor   id_0,
    output uwire id_1,
    input  tri   id_2,
    output uwire id_3,
    input  wire  id_4,
    output uwire id_5,
    input  tri1  id_6,
    output wand  id_7,
    input  wand  id_8,
    input  wand  id_9,
    input  wor   id_10,
    input  wire  id_11,
    input  tri0  id_12
);
  wire  id_14;
  logic id_15;
  wire  id_16;
  assign module_1.id_8 = 0;
endmodule
program module_1 #(
    parameter id_0 = 32'd25,
    parameter id_1 = 32'd88
) (
    output tri  _id_0,
    input  tri  _id_1,
    input  wire id_2,
    input  wire id_3,
    input  wand id_4,
    output wand id_5,
    output wand id_6,
    input  tri0 id_7,
    input  tri1 id_8
);
  logic [id_0 : id_1] id_10;
  ;
  wire id_11;
  ;
  assign id_5 = id_8;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_4,
      id_5,
      id_3,
      id_5,
      id_7,
      id_6,
      id_3,
      id_2,
      id_8,
      id_8,
      id_7
  );
endprogram
