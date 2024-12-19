// Seed: 1962878937
macromodule module_0 (
    output supply1 id_0,
    output supply1 id_1,
    output tri0 id_2,
    input wand id_3,
    input tri1 id_4,
    input wor id_5,
    input tri0 id_6,
    output tri0 id_7,
    input tri0 id_8,
    input wand id_9,
    input wire id_10,
    output supply1 id_11,
    input wand id_12
    , id_16,
    input uwire id_13
    , id_17,
    input tri id_14
);
  logic [7:0] id_18;
  assign id_0 = id_6;
  uwire id_19;
  wand  id_20;
  assign id_17 = id_19 - ~id_18[1];
  assign id_20 = id_5;
  assign id_1  = id_4;
  wire id_21;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output supply1 id_0
);
  assign id_0 = id_2;
  assign id_2 = id_2;
  pullup (id_0, 1);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2
  );
endmodule
