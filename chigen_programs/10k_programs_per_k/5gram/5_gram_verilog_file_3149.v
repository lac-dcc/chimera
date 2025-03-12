// Seed: 1709801388
module module_0 (
    input wire id_0,
    input tri1 id_1,
    input tri1 id_2,
    input uwire id_3,
    output uwire id_4,
    output tri0 id_5,
    input tri1 id_6,
    input supply1 id_7,
    output tri id_8,
    output wor id_9,
    output tri id_10,
    output tri id_11,
    input tri1 id_12
    , id_18,
    input wand id_13,
    input tri1 id_14,
    input tri0 id_15,
    output supply0 id_16
);
  logic id_19;
  always @(1'h0 or id_12) id_18 = 1;
endmodule
module module_1 (
    input wor id_0,
    input wand id_1,
    input tri id_2,
    output supply0 id_3,
    input wand id_4
);
  assign id_3 = id_1;
  xor primCall (id_3, id_1, id_4, id_0, id_2);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_4,
      id_3,
      id_3,
      id_0,
      id_4,
      id_3,
      id_3,
      id_3,
      id_3,
      id_4,
      id_0,
      id_0,
      id_4,
      id_3
  );
  assign modCall_1.id_0 = 0;
endmodule
