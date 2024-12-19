// Seed: 578222593
module module_0 (
    input  tri0  id_0,
    output tri1  id_1,
    input  wor   id_2,
    input  uwire id_3,
    input  wand  id_4,
    input  tri1  id_5,
    input  wire  id_6,
    input  wand  id_7
);
  tri0 id_9, id_10;
  wire id_11;
  tri0 id_12 = id_4;
  tri0 id_13 = id_9, id_14 = id_0;
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    output wand id_2,
    output tri id_3,
    input supply1 id_4,
    output wor id_5,
    output wor id_6,
    input wand id_7,
    input uwire id_8,
    input tri id_9,
    output uwire id_10,
    input supply1 id_11,
    input tri id_12,
    input wire id_13,
    input uwire id_14
);
  id_16(
      1, 1, 1, 1
  );
  module_0 modCall_1 (
      id_9,
      id_10,
      id_14,
      id_1,
      id_1,
      id_1,
      id_11,
      id_4
  );
  assign modCall_1.type_4 = 0;
  always_ff id_6 = 1;
  assign id_5  = 1;
  assign id_16 = id_16;
  genvar id_17;
  assign id_3 = (id_14);
endmodule
