// Seed: 4226078178
module module_0 (
    input wire id_0,
    output tri id_1,
    input tri id_2,
    input uwire id_3,
    input wor id_4,
    output wor id_5,
    output tri id_6,
    input uwire id_7,
    output wand id_8,
    input wire id_9,
    output tri1 id_10,
    output tri0 id_11,
    input wire id_12,
    input tri id_13,
    output tri0 id_14,
    input tri id_15,
    output uwire id_16
    , id_25,
    input tri1 id_17,
    output tri0 id_18,
    input wor id_19,
    output tri1 id_20,
    output supply1 id_21,
    input uwire id_22,
    output wor id_23
);
  assign #id_26 id_23 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    input supply1 id_1,
    output tri id_2,
    output tri id_3,
    input uwire id_4,
    input wire id_5,
    output wor id_6,
    input wire id_7,
    input supply1 id_8,
    output tri0 id_9,
    input wand id_10,
    output wire id_11,
    input uwire id_12,
    input wor id_13,
    input uwire id_14,
    input wand id_15
);
  wire id_17;
  module_0 modCall_1 (
      id_4,
      id_11,
      id_13,
      id_5,
      id_1,
      id_9,
      id_0,
      id_12,
      id_2,
      id_7,
      id_9,
      id_9,
      id_10,
      id_12,
      id_0,
      id_12,
      id_2,
      id_7,
      id_0,
      id_4,
      id_2,
      id_3,
      id_15,
      id_6
  );
  assign modCall_1.type_33 = 0;
  integer id_18;
  always @(*) begin : LABEL_0
    #1 id_0 = 1;
  end
endmodule
