// Seed: 2071218279
module module_0 (
    input uwire id_0,
    input wor id_1,
    input wor id_2,
    input tri1 id_3,
    input uwire id_4,
    input tri id_5,
    input supply1 id_6,
    input supply1 id_7,
    input tri id_8,
    input wor id_9,
    input tri id_10,
    input tri1 id_11
    , id_14,
    input tri1 id_12
);
  assign id_14 = 1'b0;
  assign module_1.type_0 = 0;
  wire id_15;
  wor id_16;
  wire id_17;
  supply1 id_18;
  assign id_18 = id_10 == id_16 && 1 && id_0;
  assign id_14 = 1;
  wire id_19;
  wire id_20;
  wire id_21;
  wire id_22;
endmodule
module module_1 (
    output supply1 id_0,
    input tri1 id_1,
    output supply1 id_2,
    input wand id_3,
    input wor id_4,
    input tri id_5,
    input tri id_6,
    input supply0 id_7,
    output tri id_8,
    input uwire id_9,
    input wor id_10,
    input wire id_11,
    output wand id_12
    , id_15,
    output wand id_13
);
  always force id_8 = 1;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_4,
      id_4,
      id_9,
      id_4,
      id_7,
      id_4,
      id_1,
      id_5,
      id_9,
      id_7,
      id_7
  );
endmodule
