// Seed: 447554326
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    output wor id_2,
    output tri1 id_3,
    input uwire id_4
);
  wire id_6;
  wire id_7;
  wire id_8;
  assign id_2 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    input wand id_2,
    output tri1 id_3,
    output uwire id_4,
    input tri0 id_5,
    input wor id_6,
    output tri0 id_7,
    output supply0 id_8,
    output supply1 id_9,
    output uwire id_10,
    input wand id_11,
    input wor id_12,
    input tri0 id_13,
    input wand id_14,
    output wire id_15,
    input uwire id_16
);
  uwire id_18 = id_12;
  id_19 :
  assert property (@(negedge id_16 or 1) 1)
  else;
  module_0 modCall_1 (
      id_0,
      id_19,
      id_7,
      id_9,
      id_1
  );
endmodule : SymbolIdentifier
