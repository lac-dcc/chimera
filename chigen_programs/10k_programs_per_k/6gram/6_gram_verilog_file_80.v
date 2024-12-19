// Seed: 1830961714
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    output wor id_2,
    input supply1 id_3,
    output supply1 id_4,
    input tri id_5,
    input supply1 id_6,
    input wor id_7,
    input tri id_8
    , id_26,
    output tri1 id_9,
    input tri1 id_10,
    input tri id_11,
    output tri id_12,
    input tri1 id_13,
    output uwire id_14,
    output tri id_15,
    input tri id_16,
    output tri id_17,
    output uwire id_18,
    input supply1 id_19,
    output tri0 id_20,
    input wand id_21,
    output uwire id_22,
    input supply1 id_23,
    output wire id_24
);
  assign id_4 = 1'h0;
  initial begin : LABEL_0
    disable id_27;
    $display(id_13, id_5 - id_8);
  end
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    input tri id_2,
    output wand id_3,
    input supply0 id_4,
    input supply0 id_5,
    input supply1 id_6,
    output supply0 id_7
);
  assign id_3 = 1 ? ~id_1 : 1;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_3,
      id_0,
      id_3,
      id_4,
      id_5,
      id_6,
      id_6,
      id_3,
      id_0,
      id_5,
      id_3,
      id_6,
      id_3,
      id_7,
      id_0,
      id_7,
      id_3,
      id_6,
      id_7,
      id_6,
      id_7,
      id_4,
      id_7
  );
  assign modCall_1.type_9 = 0;
endmodule
