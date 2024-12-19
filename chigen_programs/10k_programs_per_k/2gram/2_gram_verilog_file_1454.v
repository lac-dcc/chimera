// Seed: 2669702814
module module_0 (
    output supply0 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input wand id_3,
    output uwire id_4,
    output supply0 id_5,
    input tri id_6,
    input tri id_7,
    output tri0 id_8,
    output tri id_9,
    output supply0 id_10,
    input tri0 id_11,
    input supply0 id_12,
    output wor id_13,
    input wor id_14,
    input supply0 id_15,
    input wand id_16,
    output wand id_17,
    output wor id_18,
    input uwire id_19,
    input wor id_20,
    output uwire id_21,
    output uwire id_22,
    input tri id_23,
    output supply1 id_24,
    input tri id_25,
    input tri1 id_26,
    input tri id_27,
    input wire id_28,
    input tri1 id_29,
    input uwire id_30
);
  assign module_1.type_1 = 0;
  for (id_32 = id_1; id_28; id_32 = 1) begin : LABEL_0
    wire id_33;
  end
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    input wand id_2,
    input tri0 id_3,
    output uwire id_4
);
  module_0 modCall_1 (
      id_4,
      id_3,
      id_2,
      id_3,
      id_4,
      id_4,
      id_0,
      id_0,
      id_4,
      id_4,
      id_4,
      id_1,
      id_3,
      id_4,
      id_3,
      id_0,
      id_3,
      id_4,
      id_4,
      id_0,
      id_1,
      id_4,
      id_4,
      id_3,
      id_4,
      id_2,
      id_0,
      id_1,
      id_0,
      id_2,
      id_1
  );
  wand id_6 = id_2;
endmodule
