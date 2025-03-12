// Seed: 1246992344
program module_0 (
    output wand id_0,
    output uwire id_1,
    input tri id_2
    , id_14,
    input wor id_3,
    input tri id_4,
    input supply1 id_5,
    input supply1 id_6,
    input wire id_7
    , id_15,
    input supply0 id_8,
    output tri1 id_9,
    input uwire id_10,
    output tri1 id_11,
    input tri0 id_12
);
  assign id_14 = -1'd0;
endprogram
module module_1 (
    output tri1 id_0,
    input wire id_1,
    input uwire id_2,
    output wire id_3,
    output wire id_4,
    input supply1 id_5,
    input tri1 id_6,
    output tri1 id_7,
    output tri0 id_8,
    output supply1 id_9
);
  assign id_8 = id_2;
  module_0 modCall_1 (
      id_7,
      id_0,
      id_5,
      id_1,
      id_5,
      id_6,
      id_1,
      id_1,
      id_2,
      id_9,
      id_1,
      id_3,
      id_6
  );
  assign modCall_1.id_1 = 0;
endmodule
