// Seed: 62216104
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    input wor id_2,
    input uwire id_3,
    output wand id_4,
    output wire id_5,
    input wire id_6,
    input wand id_7,
    input supply0 id_8
);
  supply1 id_10 = 1;
  assign id_10 = id_1;
  supply0 id_11, id_12, id_13, id_14 = 1 * id_1, id_15, id_16, id_17, id_18;
  assign id_16 = id_3;
  wire id_19;
  wire id_20, id_21;
  wire id_22, id_23;
  assign id_12 = id_12;
  wire id_25;
  wire id_26;
endmodule
module module_1 (
    input wire id_0,
    output wor id_1,
    input supply0 id_2,
    output wand id_3,
    output tri id_4,
    input uwire id_5,
    output uwire id_6,
    output wor id_7,
    input supply1 id_8,
    output wand id_9
);
  assign id_6 = 1'b0;
  supply1 id_11, id_12, id_13;
  wire id_14;
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_12,
      id_12,
      id_12,
      id_9,
      id_4,
      id_0,
      id_5,
      id_12
  );
  assign modCall_1.type_28 = 0;
  assign id_6 = id_11;
endmodule
