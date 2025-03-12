// Seed: 3511766258
module module_0 (
    output tri0  id_0,
    input  wor   id_1,
    input  tri   id_2,
    input  tri0  id_3,
    input  wand  id_4,
    output uwire id_5,
    input  wand  id_6,
    output uwire id_7,
    input  tri   id_8
);
  logic [7:0] id_10;
  assign id_5 = id_6;
  assign id_7 = id_10[-1==1] == 1 ? id_8 : -1;
  assign id_7 = id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd24,
    parameter id_4 = 32'd19
) (
    input wand id_0,
    input supply0 _id_1,
    output supply1 id_2,
    output tri0 id_3,
    input tri _id_4,
    output uwire id_5,
    input supply0 id_6,
    input tri id_7,
    input tri1 id_8,
    input uwire id_9,
    output wire id_10
);
  logic [id_4 : id_1] id_12 = id_1;
  module_0 modCall_1 (
      id_10,
      id_6,
      id_8,
      id_9,
      id_9,
      id_2,
      id_7,
      id_10,
      id_8
  );
  assign modCall_1.id_2 = 0;
endmodule
