// Seed: 2626922211
module module_0 (
    output wand id_0,
    input tri1 id_1,
    input tri1 id_2,
    output uwire id_3,
    output tri1 id_4,
    output wor id_5,
    output tri0 id_6,
    output supply1 id_7,
    input wor id_8,
    input wor id_9,
    input tri id_10,
    input wire id_11,
    input wor id_12,
    input wor id_13,
    output supply1 id_14,
    input wor id_15,
    input uwire id_16,
    input wor id_17,
    input tri id_18
);
  assign id_5 = id_11;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input tri1 id_1,
    input wand id_2,
    output supply0 id_3,
    output uwire id_4,
    input wand id_5,
    output tri1 id_6,
    input uwire id_7,
    input supply1 id_8
);
  initial begin : LABEL_0
    id_4 = id_5;
  end
  wire id_10;
  assign id_4 = 1;
  assign id_3 = id_7;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_6,
      id_4,
      id_0,
      id_6,
      id_4,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_4,
      id_2,
      id_7,
      id_2,
      id_7
  );
endmodule
