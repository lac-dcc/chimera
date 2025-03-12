// Seed: 2886276975
module module_0 (
    output uwire id_0,
    output wire id_1,
    output uwire id_2,
    output wand id_3,
    output supply1 id_4,
    output uwire id_5,
    input supply1 id_6,
    input wire id_7,
    input tri1 id_8,
    input wand id_9,
    output wor id_10,
    output uwire id_11,
    input tri id_12
    , id_17,
    input wand id_13,
    output wor id_14,
    input wire id_15
);
endmodule
module module_1 (
    output wand id_0,
    input  wor  id_1
);
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1
  );
  generate
    assign id_0 = id_1 ? 1'b0 : id_1 ? id_1 : 1;
  endgenerate
  logic [7:0] id_3;
  assign id_3[1] = 1;
endmodule
