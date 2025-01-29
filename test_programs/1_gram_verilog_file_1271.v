// Seed: 582891013
module module_0 #(
    parameter id_20 = 32'd76
) (
    output wand id_0,
    input wand id_1,
    id_17,
    id_18,
    output wor id_2,
    input supply0 id_3,
    output tri1 id_4,
    input supply1 id_5,
    output wire id_6,
    output wor id_7,
    input tri0 id_8,
    input uwire id_9,
    input wor id_10,
    input uwire id_11,
    output wor id_12,
    output supply1 id_13,
    input supply0 id_14,
    output wor id_15
);
  wire id_19;
  defparam id_20 = id_17;
endmodule
module module_1 (
    output supply1 id_0,
    input supply1 id_1,
    input supply1 id_2,
    output uwire id_3,
    output tri0 id_4,
    output wor id_5,
    input tri id_6
);
  assign #1 id_3 = id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_2,
      id_5,
      id_2,
      id_5,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_4,
      id_0,
      id_1,
      id_5
  );
  assign modCall_1.id_7 = 0;
  parameter id_8 = "";
  wire id_9, id_10, id_11, id_12;
  localparam id_13 = -1;
  assign id_10 = id_12;
endmodule : SymbolIdentifier
