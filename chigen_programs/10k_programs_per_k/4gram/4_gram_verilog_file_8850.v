// Seed: 340182549
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri id_3,
    input uwire id_4,
    input wor id_5,
    input tri id_6,
    input wire id_7,
    input tri id_8,
    input wand id_9
    , id_12,
    output tri id_10
);
  wire id_13;
  assign module_0[1] = 1;
endmodule
module module_1 (
    output supply1 id_0,
    output wire id_1,
    output tri1 id_2,
    input supply0 id_3,
    output tri id_4,
    output wand id_5,
    input wire id_6,
    input supply0 id_7,
    input wand id_8
);
  assign id_5 = 1;
  nand (id_0, id_8, id_12, id_10, id_11, id_6, id_3, id_7);
  tri1 id_10, id_11, id_12 = 1;
  module_0(
      id_7, id_3, id_7, id_7, id_8, id_6, id_3, id_6, id_6, id_7, id_0
  );
endmodule
