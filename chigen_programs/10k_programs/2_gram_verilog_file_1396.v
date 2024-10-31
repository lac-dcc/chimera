// Seed: 1140503989
module module_0 (
    output supply0 id_0,
    output wire id_1,
    output tri0 id_2,
    output uwire id_3,
    input wand id_4,
    input supply0 id_5,
    input tri1 id_6
);
  wire id_8;
  assign id_0 = id_4;
endmodule
module module_1 (
    output tri1 id_0,
    output uwire id_1,
    output tri1 id_2,
    input wire id_3,
    input tri0 id_4,
    input uwire id_5,
    input tri id_6,
    input supply1 id_7,
    input supply0 id_8
);
  assign id_0 = id_6;
  nand (id_0, id_3, id_8, id_4);
  module_0(
      id_0, id_1, id_1, id_0, id_5, id_3, id_6
  );
endmodule
