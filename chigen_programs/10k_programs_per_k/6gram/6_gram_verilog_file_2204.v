// Seed: 2713182096
module module_0 (
    output wand id_0,
    input tri0 id_1,
    input wand id_2,
    input supply0 id_3,
    input wor id_4,
    output wor id_5
);
  initial begin : LABEL_0
    fork
      #1 id_5 = 1;
      $display;
    join_any
    id_0 = 1;
  end
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    input supply1 id_2,
    input tri1 id_3,
    output tri id_4,
    input wor id_5,
    input tri id_6,
    output supply1 id_7,
    input wor id_8,
    output tri1 id_9,
    output wor id_10,
    input supply0 id_11,
    input supply0 id_12,
    input tri1 id_13,
    output wor id_14,
    input tri1 id_15,
    input tri0 id_16,
    output wor id_17,
    input wor id_18,
    output uwire id_19
);
  assign id_9 = 1;
  module_0 modCall_1 (
      id_14,
      id_1,
      id_2,
      id_13,
      id_6,
      id_19
  );
endmodule
