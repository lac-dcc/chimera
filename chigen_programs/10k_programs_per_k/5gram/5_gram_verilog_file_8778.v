// Seed: 797285558
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    output supply0 id_2,
    output tri0 id_3,
    output supply0 id_4,
    input tri id_5,
    output wand id_6,
    input tri1 id_7,
    output tri1 id_8,
    input tri id_9,
    input wand id_10,
    input uwire id_11,
    input tri id_12,
    input wor id_13,
    output supply1 id_14,
    output supply1 id_15,
    output wire id_16,
    output tri1 id_17
);
  wire id_19;
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    input wor id_2,
    output uwire id_3,
    input tri0 id_4,
    input wand id_5,
    input tri0 id_6,
    input wire id_7,
    input supply1 id_8,
    input tri0 id_9,
    output tri id_10,
    output tri id_11,
    output supply0 id_12,
    input uwire id_13,
    input tri id_14,
    output tri1 id_15,
    input uwire id_16,
    input tri1 id_17,
    output uwire id_18
);
  logic [7:0] id_20;
  assign id_20[1] = 1;
  xnor (id_12, id_7, id_5, id_4, id_2, id_14, id_20, id_9, id_8, id_17, id_0, id_1, id_13, id_16);
  module_0(
      id_5,
      id_1,
      id_15,
      id_11,
      id_18,
      id_6,
      id_18,
      id_9,
      id_15,
      id_9,
      id_6,
      id_5,
      id_1,
      id_6,
      id_12,
      id_3,
      id_18,
      id_12
  );
endmodule
