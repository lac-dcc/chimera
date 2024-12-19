// Seed: 3975337275
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    input supply1 id_2,
    input tri0 id_3,
    output wire id_4,
    input supply0 id_5,
    input wire id_6,
    output wor id_7,
    output tri1 id_8,
    input tri0 id_9,
    input tri id_10,
    input tri id_11,
    output uwire id_12,
    input uwire id_13,
    input wire id_14,
    input supply1 id_15
);
  wire id_17;
  assign module_1.type_2 = 0;
  assign #1 id_4 = 1'b0;
  wire id_18, id_19;
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    output supply1 id_2,
    output uwire id_3,
    input wor id_4,
    output wire id_5,
    input uwire id_6,
    input supply0 id_7,
    input uwire id_8,
    input supply0 id_9,
    input tri id_10,
    input supply1 id_11,
    output tri id_12,
    input supply1 id_13,
    output uwire id_14,
    output wand id_15,
    output tri0 id_16,
    input tri0 id_17,
    input wire id_18
    , id_41,
    output wand id_19,
    input supply0 id_20,
    output tri0 id_21,
    input uwire id_22,
    input tri id_23,
    output supply1 id_24,
    output tri0 id_25,
    input tri1 id_26,
    output wand id_27,
    output uwire id_28,
    input wand id_29,
    input uwire id_30,
    input tri id_31,
    input tri1 id_32,
    output wand id_33,
    output supply1 id_34,
    output tri0 id_35,
    output tri1 id_36,
    input wand id_37,
    input wor id_38,
    input wor id_39
);
  always begin : LABEL_0
    for (id_36 = 1; id_17; id_25 = (id_9 & 1)) begin : LABEL_0
      @(posedge id_23) id_5 = 1'd0;
    end
  end
  module_0 modCall_1 (
      id_8,
      id_28,
      id_17,
      id_1,
      id_27,
      id_32,
      id_29,
      id_19,
      id_25,
      id_7,
      id_0,
      id_22,
      id_28,
      id_32,
      id_17,
      id_31
  );
endmodule
