// Seed: 3630564091
module module_0 (
    output wire id_0,
    output tri1 id_1,
    output tri0 id_2,
    input tri0 id_3,
    output supply0 id_4,
    input tri1 id_5,
    input tri0 id_6,
    input tri id_7,
    input tri1 id_8,
    input wand id_9,
    input supply1 id_10
);
  int [1 : 1] id_12;
  wire id_13;
endmodule
module module_1 (
    output tri1 id_0,
    output supply0 id_1,
    output tri0 id_2,
    input wire id_3,
    input tri1 id_4,
    input wire id_5,
    input wand id_6,
    output tri1 id_7,
    output supply0 id_8
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_3,
      id_8,
      id_3,
      id_6,
      id_6,
      id_3,
      id_4,
      id_4
  );
  assign modCall_1.id_7 = 0;
endmodule
