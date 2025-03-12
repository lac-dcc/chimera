// Seed: 118777574
module module_0 (
    output wand id_0,
    output tri1 id_1,
    output tri0 id_2,
    output uwire id_3,
    output wand id_4,
    output uwire id_5,
    input tri id_6
    , id_12,
    input tri1 id_7,
    input supply1 id_8,
    output tri id_9,
    output uwire id_10
);
  assign module_1.id_17 = 0;
  wire id_13;
endmodule
module module_1 (
    output tri0 id_0,
    output supply1 id_1,
    input supply0 id_2,
    inout supply1 id_3,
    output tri0 id_4,
    input tri0 id_5,
    output tri1 id_6,
    output tri0 id_7,
    output tri id_8,
    input tri id_9,
    input uwire id_10,
    output uwire id_11,
    input wire id_12,
    output supply1 id_13,
    output supply1 id_14,
    output wire id_15,
    output wire id_16,
    input wor id_17
);
  reg
      id_19 = -1,
      id_20 = -1,
      id_21 = 1,
      id_22 = id_12,
      id_23 = id_21,
      id_24 = id_22,
      id_25 = id_17,
      id_26 = 1,
      id_27 = id_24 ? -1 : id_15++ ? id_12 : 1,
      id_28 = id_2 | -1 | id_12 | 1 | id_28,
      id_29 = 1,
      id_30 = id_26 + -1'd0,
      id_31 = id_24,
      id_32 = -1'b0,
      id_33 = id_26,
      id_34 = -1,
      id_35 = -1,
      id_36 = {"", -1} & 1,
      id_37 = -1,
      id_38 = id_2,
      id_39 = 1;
  initial begin : LABEL_0
    id_26 <= 1;
  end
  xnor primCall (
      id_14,
      id_5,
      id_31,
      id_10,
      id_37,
      id_33,
      id_22,
      id_29,
      id_20,
      id_23,
      id_34,
      id_3,
      id_28,
      id_17,
      id_27,
      id_26,
      id_39,
      id_21,
      id_30,
      id_38,
      id_2,
      id_35,
      id_9,
      id_36,
      id_32,
      id_12
  );
  module_0 modCall_1 (
      id_6,
      id_16,
      id_1,
      id_11,
      id_14,
      id_13,
      id_17,
      id_9,
      id_10,
      id_15,
      id_14
  );
endmodule
