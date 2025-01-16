// Seed: 3483000109
module module_0 (
    output wand id_0,
    output tri0 id_1,
    input tri1 id_2,
    output wor id_3,
    input wand id_4,
    input tri1 id_5,
    output supply0 id_6,
    input wor id_7,
    input tri0 id_8,
    output wand id_9,
    input wand id_10,
    input supply0 id_11,
    input wor id_12
);
  localparam id_14 = 1;
  assign id_1 = -1;
endmodule
module module_1 (
    input wor id_0,
    output tri id_1,
    input tri0 id_2,
    input wand void id_3,
    output tri0 id_4,
    output tri1 id_5,
    input tri0 id_6,
    output tri0 id_7,
    input tri id_8,
    output supply1 id_9,
    input uwire id_10,
    input tri0 id_11
);
  wire id_13;
  always if (id_8) id_4 = 1;
  id_14(
      -1, 1, {-1'b0{-1, id_0}}
  );
  module_0 modCall_1 (
      id_7,
      id_4,
      id_6,
      id_9,
      id_8,
      id_8,
      id_4,
      id_8,
      id_11,
      id_9,
      id_10,
      id_3,
      id_2
  );
  assign modCall_1.type_6 = 0;
  assign id_5 = 1ps && id_8;
endmodule
