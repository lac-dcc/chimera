// Seed: 1632861689
module module_0 (
    output wor id_0,
    output wor id_1,
    output tri0 id_2,
    output supply0 id_3,
    output wand id_4,
    input wand id_5,
    output tri0 id_6
);
  wire id_8;
  wire id_9;
  wire id_10;
  logic [7:0] id_11;
  assign id_10 = id_9;
  wire id_12;
  wire id_13 = id_11[1'b0 : 1];
endmodule
module module_1 (
    input supply0 id_0,
    input tri1 id_1,
    input wor id_2,
    input wand id_3,
    output wire id_4,
    input wire id_5,
    output tri0 id_6,
    input tri1 id_7,
    output tri0 id_8,
    input tri0 id_9,
    input supply1 id_10,
    output tri id_11,
    output tri0 id_12,
    input wor id_13,
    input supply0 id_14,
    output tri0 id_15,
    output tri0 id_16,
    input wand id_17,
    input uwire id_18,
    output tri0 id_19
);
  wire id_21;
  assign id_11 = id_18;
  module_0 modCall_1 (
      id_19,
      id_15,
      id_19,
      id_8,
      id_19,
      id_3,
      id_6
  );
  assign modCall_1.type_1 = 0;
endmodule
