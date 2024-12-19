// Seed: 35793654
module module_0 (
    output wor id_0,
    output tri0 id_1,
    input wand id_2,
    input supply0 id_3,
    output tri1 id_4,
    output uwire id_5,
    output tri1 id_6,
    output wire id_7,
    output supply0 id_8,
    output uwire id_9
    , id_17,
    input wire id_10,
    input wire id_11,
    input supply0 id_12,
    output supply1 id_13,
    input tri0 id_14,
    output wor id_15
);
  assign id_0 = 1'b0;
endmodule
module module_1 (
    output uwire id_0,
    output tri0 id_1,
    output tri1 id_2,
    output tri0 id_3,
    input supply1 id_4,
    output wor id_5,
    output supply1 id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_4,
      id_6,
      id_6,
      id_5,
      id_6,
      id_3,
      id_3,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_2
  );
  assign modCall_1.id_3 = 0;
  assign id_3 = id_4;
  wire id_9;
  always repeat (1) id_3 = 1;
endmodule
