// Seed: 3851813777
module module_0 (
    output wand id_0,
    input wand id_1,
    output uwire id_2,
    input uwire id_3,
    input wire id_4,
    input supply0 id_5,
    input wire id_6,
    input uwire id_7,
    output tri0 id_8
);
  assign id_0 = 1;
endmodule
module module_1 (
    input  tri  id_0,
    input  tri  id_1,
    input  wor  id_2,
    input  tri0 id_3,
    output tri  id_4,
    input  tri1 id_5
);
  assign id_4 = 1'b0;
  assign id_4 = 1 ? id_3 : 1'b0;
  assign id_4 = id_3 != 1 - ~(id_1);
  module_0(
      id_4, id_0, id_4, id_1, id_0, id_3, id_3, id_5, id_4
  );
endmodule
