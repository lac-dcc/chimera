// Seed: 508184642
module module_0 (
    input uwire id_0,
    input wand id_1,
    output supply0 id_2,
    input tri0 id_3,
    input wor id_4,
    input wand id_5,
    input tri0 id_6
    , id_17,
    input supply1 id_7,
    input tri1 id_8,
    input wor id_9,
    input tri1 id_10,
    output wire id_11,
    output supply0 id_12,
    input uwire id_13,
    input supply0 id_14,
    output uwire id_15
);
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    input wor id_2,
    input wor id_3,
    output wor id_4
);
  wire id_6;
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_3,
      id_1,
      id_1,
      id_2,
      id_3,
      id_3,
      id_0,
      id_4,
      id_4,
      id_3,
      id_2,
      id_4
  );
  assign modCall_1.id_10 = 0;
  wire id_9;
  assign id_7 = id_7;
  assign id_4 = (-1'b0) ? 1 : -1;
  xnor primCall (id_4, id_3, id_0, id_1);
endmodule
