// Seed: 2706539391
module module_0 (
    output tri1 id_0,
    output wor id_1,
    output supply0 id_2,
    output tri1 id_3,
    output wand id_4,
    input tri0 id_5,
    output wand id_6,
    input wand id_7,
    output supply0 id_8,
    input supply0 id_9,
    input wor id_10,
    output wire id_11,
    output tri1 id_12,
    output tri id_13,
    input supply1 id_14,
    output wire id_15,
    output uwire id_16,
    input wire id_17,
    output wire id_18,
    output wor id_19
);
  always if (id_9) @(id_14 or posedge 1);
  assign module_1.id_5 = 0;
  wire id_21;
endmodule
module module_1 (
    input tri id_0,
    output supply0 id_1,
    input tri0 id_2,
    input wor id_3,
    input wire id_4,
    output wor id_5,
    input wand id_6,
    output supply1 id_7
);
  module_0 modCall_1 (
      id_7,
      id_5,
      id_5,
      id_1,
      id_1,
      id_4,
      id_5,
      id_6,
      id_7,
      id_3,
      id_0,
      id_7,
      id_5,
      id_7,
      id_2,
      id_5,
      id_5,
      id_3,
      id_7,
      id_7
  );
endmodule
