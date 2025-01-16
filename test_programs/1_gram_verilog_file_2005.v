// Seed: 1138633173
module module_0 (
    input tri0 id_0,
    output supply1 id_1,
    input tri id_2,
    output wor id_3,
    input tri1 id_4,
    output supply0 id_5,
    output tri0 id_6,
    input wand id_7,
    input tri0 id_8,
    output wor id_9,
    output supply0 id_10,
    output tri0 id_11,
    input tri0 id_12,
    input wand id_13,
    input uwire id_14,
    input supply1 id_15,
    input tri id_16,
    output supply1 id_17,
    output wire id_18,
    output wire id_19,
    output tri0 id_20,
    output tri1 id_21,
    input uwire id_22,
    id_30,
    input tri0 id_23,
    input tri1 id_24,
    input tri id_25,
    input tri0 id_26,
    input supply1 id_27,
    input tri0 id_28
);
  always id_18 = id_7;
  assign module_1.id_10 = 0;
  wire id_31, id_32;
  wire id_33;
endmodule
program module_1 (
    input wire id_0,
    input wor id_1,
    inout supply0 id_2,
    input tri id_3,
    output uwire id_4,
    output uwire id_5,
    output wor id_6,
    input wor id_7,
    output wand id_8,
    input supply1 id_9,
    input wand id_10,
    output supply1 id_11,
    input supply0 id_12,
    input supply1 id_13,
    input tri id_14
);
  module_0 modCall_1 (
      id_0,
      id_11,
      id_14,
      id_4,
      id_9,
      id_4,
      id_2,
      id_14,
      id_1,
      id_5,
      id_4,
      id_2,
      id_7,
      id_12,
      id_2,
      id_1,
      id_0,
      id_4,
      id_4,
      id_5,
      id_11,
      id_2,
      id_10,
      id_12,
      id_13,
      id_9,
      id_9,
      id_0,
      id_2
  );
  always begin : LABEL_0
    if (-1'h0) id_11 = !id_14;
  end
endmodule
