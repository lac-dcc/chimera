// Seed: 2575578320
module module_0 (
    input wand id_0,
    output tri1 id_1,
    input supply1 id_2,
    output tri1 id_3,
    input uwire id_4,
    input supply1 id_5,
    input wand id_6,
    input uwire id_7,
    output tri0 id_8,
    output tri1 id_9,
    output wor id_10,
    input tri id_11,
    input tri1 id_12
);
  tri0 id_14 = 1;
  wire id_15;
  wor  id_16 = 1;
  wire id_17;
  wire id_18, id_19;
  wire id_20;
  wire id_21;
  assign id_10 = 1;
  wire id_22;
  wire id_23;
  wire id_24;
  assign module_1.id_5 = 0;
endmodule
macromodule module_1 (
    output tri0 id_0,
    output tri  id_1,
    input  wor  id_2,
    input  wand id_3,
    output tri  id_4,
    input  wor  id_5
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_2,
      id_3,
      id_3,
      id_5,
      id_1,
      id_1,
      id_4,
      id_3,
      id_2
  );
endmodule
