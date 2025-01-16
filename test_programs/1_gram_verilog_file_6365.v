// Seed: 1734784730
module module_0 (
    output wand id_0,
    output tri0 id_1,
    output supply0 id_2,
    id_11,
    input wire id_3,
    input tri0 id_4,
    input wor id_5,
    input tri1 id_6,
    input tri0 id_7,
    output supply1 id_8,
    input tri1 id_9
);
  wire id_12;
  assign id_8 = 1'b0;
endmodule
module module_1 (
    output wire id_0,
    input tri0 id_1,
    input tri1 id_2,
    output wire id_3,
    output wand id_4,
    output tri0 id_5,
    output supply0 id_6,
    input tri1 id_7
);
  uwire   id_9;
  integer id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_9,
      id_9,
      id_7,
      id_1,
      id_1,
      id_0,
      id_1
  );
  assign modCall_1.id_6 = 0;
  assign id_5 = id_9;
  tri0 id_11 = 1;
endmodule
