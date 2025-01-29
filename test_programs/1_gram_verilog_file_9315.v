// Seed: 3179753390
module module_0 (
    output wand id_0,
    output wand id_1,
    output tri id_2 id_27,
    output uwire id_3,
    input tri id_4,
    output uwire id_5,
    output supply1 id_6,
    input tri id_7,
    input wor id_8,
    output wand id_9,
    output tri id_10,
    output supply1 id_11,
    output wor id_12,
    output tri id_13,
    output tri0 id_14,
    input tri id_15,
    input wire id_16,
    input tri0 id_17,
    input wire id_18,
    input uwire id_19,
    output tri0 id_20,
    input supply1 id_21,
    output wire id_22,
    input wire id_23,
    input wor id_24,
    output tri0 id_25,
    id_28
);
  wire id_29;
endmodule
module module_1 (
    output tri id_0,
    output supply0 id_1,
    output wand id_2,
    input tri0 id_3,
    output wire id_4,
    input wire id_5,
    inout tri0 id_6,
    output wire id_7,
    input tri1 id_8,
    input tri0 id_9,
    input wire id_10,
    output supply1 id_11,
    output uwire id_12
);
  for (id_14 = -1; 1; id_2 = 1) wire id_15;
  wand id_16, id_17;
  wire id_18;
  xnor primCall (id_2, id_15, id_18, id_17, id_16, id_5, id_9, id_3, id_6, id_8, id_14, id_10);
  assign id_2 = id_17;
  always id_7 = 1'b0;
  module_0 modCall_1 (
      id_4,
      id_17,
      id_6,
      id_2,
      id_8,
      id_17,
      id_4,
      id_10,
      id_6,
      id_17,
      id_2,
      id_16,
      id_16,
      id_12,
      id_4,
      id_8,
      id_3,
      id_10,
      id_8,
      id_9,
      id_6,
      id_8,
      id_11,
      id_6,
      id_17,
      id_2
  );
  assign modCall_1.type_15 = 0;
  wire id_19;
  wire id_20;
endmodule
