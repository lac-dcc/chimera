// Seed: 64722324
module module_0 (
    input uwire id_0,
    input wire id_1,
    input wand id_2,
    output uwire id_3,
    input tri0 id_4,
    input wor id_5,
    input tri1 id_6,
    output uwire id_7,
    output supply1 id_8,
    input supply1 id_9,
    input supply1 id_10,
    output wand id_11,
    input tri0 id_12,
    input tri1 id_13,
    input wire id_14,
    output tri1 id_15,
    input tri0 id_16,
    output supply0 id_17
);
  wire id_19;
  assign id_17 = id_10;
  assign id_7 = 1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output wire id_0,
    output supply1 id_1,
    output supply0 id_2,
    input supply1 id_3,
    output supply0 id_4,
    input tri1 id_5,
    output uwire id_6,
    input wire id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_0,
      id_5,
      id_3,
      id_5,
      id_1,
      id_0,
      id_7,
      id_5,
      id_0,
      id_5,
      id_7,
      id_3,
      id_0,
      id_7,
      id_4
  );
endmodule
