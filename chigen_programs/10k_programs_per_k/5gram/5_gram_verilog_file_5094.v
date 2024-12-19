// Seed: 1326926365
module module_0 (
    input supply0 id_0,
    input wand id_1,
    output tri1 id_2,
    input wor id_3,
    output supply0 id_4,
    input supply1 id_5,
    input wire id_6,
    input supply1 id_7,
    output wand id_8,
    input wor id_9,
    output tri0 id_10,
    input uwire id_11,
    output wor id_12,
    output uwire id_13,
    output wor id_14
);
  assign id_14 = id_11 * 1;
  wire id_16;
  assign module_1.type_0 = 0;
  wire id_17;
  assign id_4 = id_6;
endmodule
module module_1 (
    input wand id_0,
    output supply0 id_1,
    input supply1 id_2,
    output wand id_3,
    input wand id_4,
    output wire id_5,
    input wire id_6,
    input tri id_7,
    input wand id_8,
    input wand id_9,
    input tri id_10,
    input tri id_11,
    input supply0 id_12,
    output wor id_13,
    input tri id_14,
    input wor id_15,
    input uwire id_16
);
  uwire id_18 = 1;
  tri   id_19;
  wire  id_20;
  module_0 modCall_1 (
      id_15,
      id_11,
      id_5,
      id_4,
      id_19,
      id_6,
      id_6,
      id_9,
      id_13,
      id_9,
      id_5,
      id_0,
      id_3,
      id_19,
      id_1
  );
  assign id_13 = id_19;
  or primCall (id_1, id_12, id_20, id_10, id_15, id_8, id_11, id_7, id_19, id_9, id_4, id_18);
endmodule
