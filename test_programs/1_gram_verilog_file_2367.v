// Seed: 2494002670
module module_0 (
    id_1
);
  output wire id_1;
  always id_1 <= -1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
  or primCall (id_3, id_4, id_2, id_1);
  module_0 modCall_1 (id_4);
  assign modCall_1.id_1 = 0;
  always id_4 <= 1;
endmodule
module module_2 (
    input wand id_0,
    output supply0 id_1,
    output supply0 id_2,
    input tri id_3,
    output wand id_4,
    input supply1 id_5,
    output wor id_6,
    output wire id_7,
    input tri id_8,
    input uwire id_9,
    input wor id_10,
    input wand id_11,
    output tri0 id_12,
    output wor id_13,
    input tri0 id_14,
    output tri1 id_15,
    output wire id_16,
    output wand void id_17
);
  wire id_19;
  assign id_1 = id_8;
  assign id_2 = id_5;
  assign id_16 = 1;
  assign module_3.id_4 = 0;
  assign id_2 = id_11;
  wire id_20;
endmodule
module module_3 (
    input supply0 id_0,
    input wand id_1,
    output wire id_2,
    id_9,
    output tri0 id_3,
    output wand id_4,
    input tri0 id_5,
    output tri id_6,
    input wire id_7
);
  assign id_6 = (id_1);
  module_2 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_0,
      id_3,
      id_5,
      id_6,
      id_6,
      id_0,
      id_0,
      id_1,
      id_0,
      id_2,
      id_6,
      id_1,
      id_6,
      id_2,
      id_4
  );
endmodule : SymbolIdentifier
