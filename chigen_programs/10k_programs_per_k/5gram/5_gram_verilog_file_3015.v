// Seed: 1600342711
module module_0 (
    output supply1 id_0,
    input tri id_1,
    input tri id_2,
    input supply0 id_3,
    input uwire id_4,
    input supply0 id_5,
    output wor id_6,
    input supply1 id_7,
    output uwire id_8
);
  assign id_8 = 1;
  wire id_10;
  assign id_8 = 1'd0 == id_4;
  wand id_11 = 1;
  assign id_11 = id_2;
  wire id_12;
endmodule
module module_1 (
    input  tri1 id_0,
    output wor  id_1,
    input  tri  id_2,
    input  tri  id_3,
    input  wand id_4
);
  assign id_1 = !id_3 == id_2 ? id_4 : id_2;
  module_0(
      id_1, id_3, id_4, id_3, id_3, id_3, id_1, id_4, id_1
  );
endmodule
