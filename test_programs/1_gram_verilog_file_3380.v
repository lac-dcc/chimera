// Seed: 3572336686
module module_0 (
    input tri id_0,
    input wand id_1,
    input supply0 id_2,
    input tri1 id_3#(.id_25(-1'h0)),
    input wire id_4,
    input supply1 id_5,
    input wire id_6,
    output supply1 id_7,
    input wand id_8,
    input wor id_9,
    output wire id_10,
    output wire id_11,
    input tri0 id_12,
    input supply1 id_13,
    input supply0 id_14,
    output tri1 id_15,
    input supply1 id_16,
    input tri0 id_17,
    output tri id_18,
    input tri id_19,
    input supply0 id_20,
    input uwire id_21,
    input uwire id_22,
    output uwire id_23
);
  wire id_26;
  assign id_23 = id_5;
  assign module_1.id_7 = 0;
endmodule : SymbolIdentifier
module module_1 (
    output supply0 id_0,
    output supply1 id_1,
    output logic id_2,
    input tri0 id_3,
    input tri id_4,
    input supply0 id_5,
    input logic id_6,
    input supply0 id_7,
    input supply0 id_8
);
  wire id_10;
  wand id_11, id_12;
  always id_2 <= 1;
  assign id_2 = id_6;
  wire id_13;
  wire id_14;
  xor primCall (id_0, id_8, id_14, id_13, id_4, id_12, id_11, id_3);
  module_0 modCall_1 (
      id_7,
      id_3,
      id_5,
      id_8,
      id_4,
      id_8,
      id_5,
      id_1,
      id_3,
      id_5,
      id_0,
      id_0,
      id_3,
      id_5,
      id_8,
      id_0,
      id_5,
      id_4,
      id_0,
      id_3,
      id_8,
      id_7,
      id_5,
      id_0
  );
  assign id_11 = -1;
  wire id_15;
endmodule : SymbolIdentifier
