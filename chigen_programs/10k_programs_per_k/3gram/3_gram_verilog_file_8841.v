// Seed: 675249509
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    input tri1 id_2,
    input uwire id_3,
    input tri0 id_4,
    input supply0 id_5
);
  always @(posedge 1'd0) begin : LABEL_0
    `define pp_7 0
  end
  assign module_1.id_14 = 0;
endmodule
module module_1 (
    input tri id_0
    , id_33,
    output tri id_1,
    input supply0 id_2,
    output uwire id_3,
    input uwire id_4,
    input uwire id_5,
    input wor id_6,
    output wor id_7,
    output supply1 id_8,
    input wire id_9,
    output wire id_10,
    output tri1 id_11,
    input supply1 id_12,
    input tri1 id_13,
    input tri id_14,
    input wand id_15,
    output supply0 id_16,
    output wand id_17,
    output uwire id_18,
    input uwire id_19,
    output tri id_20,
    output wand id_21,
    input wire id_22,
    input wor id_23,
    input supply0 id_24,
    input supply1 id_25,
    input wand id_26,
    input supply1 id_27,
    input supply0 id_28
    , id_34,
    input supply1 id_29,
    output tri id_30,
    output wor id_31
);
  tri1 id_35 = (1 & 1 & id_22 & 1) < 1;
  module_0 modCall_1 (
      id_4,
      id_16,
      id_2,
      id_4,
      id_24,
      id_24
  );
  wire id_36;
  tri  id_37 = id_27;
  nand primCall (
      id_10,
      id_24,
      id_14,
      id_19,
      id_13,
      id_22,
      id_2,
      id_9,
      id_5,
      id_33,
      id_12,
      id_27,
      id_23,
      id_6,
      id_28,
      id_26,
      id_35,
      id_0,
      id_4,
      id_29,
      id_34,
      id_25,
      id_15
  );
endmodule
