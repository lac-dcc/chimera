// Seed: 1856076953
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    output wand id_2,
    input tri0 id_3,
    input supply0 id_4,
    input tri0 id_5
);
  assign id_2 = 1;
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd16,
    parameter id_4 = 32'd69
) (
    input  tri1 _id_0,
    input  tri1 id_1,
    output wand id_2,
    input  wor  id_3,
    input  wor  _id_4,
    output wand id_5
);
  logic id_7 = id_0;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_5,
      id_1,
      id_1,
      id_3
  );
  assign id_7[id_0==id_4] = -1;
  nand primCall (id_2, id_3, id_7, id_1);
endmodule
