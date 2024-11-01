// Seed: 2898067192
module module_0 (
    output tri0 id_0,
    input uwire id_1,
    input wire id_2,
    input wire id_3,
    input wand id_4,
    output wand id_5,
    input wor id_6,
    output supply0 id_7,
    input tri id_8,
    output supply1 id_9
);
  assign id_9 = id_2;
  assign #1 id_9 = id_8;
  assign id_0 = 1 == id_3;
  wire id_11;
endmodule
module module_1 (
    output wire id_0,
    input supply1 id_1,
    input supply1 id_2,
    output wand id_3,
    output tri id_4
);
  assign id_4 = 1;
  nand (id_4, id_2, id_1);
  module_0(
      id_3, id_2, id_2, id_1, id_2, id_3, id_2, id_4, id_1, id_4
  );
endmodule
