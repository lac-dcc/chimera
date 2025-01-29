// Seed: 227802038
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    input wire id_2,
    input wire id_3,
    input wire id_4,
    input wand id_5,
    output uwire id_6,
    input wire id_7,
    input supply1 id_8,
    input tri1 id_9,
    input tri id_10,
    input supply1 id_11,
    input wor id_12,
    input wor id_13,
    input tri1 id_14,
    input wand id_15,
    input tri id_16,
    input supply0 id_17,
    output tri1 id_18
);
  assign id_18 = id_11 | -1'b0;
  assign id_18 = id_4;
endmodule : SymbolIdentifier
module module_1 (
    output wire id_0,
    input tri0 id_1,
    inout supply0 id_2,
    input wire id_3,
    output wire id_4,
    input wire id_5,
    input tri0 id_6,
    input wor id_7
);
  tri0 id_9;
  parameter id_10 = id_9;
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_6,
      id_6,
      id_1,
      id_0,
      id_7,
      id_2,
      id_5,
      id_2,
      id_7,
      id_5,
      id_2,
      id_3,
      id_3,
      id_2,
      id_6,
      id_0
  );
  assign modCall_1.id_17 = 0;
endmodule
