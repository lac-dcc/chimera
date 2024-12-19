// Seed: 116482014
module module_0 (
    input  uwire id_0,
    output wire  id_1,
    input  wor   id_2,
    input  wand  id_3,
    output wand  id_4,
    output uwire id_5,
    input  wand  id_6
);
  assign id_5 = id_3;
endmodule
module module_1 (
    output tri1 id_0,
    output uwire id_1,
    input tri0 id_2,
    output tri id_3,
    output wire id_4,
    input tri1 id_5,
    input tri id_6,
    input supply1 id_7,
    output tri id_8,
    input uwire id_9
    , id_17,
    output uwire id_10,
    output wor id_11,
    output uwire id_12,
    output wor id_13,
    input tri1 id_14,
    input tri0 id_15
);
  wire id_18;
  assign id_8 = id_6;
  reg  id_19 = 1;
  wire id_20;
  assign id_8 = 1 * 1;
  module_0 modCall_1 (
      id_15,
      id_1,
      id_6,
      id_9,
      id_4,
      id_10,
      id_6
  );
  assign modCall_1.id_5 = 0;
  generate
    id_21(
        .id_0((1)), .id_1(1 - ""), .id_2(1)
    );
  endgenerate
  assign id_13 = 1'b0;
  always_latch @(*) id_17 <= id_19;
  wire id_22;
  wire id_23;
endmodule
