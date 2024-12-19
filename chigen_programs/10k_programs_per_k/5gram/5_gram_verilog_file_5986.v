// Seed: 1938137871
module module_0 (
    input  tri0  id_0,
    output wand  id_1,
    input  tri1  id_2,
    input  wand  id_3,
    input  tri   id_4,
    output wire  id_5,
    output uwire id_6
);
  assign id_1 = 1;
  assign module_1.id_18 = 0;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    input wand id_2,
    output tri0 id_3,
    output wire id_4,
    input wire id_5,
    output tri1 id_6,
    input supply0 id_7,
    input tri0 id_8,
    output tri id_9,
    output supply0 id_10,
    output wire id_11,
    output tri1 id_12,
    input tri0 id_13,
    output wire id_14,
    output supply1 id_15,
    output uwire id_16,
    input wand id_17,
    input supply1 id_18,
    input supply0 id_19,
    input supply1 id_20,
    input tri id_21
);
  assign id_11 = id_21 == 1'b0 ? 1 : id_8;
  module_0 modCall_1 (
      id_2,
      id_10,
      id_2,
      id_19,
      id_0,
      id_11,
      id_4
  );
endmodule
