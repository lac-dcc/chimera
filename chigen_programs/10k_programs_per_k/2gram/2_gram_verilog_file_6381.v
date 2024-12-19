// Seed: 3783154269
module module_0 (
    input wor id_0,
    input wor id_1,
    output wand id_2,
    input uwire id_3,
    output supply1 id_4,
    input tri1 id_5,
    input wor id_6,
    input tri0 id_7,
    output supply1 id_8,
    input wor id_9,
    output supply1 id_10,
    input tri0 id_11
);
  always begin : LABEL_0
    id_8 = 1 * 1 ? 1 : id_11;
  end
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output wire id_0,
    output wand id_1,
    input supply1 id_2,
    output wand id_3
);
  assign id_1 = 1'b0;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_1,
      id_2
  );
endmodule
