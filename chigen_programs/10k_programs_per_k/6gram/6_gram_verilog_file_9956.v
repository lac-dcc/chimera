// Seed: 1512910445
module module_0 (
    output supply1 id_0,
    input tri1 id_1,
    input tri0 id_2,
    output wire id_3,
    output wand id_4,
    input tri id_5
    , id_35,
    output wire id_6,
    output wor id_7,
    output supply0 id_8,
    input tri id_9,
    input supply1 id_10,
    input wire id_11,
    input tri1 id_12,
    input uwire id_13,
    input wand id_14,
    input supply0 id_15,
    input tri0 id_16,
    input tri id_17,
    input tri1 id_18,
    output supply1 id_19,
    input wor id_20
    , id_36,
    input wire id_21,
    output supply0 id_22,
    input uwire id_23,
    input tri id_24,
    input tri1 id_25,
    output wor id_26,
    input uwire id_27,
    input tri0 id_28,
    input tri id_29,
    input wand id_30,
    input supply1 id_31,
    output tri1 id_32,
    output tri id_33
);
  always @(*) begin : LABEL_0
    assume #1  (id_15) $display(~(1));
  end
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    input wor id_0,
    input wire id_1,
    output uwire id_2,
    inout supply1 id_3,
    output wor id_4,
    input tri1 id_5,
    input tri1 id_6
    , id_9,
    output supply0 id_7
);
  assign id_4 = id_0;
  wire id_10;
  supply0 id_11, id_12, id_13, id_14;
  module_0 modCall_1 (
      id_7,
      id_3,
      id_5,
      id_12,
      id_4,
      id_11,
      id_13,
      id_13,
      id_3,
      id_14,
      id_12,
      id_14,
      id_3,
      id_13,
      id_11,
      id_3,
      id_5,
      id_1,
      id_13,
      id_2,
      id_0,
      id_12,
      id_12,
      id_6,
      id_3,
      id_11,
      id_11,
      id_1,
      id_1,
      id_1,
      id_3,
      id_12,
      id_7,
      id_11
  );
  assign id_11 = id_1;
endmodule
