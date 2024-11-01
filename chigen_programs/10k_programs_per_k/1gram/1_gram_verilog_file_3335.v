// Seed: 2830304976
module module_0 (
    input wire void id_0,
    output supply0 id_1,
    output uwire id_2,
    input tri0 id_3,
    output tri id_4,
    output wand id_5,
    input tri0 id_6,
    input uwire id_7,
    input wand id_8,
    input supply0 id_9,
    input tri1 id_10,
    input tri id_11,
    input wor id_12,
    input tri1 id_13,
    output supply1 id_14,
    input tri1 id_15,
    input uwire id_16
);
  assign id_14 = 1 == id_0.id_3;
  wire id_18;
  timeprecision 1ps;
endmodule
module module_1 (
    output tri1 id_0,
    input tri0 id_1,
    output wire id_2,
    input tri1 id_3,
    output tri0 id_4,
    input supply0 id_5,
    input tri1 id_6,
    input wand id_7,
    input supply1 id_8
);
  assign id_0 = 1;
  assign id_2 = id_7;
  nand (id_2, id_7, id_6, id_1, id_8, id_5, id_3);
  module_0(
      id_3,
      id_2,
      id_4,
      id_8,
      id_4,
      id_4,
      id_6,
      id_1,
      id_3,
      id_6,
      id_8,
      id_5,
      id_5,
      id_1,
      id_2,
      id_1,
      id_7
  );
  supply1 id_10 = 1'b0;
endmodule
