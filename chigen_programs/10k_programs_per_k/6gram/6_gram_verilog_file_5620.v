// Seed: 2011581344
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input uwire id_2,
    input uwire id_3,
    output wor id_4,
    output wor id_5,
    input uwire id_6,
    output uwire id_7
    , id_20,
    input tri id_8,
    input tri id_9,
    output supply1 id_10,
    input wire id_11,
    input wire id_12,
    input tri1 id_13,
    input supply1 id_14,
    input tri1 id_15,
    input tri id_16,
    input tri id_17,
    output wand id_18
);
  assign id_20 = 1;
  wire id_21;
  always @(1 or posedge 1) $display;
endmodule
module module_1 (
    input tri id_0,
    output wor id_1,
    input supply0 id_2,
    input supply1 id_3,
    input supply1 id_4,
    input wand id_5,
    input supply1 id_6
    , id_10,
    output tri1 id_7,
    input tri id_8
);
  logic [7:0] id_11;
  wand id_12;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_8,
      id_4,
      id_1,
      id_12,
      id_4,
      id_7,
      id_5,
      id_0,
      id_12,
      id_5,
      id_4,
      id_6,
      id_2,
      id_0,
      id_4,
      id_4,
      id_7
  );
  assign modCall_1.id_8 = 0;
  assign id_11[1] = id_5 == 1;
  always @((1)) id_12 = id_0;
endmodule
