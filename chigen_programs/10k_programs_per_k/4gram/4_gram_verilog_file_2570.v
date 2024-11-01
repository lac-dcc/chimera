// Seed: 1916672694
module module_0 (
    output supply1 id_0,
    output supply1 id_1,
    input wor id_2,
    output supply0 id_3,
    input supply0 id_4,
    input wor id_5,
    input uwire id_6,
    output uwire id_7,
    output wand id_8
);
  wire id_10;
  nand (id_8, id_6, id_4, id_5, id_2, id_10);
  module_2(
      id_10, id_10, id_10, id_10
  );
endmodule
module module_1 (
    output tri0 id_0,
    input wand id_1,
    input wire id_2,
    input supply0 id_3,
    input supply1 id_4,
    input tri1 id_5
);
  module_0(
      id_0, id_0, id_2, id_0, id_2, id_3, id_4, id_0, id_0
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  generate
    assign id_4 = id_2 == id_1 && id_2 && 1 && 1;
  endgenerate
endmodule
