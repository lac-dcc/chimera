// Seed: 2693981612
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    output supply0 id_2,
    input supply1 id_3,
    output wor id_4,
    input tri0 id_5,
    input tri0 id_6,
    input supply1 id_7,
    input wand id_8
);
  tri1 id_10;
  wire id_11;
  supply0 id_12 = 1;
  assign #1 id_1 = {id_10, 1'b0};
  wire id_13 = 1;
endmodule
module module_1 (
    input wor id_0,
    output wand id_1,
    output supply0 id_2,
    output wire id_3,
    input wire id_4,
    input tri0 id_5,
    output supply1 id_6,
    inout supply0 id_7,
    output wand id_8
);
  tri id_10 = id_4;
  nand (id_1, id_7, id_0, id_5, id_4);
  module_0(
      id_10, id_10, id_1, id_4, id_8, id_5, id_10, id_10, id_10
  );
endmodule
