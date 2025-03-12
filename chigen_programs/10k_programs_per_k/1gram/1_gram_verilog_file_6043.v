// Seed: 4234909662
module module_0 (
    output wor id_0,
    output wor id_1,
    input tri0 id_2,
    input wire id_3,
    input tri1 id_4,
    input wand id_5,
    output uwire id_6,
    input tri0 id_7,
    input supply1 id_8
);
  assign id_1 = id_4;
  logic id_10;
endmodule
module module_1 (
    output tri0 id_0,
    output uwire id_1,
    input supply0 id_2,
    input tri0 id_3,
    input supply1 id_4,
    output tri id_5,
    input supply0 id_6,
    output uwire id_7,
    input supply1 id_8,
    output uwire id_9,
    output supply1 id_10
);
  localparam id_12 = 1;
  wire id_13;
  xor primCall (id_1, id_4, id_12, id_3, id_2, id_8, id_14, id_15, id_6, id_13);
  wire id_14, id_15;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_4,
      id_4,
      id_4,
      id_4,
      id_7,
      id_4,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
