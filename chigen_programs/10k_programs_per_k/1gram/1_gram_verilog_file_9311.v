// Seed: 2293596028
module module_0 (
    output tri   id_0,
    input  wand  id_1,
    input  wire  id_2,
    output tri   id_3,
    input  uwire id_4,
    output wor   id_5,
    output wor   id_6,
    output wire  id_7,
    output tri1  id_8,
    output tri0  id_9,
    output wire  id_10,
    output tri   id_11,
    input  tri0  id_12,
    input  tri   id_13,
    output uwire id_14,
    input  tri1  id_15
);
  wire id_17;
  tri id_18, id_19, id_20;
  assign module_1.id_18 = 0;
  assign id_18 = id_13;
  assign id_5 = id_2;
  assign id_11 = 1;
  always id_20 = 1;
  assign id_6 = id_20;
  wire id_21;
  assign id_8 = 1;
  wire id_22;
  wire id_23, id_24, id_25;
  wire id_26;
  wire id_27;
endmodule
module module_1 (
    input uwire id_0,
    input supply1 id_1,
    input tri0 id_2,
    inout tri0 id_3,
    input supply0 id_4,
    input wor id_5,
    output tri0 id_6,
    input tri id_7,
    output tri id_8,
    output supply1 id_9
    , id_20,
    input tri id_10,
    output supply0 id_11,
    input uwire id_12
    , id_21,
    input supply0 id_13,
    input wand id_14,
    output wor id_15,
    output wand id_16,
    input supply1 id_17,
    input tri0 id_18
);
  assign id_9 = 1 & ~id_3;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_16,
      id_13,
      id_7,
      id_8,
      id_3,
      id_3,
      id_6,
      id_15,
      id_15,
      id_16,
      id_16,
      id_15,
      id_13,
      id_4,
      id_3,
      id_7
  );
endmodule
