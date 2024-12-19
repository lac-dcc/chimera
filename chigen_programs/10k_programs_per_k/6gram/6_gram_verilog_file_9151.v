// Seed: 1823048571
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    output tri id_2,
    output supply1 id_3,
    input wand id_4,
    output supply1 id_5,
    output supply0 id_6,
    input wor id_7,
    input wor id_8,
    input tri1 id_9,
    output tri id_10,
    output wand id_11,
    output supply1 id_12,
    input wand id_13,
    output wire id_14,
    output wand id_15
);
  assign id_12 = 1;
endmodule
module module_1 (
    input wand id_0,
    output wand id_1,
    input tri id_2,
    input tri1 id_3,
    input supply0 id_4,
    inout tri1 id_5
);
  initial begin : LABEL_0
    ;
    if (id_3 && 1) begin : LABEL_0
      wait (1);
    end
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_5,
      id_4,
      id_2,
      id_5,
      id_5,
      id_1,
      id_1,
      id_3,
      id_5,
      id_5
  );
  assign modCall_1.id_0 = 0;
endmodule
