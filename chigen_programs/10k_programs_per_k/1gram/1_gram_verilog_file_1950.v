// Seed: 724381226
module module_0 (
    output tri0 id_0,
    input tri id_1,
    output uwire id_2,
    input tri id_3,
    output wire id_4,
    output tri0 id_5,
    output tri1 id_6,
    output wire id_7,
    input tri1 id_8,
    input supply1 id_9,
    input tri0 id_10,
    input wor id_11,
    output wire id_12,
    input wand id_13,
    input tri0 id_14
);
  wire id_16;
  wire id_17, id_18, id_19;
  assign id_2 = id_11;
  wire id_20;
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    inout wor id_2,
    input tri0 id_3,
    output uwire id_4,
    output tri id_5,
    input wor id_6,
    input uwire id_7,
    input wor id_8
);
  assign id_5 = id_0;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_8,
      id_5,
      id_5,
      id_5,
      id_2,
      id_3,
      id_2,
      id_8,
      id_0,
      id_5,
      id_1,
      id_3
  );
  assign modCall_1.type_25 = 0;
  assign id_2 = 1;
  id_10(
      id_6, 1, id_8, 1, 1
  );
endmodule : SymbolIdentifier
