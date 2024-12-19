// Seed: 1615328690
module module_0 (
    input wand id_0,
    input supply1 id_1,
    input tri1 id_2,
    input tri0 id_3,
    output wire id_4,
    input tri1 id_5,
    output tri0 id_6,
    output supply0 id_7,
    input supply1 id_8,
    input supply1 id_9,
    input wand id_10,
    input wire id_11
);
  logic [7:0] id_13 = id_13, id_14;
  assign id_13[1] = id_11 == 1;
endmodule
module module_1 (
    input wand id_0,
    output wire id_1,
    input wor id_2,
    input tri id_3,
    input wand id_4,
    input wand id_5,
    input tri0 id_6,
    output wire id_7,
    input wand id_8,
    input supply1 id_9,
    input tri0 id_10
);
  wire id_12;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_5,
      id_1,
      id_5,
      id_7,
      id_7,
      id_6,
      id_0,
      id_0,
      id_10
  );
  assign modCall_1.type_5 = 0;
endmodule
