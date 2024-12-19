// Seed: 3725120390
module module_0 (
    input tri0 id_0,
    output wand id_1,
    output wor id_2,
    input tri0 id_3,
    input tri0 id_4,
    input tri0 id_5,
    input wand id_6,
    input wire id_7,
    input wor id_8,
    input wor id_9,
    input supply0 id_10,
    input wor id_11,
    output wor id_12,
    input supply0 id_13,
    input tri1 id_14,
    output supply1 id_15,
    input tri0 id_16
    , id_20,
    input uwire id_17,
    input wire id_18
);
  wire id_21;
  tri  id_22;
  wire id_23;
  assign module_1.id_9 = 0;
  wor  id_24;
  wire id_25;
  assign id_24 = id_20 ? 1 : id_16 ? id_22 : 1;
endmodule
module module_1 (
    input wand id_0,
    output tri id_1,
    input tri1 id_2,
    input wand id_3,
    output wor id_4,
    output wire id_5,
    output wire id_6,
    output tri0 id_7,
    output supply0 id_8,
    input supply1 id_9,
    inout tri1 id_10
);
  wire id_12;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_0,
      id_0,
      id_2,
      id_3,
      id_9,
      id_10,
      id_0,
      id_0,
      id_10,
      id_5,
      id_0,
      id_10,
      id_5,
      id_3,
      id_0,
      id_2
  );
  wire id_13;
endmodule
