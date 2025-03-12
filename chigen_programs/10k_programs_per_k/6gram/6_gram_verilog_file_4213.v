// Seed: 2099988901
module module_0 (
    output uwire id_0,
    output supply1 id_1,
    input tri id_2,
    output wire id_3
);
  wire id_5;
  assign id_3 = 1;
  assign id_0 = -1;
  wire  id_6;
  logic id_7;
endmodule
module module_1 (
    output wand id_0,
    input wor id_1,
    input supply0 id_2,
    input tri1 id_3,
    output uwire id_4,
    input wand id_5,
    output tri1 id_6,
    output wor id_7,
    output supply1 id_8
);
  logic id_10;
  nand primCall (id_8, id_1, id_5, id_2, id_3, id_10);
  module_0 modCall_1 (
      id_6,
      id_0,
      id_1,
      id_8
  );
  assign modCall_1.id_2 = 0;
endmodule
