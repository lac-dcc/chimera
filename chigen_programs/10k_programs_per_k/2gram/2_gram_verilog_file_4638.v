// Seed: 1979898061
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    output tri id_2,
    input tri0 id_3,
    input wor id_4,
    output wire id_5,
    output tri1 id_6,
    input wand id_7,
    input tri0 id_8,
    output tri id_9
    , id_13,
    output wire id_10,
    output tri0 id_11
);
  assign id_6 = id_13;
  wire id_14;
  tri1 id_15;
  id_16(
      .id_0(), .id_1(id_7)
  );
  wire id_17;
  wire id_18;
  assign id_15 = id_8;
endmodule
module module_1 (
    input tri0 id_0,
    output uwire id_1,
    input tri id_2,
    input wand id_3,
    input wire id_4,
    output supply0 id_5,
    input uwire id_6,
    output wire id_7,
    input supply0 id_8,
    input supply1 id_9,
    input tri0 id_10,
    input tri1 id_11,
    output wand id_12,
    input uwire id_13,
    input logic id_14,
    output wand id_15,
    input uwire id_16,
    output tri id_17,
    input wor id_18
    , id_28,
    input uwire id_19,
    output supply1 id_20,
    output wand id_21,
    output wor id_22,
    input supply0 id_23,
    input uwire id_24,
    input supply0 id_25,
    output tri id_26
);
  always begin : LABEL_0
    if (id_18 - id_14) id_28 <= id_14;
  end
  module_0 modCall_1 (
      id_22,
      id_25,
      id_12,
      id_18,
      id_6,
      id_21,
      id_17,
      id_23,
      id_18,
      id_26,
      id_17,
      id_7
  );
  assign modCall_1.type_5 = 0;
endmodule
