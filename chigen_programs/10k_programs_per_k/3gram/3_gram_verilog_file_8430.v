// Seed: 2859671256
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    output supply1 id_2,
    input tri1 id_3,
    output wand id_4,
    output wand id_5,
    output tri1 id_6
);
  assign id_6 = 1;
  logic ["" : 1] id_8 = id_1 + -1;
  assign id_4 = -1;
endmodule
module module_1 (
    output tri1 id_0,
    output supply1 id_1,
    input supply0 id_2,
    output wand id_3,
    input wand id_4,
    output wire id_5
);
  wire id_7 = id_4;
  assign id_3 = id_2;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_5,
      id_2,
      id_5,
      id_0,
      id_1
  );
  assign modCall_1.id_4 = 0;
  logic id_8;
endmodule
