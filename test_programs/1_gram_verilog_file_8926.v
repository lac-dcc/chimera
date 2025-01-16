// Seed: 1617424535
module module_0 (
    input tri id_0,
    output wor id_1,
    input uwire id_2,
    input supply0 id_3,
    output tri id_4,
    input tri id_5,
    output wand id_6,
    input wand id_7,
    input wor id_8,
    input uwire id_9,
    output wand id_10,
    input tri0 id_11,
    input wor id_12,
    output supply1 id_13,
    input tri0 id_14,
    id_19,
    input wand id_15,
    input uwire id_16,
    output wand id_17
);
  assign module_1.type_0 = 0;
  wire id_20, id_21;
endmodule
module module_1 (
    input tri0 void id_0,
    input tri id_1
);
  always
    wait (id_0 + id_1 || id_0 & id_1) begin : LABEL_0
      id_3 <= -1;
    end
  assign id_4 = id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1,
      id_4,
      id_0,
      id_4,
      id_1,
      id_1,
      id_4,
      id_0,
      id_0,
      id_4,
      id_4
  );
  wire id_5;
  assign id_4 = 1;
  assign id_4 = 1;
endmodule
