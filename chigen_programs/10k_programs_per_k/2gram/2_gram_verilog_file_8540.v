// Seed: 2593488952
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    output wand id_2,
    output wand id_3,
    input tri0 id_4,
    output supply1 id_5,
    output tri1 id_6,
    output wire id_7,
    input wire id_8,
    input uwire id_9,
    output uwire id_10,
    output tri0 id_11,
    input wor id_12,
    input tri1 id_13
);
  parameter id_15 = 1;
  wire id_16;
  ;
  wire id_17;
endmodule
module module_1 (
    input wor id_0,
    input tri1 id_1,
    input tri1 id_2,
    input uwire id_3,
    input tri1 id_4,
    output supply1 id_5,
    output wor id_6,
    output wor id_7,
    output wor id_8,
    input supply1 id_9
);
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_7,
      id_7,
      id_9,
      id_6,
      id_8,
      id_8,
      id_3,
      id_0,
      id_7,
      id_8,
      id_9,
      id_3
  );
  assign modCall_1.id_12 = 0;
endmodule
