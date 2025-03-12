// Seed: 3436039360
module module_0 (
    output tri0 id_0,
    output tri id_1,
    output wire id_2,
    input wor id_3,
    input wor id_4,
    input tri1 id_5,
    input tri0 id_6,
    input supply1 id_7
    , id_33,
    input wand id_8,
    input wand id_9,
    output uwire id_10,
    input tri0 id_11,
    input supply1 id_12,
    input wand id_13,
    input wand id_14,
    input supply0 id_15,
    input tri1 id_16,
    output wand id_17,
    output tri1 id_18,
    output tri id_19,
    input uwire id_20,
    input wand id_21,
    input uwire id_22,
    input wand id_23,
    input tri1 id_24,
    input tri0 id_25,
    input supply1 id_26,
    output tri id_27,
    input uwire id_28,
    output tri0 id_29,
    input supply0 id_30,
    input wand id_31
);
  assign id_0 = id_21 != -1;
  assign module_1.id_4 = 0;
  always @* begin : LABEL_0
    $unsigned(50);
    ;
  end
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input wand id_3,
    input wire id_4,
    input tri0 id_5,
    output wor id_6,
    input tri1 id_7,
    input tri1 id_8,
    output wor id_9
    , id_12,
    input wand id_10
);
  xnor primCall (id_6, id_7, id_5, id_2, id_0, id_1, id_8, id_12, id_3, id_10, id_4);
  module_0 modCall_1 (
      id_9,
      id_6,
      id_9,
      id_5,
      id_1,
      id_5,
      id_5,
      id_7,
      id_1,
      id_0,
      id_9,
      id_1,
      id_5,
      id_7,
      id_10,
      id_0,
      id_5,
      id_6,
      id_6,
      id_6,
      id_2,
      id_0,
      id_2,
      id_10,
      id_7,
      id_5,
      id_1,
      id_6,
      id_3,
      id_6,
      id_8,
      id_7
  );
endmodule
