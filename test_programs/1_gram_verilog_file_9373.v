// Seed: 2706639717
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    input tri0 id_2,
    input wand id_3,
    output tri1 id_4,
    input wor id_5,
    input tri0 id_6,
    input uwire id_7,
    output tri id_8,
    output tri0 id_9,
    input tri0 id_10,
    input wand id_11,
    id_23,
    output wire id_12,
    output supply1 id_13,
    output wand id_14,
    input uwire id_15,
    input tri1 id_16,
    input tri1 id_17,
    input wand id_18,
    input tri1 id_19,
    input wire id_20,
    output wor id_21
);
  wire id_24;
  assign module_1.id_4 = 0;
  assign id_1 = $realtime;
endmodule
module module_1 (
    output tri id_0,
    input wor id_1,
    output tri id_2,
    input tri1 id_3,
    output tri1 id_4,
    input wor id_5,
    output supply1 id_6,
    input wor id_7,
    output supply1 id_8
);
  assign id_0 = id_5;
  wire id_10, id_11;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_1,
      id_7,
      id_6,
      id_1,
      id_7,
      id_7,
      id_2,
      id_0,
      id_1,
      id_7,
      id_8,
      id_2,
      id_6,
      id_3,
      id_7,
      id_7,
      id_3,
      id_1,
      id_7,
      id_8
  );
endmodule
