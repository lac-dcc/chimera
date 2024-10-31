// Seed: 2980262319
module module_0 (
    input tri id_0,
    output supply1 id_1,
    output uwire id_2,
    input supply1 id_3,
    input tri id_4,
    input supply0 id_5,
    input uwire id_6,
    output supply0 id_7
    , id_10,
    output wand id_8
);
  assign id_1 = id_4;
  wire id_11;
  wire id_12;
  wire id_13;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    input wand id_2,
    output wire id_3
);
  assign id_3 = id_1;
  nand (id_3, id_1, id_0);
  module_0(
      id_2, id_3, id_3, id_2, id_2, id_1, id_2, id_3, id_3
  );
endmodule
