// Seed: 2512894302
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    input uwire id_2,
    input supply1 id_3,
    input tri0 id_4,
    input wand id_5,
    input wor id_6,
    output tri0 id_7,
    output tri0 id_8,
    input tri0 id_9,
    input tri0 id_10,
    output wand id_11,
    input tri1 id_12,
    output uwire id_13,
    output tri0 id_14,
    input tri0 id_15,
    input tri1 id_16,
    output uwire id_17,
    input uwire id_18,
    output wand id_19
);
  always #0 begin : LABEL_0
    #1;
  end
endmodule
module module_1 (
    input tri0 id_0,
    input wor id_1,
    output supply1 id_2
);
  wire id_4, id_5;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_2,
      id_2,
      id_0,
      id_1,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_1,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.id_8 = 0;
endmodule
