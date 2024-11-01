// Seed: 1826064346
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    input wand id_2,
    input tri id_3,
    input supply1 id_4,
    input tri id_5,
    input supply0 id_6,
    input uwire id_7,
    input tri0 id_8,
    output tri0 id_9
);
  assign id_9 = id_4;
  wire id_11;
endmodule
module module_1 (
    input  tri   id_0,
    input  uwire id_1,
    output uwire id_2,
    input  wand  id_3,
    input  wand  id_4,
    output uwire id_5,
    output wand  id_6,
    input  tri0  id_7,
    output wire  id_8,
    input  uwire id_9,
    input  uwire id_10
);
  assign id_8 = id_0;
  assign id_8 = id_7 ? id_4 : id_3;
  module_0(
      id_0, id_7, id_1, id_9, id_7, id_1, id_10, id_0, id_3, id_6
  );
  wire id_12;
  wire id_13;
  wire id_14;
  wire id_15;
  wire id_16 = id_4;
  wire id_17;
  generate
    genvar id_18;
  endgenerate
endmodule
