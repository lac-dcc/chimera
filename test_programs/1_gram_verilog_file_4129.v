// Seed: 2030089403
module module_0 (
    output wire id_0#(.id_33(1)),
    input tri1 id_1,
    input tri1 id_2,
    input wand id_3,
    id_34,
    input tri1 id_4,
    input tri id_5,
    input tri id_6,
    output supply0 id_7,
    input wand id_8,
    output supply0 id_9,
    input wor id_10,
    input tri id_11,
    output wand id_12,
    input supply0 id_13,
    input wor id_14,
    output wor id_15,
    output wand id_16,
    input wor id_17,
    input tri id_18,
    input supply1 id_19,
    input tri1 id_20,
    output wire id_21,
    input tri1 id_22,
    output uwire id_23,
    id_35,
    output uwire id_24,
    output tri0 id_25,
    input tri1 id_26,
    output tri0 id_27,
    input supply0 id_28,
    output tri id_29,
    output uwire id_30,
    input uwire id_31
);
  wire id_36;
  wand id_37 = -1;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    output tri0 id_1,
    output uwire id_2,
    input supply0 id_3,
    input tri1 id_4,
    output uwire id_5,
    output wor id_6,
    input wor id_7,
    input wire id_8,
    input tri0 id_9,
    input wire id_10,
    input tri0 id_11,
    input supply1 id_12
);
  wire id_14;
  id_15(
      .id_0(id_8), .id_1(1)
  );
  module_0 modCall_1 (
      id_0,
      id_11,
      id_4,
      id_4,
      id_9,
      id_4,
      id_7,
      id_5,
      id_4,
      id_5,
      id_9,
      id_7,
      id_6,
      id_12,
      id_8,
      id_1,
      id_0,
      id_3,
      id_4,
      id_7,
      id_10,
      id_2,
      id_10,
      id_2,
      id_0,
      id_0,
      id_9,
      id_5,
      id_4,
      id_5,
      id_6,
      id_9
  );
  wire id_16;
  xor primCall (id_1, id_9, id_12, id_10, id_11, id_14, id_4, id_8, id_15, id_7, id_3);
  assign (pull0, strong1) id_1 = -1;
endmodule : SymbolIdentifier
