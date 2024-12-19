// Seed: 2943755459
module module_0 (
    input wor id_0,
    input wor id_1
    , id_15,
    input wand id_2,
    input uwire module_0,
    output supply1 id_4,
    input tri1 id_5,
    input wor id_6,
    output tri0 id_7,
    output supply1 id_8,
    output wor id_9,
    input supply1 id_10,
    output tri0 id_11,
    input wor id_12,
    input tri0 id_13
);
  wire id_16;
endmodule
module module_1 (
    input  wire id_0,
    input  wire id_1,
    output tri0 id_2
);
  always_ff @(posedge id_0 or negedge id_1) id_2 = 1 ~^ id_1 <= id_1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_0,
      id_0
  );
  assign modCall_1.id_8 = 0;
endmodule
