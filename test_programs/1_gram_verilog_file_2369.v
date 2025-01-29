// Seed: 1640766108
module module_0 (
    output wire id_0,
    output wand id_1,
    input  wand id_2,
    input  tri0 id_3,
    input  wand id_4,
    input  tri1 id_5,
    input  tri1 id_6,
    output wor  id_7
);
  supply0 id_9, id_10, id_11;
  for (id_12 = 1; (-1'd0); id_11 = 1) assign id_9 = 1 ? id_4 : -1;
  wire id_13;
  assign id_7 = -1;
endmodule
module module_1 (
    output tri id_0
);
  wor id_2;
  assign id_0 = id_2;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_9 = 0;
  genvar id_3;
endmodule
