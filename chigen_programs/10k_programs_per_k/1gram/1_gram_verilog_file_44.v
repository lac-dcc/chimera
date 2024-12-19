// Seed: 2786006622
module module_0 (
    output uwire id_0,
    output tri id_1,
    input tri id_2,
    input wire id_3,
    input supply1 id_4,
    input supply1 id_5,
    output supply0 id_6,
    input supply0 id_7,
    output uwire id_8,
    output tri0 id_9,
    input tri1 id_10,
    input tri0 id_11,
    input tri0 id_12,
    input supply1 id_13,
    input supply0 id_14
);
  logic [7:0] id_16, id_17, id_18, id_19, id_20, id_21;
  assign id_20[1] = id_10;
  assign module_1.type_9 = 0;
endmodule
module module_1 (
    output wire id_0,
    input wand id_1,
    output supply1 id_2,
    output wand id_3
);
  wire id_5, id_6;
  wire id_7, id_8;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_3,
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
