// Seed: 2594092466
module module_0 (
    output tri id_0,
    input tri0 id_1,
    input tri0 id_2,
    input wor id_3,
    input wand id_4,
    output tri0 id_5,
    output tri id_6,
    input uwire id_7,
    input tri0 id_8,
    input uwire id_9,
    output tri id_10
    , id_23,
    input wire id_11,
    output uwire id_12,
    output supply1 id_13,
    input tri id_14,
    output wire id_15,
    output supply0 id_16,
    output uwire id_17,
    output uwire id_18,
    input tri id_19,
    input tri1 id_20,
    input uwire id_21
);
  logic id_24;
  wire  id_25;
endmodule
module module_1 (
    input wand id_0,
    input tri id_1,
    input wor id_2,
    input uwire id_3,
    input tri1 id_4,
    output supply1 id_5,
    input supply1 id_6,
    input wand id_7,
    input wand id_8,
    input tri0 id_9,
    input tri id_10,
    input tri0 id_11,
    input tri1 id_12
);
  parameter id_14 = 1'b0;
  xnor primCall (id_5, id_14, id_4, id_2, id_3, id_0, id_11, id_9);
  module_0 modCall_1 (
      id_5,
      id_10,
      id_6,
      id_9,
      id_9,
      id_5,
      id_5,
      id_8,
      id_4,
      id_2,
      id_5,
      id_3,
      id_5,
      id_5,
      id_11,
      id_5,
      id_5,
      id_5,
      id_5,
      id_3,
      id_0,
      id_12
  );
  assign modCall_1.id_17 = 0;
endmodule
