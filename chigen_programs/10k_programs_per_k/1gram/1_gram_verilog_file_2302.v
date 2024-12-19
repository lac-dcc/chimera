// Seed: 2439608044
module module_0 (
    output supply0 id_0,
    input supply1 id_1,
    input wor id_2,
    input wire id_3,
    input wand id_4,
    input tri id_5,
    input uwire id_6,
    input uwire id_7,
    input wand id_8,
    input supply1 id_9,
    output supply0 id_10,
    input supply1 id_11,
    output tri id_12,
    input wor id_13,
    output tri1 id_14
    , id_16
);
  tri id_17, id_18 = 1, id_19;
  wire id_20;
  assign id_12 = id_1;
endmodule
module module_1 (
    input  wire  id_0,
    input  wand  id_1,
    output tri1  id_2,
    input  tri0  id_3,
    input  wire  id_4,
    input  tri   id_5,
    input  tri0  id_6,
    output logic id_7,
    input  tri   id_8
);
  tri id_10 = 1'd0;
  always if (id_4) id_7 <= 1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_8,
      id_4,
      id_5,
      id_6,
      id_1,
      id_1,
      id_1,
      id_2,
      id_0,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.id_5 = 0;
  assign id_10 = 1;
endmodule
