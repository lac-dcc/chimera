// Seed: 1799589025
module module_0 (
    output supply0 id_0,
    input wand id_1,
    input supply0 id_2
    , id_19,
    input wor id_3,
    input tri id_4,
    output tri id_5,
    input wor id_6,
    input tri1 id_7,
    output wire id_8,
    output wire id_9,
    output wor id_10,
    input uwire id_11,
    output supply0 id_12,
    input supply0 id_13,
    input wor id_14,
    output supply1 id_15,
    input tri id_16,
    output supply0 id_17
);
  initial begin : LABEL_0
    disable id_20;
    if ("") id_9 = id_3 - id_16;
  end
endmodule
module module_1 (
    input wire id_0,
    input supply0 id_1,
    output tri1 id_2
);
  assign id_2 = id_1 - 1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_1,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.type_1 = 0;
endmodule
