// Seed: 3124981771
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input tri1 id_2,
    output wor id_3,
    input uwire id_4,
    input tri1 id_5,
    input tri id_6,
    input wor id_7,
    output uwire id_8,
    input tri0 id_9,
    input tri id_10,
    input tri id_11,
    input supply0 id_12,
    output wor id_13,
    input tri0 id_14,
    input supply1 id_15
);
  supply0 id_17, id_18, id_19;
  id_20 :
  assert property (@* id_18) begin : LABEL_0
    id_19 = 1 & 1;
  end
endmodule
module module_1 (
    input wand id_0,
    output wire id_1,
    id_14,
    input supply0 id_2,
    output supply0 id_3,
    input tri0 id_4,
    input uwire id_5,
    input tri id_6,
    id_15,
    input supply1 id_7,
    output uwire id_8,
    output wire void id_9,
    output wor id_10,
    input uwire id_11,
    input supply1 id_12
);
  wire id_16;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_2,
      id_10,
      id_5,
      id_2,
      id_11,
      id_4,
      id_9,
      id_11,
      id_12,
      id_6,
      id_6,
      id_10,
      id_2,
      id_11
  );
  assign modCall_1.type_5 = 0;
endmodule
