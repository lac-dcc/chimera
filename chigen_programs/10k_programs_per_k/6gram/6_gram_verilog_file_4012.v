// Seed: 1882775872
module module_0 (
    input supply0 id_0,
    output supply0 id_1,
    input supply1 id_2,
    input wor id_3,
    input wor id_4,
    output wire id_5,
    input supply0 id_6
);
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    input wor id_0,
    output tri0 id_1,
    input tri id_2,
    input wand id_3,
    input wor id_4,
    output supply0 id_5,
    input wand id_6,
    input tri1 id_7,
    output wire id_8,
    output supply0 id_9,
    input tri id_10,
    input wand id_11,
    output supply1 id_12,
    input tri id_13,
    input tri id_14,
    input tri0 id_15,
    input tri id_16,
    input tri id_17,
    input wor id_18,
    output supply0 id_19,
    output wand id_20,
    input supply0 id_21
    , id_25,
    input tri1 id_22,
    output wire id_23
);
  assign id_12 = id_17 & (-1) & id_15 & id_18 ? -1 : -1;
  assign id_8  = -1;
  or primCall (
      id_20,
      id_25,
      id_14,
      id_2,
      id_22,
      id_0,
      id_11,
      id_10,
      id_7,
      id_6,
      id_21,
      id_15,
      id_3,
      id_17,
      id_16,
      id_13,
      id_4,
      id_26,
      id_18
  );
  wire id_26;
  module_0 modCall_1 (
      id_2,
      id_8,
      id_4,
      id_21,
      id_3,
      id_1,
      id_14
  );
  assign modCall_1.id_5 = 0;
  always @(id_16 >= -1) begin : LABEL_0
    $clog2(30);
    ;
  end
endmodule
