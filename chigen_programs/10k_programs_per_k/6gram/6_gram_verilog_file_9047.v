// Seed: 980075508
module module_0 (
    input wor id_0,
    output wire id_1,
    output wand id_2,
    input wire id_3,
    input tri0 id_4,
    input supply0 id_5,
    output tri id_6,
    input supply1 id_7,
    output tri0 id_8,
    input tri1 id_9,
    input tri id_10,
    output supply1 id_11,
    input tri id_12,
    output wor id_13,
    output supply1 id_14,
    input wand id_15,
    input wor id_16,
    output wor id_17,
    input tri0 id_18
    , id_37,
    output tri1 id_19,
    output tri1 id_20,
    input supply1 id_21,
    input supply0 id_22,
    input wand id_23,
    output tri1 id_24,
    output supply1 id_25,
    input wand id_26
    , id_38,
    output uwire id_27,
    input supply0 id_28,
    output uwire id_29,
    input tri1 id_30,
    input wire id_31,
    output tri0 id_32,
    input uwire id_33,
    input tri0 id_34,
    input supply0 id_35
    , id_39
);
  wire id_40;
  wand id_41 = 1'h0;
endmodule
module module_1 (
    output supply0 id_0,
    input supply1 id_1,
    output wor id_2,
    input wor id_3,
    input uwire id_4,
    output wor id_5,
    input tri1 id_6,
    output wand id_7,
    output supply0 id_8
);
  nand primCall (id_7, id_10, id_3, id_4, id_1, id_6);
  wire id_10;
  always @(posedge ~id_3 or 1) begin : LABEL_0
    if (id_4) assert (({id_1{1'h0}}));
  end
  module_0 modCall_1 (
      id_6,
      id_5,
      id_7,
      id_1,
      id_4,
      id_1,
      id_0,
      id_1,
      id_7,
      id_1,
      id_1,
      id_2,
      id_3,
      id_2,
      id_8,
      id_3,
      id_3,
      id_2,
      id_3,
      id_7,
      id_5,
      id_1,
      id_1,
      id_3,
      id_8,
      id_8,
      id_4,
      id_7,
      id_3,
      id_5,
      id_1,
      id_6,
      id_8,
      id_1,
      id_4,
      id_3
  );
  assign modCall_1.type_56 = 0;
endmodule
