// Seed: 3932676997
module module_0 (
    output wor id_0,
    output wor id_1,
    output supply0 id_2,
    output tri0 id_3,
    output supply0 id_4,
    input tri id_5,
    input tri0 id_6,
    output supply0 id_7,
    input wand id_8,
    input wand id_9,
    output tri0 id_10,
    input tri0 id_11,
    input wand id_12,
    input tri1 id_13,
    output tri1 id_14,
    input wor id_15,
    input wand id_16,
    output supply0 id_17,
    input supply1 id_18,
    input supply0 id_19,
    output supply0 id_20
);
  logic [-1 : -1 'b0] id_22;
  assign id_2 = 1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output tri id_0,
    input wand id_1,
    input wand id_2,
    input supply0 id_3,
    input wor id_4,
    input supply0 id_5,
    inout supply1 id_6,
    output wor id_7
);
  assign id_6 = 1'b0;
  module_0 modCall_1 (
      id_7,
      id_0,
      id_6,
      id_0,
      id_6,
      id_4,
      id_5,
      id_6,
      id_3,
      id_3,
      id_0,
      id_5,
      id_5,
      id_3,
      id_0,
      id_2,
      id_3,
      id_7,
      id_3,
      id_6,
      id_0
  );
endmodule
