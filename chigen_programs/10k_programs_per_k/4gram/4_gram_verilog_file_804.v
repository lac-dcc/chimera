// Seed: 1225602420
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input tri1 id_2,
    input uwire id_3,
    input tri id_4,
    output tri0 id_5,
    input tri id_6,
    output wor id_7,
    output wire id_8,
    input wand id_9,
    input tri0 id_10,
    input wand id_11,
    output tri0 id_12,
    output uwire id_13,
    input tri id_14,
    output wor id_15
);
  assign id_12 = 1 ^ id_0;
  logic [7:0] id_17;
  wire id_18;
  wire id_19, id_20;
  wire id_21;
  assign id_5 = 1 ? id_17[1] : id_3 ? 1'b0 * 1 + 1 : id_9;
endmodule
module module_1 (
    output uwire id_0,
    output wor   id_1,
    output wand  id_2,
    output wand  id_3,
    input  wand  id_4
);
  wire id_6;
  module_0(
      id_4, id_0, id_4, id_4, id_4, id_3, id_4, id_3, id_2, id_4, id_4, id_4, id_1, id_3, id_4, id_0
  );
endmodule
