// Seed: 836672512
module module_0 (
    input tri id_0,
    input wor id_1,
    output wor id_2,
    input uwire id_3,
    input tri0 id_4,
    input wor id_5,
    input tri1 id_6,
    input supply1 id_7
);
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input wire id_1,
    input wand id_2,
    input supply1 id_3,
    output wand id_4,
    input tri id_5,
    input uwire id_6,
    input supply1 id_7,
    output tri1 id_8,
    input supply0 id_9
);
  always #1 begin : LABEL_0
    id_8 = 1;
  end
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_0,
      id_9,
      id_7,
      id_1,
      id_6,
      id_6
  );
endmodule
