// Seed: 2090125152
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input tri id_2,
    output supply0 id_3,
    input wire id_4,
    input tri0 id_5,
    input wor id_6,
    input wand id_7,
    output wire id_8,
    input wand id_9,
    input tri0 id_10,
    output tri id_11,
    input uwire id_12,
    input tri0 id_13,
    input wor id_14,
    input tri0 id_15,
    input wand id_16,
    output supply0 id_17
);
  tri0 id_19;
  assign module_1.type_0 = 0;
  assign id_19 = 1;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    input wor id_2,
    input supply1 id_3,
    inout supply0 id_4,
    output supply1 id_5,
    output tri0 id_6,
    input tri0 id_7,
    input tri0 id_8
    , id_11,
    output wand id_9
);
  supply0 id_12 = id_8, id_13;
  xnor primCall (id_9, id_7, id_12, id_4, id_13, id_1, id_11, id_2, id_3, id_0);
  module_0 modCall_1 (
      id_12,
      id_12,
      id_8,
      id_5,
      id_12,
      id_13,
      id_7,
      id_13,
      id_6,
      id_8,
      id_1,
      id_5,
      id_2,
      id_8,
      id_8,
      id_13,
      id_7,
      id_9
  );
endmodule
