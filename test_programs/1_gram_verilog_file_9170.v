// Seed: 181111087
module module_0 (
    input wire id_0,
    input uwire id_1,
    input uwire id_2,
    input supply1 id_3,
    output supply1 id_4,
    input wand id_5,
    input supply1 id_6,
    input wand id_7,
    input tri0 id_8,
    id_13 = -1'b0,
    input wor id_9,
    input tri1 id_10,
    input uwire id_11
);
  assign id_4 = id_11;
endmodule : SymbolIdentifier
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    input wand id_2,
    output supply1 id_3,
    output wor id_4,
    input wire id_5,
    output wire id_6
);
  assign id_4 = id_5 ? -1 : -1 - id_1;
  always id_3 = 1 - id_2 | (-1);
  wire id_8;
  wire id_9, id_10;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_1,
      id_1,
      id_4,
      id_5,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_3 = 0;
  localparam id_11 = 1;
endmodule
