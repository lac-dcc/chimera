// Seed: 2265262260
module module_0 (
    output wand id_0,
    input tri0 id_1
    , id_28,
    output wire id_2,
    output uwire id_3,
    output wand id_4,
    input wand id_5,
    input tri1 id_6,
    input tri module_0,
    input wand id_8,
    input tri1 id_9,
    output tri1 id_10,
    input tri0 id_11,
    input wand id_12,
    input uwire id_13,
    input supply1 id_14,
    output wand id_15,
    input wor id_16,
    input tri0 id_17,
    output tri1 id_18,
    input supply0 id_19,
    output wand id_20,
    output wor id_21,
    output uwire id_22,
    input uwire id_23
    , id_29,
    input wire id_24,
    output uwire id_25,
    input supply1 id_26
);
  tri1 id_30 = id_16;
  wire id_31;
endmodule
module module_1 (
    input wor id_0,
    output supply1 id_1,
    input tri0 id_2,
    output wand id_3
    , id_6,
    input wire id_4
);
  reg id_7;
  initial id_6 = 1 == 1'h0;
  always @(posedge id_6)
    if (id_4) id_7 <= 1'd0;
    else begin : LABEL_0
      #1;
      #1;
      id_6 <= id_7;
    end
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_0,
      id_4,
      id_0,
      id_2,
      id_4,
      id_3,
      id_2,
      id_4,
      id_0,
      id_2,
      id_1,
      id_2,
      id_2,
      id_3,
      id_0,
      id_1,
      id_3,
      id_3,
      id_4,
      id_2,
      id_3,
      id_0
  );
  assign modCall_1.id_8 = 0;
endmodule
