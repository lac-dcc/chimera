// Seed: 992234284
module module_0 (
    input uwire id_0,
    output tri1 id_1,
    output tri id_2,
    input uwire id_3,
    input wand id_4,
    input wand id_5,
    output tri0 id_6,
    output supply1 id_7,
    input tri id_8,
    input uwire id_9,
    input uwire id_10,
    output tri id_11,
    output tri0 id_12,
    id_26,
    input wand id_13,
    output wor id_14,
    input tri0 id_15,
    input tri id_16,
    output supply0 id_17,
    output wor id_18,
    output wor id_19,
    input wand id_20,
    output wire id_21,
    input tri0 id_22,
    input tri id_23,
    input wor id_24
);
  assign id_17 = id_10 >> id_13;
  assign id_19 = 1'h0;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    output tri0 id_1,
    input wor id_2,
    output tri0 id_3,
    output supply0 id_4,
    inout wire id_5,
    output wor id_6,
    output supply0 id_7,
    output wire id_8,
    input supply0 id_9,
    output tri1 id_10,
    output wand id_11,
    input supply1 id_12,
    input tri1 id_13,
    input wor id_14,
    inout supply1 id_15,
    output supply0 id_16,
    input supply1 id_17,
    input tri id_18
);
  assign id_8 = id_13;
  module_0 modCall_1 (
      id_2,
      id_10,
      id_6,
      id_5,
      id_17,
      id_2,
      id_4,
      id_11,
      id_2,
      id_2,
      id_14,
      id_15,
      id_10,
      id_13,
      id_4,
      id_9,
      id_5,
      id_7,
      id_11,
      id_8,
      id_14,
      id_16,
      id_5,
      id_12,
      id_2
  );
  wire id_20;
endmodule
