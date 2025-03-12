// Seed: 1909851961
module module_0 (
    input tri1 id_0,
    input wire id_1,
    input tri0 id_2,
    input supply0 id_3,
    input uwire id_4,
    output wand id_5,
    output supply1 id_6,
    input tri1 id_7,
    input uwire id_8,
    output uwire id_9,
    input tri0 id_10,
    input supply0 id_11,
    output wand id_12,
    input supply0 id_13,
    output supply1 id_14
);
  wire  id_16;
  logic id_17;
  localparam id_18 = (1);
endmodule
module module_1 (
    output tri0 id_0,
    input supply0 id_1,
    output wand id_2,
    input wire id_3,
    output uwire id_4,
    input wire id_5,
    input wor id_6,
    output tri id_7
);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_1,
      id_6,
      id_4,
      id_7,
      id_6,
      id_3,
      id_0,
      id_3,
      id_5,
      id_2,
      id_3,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
