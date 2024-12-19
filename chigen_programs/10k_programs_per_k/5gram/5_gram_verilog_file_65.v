// Seed: 1259264572
module module_0 (
    input wand id_0,
    input uwire id_1,
    input tri1 id_2,
    output wand id_3,
    output wor id_4,
    input tri1 id_5,
    input supply1 id_6,
    output supply0 id_7,
    output tri1 id_8,
    input wire id_9
);
  initial begin : LABEL_0
    id_3 = 1;
  end
endmodule
module module_1 (
    input supply0 id_0,
    output wire id_1,
    input tri0 id_2,
    input tri1 id_3,
    input wand id_4,
    input supply1 id_5,
    output tri1 id_6,
    input wor id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_1,
      id_6,
      id_3,
      id_5,
      id_1,
      id_6,
      id_2
  );
  assign modCall_1.id_3 = 0;
  wire id_10;
endmodule
