// Seed: 2941341875
module module_0 (
    output tri1 id_0,
    input tri id_1,
    output supply1 id_2,
    input uwire id_3,
    output uwire id_4,
    input wire id_5,
    output supply1 id_6,
    input uwire id_7,
    output wire id_8,
    output tri0 id_9,
    output wire id_10,
    input tri0 id_11,
    input wire id_12,
    output wor id_13,
    id_28,
    output supply1 id_14,
    input tri0 id_15,
    input uwire id_16,
    output supply0 id_17,
    output supply0 id_18,
    input wire id_19,
    output supply0 id_20,
    input tri0 id_21,
    input tri1 id_22,
    input wand id_23,
    output tri id_24,
    output supply0 id_25,
    input tri id_26
);
  wire id_29;
  wire id_30, id_31;
endmodule
module module_1 (
    output wor   id_0,
    input  tri   id_1,
    input  wand  id_2,
    input  uwire id_3,
    output uwire id_4,
    input  wire  id_5
);
  assign id_0 = id_5;
  tri0 id_7;
  assign id_0 = id_7;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_7,
      id_2,
      id_7,
      id_3,
      id_7,
      id_1,
      id_0,
      id_4,
      id_0,
      id_2,
      id_7,
      id_0,
      id_7,
      id_7,
      id_1,
      id_7,
      id_4,
      id_7,
      id_7,
      id_3,
      id_2,
      id_2,
      id_4,
      id_0,
      id_5
  );
  assign modCall_1.id_2 = 0;
endmodule
