// Seed: 1891140872
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    output supply1 id_2,
    input wand id_3,
    output wire id_4,
    input uwire id_5,
    input supply1 id_6
);
  supply1 id_8;
  assign id_8 = 1;
  assign id_4 = 1;
endmodule
module module_1 #(
    parameter id_0 = 32'd72,
    parameter id_2 = 32'd25,
    parameter id_3 = 32'd44
) (
    output tri0 _id_0,
    input  tri0 id_1,
    input  wand _id_2,
    input  tri1 _id_3,
    output tri0 id_4,
    output wor  id_5
);
  assign id_5 = id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_4,
      id_1,
      id_5,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
  struct packed {logic [1 : id_2] id_7;} [id_3 : id_0] id_8;
  ;
  assign id_4 = id_8[id_3] && 1;
endmodule
