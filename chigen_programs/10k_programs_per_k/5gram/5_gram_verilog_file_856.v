// Seed: 4114622864
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    output supply1 id_2,
    output wor id_3,
    input tri1 id_4,
    input wand id_5,
    input wor id_6,
    input supply0 id_7,
    input wire id_8,
    output wand id_9,
    output uwire id_10,
    output supply0 id_11,
    output uwire id_12,
    output tri0 id_13
);
  wire  id_15;
  logic id_16;
  logic id_17 = (id_8);
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output wor id_0,
    input tri0 id_1,
    output uwire id_2,
    input wand id_3,
    inout wand id_4,
    input supply0 id_5,
    input tri1 id_6,
    input wor id_7
);
  assign id_0 = id_7;
  module_0 modCall_1 (
      id_7,
      id_0,
      id_4,
      id_0,
      id_6,
      id_4,
      id_5,
      id_6,
      id_3,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0
  );
  wire id_9 = ~id_7;
endmodule
