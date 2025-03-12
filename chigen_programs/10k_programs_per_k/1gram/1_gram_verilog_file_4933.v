// Seed: 265318319
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    output uwire id_2,
    input tri id_3,
    input tri id_4,
    input supply1 id_5,
    input wire id_6,
    output wire id_7,
    output uwire id_8,
    input wor id_9,
    input wor id_10,
    input uwire id_11,
    input uwire id_12,
    input tri id_13,
    output wand id_14,
    input wire id_15
);
  wire id_17;
  assign module_1.id_6 = 0;
  assign id_1 = id_17;
endmodule
module module_1 #(
    parameter id_4 = 32'd20
) (
    output tri1 id_0
    , id_8,
    input uwire id_1
    , id_9,
    input supply1 id_2,
    input tri id_3,
    input wor _id_4,
    input wand id_5,
    output uwire id_6
);
  wire id_10;
  logic [7:0] id_11;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_6,
      id_1,
      id_3,
      id_5,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_3,
      id_5,
      id_1,
      id_6,
      id_2
  );
  always_latch id_11[id_4 :-1] = ~id_2;
endmodule
