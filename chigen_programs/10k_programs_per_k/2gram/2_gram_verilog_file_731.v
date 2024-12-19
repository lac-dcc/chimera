// Seed: 1526820996
module module_0 (
    input  tri1 id_0,
    output tri1 id_1,
    output wor  id_2,
    input  wand id_3,
    output tri0 id_4,
    output tri0 id_5,
    input  wand id_6,
    input  wand id_7
);
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    input tri1 id_2,
    input uwire id_3,
    output wand id_4,
    output wire id_5,
    input tri id_6,
    input wor id_7
);
  wire id_9;
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_1,
      id_4,
      id_5,
      id_6,
      id_1
  );
  initial @(1 - ~1) $display(!1);
  assign #(1) id_5 = 1;
endmodule
