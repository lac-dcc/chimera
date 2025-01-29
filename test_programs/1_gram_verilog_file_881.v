// Seed: 3808010609
module module_0 (
    input tri0 id_0,
    input wand id_1,
    output tri0 id_2,
    input supply1 id_3,
    output tri0 id_4,
    output tri0 id_5
);
  tri1 id_7, id_8;
  for (genvar id_9 = {id_7{-1}}; -1; {1, ~id_7} = id_8) wire id_10;
  assign module_1.type_0 = 0;
  wire id_11, id_12;
endmodule
module module_1 (
    output tri  id_0,
    input  tri0 id_1,
    output tri  id_2
);
  wire id_4, id_5;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_2,
      id_1,
      id_0,
      id_2
  );
  assign id_0 = id_1 * id_5 ==? id_4 == -1;
endmodule
