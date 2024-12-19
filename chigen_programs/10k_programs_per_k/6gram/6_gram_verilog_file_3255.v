// Seed: 1387155817
module module_0 (
    input wor id_0,
    output wor id_1,
    output tri0 id_2,
    output supply0 id_3,
    output wand id_4,
    output wand id_5,
    input tri0 id_6,
    input tri0 id_7,
    output supply0 id_8,
    input tri id_9,
    input tri0 id_10,
    output supply0 id_11
);
  wire id_13;
  wire id_14;
  always @(posedge id_6) $display;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    output wand id_2,
    output wand id_3,
    output wand id_4,
    input supply0 id_5,
    input supply1 id_6,
    input tri id_7,
    input tri id_8,
    output tri0 id_9,
    output tri1 id_10,
    input tri1 id_11,
    input tri0 id_12,
    input wand id_13,
    input supply1 id_14,
    output tri id_15
);
  assign id_3 = 1;
  assign id_2 = 1;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_2,
      id_10,
      id_9,
      id_3,
      id_11,
      id_12,
      id_9,
      id_14,
      id_12,
      id_3
  );
  assign modCall_1.id_3 = 0;
  assign id_3 = id_14;
  initial id_10 = 1;
endmodule
