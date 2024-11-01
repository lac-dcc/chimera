// Seed: 2063183206
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input wire id_2,
    input tri0 id_3,
    output supply0 id_4,
    output supply0 id_5,
    output supply0 id_6,
    output wor id_7,
    output uwire id_8,
    output uwire id_9
);
  wor id_11 = 1;
endmodule
module module_1 (
    input uwire id_0,
    output wire id_1,
    output tri0 id_2,
    input tri0 id_3,
    output supply1 id_4,
    output wor id_5,
    input wire id_6,
    output wand id_7
);
  assign id_1 = 1'b0;
  wire id_9;
  module_0(
      id_3, id_3, id_0, id_0, id_5, id_5, id_5, id_1, id_7, id_2
  );
  wand id_10, id_11, id_12, id_13;
  assign id_11 = id_6 ? 1 : id_11;
  nand (id_2, id_0, id_6, id_3, id_9);
endmodule
