// Seed: 981154797
module module_0 (
    output supply0 id_0,
    output supply1 id_1,
    output tri id_2,
    output wire id_3,
    output supply0 id_4,
    output wor id_5,
    input tri0 id_6,
    input tri1 id_7,
    output wor module_0,
    input supply1 id_9,
    input wor id_10,
    output tri id_11,
    output uwire id_12,
    output tri0 id_13,
    output wand id_14,
    input tri0 id_15,
    input wand id_16
);
  wire id_18;
endmodule
module module_1 (
    input tri0 id_0,
    output wor id_1,
    input supply1 id_2,
    output tri id_3,
    inout tri0 id_4,
    output wor id_5
);
  assign {id_0 * 1 * 1'd0, -1} = id_2;
  bit id_7 = id_4;
  initial begin : LABEL_0
    id_7 <= id_0;
  end
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_3,
      id_5,
      id_3,
      id_4,
      id_0,
      id_5,
      id_4,
      id_0,
      id_4,
      id_4,
      id_4,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.id_10 = 0;
endmodule
