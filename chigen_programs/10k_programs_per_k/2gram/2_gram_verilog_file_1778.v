// Seed: 2581434593
module module_0 (
    input wor id_0,
    input wire id_1,
    output tri0 id_2,
    output supply0 id_3,
    input wor id_4,
    input wor id_5,
    input wor id_6,
    input supply0 id_7,
    output wand id_8#(
        .id_16(1 > 1),
        .id_17(1'b0)
    ),
    output wor id_9,
    output tri0 id_10,
    input tri0 id_11,
    output tri0 id_12,
    input wand id_13,
    input uwire id_14
);
  wire id_18;
endmodule
module module_1 (
    input tri1 id_0,
    output wire id_1,
    input supply0 id_2,
    output wand id_3,
    input supply1 id_4,
    output tri1 id_5,
    input wor id_6,
    input supply1 id_7
);
  tri0 id_9;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_1,
      id_9,
      id_4,
      id_9,
      id_6,
      id_6,
      id_3,
      id_5,
      id_9,
      id_0,
      id_5,
      id_6,
      id_7
  );
  assign modCall_1.id_0 = 0;
  wire id_10;
  assign id_5 = id_2;
  always_comb @(posedge id_4 or posedge id_2);
  assign id_9 = id_2;
endmodule
