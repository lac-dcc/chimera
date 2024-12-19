// Seed: 4058906186
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    output uwire id_2,
    input wand id_3,
    output tri1 id_4,
    output tri1 id_5,
    output supply0 id_6,
    input uwire id_7,
    input tri id_8,
    output wand id_9
);
  wire id_11;
  wire id_12;
  wire id_13;
  wire id_14;
  wire id_15;
  initial
    forever begin : LABEL_0
      id_16(1);
    end
endmodule
module module_1 (
    input wand id_0,
    input wire id_1,
    output wand id_2,
    output supply1 id_3,
    output wand id_4,
    input tri id_5,
    input tri1 id_6,
    output wor id_7
);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_0,
      id_3,
      id_4,
      id_7,
      id_6,
      id_6,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
