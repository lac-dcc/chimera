// Seed: 899791107
module module_0 (
    input tri0 id_0,
    output wand id_1,
    output wire id_2,
    input supply1 id_3,
    input supply0 id_4,
    output tri0 id_5,
    input supply0 id_6,
    output wand id_7,
    input tri id_8,
    output supply0 id_9,
    input wor id_10,
    input wand id_11,
    output supply1 id_12,
    input tri0 id_13,
    input uwire id_14,
    input wand id_15,
    input supply0 id_16,
    input tri id_17,
    input tri0 id_18,
    input tri1 id_19,
    output wire id_20,
    input supply1 id_21,
    output supply1 id_22,
    input wor id_23
);
  wire id_25;
  assign module_1.id_9 = 0;
  initial begin : LABEL_0
    id_12 = 1;
  end
endmodule
module module_1 (
    input wor id_0,
    input wire id_1,
    input uwire id_2,
    input supply1 id_3,
    input wor id_4,
    output tri1 id_5,
    input tri1 id_6,
    input supply0 id_7,
    output supply0 id_8,
    output tri0 id_9,
    output tri0 id_10,
    input wire id_11,
    input wand id_12,
    input wire id_13
);
  wire id_15;
  assign id_10 = id_3;
  wire id_16;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_10,
      id_3,
      id_1,
      id_8,
      id_11,
      id_5,
      id_0,
      id_8,
      id_12,
      id_6,
      id_9,
      id_11,
      id_1,
      id_11,
      id_0,
      id_3,
      id_13,
      id_7,
      id_8,
      id_13,
      id_8,
      id_7
  );
endmodule
