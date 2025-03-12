// Seed: 1709968194
module module_0 (
    input supply0 id_0,
    input wand id_1,
    output tri1 id_2,
    input tri0 id_3,
    output supply1 id_4,
    input supply1 id_5,
    output wire id_6,
    input supply1 id_7,
    input tri0 id_8,
    output supply0 id_9,
    input tri0 id_10,
    input tri id_11,
    input supply0 id_12,
    input tri id_13,
    output wand id_14,
    input tri1 id_15,
    output tri0 id_16,
    output supply0 id_17
    , id_23,
    input uwire id_18,
    output uwire id_19,
    output wand id_20,
    input supply0 id_21
);
  assign id_16 = id_3;
endmodule
module module_1 (
    input wire id_0,
    output wire id_1,
    input tri id_2,
    input supply0 id_3,
    input supply0 id_4,
    input supply0 id_5,
    input supply0 id_6,
    output supply1 id_7
);
  wire id_9;
  xnor primCall (id_1, id_9, id_3, id_0, id_6, id_5);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_0,
      id_7,
      id_3,
      id_7,
      id_6,
      id_3,
      id_7,
      id_4,
      id_0,
      id_5,
      id_6,
      id_1,
      id_0,
      id_7,
      id_7,
      id_4,
      id_7,
      id_7,
      id_2
  );
  assign id_1#(.id_4(1)) = id_4;
endmodule
