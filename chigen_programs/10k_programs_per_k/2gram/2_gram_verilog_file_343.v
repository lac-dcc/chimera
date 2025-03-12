// Seed: 3511220525
module module_0 (
    output tri0 id_0,
    output wand id_1
);
  assign module_1.id_3 = 0;
endmodule
macromodule module_1 (
    input tri id_0,
    input tri id_1,
    output supply1 id_2,
    output uwire id_3,
    input tri0 id_4,
    output supply0 id_5
    , id_8,
    input supply0 id_6
);
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_2,
      id_5
  );
endmodule
module module_2 (
    output tri id_0,
    input tri0 id_1,
    input uwire id_2,
    output tri0 id_3,
    input wire id_4,
    output supply0 id_5,
    output wor id_6,
    input supply0 id_7,
    inout wire id_8,
    input tri1 id_9,
    input wand id_10,
    input wor id_11,
    input supply1 id_12,
    input supply1 id_13,
    input supply0 id_14,
    input wand id_15,
    input tri id_16,
    input uwire id_17,
    input supply0 id_18,
    input wor id_19,
    input wor id_20,
    input uwire id_21,
    input wand id_22,
    input tri1 id_23,
    output tri0 id_24,
    input wire id_25,
    input supply0 id_26,
    output wand id_27,
    input tri id_28,
    input wor id_29,
    input tri1 id_30
);
  id_32 :
  assert property (@(1 or posedge id_29) id_20 - 1'b0)
  else;
  module_0 modCall_1 (
      id_6,
      id_27
  );
  assign modCall_1.id_1 = 0;
endmodule
