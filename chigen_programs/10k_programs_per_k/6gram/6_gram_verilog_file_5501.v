// Seed: 3193974104
module module_0 (
    input wand id_0,
    output tri0 id_1,
    input wand id_2,
    input tri1 id_3,
    input wor id_4,
    output supply0 id_5,
    output supply0 id_6,
    input supply0 id_7,
    output tri1 id_8,
    input wand id_9,
    output wire id_10
);
  logic id_12;
endmodule
module module_1 (
    input tri1 id_0,
    input supply1 id_1,
    output wor id_2,
    output wor id_3,
    input wire id_4,
    inout tri id_5,
    input wand id_6,
    input wire id_7,
    input wire id_8,
    input supply0 id_9,
    output uwire id_10,
    input tri id_11,
    output tri1 id_12
);
  wire id_14;
  assign id_10 = id_14;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_9,
      id_5,
      id_2,
      id_10,
      id_5,
      id_10,
      id_6,
      id_10
  );
  assign modCall_1.id_9 = 0;
  logic id_15 = 1;
  xnor primCall (id_10, id_5, id_14, id_0, id_8, id_1, id_11, id_6, id_9, id_7, id_4);
  logic id_16;
endmodule
